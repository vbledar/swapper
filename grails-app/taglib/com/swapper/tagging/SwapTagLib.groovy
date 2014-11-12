package com.swapper.tagging

import com.swapper.domain.commands.item.ItemCommand
import com.swapper.domain.multimedia.photo.ItemPhotoCommand
import com.swapper.item.Item
import com.swapper.multimedia.photo.PersonPhoto
import com.swapper.multimedia.photo.Photo
import com.swapper.user.Person

class SwapTagLib {
//    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "sw"

    def enumMessage = {attrs ->
        def theEnum = attrs.e
        if(theEnum){
            if (theEnum instanceof Enum){
                out << "${message(code: "${theEnum.class.simpleName}.${theEnum.name()}", default: theEnum.name())}"
            }else{
                throw new RuntimeException("Please provide an enum as attrs.e. Thank you!");
            }
        }else{
            out << ""
        }
    }

    /**
     * Display the full name of the provided user
     *
     * @attr user REQUIRED
     */
    def userFullName = { attrs ->
        Person u = attrs.user
        if (u){
            out << "${u.firstName} ${u.lastName}"
        }
    }


    def booleanDescription = { attrs ->
        Boolean value = attrs.val
        if (value == null){
            out << ''
        }else if (value.booleanValue() == true){
            out << 'Yes'
        }else if (value.booleanValue() == false){
            out << 'No'
        }
    }


//	public static String getNiceDate(Date date) {
//
//		def now = new Date()
//
//		def diff = Math.abs(now.getTime() - date.getTime())
//
//		long second = 1000
//		long minute = 1000 * 60
//		long hour = minute * 60
//		long day = hour * 24
//
//		def niceTime = ""
//
//		long calc = 0L;
//
//		calc = Math.floor(diff / day)
//		if (calc > 0) {
//			niceTime += calc + " day" + (calc > 1 ? "s " : " ")
//			diff = diff % day
//		}
//
//		calc = Math.floor(diff / hour)
//		if (calc > 0) {
//			niceTime += calc + " hour" + (calc > 1 ? "s " : " ")
//			diff = diff % hour
//		}
//
//		calc = Math.floor(diff / minute)
//		if (calc > 0) {
//			niceTime += calc + " minute" + (calc > 1 ? "s " : " ")
//			diff = diff % minute
//		}
//
//		if (niceTime.length() == 0) {
//			niceTime = "Right now"
//		} else {
//			niceTime += (date.getTime() > now.getTime()) ? "from now" : "ago"
//		}
//
//		return niceTime
//
//	}
//
//	def dateFromNow = {attrs ->
//
//		def date = attrs.date
//
//		out << getNiceDate(date)
//	}


    def nameOfUser = {attrs ->
        Person user = attrs.user
        if(user){
            if(springSecurityService.principal.id == user.id){
                out << "<span>${message(code: 'me', default: 'me')}</span>"
            }else{
                out << "<span>${user.username}</span>"
            }
        }else{
            out << ""
        }
    }



    def userPhoto = { attrs ->
        Person user = attrs.user
        PersonPhoto photo = user?.photo
        String size = attrs.size
        String noImageFileName = 'no_user_image.gif'
        renderPhoto(photo?.url, size, attrs, noImageFileName)
    }

    def photo = { attrs ->
        Photo photo = attrs.photo
        String size = attrs.size
        String noImageFileName = 'no_image.jpg'
        renderPhoto(photo?.url, size, attrs, noImageFileName)
    }

    def photoCommand = { attrs ->
        ItemPhotoCommand photo = attrs.photo
        String size = attrs.size
        String noImageFileName = 'no_image.jpg'
        renderPhoto(photo?.url, size, attrs, noImageFileName)
    }

    def itemMainPhoto = { attrs ->
        Item item = attrs.item
        Photo photo = item?.photos?.asList()[0]
        String size = attrs.size
        String noImageFileName = 'no_image.jpg'
        renderPhoto(photo?.url, size, attrs, noImageFileName, item.id.toString())
    }

//    def listItemPhoto = { attrs ->
//        ListItemCommand item = attrs.item
//        String size = attrs.size
//        String noImageFileName = 'no_image.jpg'
//        renderPhoto(item.url, size, attrs, noImageFileName, item.id.toString())
//    }

    def itemMainPhotoForCarousel = { attrs ->
        Item item = attrs.item
        Photo photo = item?.photos?.asList()[0]
        String size = attrs.size
        String noImageFileName = 'no_image.jpg'
        renderPhotoForDrag(photo?.url, size, attrs, noImageFileName, item.id.toString())
    }

    def itemMainPhotoCommand = { attrs ->
        ItemCommand item = attrs.item
        ItemPhotoCommand photo = item?.photos?.asList()[0]
        String size = attrs.size
        String noImageFileName = 'no_image.jpg'
        renderPhoto(photo?.url, size, attrs, noImageFileName)
    }

    private def renderPhoto(String url, String size, def attrs, String noImageFileName, String itemId = ""){
        if(!url){
            out << g.img(dir: 'images', file: noImageFileName, class: attrs.cssClass?:'' + ', photo_size_' + size, style: attrs.cssStyle)
        }else{
            int lastIndexOfDot = url.lastIndexOf('.')
            String newExtension = "_" + size + url.substring(lastIndexOfDot)
            String finalPhotoUrl = url.substring(0, lastIndexOfDot) + newExtension

            out << "<img src='${finalPhotoUrl}' class='${attrs.cssClass?:''}' style='${attrs.cssStyle?:''}' data-value-itemId='${itemId}' ondragstart='dragItem(event)' />"
        }
    }

    private def renderPhotoForDrag(String url, String size, def attrs, String noImageFileName, String itemId = ""){
        if(!url){
            out << g.img(dir: 'images', file: noImageFileName, class: attrs.cssClass?attrs.cssClass:'' + ', photo_size_' + size, style: attrs.cssStyle)
        }else{
            int lastIndexOfDot = url.lastIndexOf('.')
            String newExtension = "_" + size + url.substring(lastIndexOfDot)
            String finalPhotoUrl = url.substring(0, lastIndexOfDot) + newExtension

            out << "<img src='${finalPhotoUrl}' class='${attrs.cssClass?:''}' style='${attrs.cssStyle?:''}' data-value-itemId='${itemId}' ondragend='removeItemByDrag(event)' />"
        }
    }

    def itemMainPhotoUrl = { attrs ->
        Item item = attrs.item
        Photo photo = item?.photos?.asList()[0]
        String noImageFileName = 'no_image.jpg'
        out << (photo == null ? 'http' + g.resource(dir: 'images', file: noImageFileName, absolute: true) : photo.url)
    }
}
