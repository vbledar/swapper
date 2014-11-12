package com.swapper.media

class FlickrController {

    def flickrService

    def flickr = {}

    def flickrRequestToken = {
        redirect(url: flickrService.getRequestToken())
    }

    def flickCallback = {
        def accessToken = flickrService.getAccessToken(params.oauth_token, params.oauth_verifier, getSession().flickrRequestToken.oauthTokenSecret)
        getSession().removeAttribute('flickrRequestToken')
        render(view: 'flickr', model: [flickrMessage: 'Authorized'])
    }
}
