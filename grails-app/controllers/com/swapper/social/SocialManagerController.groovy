package com.swapper.social

import com.swapper.enums.person.SocialNetworkType
import com.swapper.user.Person

class SocialManagerController {

    def facebookService

    /**
     * This action controls the facebook success login meta events.
     * One event to occur is to check if the user has logged in before
     * with the application and if so to retrieve his information.
     * Otherwise, a new person instance must be created after retrieving
     * user information from facebook.
     */
    def facebookSuccessHandler() {
        flash.success = 'Successfully authenticated with facebook.'
        Person person = facebookService.getUserInformation(session["facebook:oasAccessToken"].token)
        if (!person) {
            flass.error = message(code: "user.message.login.failure")
            redirect(controller: "socialManager", action: "facebookFailureHandler")
            return
        }

        if (!person.photo) {
            facebookService.updateUserProfilePicture(person, session["facebook:oasAccessToken"].token)
        }

        session["loggeduser"] = person
        render (view: '/index')
    }

    /**
     * This action controls the facebook failure login meta events. A
     * failure can mean that something went wrong or that the user
     * doesn't won't to login after all.
     */
    def facebookFailureHandler() {
        flash.error = 'Failed to authenticate with facebook.'
        render (view: '/index')
    }

    def getUserProfilePicture() {
        Person person = (Person) session["loggeduser"]
        person = Person.findBySocialNetworkId(person?.socialNetworkId)
        if (!person) {
            redirect(controller: 'landing', action: 'index')
            return
        }

        String accessToken
        SocialManagerService socialManagerService
        if (person.socialNetworkType == SocialNetworkType.FACEBOOK) {
            socialManagerService = facebookService
            accessToken = session["facebook:oasAccessToken"].token
        } else {
            flash.message = message (code: "user.message.social.network.invalid")
            redirect (controller: 'landing', action: 'index')
            return
        }

        Boolean result = socialManagerService.updateUserProfilePicture(person, accessToken)
        if (result) {
            flash.message = message( code: "user.message.profile.picture.updated.successfully", args: [person?.socialNetworkType?.descriptive])
        }

        redirect( controller: 'myProfile', action: 'profileManagement')
    }

    def userLoggedOut() {
        session.invalidate()
        redirect(controller: 'landing')
    }
}
