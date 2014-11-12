package com.swapper.enums.payment

/**
 * Created by Bledar on 10/28/2014.
 */
public enum TransactionPaymentType {

    TOP_UP ('Top Up', 'transaction.payment.type.top.up'),       // defines an account top up
    MONETARY ('Monetary', 'transaction.payment.type.monetary')  // defines a monetary transaction

    private String description                                  // default human readable representation
    private String i18nCode                                     // i18n representation

    /**
     * Enumeration instance constructor. This constructor
     * will initialize the enumeration instance descriptive
     * value.
     *
     * @param descriptive, the value to set.
     */
    public TransactionPaymentType(String description, String i18nCode) {
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