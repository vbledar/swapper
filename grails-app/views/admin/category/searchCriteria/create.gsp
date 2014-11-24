<!DOCTYPE html>
<html>
	<head>
        <meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'searchCriteria.label', default: 'SearchCriteria')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
        <content tag="title">
            <h3>
                <g:message code="default.list.label" args="[entityName]"/>
                <span class="pull-right">
                    <div class="btn-group" role="group" aria-label="Choose">
                        <g:link controller="searchCriteria" action="index" class="btn btn-primary">
                            <g:message code="default.home.label"/>
                        </g:link>
                        <g:link controller="category" action="index" class="btn btn-primary">
                            <g:message code="button.label.cancel"/>
                        </g:link>
                    </div>
                </span>
            </h3>
        </content>

        <content tag="content">
            <div id="list-searchCriteria" class="content scaffold-list" role="main">

                <div class=row">
                    <div class="col-sm-12">

                        <div id="create-category" class="content scaffold-create" role="main">
                            <blockquote>
                                <g:message code="default.create.label" args="[entityName]"/>
                            </blockquote>
                            <g:hasErrors bean="${searchCriteriaInstance}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${searchCriteriaInstance}" var="error">
                                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>

                            <g:form controller="searchCriteria" action="save" >
                                <g:hiddenField name="category.id" value="${category.id}" type="number"/>
                                <fieldset class="form">
                                    <g:render template="/admin/category/searchCriteria/form"/>
                                </fieldset>
                                <fieldset class="buttons">
                                    <g:submitButton name="create" class="save btn btn-primary pull-right" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                                </fieldset>
                            </g:form>
                        </div>

                    </div>
                </div>
            </div>
        </content>
	</body>
</html>
