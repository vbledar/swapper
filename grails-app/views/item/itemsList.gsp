<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 11/19/2014
  Time: 10:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">

    <title>${maincat} > ${subcat}</title>
</head>

<body>


    <div class="container_80" style="margin-left: auto; margin-right: auto;">
        <div class="row">
            <div class="col-sm-2">
                <g:render template="/category/searchCriteria/searchCriteria" model="[maincat: maincat, subcat: subcat, searchCriteria: searchCriteria, showunavailable: showunavailable]" />
            </div>
            <div class="col-sm-10">
                <g:each in="${items}" var="item">
                    <g:render template="/item/itemInListView" model="[item: item]"/>
                </g:each>
            </div>
        </div>
    </div>

</body>
</html>