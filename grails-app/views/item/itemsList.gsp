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

    <title></title>
</head>

<body>


    <div class="container_80" style="margin-left: auto; margin-right: auto;">
        <div class="row">
            <g:each in="${items}" var="item">
                <g:render template="/item/itemInListView" model="[item: item]"/>
            </g:each>
        </div>
    </div>

</body>
</html>