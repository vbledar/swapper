package com.swapper.person

import com.swapper.payment.PaymentMethod
import com.swapper.user.Address
import com.swapper.user.Person

class MyProfileController {

    /**
     * Render person's profile management screen.
     */
    def profileManagement() {
        Person person = (Person) session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        String showContent = params.goToContent

        render(view: "profileManagement", model: [person: person, addresses: person?.addresses, paymentMethods: person?.paymentMethods, showContent: showContent])
    }

    /**
     * Update request on person's profile management form handler.
     */
    def updateProfile() {
        Person person = (Person) session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        // apply parameters retrieved from form submission
        bindData(person, params)

        // custom handling of receiveNotifications field
        // since an unchecked checkbox is not submit along
        // with other parameters so we assume that if it
        // is missing the user has deselected it
        if (!params.receiveNotifications)
            person.receiveNotifications = Boolean.FALSE

        // persist the person's instance and handle any errors
        if (!person.save(flush: true)) {
            log.error "Unable to persist person instance."
            log.error "Person instance is " + person?.id
            person.errors.each {
                log.error it
            }
            flash.error = message(code: "user.message.profile.update.failed")
            redirect(action: "profileManagement")
            return
        }

        flash.success = message(code: "user.message.profile.update.successful")
        redirect(action: "profileManagement")
    }

    def profileBasicManagement() {
        Person person = (Person) session["loggeduser"]
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
        }

        render(template: "personBasicInfo", model: [person: person])
    }

    /**
     * Render person's address management screen.
     */
    def profileAddressesManagement() {
        Person person = (Person) session["loggeduser"]
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
        }

        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
        }

        render(template: "personAddressesInfo", model: [addresses: person?.getSortedAddresses()])
    }

    /**
     * Add new address in address list.
     */
    def addAddress() {
        Person person = (Person) session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            render(contentType: "application/json") {
                ['success': false, 'message': "Failed to submit new address."]
            }
            return;
        }

        Address address = new Address()
        bindData(address, params)

        // only one main address is allowed
        if (address.mainAddress) {
            person.addresses.each {
                if (it.mainAddress) {
                    log.error "Found main address..."
                    it.mainAddress = Boolean.FALSE
                    if (!it.save(flush: true)) {
                        log.error("Failed to submit new address while removing main address indication from another entry.")
                        render(contentType: "application/json") {
                            ['success': false, 'message': message (code: 'user.message.failed.address.creation')]
                        }
                        return
                    }
                }
            }
        }

        // attach address to person
        person.addToAddresses(address)
        if (!address.save()) {
            log.error("Failed to submit new address.")
            address.errors.each {
                log.error it
            }
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.failed.address.creation'), 'errors': address.errors]
            }
            return;
        }

        render (template: "personAddressesInfo", model: [addresses: person?.getSortedAddresses()])
    }

    def removeAddress() {
        // check for address id parameter
        if (!params.addressId) {
            log.error 'Address id no provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.address.not.found')]
            }
            return
        }

        // get address record from database
        Address address = Address.findById(params.addressId)

        // check address record exists in database
        if (!address) {
            log.error 'Address id no provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.address.not.found')]
            }
            return
        }

        // delete address record
        address.delete(flush: true)

        Person person = session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        render (template: "personAddressesInfo", model: [addresses: person?.getSortedAddresses()])
    }

    def setMainAddress() {
        // check for address id parameter
        if (!params.addressId) {
            log.error 'Address id no provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.address.not.found')]
            }
            return
        }

        // get address record from database
        Address address = Address.findById(params.addressId)

        // check address record exists in database
        if (!address) {
            log.error 'Address id no provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.address.not.found')]
            }
            return
        }

        Person person = session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        person.addresses.each {
            if (it.mainAddress) {
                it.mainAddress = Boolean.FALSE
            }
        }
        address.mainAddress = Boolean.TRUE

        if (!person.save()) {
            log.error 'Failed to set main address'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.main.address.not.set')]
            }
            return
        }

        render (template: "personAddressesInfo", model: [addresses: person?.getSortedAddresses()])
    }

    def profilePaymentMethodsManagement() {
        Person person = (Person) session["loggeduser"]
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
        }

        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
        }

        render(template: "personPaymentMethodInfo", model: [paymentMethods: person?.getSortedPaymentMethods()])
    }

    /**
     * Add new address in address list.
     */
    def addPaymentMethod() {
        Person person = (Person) session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            render(contentType: "application/json") {
                ['success': false, 'message': "Failed to submit new payment method."]
            }
            return;
        }

        PaymentMethod paymentMethod = new PaymentMethod()
        bindData(paymentMethod, params)

        // only one main address is allowed
        if (paymentMethod.mainPaymentMethod) {
            person.paymentMethods.each {
                if (it.mainPaymentMethod) {
                    log.error "Found main address..."
                    it.mainPaymentMethod = Boolean.FALSE
                    if (!it.save(flush: true)) {
                        log.error("Failed to submit new payment method while removing main payment method indication from another entry.")
                        render(contentType: "application/json") {
                            ['success': false, 'message': message (code: 'user.message.failed.payment.method.creation')]
                        }
                        return
                    }
                }
            }
        }

        // attach address to person
        person.addToPaymentMethods(paymentMethod)
        if (!paymentMethod.save()) {
            log.error("Failed to submit new payment method.")
            paymentMethod.errors.each {
                log.error it
            }
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.failed.payment.method.creation'), 'errors': paymentMethod.errors]
            }
            return;
        }

        render (template: "personPaymentMethodInfo", model: [paymentMethods: person?.getSortedPaymentMethods()])
    }

    def removePaymentMethod() {
        // check for address id parameter
        if (!params.paymentMethodId) {
            log.error 'Payment method id not provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.payment.method.not.found')]
            }
            return
        }

        // get address record from database
        PaymentMethod paymentMethod = PaymentMethod.findById(params.paymentMethodId)

        // check address record exists in database
        if (!paymentMethod) {
            log.error 'Payment method id not provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.payment.method.not.found')]
            }
            return
        }

        // delete address record
        paymentMethod.delete(flush: true)

        Person person = session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        render (template: "personPaymentMethodInfo", model: [paymentMethods: person?.getSortedPaymentMethods()])
    }

    def setMainPaymentMethod() {
        // check for address id parameter
        if (!params.paymentMethodId) {
            log.error 'Payment method id not provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.payment.method.not.found')]
            }
            return
        }

        // get address record from database
        PaymentMethod paymentMethod = PaymentMethod.findById(params.paymentMethodId)

        // check address record exists in database
        if (!paymentMethod) {
            log.error 'Payment method id not provided'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.payment.method.not.found')]
            }
            return
        }

        Person person = session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            flash.error = message(code: "user.message.no.logged.in.user.found")
            redirect(controller: "landing", action: "index")
            return
        }

        person.paymentMethods.each {
            if (it.mainPaymentMethod) {
                it.mainPaymentMethod = Boolean.FALSE
            }
        }
        paymentMethod.mainPaymentMethod = Boolean.TRUE

        if (!person.save()) {
            log.error 'Failed to set main payment method.'
            render(contentType: "application/json") {
                ['success': false, 'message': message (code: 'user.message.main.payment.method.not.set')]
            }
            return
        }

        render (template: "personPaymentMethodInfo", model: [paymentMethods: person?.getSortedPaymentMethods()])
    }
}
