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
            <div class="col-sm-12">
                <g:render template="/category/searchCriteria/searchCriteriaPanel"/>
            </div>
        </div>


        <g:each in="${items}" var="item">
            <g:render template="/item/itemInListView" model="[item: item]"/>
        </g:each>
    </div>

</body>
</html>