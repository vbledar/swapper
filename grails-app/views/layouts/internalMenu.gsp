<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 10/27/2014
  Time: 7:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<g:applyLayout name="main">

    <g:if test="${pageProperty(name: "page.internalMenu")}">
        <g:pageProperty name="page.internalMenu"/>
        <div class="spacer10"></div>
    </g:if>

    <g:layoutBody/>
</g:applyLayout>