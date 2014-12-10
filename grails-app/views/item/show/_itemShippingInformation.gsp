<%@ page import="com.swapper.enums.item.ItemExchangeType;"%>

%{--<div class="row">--}%
    <div class="col-sm-12 ">
        <h3>
            <g:message code="item.management.shipping.information.header"/>
        </h3>
    </div>
%{--</div>--}%

<div class="divider"></div>
<div class="spacer10"></div>

<g:if test="${itemShipping.shippingInfo}">
    <ii:informationLabel label="${message(code: "form.field.item.shipping.info")}" value="${itemShipping.shippingInfo}"/>
</g:if>
<g:if test="${ item.itemExchangeType == ItemExchangeType.SELL|| item.itemExchangeType == ItemExchangeType.SWAPORSELL}">
    <g:if test="${!itemShipping.noCosts }">
        <ii:informationLabel label="${message(code: "form.field.shipping.costs")}" value="${itemShipping?.shippingCosts}"/>
    </g:if>
    <g:else>
        <ii:informationLabel label="${message(code: "form.field.shipping.costs")}" value="${message (code: "form.field.no.shipping.costs.applied")}"/>
    </g:else>
</g:if>