package com.swapper.profile

import com.swapper.user.Person
import grails.transaction.Transactional

@Transactional
class MyProfileService {

    /**
     * Checks if the person instance has defined at least on payment method.
     *
     * @param person the instance to check.
     *
     * @return true if at least one payment method has been defined.
     */
    def personHasDefinedPaymentMethod(Person person) {
        if (person?.paymentMethods?.size() > 0) {
            return Boolean.TRUE
        }
        return Boolean.FALSE
    }

}
