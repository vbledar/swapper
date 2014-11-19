<%@ page import="com.swapper.item.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'parent', 'error')} ">
    <label for="parent">
        <g:message code="category.parent.label" default="Parent"/>
    </label>
    <g:select id="parent"
              name="parent.id"
              from="${com.swapper.item.Category.list()}"
              optionKey="id"
              value="${categoryInstance?.parent?.id}"
              class="many-to-one"
              noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categories', 'error')} ">
    <label for="categories">
        <g:message code="category.categories.label" default="Categories"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${categoryInstance?.categories ?}" var="c">
            <li><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="category" action="create"
                    params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'category.label', default: 'Category')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="category.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${categoryInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'items', 'error')} ">
    <label for="items">
        <g:message code="category.items.label" default="Items"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${categoryInstance?.items ?}" var="i">
            <li><g:link controller="item" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="item" action="create"
                    params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'item.label', default: 'Item')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="category.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${categoryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'ordering', 'error')} required">
    <label for="ordering">
        <g:message code="category.ordering.label" default="Ordering"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="ordering" type="number" value="${categoryInstance.ordering}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'searchCriterias', 'error')} ">
    <label for="searchCriterias">
        <g:message code="category.searchCriterias.label" default="Search Criterias"/>

    </label>

    <ul class="one-to-many">
        <g:each in="${categoryInstance?.searchCriterias ?}" var="s">
            <li><g:link controller="searchCriteria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
        </g:each>
        <li class="add">
            <g:link controller="searchCriteria" action="create"
                    params="['category.id': categoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'searchCriteria.label', default: 'SearchCriteria')])}</g:link>
        </li>
    </ul>

</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'visible', 'error')} ">
    <label for="visible">
        <g:message code="category.visible.label" default="Visible"/>

    </label>
    <g:checkBox name="visible" value="${categoryInstance?.visible}"/>

</div>

