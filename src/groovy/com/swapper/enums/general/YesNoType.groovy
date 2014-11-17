package com.swapper.enums.general

/**
 * Created by Bledar on 11/17/2014.
 */
public enum YesNoType {

    YES ('Yes', 'yes.no.type.yes'),             // defines a new condition type
    NO ('No', 'yes.no.type.no')                 // defines a used condition type

    private String description                  // default human readable representation
    private String i18nCode                     // i18n representation

    /**
     * Enumeration instance constructor. This constructor
     * will initialize the enumeration instance descriptive
     * value.
     *
     * @param descriptive, the value to set.
     */
    public YesNoType(String description, String i18nCode) {
        this.description = description
        this.i18nCode = i18nCode
    }

    /**
     * Retrieve the descriptive information of this enumeration
     * instance.
     *
     * @return <code>String</code> the descriptive value of the
     * enumeration instance.
     */
    public String getDescription() {
        return this.description
    }

    /**
     * Retrieve the i18n descriptive information of this enumeration
     * instance.
     *
     * @return <code>String</code> the i18n descriptive value of the
     * enumeration instance.
     */
    public String getI18nCode() {
        return this.i18nCode
    }

}