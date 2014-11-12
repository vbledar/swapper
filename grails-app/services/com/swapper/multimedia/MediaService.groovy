package com.swapper.multimedia

import com.swapper.exception.ServiceException
import com.swapper.exception.media.PhotoContentTypeException
import com.swapper.exception.media.PhotoSizeException
import grails.transaction.Transactional

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

@Transactional
class MediaService {

    public static final int ITEM_PHOTO_MAX_SIZE = 1048576 // 1mb

    def flickrService


//    @SuccessMessage(messageCode = "uploadPhoto.success")
    def uploadPhoto( def photo) throws ServiceException {
        // Check photo
        if(photo?.size <= 0 || photo?.size > ITEM_PHOTO_MAX_SIZE){
            throw new PhotoSizeException()
        }
        String contentType = photo.fileItem.contentType.toLowerCase()
        if(!(contentType == 'image/jpeg' || contentType == 'image/jpg' || contentType == 'image/gif' || contentType == 'image/png')){
            throw new PhotoContentTypeException()
        }

        log.error photo

        // Upload photo
        String photoID = flickrService.uploadPhoto(photo.fileItem.name, photo.getInputStream())

        log.error 'Photo id from flickr is: ' + photoID;

        String photoUrl = flickrService.getPhotoURL(photoID)

        [photoID:photoID,photoUrl:photoUrl]
    }

    def uploadPhotoFromUrl(String photoLinkUrl) throws ServiceException {
        int dot = photoLinkUrl.lastIndexOf('.')
        if(dot == -1){
            throw new PhotoContentTypeException()
        }

        String ext = photoLinkUrl.substring(dot+1, photoLinkUrl.length())

        if(!(ext == 'jpeg' || ext == 'jpg' || ext == 'gif' || ext == 'png')){
            throw new PhotoContentTypeException()
        }

        URL url = new URL(photoLinkUrl);
        BufferedImage image = ImageIO.read(url);
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, ext, os);
        InputStream is = new ByteArrayInputStream(os.toByteArray());

        String photoID = flickrService.uploadPhoto("teset", is)
        String photoUrl = flickrService.getPhotoURL(photoID)

        [photoID:photoID,photoUrl:photoUrl]
    }

    def uploadPhotoFromSocialUrl(String photoLinkUrl) throws ServiceException {
        URL url = new URL(photoLinkUrl);
        BufferedImage image = ImageIO.read(url);
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        ImageIO.write(image, "png", os);
        InputStream is = new ByteArrayInputStream(os.toByteArray());

        String photoID = flickrService.uploadPhoto("teset", is)
        String photoUrl = flickrService.getPhotoURL(photoID)

        [photoID:photoID,photoUrl:photoUrl]
    }
}
