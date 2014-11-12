package com.swapper.user

import com.swapper.domain.BaseRecord
import com.swapper.enums.person.GenderType
import com.swapper.enums.person.LocaleType
import com.swapper.enums.person.SocialNetworkType
import com.swapper.item.Item
import com.swapper.multimedia.photo.PersonPhoto
import com.swapper.payment.PaymentMethod

class Person extends BaseRecord {

    String email
    Boolean receiveNotifications = Boolean.FALSE

    String firstName
    String lastName

    String socialNetworkId
    SocialNetworkType socialNetworkType

    LocaleType localeType = LocaleType.ENGLISH
    GenderType genderType = GenderType.NOT_KNOWN

    Boolean qualityUser = Boolean.FALSE

    PersonPhoto photo

    static hasMany = [addresses: Address, paymentMethods: PaymentMethod, items: Item]

    static constraints = {
        email nullable: false
        receiveNotifications nullable: false
        firstName nullable: true
        lastName nullable: true

        socialNetworkId nullable: false
        socialNetworkType nullable: false

        localeType nullable: false
        genderType nullable: false

        photo nullable: true

        qualityUser nullable: false

        addresses nullable: true
        paymentMethods nullable: true

        items nullable: true
    }

    def getSortedAddresses() {
        return addresses.sort { a, b ->
            if (a.mainAddress) {
                return -1
            } else if (b.mainAddress) {
                return 1
            } else {
                b.lastUpdated <=> a.lastUpdated
            }
        }
    }

    def getSortedPaymentMethods() {
        return paymentMethods.sort { a, b ->
            if (a.mainPaymentMethod) {
                return -1
            } else if (b.mainPaymentMethod) {
                return 1
            } else {
                b.lastUpdated <=> a.lastUpdated
            }
        }
    }
}
