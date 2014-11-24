
<%@ page import="com.swapper.item.criteria.SearchCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'searchCriteria.label', default: 'SearchCriteria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-searchCriteria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <content tag="title">
            <h3>
                <g:message code="default.list.label" args="[entityName]"/>
                <span class="pull-right">
                    <div class="btn-group" role="group" aria-label="Choose">
                        <g:link controller="searchCriteria" action="create" params="['category.id': category.id]" class="btn btn-primary">
                            <span class="glyphicon glyphicon-plus-sign"></span> <g:message code="default.new.label" args="[entityName]"/>
                        </g:link>
                    </div>
                </span>
            </h3>
        </content>

    <content tag="content">
        <div id="list-searchCriteria" class="content scaffold-list" role="main">

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
                            <g:sortableColumn property="description" title="${message(code: 'searchCriteria.description.label', default: 'Description')}" />

                            <g:sortableColumn property="shortDescription" title="${message(code: 'searchCriteria.shortDescription.label', default: 'Short Description')}" />

                            <g:sortableColumn property="searchCriteriaType" title="${message(code: 'searchCriteria.searchCriteriaType.label', default: 'Search Criteria Type')}" />

                            <g:sortableColumn property="ordering" title="${message(code: 'searchCriteria.ordering.label', default: 'Ordering')}" />

                            <th><g:message code="searchCriteria.category.label" default="Category" /></th>

                            <g:sortableColumn property="dateCreated" title="${message(code: 'searchCriteria.dateCreated.label', default: 'Date Created')}" />

                            <th></th>

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${searchCriteriaInstanceList}" status="i" var="searchCriteriaInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td>${fieldValue(bean: searchCriteriaInstance, field: "description")}</td>

                                <td>${fieldValue(bean: searchCriteriaInstance, field: "shortDescription")}</td>

                                <td>${searchCriteriaInstance.searchCriteriaType}</td>

                                <td>${fieldValue(bean: searchCriteriaInstance, field: "ordering")}</td>

                                <td>${fieldValue(bean: searchCriteriaInstance, field: "category.name")}</td>

                                <td><g:formatDate date="${searchCriteriaInstance.dateCreated}" /></td>

                                <td class="text-right">
                                    <div class="btn-group">
                                        <div class="btn-group pull-right">
                                            <g:link controller="searchCriteria" action="show" id="${searchCriteriaInstance.id}" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-eye-open"></span>
                                            </g:link>
                                            <g:link controller="searchCriteria" action="edit" id="${searchCriteriaInstance.id}" class="btn btn-primary">
                                                <span class="glyphicon glyphicon-pencil"></span>
                                            </g:link>
                                            %{--<g:if test="${categoryInstance.parent}">--}%
                                                %{--<g:link controller="searchCriteria" action="index" id="${searchCriteriaInstance.id}" class="btn btn-primary">--}%
                                                    %{--<span class="glyphicon glyphicon glyphicon-th"></span>--}%
                                                %{--</g:link>--}%
                                            %{--</g:if>--}%
                                            <g:link controller="searchCriteria" action="delete" id="${searchCriteriaInstance.id}" class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span>
                                            </g:link>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </content>
	</body>
</html>
