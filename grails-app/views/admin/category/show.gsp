<%@ page import="com.swapper.item.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="admin">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<content tag="title">
    <h3>
        <g:message code="default.list.label" args="[entityName]"/>
        <span class="pull-right">
            <div class="btn-group" role="group" aria-label="Choose">
                <g:link controller="category" action="index" class="btn btn-primary">
                    <span class="glyphicon glyphicon-home"></span> <g:message code="default.home.label"/>
                </g:link>
                <g:link controller="category" action="edit" id="${categoryInstance.id}" class="btn btn-primary">
                    <span class="glyphicon glyphicon-pencil"></span> <g:message code="default.edit.label" args="[entityName]"/>
                </g:link>
                <g:link controller="category" action="delete" id="${categoryInstance.id}" class="btn btn-danger">
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

                        <ii:informationLabel label="${message (code: "category.name.label", default: "Name")}" value="${categoryInstance?.name}"/>

                        <g:if test="${categoryInstance.parent}">
                            <ii:informationLabel label="${message (code: "category.parent.label", default: "Parent")}" value="${categoryInstance?.parent?.name}"/>
                        </g:if>
                        <g:else>
                            <ii:informationLabel label="${message (code: "category.parent.label", default: "Parent")}" value="None"/>
                        </g:else>

                        <ii:informationLabel label="${message (code: "category.dateCreated.label", default: "Date Created")}" value="${formatDate(date: categoryInstance?.dateCreated, format: 'dd/mm/yyyy hh:mm')}"/>
                        <ii:informationLabel label="${message (code: "category.lastUpdated.label", default: "Last Updated")}" value="${formatDate(date: categoryInstance?.lastUpdated, format: 'dd/MM/yyyy hh:mm')}"/>


                        <ii:informationLabel label="${message (code: "category.ordering.label", default: "Ordering")}" value="${categoryInstance?.ordering}"/>
                        <ii:informationLabel label="${message (code: "category.description.label", default: "Description")}" value="${categoryInstance?.description}"/>

                        <g:if test="${categoryInstance?.visible}">
                            <ii:informationLabel label="${message (code: "category.visible.label", default: "Visible")}" value="${message (code: com.swapper.enums.item.ItemVisibilityType.VISIBLE.i18nCode)}"/>
                        </g:if>
                        <g:else>
                            <ii:informationLabel label="${message (code: "category.visible.label", default: "Visible")}" value="${message (code: com.swapper.enums.item.ItemVisibilityType.HIDDEN.i18nCode)}"/>
                        </g:else>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</content>


</body>
</html>
