<div class="row">
    <div class="col-sm-12">
        <h3 class="text-center">
            <g:message code="item.management.overview.basic.information.header"/>
        </h3>

        <ii:informationLabel label="${message(code: "form.field.item.status")}" value="${message(code: item?.itemStatusType?.i18nCode)}"/>
        <ii:informationLabel label="${message(code: "form.field.item.condition")}" value="${message(code: item?.itemConditionType?.i18nCode)}"/>
        <ii:informationLabel label="${message(code: "form.field.exchange.type")}" value="${message(code: item?.itemExchangeType?.i18nCode)}"/>
        <g:if test="${item?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SELL || item?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
            <ii:informationLabel label="${message(code: "form.field.item.price")}" value="${item?.price}"/>
            <g:if test="${ itemShipping.noCosts }">
                <g:set var="shippingCostsFound" value="${message (code: "form.field.no.shipping.costs.applied")}"/>
            </g:if>
            <g:else>
                <g:set var="shippingCostsFound" value="${String.valueOf(itemShipping?.shippingCosts)}"/>
            </g:else>
            <ii:informationLabel label="${message(code: "form.field.shipping.costs")}" value="${shippingCostsFound}"/>
            %{--<ii:informationLabel label="${message(code: "form.field.total.buy.value")}" value="${String.valueOf(item?.price + (itemShipping?.shippingCosts ? itemShipping?.shippingCosts : 0))}"/>--}%
        </g:if>
    </div>
</div>