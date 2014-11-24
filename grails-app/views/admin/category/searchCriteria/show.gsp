
<%@ page import="com.swapper.item.criteria.SearchCriteria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'searchCriteria.label', default: 'SearchCriteria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <content tag="title">
        <h3>
            <g:message code="default.list.label" args="[entityName]"/>
            <span class="pull-right">
                <div class="btn-group" role="group" aria-label="Choose">
                    <g:link controller="searchCriteria" action="index" id="${searchCriteriaInstance.category.id}" class="btn btn-primary">
                        <span class="glyphicon glyphicon-home"></span> <g:message code="default.home.label"/>
                    </g:link>
                    <g:link controller="searchCriteria" action="edit" id="${searchCriteriaInstance.id}" class="btn btn-primary">
                        <span class="glyphicon glyphicon-pencil"></span> <g:message code="default.edit.label" args="[entityName]"/>
                    </g:link>
                    <g:link controller="searchCriteriaInstance" action="delete" id="${searchCriteriaInstance.id}" class="btn btn-danger">
                        <span class="glyphicon glyphicon-remove"></span> <g:message code="default.delete.label" default="Delete"/>
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

                    <div id="show-category" class="content scaffold-show" role="main">
                        <ol class="property-list category">

                            <ii:informationLabel label="${message (code: "category.description.label", default: "Description")}" value="${searchCriteriaInstance?.description}"/>

                            <ii:informationLabel label="${message (code: "searchCriteria.shortDescription.label", default: "Short Description")}" value="${searchCriteriaInstance?.shortDescription}"/>

                            <ii:informationLabel label="${message (code: "searchCriteria.searchCriteriaType.label", default: "Search Criteria Type")}" value="${searchCriteriaInstance?.searchCriteriaType}"/>

                            <ii:informationLabel label="${message (code: "category.parent.label", default: "Parent")}" value="${searchCriteriaInstance?.category?.name}"/>

                            <ii:informationLabel label="${message (code: "category.dateCreated.label", default: "Date Created")}" value="${formatDate(date: searchCriteriaInstance?.dateCreated, format: 'dd/mm/yyyy hh:mm')}"/>
                            <ii:informationLabel label="${message (code: "category.lastUpdated.label", default: "Last Updated")}" value="${formatDate(date: searchCriteriaInstance?.lastUpdated, format: 'dd/MM/yyyy hh:mm')}"/>


                            <ii:informationLabel label="${message (code: "category.ordering.label", default: "Ordering")}" value="${searchCriteriaInstance?.ordering}"/>

                            <g:if test="${com.swapper.enums.criteria.SearchCriteriaType.NUMERIC == searchCriteriaInstance.searchCriteriaType}">
                                <ii:informationLabel label="${message (code: "searchCriteria.max.label", default: "Max")}" value="${searchCriteriaInstance.max}"/>

                                <ii:informationLabel label="${message (code: "searchCriteria.min.label", default: "Min")}" value="${searchCriteriaInstance.min}"/>

                                <ii:informationLabel label="${message (code: "searchCriteria.step.label", default: "Step")}" value="${searchCriteriaInstance.step}"/>
                            </g:if>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </content>

		</div>
	</body>
</html>
