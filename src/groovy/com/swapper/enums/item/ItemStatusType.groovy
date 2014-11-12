package com.swapper.enums.item

/**
 * Created by Bledar on 10/29/2014.
 */
public enum ItemStatusType {

    AVAILABLE ('Available', 'item.status.type.available'),              // defines a new condition type
    UNAVAILABLE ('Unavailable', 'item.status.type.unavailable')         // defines a used condition type

    private String description                                          // default human readable representation
    private String i18nCode                                             // i18n representation

    /**
     * Enumeration instance constructor. This constructor
     * will initialize the enumeration instance descriptive
     * value.
     *
     * @param descriptive, the value to set.
     */
    public ItemStatusType(String description, String i18nCode) {
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