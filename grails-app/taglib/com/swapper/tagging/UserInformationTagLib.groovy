package com.swapper.tagging

import com.swapper.user.Address
import com.swapper.user.Person

class UserInformationTagLib {
//    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "ui"

    def personAddress = { attrs ->
        Address address = attrs.address
        Boolean showRemove = Boolean.parseBoolean(attrs.showRemove)
        if (address) {
            out << "<address class='well well-sm'>"
            out << "<strong>${address?.firstAddress}</strong>"
            if (address?.mainAddress) {
                out << "<span class='text-muted'>"
                out << " " << message(code: "profile.management.user.main.address")
                out << "</span>"
            }

            if (showRemove) {
                out << "<span class='pull-right'>"
                out << "<button class='btn btn-sm btn-danger remove-address' address-id='${address?.id}'>"
                out << "<span class='glyphicon glyphicon-remove'></span>"
                out << "</button>"
                out << "</span>"
            }

            out << "<br>"
            if (address.secondAddress) {
                out << "${address?.secondAddress}<br>"
            }

            out << "${address?.city},<br>"
            out << "${address?.country},<br>"
            out << "${address?.postalCode}"

            out << "<div class='spacer10'></div>"

            if (address.furtherInformation) {
                out << "<strong>Further Information</strong>"
                out << "<p>"
                out << address?.furtherInformation
                out << "</p>"
            }
            out << "</address>"
        }
    }
}
