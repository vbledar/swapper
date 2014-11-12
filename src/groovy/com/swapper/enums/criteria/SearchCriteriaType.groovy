package com.swapper.enums.criteria

/**
 * Created by Bledar on 10/29/2014.
 */
public enum SearchCriteriaType {

    NUMERIC ('Numeric', 'search.criteria.type.numeric'),
    LITERAL ('Literal', 'search.criteria.type.literal'),
    BOOLEAN ('Boolean', 'search.criteria.type.boolean')

    private String description                                  // default human readable representation
    private String i18nCode                                     // i18n representation

    /**
     * Enumeration instance constructor. This constructor
     * will initialize the enumeration instance descriptive
     * value.
     *
     * @param descriptive, the value to set.
     */
    public SearchCriteriaType(String description, String i18nCode) {
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