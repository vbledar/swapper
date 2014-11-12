package com.swapper.multimedia.photo

import com.swapper.user.Person

class PersonPhoto extends Photo {

    static belongsTo = [person: Person]

    static constraints = {
    }
}
