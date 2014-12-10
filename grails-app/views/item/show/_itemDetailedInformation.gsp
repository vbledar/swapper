%{--<div class="row">--}%
    <div class="col-sm-12 ">
        <h3>
            <g:message code="item.management.overview.details.information.header"/>
        </h3>
    </div>
%{--</div>--}%

<div class="divider"></div>
<div class="spacer10"></div>

<ii:informationLabel label="${message(code: "form.field.main.category")}" value="${item?.category?.parent?.name}"/>
<ii:informationLabel label="${message(code: "form.field.sub.category")}" value="${item?.category?.name}"/>

<g:each in="${item.quantities[0].attributes}" var="attr">
    <g:if test="${attr instanceof com.swapper.item.attribute.LiteralItemAttribute}">
        <g:if test="${attr.stringValue}">
            <g:set var="attributeValue" value="${attr.stringValue}"/>
        </g:if>
    </g:if>

    <g:elseif test="${attr.numberValue}">
        <g:set var="attributeValue" value="${attr.numberValue}"/>
    </g:elseif>
    <g:elseif test="${attr.booleanValue != null}">
        <g:if test="${attr?.booleanValue}">
            <g:set var="attributeValue" value="${com.swapper.enums.general.YesNoType.YES.getI18nCode()}"/>
        </g:if>
        <g:elseif test="${!attr?.booleanValue}">
            <g:set var="attributeValue" value="${com.swapper.enums.general.YesNoType.NO.getI18nCode()}"/>
        </g:elseif>
    </g:elseif>
    <ii:informationLabel label="${attr.searchCriteria.shortDescription}" value="${attributeValue}"/>
</g:each>
