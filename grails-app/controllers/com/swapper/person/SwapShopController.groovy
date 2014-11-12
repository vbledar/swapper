package com.swapper.person

import com.swapper.BaseController
import com.swapper.domain.commands.item.ItemAttributeCommand
import com.swapper.domain.commands.item.ItemCommand
import com.swapper.domain.commands.item.ItemShippingCommand
import com.swapper.domain.multimedia.photo.ItemPhotoCommand
import com.swapper.exception.EntityAwareException
import com.swapper.exception.PersistException
import com.swapper.exception.ServiceException
import com.swapper.exception.media.PhotoContentTypeException
import com.swapper.exception.media.PhotoSizeException
import com.swapper.item.Item
import com.swapper.item.criteria.SearchCriteria
import com.swapper.item.criteria.SearchCriteriaAttribute
import com.swapper.user.Person
import grails.converters.JSON

class SwapShopController extends BaseController {

    def categoryService
    def itemService
    def myProfileService
    def mediaService

    /**
     * Loads the items a person has uploaded and displays the management page.
     */
    def swapShop() {
        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        if (!params.max) {
            params.max = getMaximumNumberOfElementsInView()
        }

        if (!params.offset) {
            params.offset = 0
        }

        def itemListCount = itemService.findItemsOfPerson(person, params, true)[0]
        def itemsList = itemService.findItemsOfPerson(person, params, false)

        render(view: "swapShopManagement", model: [items: itemsList, itemsCounted: itemListCount])
    }

    /**
     * Render the itemsList template used in remote pagination inside the person's items list.
     */
    def personsItems() {
        Person person = getLoggedInUserFromDatabase()
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        if (!params.max) {
            params.max = getMaximumNumberOfElementsInView()
        }

        if (!params.offset) {
            params.offset = 0
        }

        def itemListCount = itemService.findItemsOfPerson(person, params, true)[0]
        def itemsList = itemService.findItemsOfPerson(person, params, false)

        render(template: "itemsList", model: [items: itemsList, itemsCounted: itemListCount])
    }

    /**
     * Render view item page.
     */
    def viewItem() {
        Item item = Item.findById(params.id)
        if (!item) {
            flash.error = message (code: "user.message.item.not.found")
            redirect(controller: "swapShop", action: "swapShop")
            return
        }

        render(view: "item/itemManagement", model: [item: item,
                                                    rootCategories: categoryService.getRootCategories(params),
                                                    categories: categoryService.getSubCategories(item.category?.parent?.id,params),
                                                    selectedCategory: item.category,
                                                    searchCriteria: item.category.searchCriterias,
                                                    hasPaymentMethod: myProfileService.personHasDefinedPaymentMethod(getLoggedInUserFromDatabase())])
    }

    /**
     * Update basic item information.
     */
    def updateItemBasicInformation() {
        Item item = Item.findById(params.id)
        if (!item) {
            flash.error = message(code: "user.message.item.not.found")
            render(contentType: "text/json") {
                ['success': false, message : message (code: "user.message.item.not.found")]
            }
            return
        }

        try {
            itemService.update(item, params)
        } catch (PersistException pe) {
            log.error "Failed to update item.", pe
            render(contentType: "text/json") {
                ['success': false, message : message (code: "user.message.item.update.failed"), errors: item.errors]
            }
            return
        }

        render(contentType: "text/json") {
            ['success': true, message : message (code: "user.message.item.update.success")]
        }
    }

    /**
     * Update item detailed information.
     */
    def updateItemDetailedInformation() {
        Item item = Item.findById(params.id)
        if (!item) {
            flash.error = message(code: "user.message.item.not.found")
            render(contentType: "text/json") {
                ['success': false, message : message (code: "user.message.item.not.found")]
            }
            return
        }

        try {
            def attrs = extractItemAttributes(params)
            itemService.updateItemAttributes(item,attrs)
        }catch (ServiceException se){
            log.error "Failed to update item detailed information", se
            render(contentType: "text/json") {
                ['success': false, message : message (code: "user.message.item.update.failed"), errors: item.errors]
            }
            return
        }

        render(contentType: "text/json") {
            ['success': true, message : message (code: "user.message.item.update.success")]
        }
    }

