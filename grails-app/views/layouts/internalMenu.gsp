<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 10/27/2014
  Time: 7:50 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<g:applyLayout name="main">

    <g:if test="${pageProperty(name: "page.internalMenu")}">
        <div class="container_80" style="margin-right: auto; margin-left: auto;">
            <g:pageProperty name="page.internalMenu"/>
        </div>

        <div class="spacer10"></div>
    </g:if>

    <div class="container_80">
        <g:layoutBody/>
    </div>
</g:applyLayout>