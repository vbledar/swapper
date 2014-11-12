package com.swapper

import com.swapper.system.SysParam
import com.swapper.user.Person

abstract class BaseController {

    /**
     * Returns the maximum number of elements in view.
     * If a parameter has not been defined then by default
     * a number of 12 elements will be created.
     */
    def getMaximumNumberOfElementsInView() {
        String maximumElementInView = SysParam.valueForName(SysParam.MAX_ELEMENT_IN_VIEW_PARAM)
        if (!maximumElementInView) {
            SysParam.createOrUpdate(SysParam.MAX_ELEMENT_IN_VIEW_PARAM, "12")
            maximumElementInView = "4"
        }
        return Integer.parseInt(maximumElementInView)
    }

    /**
     * Sets the user that has logged in in the session.
     *
     * @param person the person instance to set.
     */
    def setLoggedInUserInSession(Person person) {
        session["loggeduser"] = person
    }

    /**
     * Retrieves the logged in user from session.
     *
     * @return the logged in person instance.
     */
    Person getLoggedInUser() {
        Person person = session["loggeduser"]
    }

    /**
     * Retrieves the logged in user from session by connecting
     * the user to the database session.
     *
     * @return the logged in person instance.
     */
    Person getLoggedInUserFromDatabase() {
        Person person = session["loggeduser"]
        return Person.findBySocialNetworkId(person?.socialNetworkId)
    }
}
