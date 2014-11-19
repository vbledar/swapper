package com.swapper

import com.swapper.user.Person

class LandingController extends BaseController {

    def index() {

        Person person = getLoggedInUserFromDatabase()

        boolean showPaymentMethodRequiredMessage = false
        if(person) {
            showPaymentMethodRequiredMessage = person?.paymentMethods?.size() == 0
        }

        render(view: '/index', model: [showPaymentMethodRequiredMessage: showPaymentMethodRequiredMessage])
    }
}
