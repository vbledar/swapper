class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")

        "/myProfile" (controller: "myProfile")

        "/flickr/$action?/$id?"(controller: "flickr")

        "500"(view:'/error')
	}
}
