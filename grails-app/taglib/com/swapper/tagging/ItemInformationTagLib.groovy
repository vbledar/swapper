package com.swapper.tagging

class ItemInformationTagLib {
//    static defaultEncodeAs = [taglib: 'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "ii"

    def informationLabel = { attrs ->
        String label = attrs.label
        String value = attrs.value

        out << "<dl class='dl-horizontal'>"
        out << "<dt>${label}</dt>"
        out << "<dd><p>${value}</p></dd>"
        out << "</dl>"
    }
}
