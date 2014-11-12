package com.swapper.domain.multimedia.photo

import com.swapper.domain.commands.BaseCommand
import com.swapper.multimedia.photo.ItemPhoto
import grails.validation.Validateable

/**
 * Created by Bledar on 10/30/2014.
 */
@Validateable
class ItemPhotoCommand extends BaseCommand {

    String photoId
    String url
    String description
    boolean mainPhoto

    static constraints = {
        importFrom ItemPhoto
    }

}
