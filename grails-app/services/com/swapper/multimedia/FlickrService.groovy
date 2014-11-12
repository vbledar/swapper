package com.swapper.multimedia

import com.googlecode.flickrjandroid.Flickr
import com.googlecode.flickrjandroid.FlickrException
import com.googlecode.flickrjandroid.RequestContext
import com.googlecode.flickrjandroid.auth.Permission
import com.googlecode.flickrjandroid.oauth.OAuth
import com.googlecode.flickrjandroid.oauth.OAuthInterface
import com.googlecode.flickrjandroid.oauth.OAuthToken
import com.googlecode.flickrjandroid.uploader.UploadMetaData
import com.googlecode.flickrjandroid.uploader.Uploader
import com.swapper.exception.media.DeletePhotoException
import com.swapper.exception.media.RetrieveException
import com.swapper.exception.media.UploadException
import com.swapper.system.SysParam


//import com.gmail.yuyang226.flickr.Flickr
//import com.gmail.yuyang226.flickr.FlickrException
//import com.gmail.yuyang226.flickr.RequestContext
//import com.gmail.yuyang226.flickr.auth.Permission
//import com.gmail.yuyang226.flickr.oauth.OAuth
//import com.gmail.yuyang226.flickr.oauth.OAuthInterface
//import com.gmail.yuyang226.flickr.oauth.OAuthToken
//import com.gmail.yuyang226.flickr.uploader.UploadMetaData
//import com.gmail.yuyang226.flickr.uploader.Uploader

class FlickrService {

    static final String FLICKR_API_KEY = "FLICKR_API_KEY"
    static final String FLICKR_API_SECRET = "FLICKR_API_SECRET"
    static final String ACCESS_TOKEN_KEY = "ACCESS_TOKEN_KEY"
    static final String ACCESS_TOKEN_SECRET = "ACCESS_TOKEN_SECRET"

    static final String API_TOKEN_KEY_DEV = "e8ecb4bb44e0cc757c80750740940229"
    static final String API_TOKEN_SECRET_DEV = "06eaac38ab5efbab"

    static final String ACCESS_TOKEN_KEY_DEV = "72157629671540197-1c1fc27b97a9d2bf"
    static final String ACCESS_TOKEN_SECRET_DEV = "ee2fdeb7612c359c"

    boolean transactional = true

    def grailsApplication

    private String apiKey
    private String apiSecret

    private String accessKey
    private String accessSecret

    URL getRequestToken() {

        String callBackUrl = "${grailsApplication.config.grails.serverURL}/admin/flickCallback"

        Flickr f = new Flickr(getApiKey(), getApiSecret())

        // Get a request token from Flickr
        OAuthToken oauthToken = f.getOAuthInterface().getRequestToken(callBackUrl);

        // Save the request token and token secret in the session (it is required in the #getAccessToken method)
        getSession().flickrRequestToken = oauthToken

        // Build the Authentication URL with the required permission
        URL oauthUrl = f.getOAuthInterface().buildAuthenticationUrl(Permission.WRITE, oauthToken);

        return oauthUrl
    }

    OAuthToken getAccessToken(String oauthToken, String oauthVerifier, String requestTokenSecret){

        Flickr f = new Flickr(getApiKey(), getApiSecret())

        OAuthInterface oauthApi = f.getOAuthInterface()

        // Exchange for an AccessToken from Flickr
        OAuth oauth = oauthApi.getAccessToken(oauthToken, requestTokenSecret, oauthVerifier)

        OAuthToken token = oauth.getToken()

        SysParam.createOrUpdate(ACCESS_TOKEN_KEY, token.oauthToken)
        accessKey = token.oauthToken

        SysParam.createOrUpdate(ACCESS_TOKEN_SECRET, token.oauthTokenSecret)
        accessSecret = token.oauthTokenSecret

        return token
    }

    String getPhotoURL(String photoID) throws RetrieveException {
        try{
            Flickr f = new Flickr(getApiKey(), getApiSecret())
            if(null==RequestContext.getRequestContext().getOAuth()){
                OAuth auth = new OAuth();
                auth.setToken(new OAuthToken(getAccessKey(), getAccessSecret()));
                // oauth token should always set to RequestContext if your app is multi-threading or multi users
                RequestContext.getRequestContext().setOAuth(auth);
            }
            return f.getPhotosInterface().getPhoto(photoID)?.getMediumUrl()
        }catch(FlickrException e){
            log.error(e)
            RetrieveException re = new RetrieveException("d")
            re.message = e.message
            throw re
        }
    }


    String deletePhoto(String photoID){
        try{
            Flickr f = new Flickr(getApiKey(), getApiSecret())
            if(null==RequestContext.getRequestContext().getOAuth()){
                OAuth auth = new OAuth();
                OAuthToken oauthToken = new OAuthToken(getAccessKey(), getAccessSecret())
                auth.setToken(oauthToken);

//                String x = f.getOAuthInterface().buildAuthenticationUrl(Permission.DELETE, oauthToken);

                // oauth token should always set to RequestContext if your app is multi-threading or multi users
                RequestContext.getRequestContext().setOAuth(auth);
            }
            return f.getPhotosInterface().delete(photoID)
        }catch(FlickrException e){
            log.error(e)
            throw new DeletePhotoException()
        }
    }

    def uploadPhoto(String title, InputStream inputStream){
        try{
            Flickr f = new Flickr(getApiKey(), getApiSecret())
            Uploader u = f.getUploader()
            UploadMetaData um = new UploadMetaData();
            um.setAsync(false);

            if(null==RequestContext.getRequestContext().getOAuth()){
                OAuth auth = new OAuth()
                auth.setToken(new OAuthToken(getAccessKey(), getAccessSecret()))
                // oauth token should always set to RequestContext if your app is multi-threading or multi users
                RequestContext.getRequestContext().setOAuth(auth)
            }
            return u.upload(title, inputStream, um)
        }catch (Exception e){
            log.error(e)
            throw new UploadException()
        }
    }

    String getApiKey(){
        if(!apiKey){
            apiKey = SysParam.valueForName(FLICKR_API_KEY)
        }
        return apiKey?:API_TOKEN_KEY_DEV
    }

    String getApiSecret(){
        if(!apiSecret){
            apiSecret = SysParam.valueForName(FLICKR_API_SECRET)
        }
        return apiSecret?:API_TOKEN_SECRET_DEV
    }

    String getAccessKey(){
        if(!accessKey){
            accessKey = SysParam.valueForName(ACCESS_TOKEN_KEY)
        }
        return accessKey?:ACCESS_TOKEN_KEY_DEV
    }

    String getAccessSecret(){
        if(!accessSecret){
            accessSecret = SysParam.valueForName(ACCESS_TOKEN_SECRET)
        }
        return accessSecret?:ACCESS_TOKEN_SECRET_DEV
    }
}
