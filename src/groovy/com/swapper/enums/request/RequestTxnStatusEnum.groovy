package com.swapper.enums.request

/**
 * Created by Bledar on 12/1/2014.
 */
public enum RequestTxnStatusEnum {

    REJECTED                    ("Rejected",                0, "swapper.enums.request.txn.status.rejected"),
    CANCELLED                   ("Cancelled",               1, "swapper.enums.request.txn.status.cancelled"),
    CANCELLED_BY_REQUESTER      ("Cancelled by requester",  2, "swapper.enums.request.txn.status.cancelled.by.requester"),
    CANCELLED_BY_ACCEPT         ("Cancelled by responder",  3, "swapper.enums.request.txn.status.cancelled.by.accept"),
    OPEN                        ("Open",                    5, "swapper.enums.request.txn.status.open"),
    ACCEPTED                    ("Accepted",                6, "swapper.enums.request.txn.status.accepted"),
    PAYED                       ("Payed",                   7, "swapper.enums.request.txn.status.payed"),
    SHIPPED                     ("Shipped",                 8, "swapper.enums.request.txn.status.shipped"),
    RECEIVED                    ("Received",                9, "swapper.enums.request.txn.status.received"),
    RATED                       ("Rated",                  10, "swapper.enums.request.txn.status.rated"),
    COMPLETED                   ("Completed",              11, "swapper.enums.request.txn.status.completed"),

    private String description
    private Integer level
    private String i18nCode

    public RequestTxnStatusEnum(String description, Integer level, String i18nCode) {
        this.description = description
        this.level = level
        this.i18nCode = i18nCode
    }

    public String getDescription() {
        return this.description
    }

    public String getLevel() {
        return this.level
    }

    public String getI18nCode() {
        return this.i18nCode
    }

}