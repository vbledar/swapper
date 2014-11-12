package com.swapper.social

import com.swapper.user.Person
import grails.transaction.Transactional

@Transactional
abstract class SocialManagerService {

    abstract def getUserInformation(String accessToken)

    abstract Boolean updateUserProfilePicture(Person person, String accessToken)

}
