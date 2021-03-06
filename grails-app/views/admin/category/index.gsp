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
                <g:link controller="category" action="create" class="btn btn-primary">
                    <span class="glyphicon glyphicon-plus-sign"></span> <g:message code="default.new.label" args="[entityName]"/>
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

                        <g:sortableColumn property="lastUpdated"
                                          title="${message(code: 'category.lastUpdated.label', default: 'Last Updated')}"/>

                        <g:sortableColumn property="description"
                                          title="${message(code: 'category.description.label', default: 'Description')}"/>

                        <g:sortableColumn property="ordering"
                                          title="${message(code: 'category.ordering.label', default: 'Ordering')}"/>
                        <th class="text-right">
                            <g:message code="action.column.available.actions" default="Available Actions"/>
                        </th>

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

                            <td>
                                <g:link controller="category" action="show" id="${categoryInstance?.parent?.id}">
                                    ${fieldValue(bean: categoryInstance, field: "parent.name")}
                                </g:link>
                            </td>

                            <td><g:formatDate date="${categoryInstance.dateCreated}" format="dd/MM/yyyy hh:mm"/></td>

                            <td><g:formatDate date="${categoryInstance.lastUpdated}" format="dd/MM/yyyy hh:mm"/></td>

                            <td>${fieldValue(bean: categoryInstance, field: "description")}</td>

                            <td>${fieldValue(bean: categoryInstance, field: "ordering")}</td>

                            <td>
                                <div class="btn-group pull-right">
                                    <g:link controller="category" action="show" id="${categoryInstance.id}" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-eye-open"></span>
                                    </g:link>
                                    <g:link controller="category" action="edit" id="${categoryInstance.id}" class="btn btn-primary">
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </g:link>
                                    <g:if test="${categoryInstance.parent}">
                                        <g:link controller="searchCriteria" action="index" id="${categoryInstance.id}" class="btn btn-primary">
                                            <span class="glyphicon glyphicon glyphicon-th"></span>
                                        </g:link>
                                    </g:if>
                                    <g:link controller="category" action="show" id="${categoryInstance.id}" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-remove"></span>
                                    </g:link>
                                </div>
                            </td>
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
