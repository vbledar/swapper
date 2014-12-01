package com.swapper.enums.request

/**
 * Created by Bledar on 12/1/2014.
 */
public enum RequestTypeEnum {
    SWAP_REQUEST ("SwapRequest", "swapper.enums.request.type.swap"),
    MONETARY_REQUEST ("MonetaryRequest", "swapper.enums.request.type.monetary")

    private String description
    private String i18nCode

    public RequestTypeEnum(String description, String i18nCode) {
        this.description = description
        this.i18nCode = i18nCode
    }

    public String getDescription() {
        return this.description
    }

    public String getI18nCode() {
        return this.i18nCode
    }
}
