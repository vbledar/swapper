package com.swapper.social

import com.swapper.enums.person.GenderType
import com.swapper.enums.person.LocaleType
import com.swapper.enums.person.SocialNetworkType
import com.swapper.multimedia.photo.PersonPhoto
import com.swapper.user.Person
import com.swapper.util.EnumUtilityMethods
import grails.transaction.Transactional
import groovyx.net.http.HTTPBuilder
import groovyx.net.http.Method

@Transactional
class FacebookService extends SocialManagerService {

    def mediaService

    def grailsApplication
    def grailsLinkGenerator

    def getUserInformation(String accessToken) {
        def http = new HTTPBuilder(grailsApplication.config.oauth.providers.facebook.graphApi)
        http.request(Method.GET, "application/json") {
            uri.path = "/me"
            uri.query = [access_token: accessToken,
                         fields: "id,email,first_name,last_name,gender,locale,picture"]

            response.success = { resp, json ->
                log.error resp.statusLine

                if (json.id) {
                    Person person = Person.findBySocialNetworkId(json.id)
                    if (!person) {
                        person = new Person()
                        person.firstName = json.first_name
                        person.lastName = json.last_name

                        person.socialNetworkType = SocialNetworkType.FACEBOOK
                        person.socialNetworkId = json.id

                        if (json.email) {
                            person.email = json.email
                        }

                        // person gender
                        if (json.gender && EnumUtilityMethods.getEnumFromString(json.gender, GenderType)) {
                            person.genderType = EnumUtilityMethods.getEnumFromString(json.gender, GenderType)
                        }

                        // person locale
                        LocaleType localeType = LocaleType.ENGLISH
                        if (json.locale && EnumUtilityMethods.getEnumFromString(json.locale, LocaleType)) {
                            person.localeType = EnumUtilityMethods.getEnumFromString(json.locale, LocaleType)
                        }

                        if (!person.save()) {
                            log.error 'Failed to persist person instance.'
                            person.errors.each {
                                log.error it
                            }
                        }
                    }
                    return person
                }
            }

            // handler for any failure status code:
            response.failure = { resp ->
                log.error uri
                log.error "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
            }
        }
    }

    Boolean updateUserProfilePicture(Person person, String accessToken) {
        def http = new HTTPBuilder(grailsApplication.config.oauth.providers.facebook.graphApi)
        http.request(Method.GET, "application/json") {
            uri.path = "/me/picture"
            uri.query = [access_token: accessToken,
                         type: "large",
                         redirect: "false",
                         width: "500",
                         height: "500"]

            response.success = { resp, json ->
                log.error resp.statusLine

                if (json.data) {

                    // picture
                    if (json.data.url) {
                        def flickResponse = mediaService.uploadPhotoFromSocialUrl(json.data.url)
                        PersonPhoto personPhoto = new PersonPhoto(photoId: flickResponse.photoID, url: flickResponse.photoUrl, person: person)
                        if (!personPhoto.save()) {
                            log.error "Failed to update user profile picture."
                            log.error personPhoto.errors.each {
                                log.error it
                            }
                        } else {
                            person.photo = personPhoto
                        }
                    }

                    if (!person.save()) {
                        log.error 'Failed to persist person instance.'
                        person.errors.each {
                            log.error it
                        }
                        return Boolean.FALSE
                    }
                    return Boolean.TRUE
                }
                return Boolean.FALSE
            }

            // handler for any failure status code:
            response.failure = { resp ->
                log.error uri
                log.error "Unexpected error: ${resp.statusLine.statusCode} : ${resp.statusLine.reasonPhrase}"
                return Boolean.FALSE
            }
        }
    }
}
