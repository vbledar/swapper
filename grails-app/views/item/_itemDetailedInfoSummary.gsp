<%@ page import="com.swapper.enums.item.ItemExchangeType;"%>
<%@ page import="com.swapper.domain.commands.*" %>
<%@ page import="com.swapper.item.Item" %>

<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-default">
            <div class="spacer10"></div>
            <ul class="nav nav-pills nav-justified" style="padding-left: 10px; padding-right: 10px;">
                <li class="active">
                    <a href="#productInfo" data-toggle="tab">
                        <g:message code="item.detailed.summary.product"/>
                    </a>
                </li>
                <li>
                    <a href="#productDetails" data-toggle="tab">
                        <g:message code="item.detailed.summary.details"/>
                    </a>
                </li>
                <li>
                    <a href="#shippingInfos" data-toggle="tab">
                        <g:message code="item.detailed.summary.shipping"/>
                    </a>
                </li>
            </ul>

            <div class="spacer10"></div>
            <div class="divider"></div>
            <div class="spacer10"></div>

            <div class="tab-content custom-tab-content">
                <div class="tab-pane fade in active" id="productInfo">
                    <div class="row">
                        <div class="col-sm-12">
                            <ii:informationLabel label="${message(code: "form.field.description")}" value="${item?.description}"/>

                            <g:if test="${!item.designer || item?.designer.trim().equalsIgnoreCase("")}">
                                <strong>Designer information not provided.</strong>
                                <g:set var="designerInformation" value="${message (code: "user.message.designer.not.applied")}"/>
                            </g:if>
                            <g:else>
                                <g:set var="designerInformation" value="${item?.designer}"/>
                            </g:else>
                            <ii:informationLabel label="${message(code: "form.field.designer")}" value="${designerInformation}"/>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="productDetails">
                    <div class="row">
                        <div class="col-sm-12">
                            <ii:informationLabel label="${message(code: "form.field.main.category")}" value="${item?.category?.parent?.name}"/>
                            <ii:informationLabel label="${message(code: "form.field.sub.category")}" value="${item?.category?.name}"/>
                            <g:if test="${item.quantities[0].attributes.size() > 0}">
                                <g:each in="${item.quantities[0].attributes}" var="attr">
                                    <g:if test="${attr.stringValue}">
                                        <g:set var="attributeValue" value="${attr.stringValue}"/>
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
                            </g:if>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="shippingInfos">
                    <div class="row">
                        <div class="col-sm-12">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>