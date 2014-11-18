<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 10/29/2014
  Time: 12:08 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="internalMenu"/>

    <title>
        <g:message code="page.title.swap.shop.management"/>
    </title>
</head>

<body>

<content tag="internalMenu">
    <div class="row">
        <div class="col-sm-12 no-padding-no-margin">
            <g:render template="/standard/swapShopMenu"/>
        </div>
    </div>
</content>

<div class="internal_container">
    <div class="page-header">
        <h1>
            <g:message code="swap.shop.management.header"/>
            <br />
            <small>
                <g:message code="swap.shop.management.sub.header"/>
            </small>
        </h1>
    </div>

    <div id="swapShopContainer">
        <g:render template="personsSwapShop" model="[items: items, itemsCounted: itemsCounted]"/>
    </div>
</div>
</body>
</html>