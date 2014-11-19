<%@ page import="com.swapper.item.Category" %>


<blockquote class="${hasErrors(bean: categoryInstance, field: 'description', 'has-error')}">
    <label class="text-muted">
        <g:message code="category.name.label"  default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" class="form-control" required="" value="${categoryInstance?.name}"/>
</blockquote>

<blockquote class="${hasErrors(bean: categoryInstance, field: 'parent', 'has-error')}">
    <label class="text-muted"><g:message code="category.parent.label"  default="Parent"/></label>
    <g:select id="parent"
              name="parent.id"
              from="${com.swapper.item.Category.getMainCategories()}"
              optionKey="id"
              optionValue="name"
              value="${categoryInstance?.parent?.id}"
              class="many-to-one form-control"
              noSelection="['null': '']"/>
</blockquote>

<blockquote class="${hasErrors(bean: categoryInstance, field: 'description', 'has-error')}">
    <label class="text-muted">
        <g:message code="category.description.label"  default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" class="form-control" required="" value="${categoryInstance?.description}"/>
</blockquote>

<blockquote class="${hasErrors(bean: categoryInstance, field: 'description', 'has-error')}">
    <label class="text-muted">
        <g:message code="category.ordering.label"  default="Ordering"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" type="number" class="form-control" required="" value="${categoryInstance?.ordering}"/>
</blockquote>

<blockquote>
    <div class="checkbox">
        <label>
            <input id="mainAddress" name="mainAddress" type="checkbox" ${categoryInstance?.visible ? 'checked': ''}> <g:message code="category.visible.label"  default="Visible"/>
            <span class="required-indicator">*</span>
        </label>
    </div>
</blockquote>

