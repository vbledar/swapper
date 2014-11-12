package com.swapper.util

/**
 * Created by Bledar on 10/27/2014.
 */
class EnumUtilityMethods {
    public static getEnumFromString(String value, enumeration) {
        for (e in enumeration.values()) {
            if (e.toString().equalsIgnoreCase(value)) {
                return e;
            }
        }
    }
}
