<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 12/2/2014
  Time: 10:37 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="internalMenu">

    <title>
        ${item.name}
    </title>
</head>

<body>

    <div class="internal_container">

        <div class="row">
            <div class="col-xs-12 col-sm-offset-3 col-sm-9 col-md-offset-3 col-md-9 profile-container">
                <div class="page-header">
                    <h1>
                        ${item.name}
                        <br />
                        <small>
                            ${item.description}
                        </small>
                        <small class="pull-right" style="color: darkorange">
                            <span class="visible-xs visible-sm hidden-md"><br></span>
                            <i>
                                <g:message code="swap.shop.item.uploaded.on" args="[formatDate(format: 'dd/MM/yyyy', date: item?.dateCreated)]"/>
                            </i>
                        </small>
                    </h1>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 col-sm-3 col-md-3 text-center thumbnail">

                <g:render template="/person/personOverview" model="[person: item.person]"/>

            </div>
            <div class="col-xs-12 col-sm-9 col-md-9 profile-container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <g:render template="/item/itemPhotosCarousel" model="[item: item]"/>
                    </div>
                    <div class="col-xs-12 col-sm-4 text-right">
                        <ui:userLoggedIn>
                            <g:if test="${item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAP || item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
                                <button id="swapRequestInitiator" class="btn btn-primary" style="width: 100%">
                                    <span class="glyphicon glyphicon-random"></span>
                                    <br class="visible-xs hidden-sm hidden-md">
                                    <g:message code="item.overview.swap.request.initiator"/>
                                </button>
                                <div class="spacer10"></div>
                            </g:if>
                            <g:if test="${item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SELL || item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
                                <button id="monetaryRequestInitiator" class="btn btn-primary" style="width: 100%">
                                    <span class="glyphicon glyphicon-euro"></span>
                                    <br class="visible-xs hidden-sm hidden-md">
                                    <g:message code="item.overview.monetary.request.initiator"/>
                                </button>
                                <div class="spacer10"></div>
                            </g:if>
                            <button id="conversationRequestInitiator" class="btn btn-primary" style="width: 100%">
                                <span class="glyphicon glyphicon-comment"></span>
                                <br class="visible-xs hidden-sm hidden-md">
                                <g:message code="item.overview.conversation.request.initiator"/>
                            </button>

                            <div class="spacer10"></div>

                            <g:render template="/item/itemSocialHorizontal"/>
                        </ui:userLoggedIn>

                        <ui:userNotLoggedIn>
                            <div class="alert alert-info">
                                <h6>
                                    <g:message code="user.message.login.to.start.request"/>
                                </h6>
                            </div>
                        </ui:userNotLoggedIn>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
                        <g:render template="/item/show/itemBasicInformation" model="[item: item, itemShipping: itemShipping]"/>
                    </div>
                </div>
                <g:if test="${item.quantities[0].attributes.size() > 0}">
                    <div class="row">
                        <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
                            <g:render template="/item/show/itemDetailedInformation" model="[item: item, itemShipping: itemShipping]"/>
                        </div>
                    </div>
                </g:if>
                <div class="row">
                    <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
                        <g:render template="/item/show/itemShippingInformation" model="[item: item, itemShipping: item.itemShipping]"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>