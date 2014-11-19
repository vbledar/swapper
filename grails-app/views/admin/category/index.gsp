<%@ page import="com.swapper.item.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'form.field.category', default: 'Category')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<content tag="title">
    <h3>
        <g:message code="default.list.label" args="[entityName]"/>
        <span class="pull-right">
            <div class="btn-group" role="group" aria-label="Choose">
                <g:link controller="category" action="index" class="btn btn-primary">
                    <g:message code="default.home.label"/>
                </g:link>
                <g:link controller="category" action="create" class="btn btn-primary">
                    <g:message code="default.new.label" args="[entityName]"/>
                </g:link>
            </div>
        </span>
    </h3>
</content>

<content tag="content">
    <div id="list-category" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="spacer10"></div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="message" role="status">${flash.message}</div>
                </div>
            </div>
        </g:if>

        <div class="spacer10"></div>

        <div class=row">
            <div class="col-sm-12">

                <table class="table">
                    <thead>
                    <tr>

                        <g:sortableColumn property="name" title="${message(code: 'category.name.label', default: 'Name')}"/>

                        <th><g:message code="category.parent.label" default="Parent"/></th>

                        <g:sortableColumn property="dateCreated"
                                          title="${message(code: 'category.dateCreated.label', default: 'Date Created')}"/>

                        <g:sortableColumn property="description"
                                          title="${message(code: 'category.description.label', default: 'Description')}"/>

                        <g:sortableColumn property="lastUpdated"
                                          title="${message(code: 'category.lastUpdated.label', default: 'Last Updated')}"/>

                        <g:sortableColumn property="ordering"
                                          title="${message(code: 'category.ordering.label', default: 'Ordering')}"/>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${categoryInstanceList}" status="i" var="categoryInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td>
                                <g:link controller="category" action="show" id="${categoryInstance.id}">
                                    ${fieldValue(bean: categoryInstance, field: "name")}
                                </g:link>
                            </td>

                            <td><g:link action="show"
                                        id="${categoryInstance.id}">${fieldValue(bean: categoryInstance, field: "parent")}</g:link></td>

                            <td><g:formatDate date="${categoryInstance.dateCreated}"/></td>

                            <td>${fieldValue(bean: categoryInstance, field: "description")}</td>

                            <td><g:formatDate date="${categoryInstance.lastUpdated}"/></td>

                            <td>${fieldValue(bean: categoryInstance, field: "ordering")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="pagination">
                    <g:paginate total="${categoryInstanceCount ?: 0}"/>
                </div>
            </div>
        </div>
    </div>
</content>
</body>
</html>
