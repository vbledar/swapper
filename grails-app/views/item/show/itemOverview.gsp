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

        <div class="page-header">
            <h1>
                ${item.name}
                <br />
                <small>
                    ${item.description}
                </small>
            </h1>
        </div>

        <div class="row">
            <div class="col-sm-4 text-center">

                <g:render template="/item/itemPhotosCarousel" model="[item: item]"/>

                %{--<g:if test="${person?.photo?.url}">--}%
                    %{--<g:img uri="${person?.photo?.url}" class="img-thumbnail img-responsive" style="margin-left: auto; margin-right: auto; min-height: 150px; min-width: 150px;"/>--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    %{--<g:set var="socialNetworkType" value="${message(code: person?.socialNetworkType?.i18nDescriptive)}"/>--}%
                    %{--<button class="btn btn-primary btn-sm">--}%
                        %{--<g:message code="button.label.load.from.social" args="[socialNetworkType]"/>--}%
                    %{--</button>--}%
                %{--</g:else>--}%

                <div class="spacer10"></div>

                <g:render template="/item/itemSocialHorizontal"/>

                <div class="spacer10"></div>

                <ui:userLoggedIn>
                    <g:if test="${item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAP || item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
                        <button id="swapRequestInitiator" class="btn btn-primary" style="width: 100%; height: 100px">
                            <span class="glyphicon glyphicon-random"></span><br> <g:message code="item.overview.swap.request.initiator"/>
                        </button>
                        <div class="spacer10"></div>
                    </g:if>
                    <g:if test="${item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SELL || item.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
                        <button id="monetaryRequestInitiator" class="btn btn-primary" style="width: 100%; height: 100px">
                            <span class="glyphicon glyphicon-euro"></span><br> <g:message code="item.overview.monetary.request.initiator"/>
                        </button>
                        <div class="spacer10"></div>
                    </g:if>
                    <button id="conversationRequestInitiator" class="btn btn-primary" style="width: 100%; height: 100px">
                        <span class="glyphicon glyphicon-comment"></span><br> <g:message code="item.overview.conversation.request.initiator"/>
                    </button>

                    <div class="spacer10"></div>
                </ui:userLoggedIn>

                <ui:userNotLoggedIn>
                    <div class="alert alert-info">
                        <h6>
                            <g:message code="user.message.login.to.start.request"/>
                        </h6>
                    </div>
                </ui:userNotLoggedIn>
            </div>
            <div class="col-sm-8 profile-container">
                <div class="row">
                    <div class="col-sm-12">
                        <g:render template="/item/show/itemBasicInformation" model="[item: item, itemShipping: itemShipping]"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        %{--<g:render template="/item/show/itemBasicInformation" model="[item: item]"/>--}%
                    </div>
                </div>
                %{--<g:if test="${"address".equalsIgnoreCase(showContent)}">--}%
                    %{--<g:render template="personAddressesInfo" model="[addresses: addresses]"/>--}%
                %{--</g:if>--}%
                %{--<g:if test="${"payment".equalsIgnoreCase(showContent)}">--}%
                    %{--<g:render template="personPaymentMethodInfo" model="[paymentMethods: paymentMethods]"/>--}%
                %{--</g:if>--}%
                %{--<g:else>--}%
                    %{--<g:render template="personBasicInfo" model="[person: person]"/>--}%
                %{--</g:else>--}%
            </div>
        </div>
    </div>

</body>
</html>