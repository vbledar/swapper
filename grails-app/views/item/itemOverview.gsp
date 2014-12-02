<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 12/1/2014
  Time: 10:24 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <title>
        ${item.name}
    </title>
</head>

<body>

<div class="container_80" style="margin-left: auto; margin-right: auto;">
    <div class="row">
        <div class="col-sm-3">

        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-3">
                    <div class="col-sm-12">
                        <g:render template="/item/itemPhotosCarousel" model="[item: item]"/>
                    </div>
                </div>
                <div class="col-sm-9">
                    <div class="col-sm-5">
                        <g:render template="/item/itemBasicInformationOverview" model="[item: item]"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <g:render template="/item/itemDetailedInfoSummary" model="[item: item, itemShipping: item.itemShipping]"/>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-right">
                    <g:render template="/item/itemSocialHorizontal"/>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>