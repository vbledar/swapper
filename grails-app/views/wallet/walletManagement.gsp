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

    <div id="topUpAccountContainer">
        <g:render template="personsWallet" model="[wallet: wallet]"/>
    </div>

</div>
</body>
</html>