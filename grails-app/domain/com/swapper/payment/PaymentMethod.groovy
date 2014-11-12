package com.swapper.payment

import com.swapper.domain.BaseRecord
import com.swapper.enums.payment.CurrencyType
import com.swapper.enums.payment.PaymentType
import com.swapper.user.Person

class PaymentMethod extends BaseRecord {

    String account

    PaymentType paymentType = PaymentType.PAYPAL
    CurrencyType currencyType = CurrencyType.EUR

    Boolean mainPaymentMethod = Boolean.FALSE

    static belongsTo = [person: Person]

    static constraints = {
        account nullable: false

        paymentType nullable: false
        currencyType nullable: false

        person nullable: false
    }
}