    /**
     * Upload item flow.
     */
    def uploadItemFlow = {
        log.info 'Upload item flow started... with request parameters:'
        log.info params
        /**
         * Initialization state.
         *
         * 1. load master categories
         * 2. item command instance creation
         * 3. item shipping command instnace creation
         * 4. determine if user has provided a paypal account
         */
        initialize {
            action {
                log.error 'Upload new item flow requested...'
                log.info params
                def rootCategories = []
                categoryService.getRootCategories([:]).each { rc ->
                    rootCategories << (rc.properties['id', 'parent', 'name', 'description']) //define dtos
                }
                flow.rootCategories = rootCategories

                Person person = session["loggeduser"]
                person = Person.findBySocialNetworkId(person?.socialNetworkId)
                if (!person) {
                    // TODO must handle this appropriately
                    log.info "There is no person logged in..."
                }
                flow.hasPaymentMethod = myProfileService.personHasDefinedPaymentMethod(person)
                flow.isQualityUser = person?.qualityUser


                flow.itemInstance = new ItemCommand()
                flow.itemShippingInstance = new ItemShippingCommand()
                flow.includeExistentPhotos = true   //photo form should also include the previously added photos
                log.info "All parameters have been gathered."
            }

            /**
             * On successfull initialization flow must proceed to basic item information step
             */
            on('success') {
                log.error 'Initialization was successful...'
            }.to('itemInformation')
        }

        /**
         * Step 1
         * Enter basic item information
         *
         * User can input item basic information like name, description, categories, etc...
         */
        itemInformation {
            /**
             * On next action the item command must be validated.
             */
            on('next') {
                log.error 'Parameters retrieved on next are: '
                log.error params

                /**
                 * bind request parameters to item command instance in stored in flow scope
                 */
                log.error 'Bind request parameters to item command instance.'
                bindData(flow.itemInstance, params)

                /**
                 * Validate item command instance.
                 */
                if (!flow.itemInstance.validate()) {
                    log.error 'Item command instance validation failed.'

                    if (params.rootCategory) {
                        def categories = []
                        grailsApplication.mainContext.getBean("categoryService").getSubCategories(params.rootCategory.toLong(), [:]).each { rc ->
                            categories << (rc.properties['id', 'parent', 'name', 'description'])
                        }
                        flow.categories = categories
                    }

                    /**
                     * If errors exist then user is redirected to the same
                     * step for corrections
                     */
                    flash.messageCode = "Fields marked with \"*\" are required."
                    return validationOfItemFailed()
                }

                log.error 'The unknown part of step 1...'
                if (params.rootCategory) {
                    def categories = []
                    grailsApplication.mainContext.getBean("categoryService").getSubCategories(params.rootCategory.toLong(), [:]).each { rc ->
                        categories << (rc.properties['id', 'parent', 'name', 'description'])
                    }
                    flow.categories = categories
                }

                if (flow.itemInstance.category) {
                    log.error "Item instance has category..."
                    flow.searchCriteria = flow.itemInstance.category.searchCriterias
                }

                log.error 'Step 1 was successful. Going to next step.'
            }.to('detailedItemInformation')

            /**
             * If the item command instance validation fails then return user
             * to same flow step for appropriate corrections.
             */
            on ('validationOfItemFailed') {
                log.error "Validation failed, oops!"
            }.to('itemInformation');
            /**
             * On this step user can cancel the flow by selecting the cancel action.
             */
            on('cancel').to('finish')
        }

        detailedItemInformation {
            /**
             * On next action the selected attributes are attached to the item command
             * and flow proceeds to the next step.
             */
            on('next') {
                log.error 'Parameters retrieved on next are: '
                log.error params

                flow.itemInstance.attrs = extractItemAttributes(params)
            }.to('itemShippingInformation')
            /**
             * On this step user can go back by selecting the previous action.
             */
            on('previous') {
                log.error 'Parameters retrieved on previous are: '
                log.error params

                flow.itemInstance.attrs = extractItemAttributes(params)
            }.to('itemInformation')
            /**
             * On this step user can cancel the flow by selecting the cancel action.
             */
            on('cancel').to('finish')
        }

        itemShippingInformation {
            on("next"){
                log.info params
                bindData(flow.itemShippingInstance, params)
            }.to("itemPhotosInformation")

            on("previous"){
                bindData(flow.itemShippingInstance, params)
            }.to("detailedItemInformation")

            on("cancel").to("cancelFinish")
        }

        itemPhotosInformation{
            on("next"){
                flow.itemInstance.photos = extractItemPhotos(params)

                if (!flow.itemInstance.photos || flow.itemInstance.photos.size() == 0) {
                    flash.messageCode = "At least one photo of the item is required."
                    return onePhotoRequired()
                }
            }.to("itemInformationVerification")

            on("previous"){
                log.info params
                flow.itemInstance.photos = extractItemPhotos(params)

                flow.itemInstance.photos.each {
                    log.error it.photoId
                }
            }.to("itemShippingInformation")

            on("cancel").to("cancelFinish")
            on("onePhotoRequired").to("itemPhotosInformation")
        }

        itemInformationVerification{

            on("next"){
                log.error "Item verification save item."
            }.to("saveItem")

            on("previous"){

            }.to("itemPhotosInformation")

            on("cancel").to("cancelFinish")
        }

        saveItem{
            action{
                try{
                    def item = itemService.create(getLoggedInUserFromDatabase(), flow.itemInstance, flow.itemShippingInstance)
                    [itemInstance: item]

//                    // send notification message to administration
//                    if (!userService.getCurrentUser().qualityUser) {
//                        try {
//                            log.info 'Recipient is: ' + GlobalSettings.emailAdmin
//
//                            User currentUser = userService.getCurrentUser()
//
//                            // send email to administrator to notify a new item upload
//                            sendEmailService.sendEmail(new EmailMessage(recipients: GlobalSettings.emailAdmin,
//                                    subject: message(code: 'item.upload.update.visibility'),
//                                    viewID: "/emails/itemUploadedEmail",
//                                    viewModel:[user: currentUser, itemInstance: item]))
//
//                            // send email to user to notify a that the item is not visible until reviewed
//                            sendEmailService.sendEmail(new EmailMessage(recipients: currentUser?.contactDetails?.email,
//                                    subject: message (code: 'item.review.required.email.title'),
//                                    viewID: "/emails/notification",
//                                    viewModel:[userFullName: currentUser.username, message: message(code: 'item.upload.review.required', args: [item?.name])]))
//                        } catch(Exception ex) {
//                            log.error 'Something went wrong while sending the email at address [' + GlobalSettings.emailAdmin + '].', ex
//                        }
//                    }
                }catch (EntityAwareException eae){
                    log.info(eae.message)
                    flow.itemInstance.errors = eae.entity.errors
                    eae.entity.discard()
                    invalid()
                }catch (ServiceException se){
                    log.info(se.message)
                    invalid()
                }
            }

            on("invalid").to("itemInformation")
            on("success").to("finish")
        }

        finish {
            action {
                log.info 'Upload new item flow finished...'
            }

            on('success').to('end')
        }

        end {

        }
    }

