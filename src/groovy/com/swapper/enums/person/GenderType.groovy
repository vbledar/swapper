package com.swapper.enums.person

/**
 * Created by Bledar on 10/27/2014.
 */
public enum GenderType {

    NOT_KNOWN ("Unknown", 0, "swapper.enums.gender.unknown"),
    MALE ("Male", 1, "swapper.enums.gender.male"),
    FEMALE ("Female", 2, "swapper.enums.gender.female")
    //  NOT_APPLICABLE ("Not Applicable", 9, "swapper.enums.gender.not.applicable") - NOT TO BE USED IN THIS APPLICATIONS

    private String description
    private Integer isoCode
    private String i18nCode

    public GenderType(String description, Integer isoCode, String i18nCode) {
        this.description = description
        this.isoCode = isoCode
        this.i18nCode = i18nCode
    }

    public String getDescription() {
        return this.description
    }

    public String getIsoCode() {
        return this.isoCode
    }

    public String getI18nCode() {
        return this.i18nCode
    }
}