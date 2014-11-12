package com.swapper.enums.person

/**
 * Created by Bledar on 10/27/2014.
 */
public enum LocaleType {

    ENGLISH ("English", "en_US", "swapper.enums.locale.english"),
    GREEK ("Ελληνικά", "el", "swapper.enums.locale.greek")

    private String description
    private String locale
    private String i18nCode

    public LocaleType(String description, String locale, String i18nCode) {
        this.description = description
        this.locale = locale
        this.i18nCode = i18nCode
    }

    public String getDescription() {
        return this.description
    }

    public String getLocale() {
        return this.locale
    }

    public String getI18nCode() {
        return this.i18nCode
    }
}