    /**
     * Extract item photos list.
     *
     * @param params, the request parameters
     *
     * @return list of ItemPhotoCommand instances.
     */
    private def extractItemPhotos(def params){
        def photos = []
        log.error 'Paremeters retrieved from system are: ' + params;
        if(params.photoID){
            if (params.photoID instanceof String){
                log.error 'One item found with id: ' + params.photoID;
                photos << new ItemPhotoCommand(photoId: params.photoID, url:params.photoUrl)
            }else{
                (0..(params.photoID.size()-1)).each{i ->
                    photos << new ItemPhotoCommand(photoId:params.photoID[i], url:params.photoUrl[i])
                }
            }
        }

        return photos
    }

    /**
     * Extract item attributes from request parameters.
     *
     * @param params, the request parameters.
     *
     * @return list of ItemAttributeCommand instances.
     */
    private def extractItemAttributes(def params) {
        def attrs = []
        def listCriteria = params.listcriteria

        log.error 'List criteria: ' + listCriteria

        if (listCriteria)
            listCriteria.each {
                if (it.value) {
                    ItemAttributeCommand command = new ItemAttributeCommand()
                    SearchCriteria searchCriteria = SearchCriteria.findById(it.key)
                    SearchCriteriaAttribute searchCriteriaAttribute = SearchCriteriaAttribute.findById(it.value)
                    if (searchCriteria && searchCriteriaAttribute) {
                        command.searchCriteria = searchCriteria
                        command.attribute = searchCriteriaAttribute
                        attrs << command
                    }
                }
            }

        def rangeCriteria = params.rangecriteria
        log.info 'Range criteria: ' + rangeCriteria

        if (rangeCriteria) {
            rangeCriteria.each {
                if (it.value) {
                    ItemAttributeCommand command = new ItemAttributeCommand()
                    SearchCriteria searchCriteria = SearchCriteria.findById(it.key)
                    if (it.value) {
                        command.searchCriteria = searchCriteria
                        command.numberValue = Double.valueOf(it.value)
                        attrs << command
                    }
                }
            }
        }

        def booleanCriteria = params.booleancriteria
        log.info 'Boolean criteria: ' + booleanCriteria

        if (booleanCriteria){
            booleanCriteria.each {
                if (it.value) {
                    ItemAttributeCommand command = new ItemAttributeCommand()
                    SearchCriteria searchCriteria = SearchCriteria.findById(it.key)
                    if (searchCriteria) {
                        command.searchCriteria = searchCriteria
                        command.booleanValue = it.value
                        attrs << command
                    }
                }
            }
        }

        return attrs
    }

    /**
     * Uploads a photo to flickr service.
     *
     * @return two elements array holding the photo url in flickr and its id.
     */
    def uploadPhoto(){
        try{
            if(request.multipartFiles?.photoFile?.findAll{ it.size > 0 }.size() > 0){
                def result = mediaService.uploadPhoto(request.multipartFiles?.photoFile[0])
                render new JSON(target:result).toString()
            }
        }
        catch(PhotoContentTypeException e) {
            log.error("Error: " + e.errorCode)
            render new JSON(target:[error: 'Cannot upload photo. Photo types allowed are JPG, JPEG, PNG and GIF.'] ).toString()
        }
        catch(PhotoSizeException e){
            log.error("Error: " + e.errorCode)
            render new JSON(target:[error: 'Cannot upload photo. Please upload a photo with size less than ' +
                    mediaService.ITEM_PHOTO_MAX_SIZE / (1024*1024) + ' Mb.'] ).toString()
        }
        catch(ServiceException e){
            log.error("Error: " + e.errorCode)
            render  new JSON(target:[error:e.errorCode]).toString()
        }
        catch(Exception e){
            log.error("Failed to upload photo.", e);
            render  new JSON(target:[error:"unknown error occured"]).toString()
        }
    }
}
