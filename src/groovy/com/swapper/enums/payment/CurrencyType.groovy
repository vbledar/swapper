package com.swapper.enums.payment

/**
 * Created by Bledar on 10/28/2014.
 */
public enum CurrencyType {

    AUD ('Australian Dollar'),
    CAD ('Canadian Dollar'),
    EUR ('Euro'),
    GBP ('British Pound'),
    JPY ('Japanese Yen'),
    USD ('U.S. Dollar'),
    NZD ('New Zealand Dollar'),
    CHF ('Swiss Franc'),
    HKD ('Hong Kong Dollar'),
    SGD ('Singapore Dollar'),
    SEK ('Swedish Krona'),
    DKK ('Danish Krone'),
    PLN ('Polish Zloty'),
    NOK ('Norwegian Krone'),
    HUF ('Hungarian Forint'),
    CZK ('Czech Koruna'),
    ILS ('Israeli New Shekel'),
    MXN ('Mexican Peso'),
    BRL ('Brazilian Real (only for Brazilian members)'),
    MYR ('Malaysian Ringgit (only for Malaysian members)'),
    PHP ('Philippine Peso'),
    TWD ('New Taiwan Dollar'),
    THB ('Thai Baht'),
    TRY ('Turkish Lira (only for Turkish members)')

    private String description                                  // default human readable representation
    private String i18nCode                                     // i18n representation

    /**
     * Enumeration instance constructor. This constructor
     * will initialize the enumeration instance descriptive
     * value.
     *
     * @param descriptive, the value to set.
     */
    public CurrencyType(String description) {
        this.description = description
//        this.i18nCode = i18nCode
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
//    public String getI18nCode() {
//        return this.i18nCode
//    }
}