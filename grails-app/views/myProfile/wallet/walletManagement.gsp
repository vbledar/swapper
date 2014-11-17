<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 11/17/2014
  Time: 10:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="internalMenu">

    <title>
        <g:message code="page.title.wallet.management"/>
    </title>
</head>

<body>

<content tag="internalMenu">
    <div class="row">
        <div class="col-sm-12 no-padding-no-margin flat-btn-group">
            <g:render template="/standard/accountMenu"/>
        </div>
    </div>
</content>

<div class="internal_container">
    <div class="page-header">
        <h1>
            <g:message code="wallet.management.header"/>
            <br />
            <small>
                <g:message code="wallet.management.sub.header"/>
            </small>
        </h1>
    </div>

    <div class="row">
        <div class="col-sm-3 text-center">
            <h3>
                <g:message code="wallet.management.status"/>
            </h3>

            <div class="panel panel-default" style="padding: 10px;">
                <ii:informationLabel label="${message(code: "form.field.available.points")}" value="${wallet?.availablePoints ? wallet?.availablePoints : 0}"/>
                <ii:informationLabel label="${message(code: "form.field.reserved.points")}" value="${wallet?.reservedPoints ? wallet?.reservedPoints : 0}"/>
                <ii:informationLabel label="${message(code: "form.field.consumed.points")}" value="${wallet?.consumedPoints ? wallet?.consumedPoints : 0}"/>
            </div>

            %{--<div class="spacer10"></div>--}%

            <button id="topUpAccount" class="btn btn-primary" style="width: 100%; height: 100px">
                <span class="glyphicon glyphicon-credit-card"></span><br> <g:message code="button.label.top.up"/>
            </button>

            <div class="spacer10"></div>

            <div class="row">
                <div class="col-sm-12">
                    <g:if test="${!wallet?.availablePoints}">
                        <div class="alert alert-info text-left">
                            <h6>
                                <g:message code="user.message.top.up.account"/>
                            </h6>
                        </div>
                    </g:if>
                </div>
            </div>

            <div class="spacer10"></div>
        </div>
        <div class="col-sm-9 profile-container">
            <h3>
                <g:message code="wallet.management.transactions.list"/>
            </h3>

            <g:if test="${!wallet?.walletTransactions}">
                <div class="alert alert-info">
                    <g:message code="user.message.no.wallet.transactions"/>
                </div>
            </g:if>
        </div>
    </div>
</div>
</body>
</html>