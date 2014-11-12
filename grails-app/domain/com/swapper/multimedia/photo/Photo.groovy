package com.swapper.multimedia.photo

import com.swapper.domain.BaseRecord

abstract class Photo extends BaseRecord {

    String photoId
    String url

    static constraints = {
        photoId(blank: false, maxSize: 50)
        url(blank: false, url: true)
    }

}
