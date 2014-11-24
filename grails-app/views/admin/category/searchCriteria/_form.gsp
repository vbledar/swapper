<%@ page import="com.swapper.item.criteria.SearchCriteria" %>

<blockquote>
    <ii:informationLabel label="${message (code: "searchCriteria.category.label", default: "Category")}" value="${searchCriteriaInstance.category.name}"/>
</blockquote>

<blockquote class="${hasErrors(bean: searchCriteriaInstance, field: 'searchCriteriaType', 'has-error')}">
    <label class="text-muted">
        <g:message code="searchCriteria.searchCriteriaType.label"  default="Search Criteria Type"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="searchCriteriaType"
              name="searchCriteriaType"
              class="form-control"
              from="${com.swapper.enums.criteria.SearchCriteriaType?.values()}"
              keys="${com.swapper.enums.criteria.SearchCriteriaType.values()*.name()}"
              required=""
              value="${searchCriteriaInstance?.searchCriteriaType?.name()}" />
</blockquote>

<blockquote class="${hasErrors(bean: searchCriteriaInstance, field: 'description', 'has-error')} required">
<label for="description">
    <g:message code="searchCriteria.description.label" default="Description" />
    <span class="required-indicator">*</span>
</label>
<g:textField name="description" required="" class="form-control" value="${searchCriteriaInstance?.description}"/>
</blockquote>

<blockquote class="${hasErrors(bean: searchCriteriaInstance, field: 'shortDescription', 'has-error')} required">
    <label for="description">
        <g:message code="searchCriteria.description.label" default="Short Description" />
    </label>
    <g:textField name="shortDescription" required="" class="form-control" value="${searchCriteriaInstance?.shortDescription}"/>
</blockquote>

<blockquote class="${hasErrors(bean: searchCriteriaInstance, field: 'searchCriteriaType', 'has-error')} required">
        <label for="ordering">
            <g:message code="searchCriteria.ordering.label" default="Ordering" />
            <span class="required-indicator">*</span>
        </label>
        <g:field name="ordering" type="number" class="form-control" value="${searchCriteriaInstance.ordering}" required=""/>
</blockquote>


<blockquote class=" range-search-field ${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? hasErrors(bean: searchCriteriaInstance, field: "max", 'has-error') : ''} required">
    <label for="ordering">
        <g:message code="rangeSearchCriteria.max.label" default="Max" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="max" type="number" class="form-control" value="${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? searchCriteriaInstance?.max : ''}" required=""/>
</blockquote>

<blockquote class=" range-search-field ${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? hasErrors(bean: searchCriteriaInstance, field: "min", 'has-error') : ''} required">
    <label for="ordering">
        <g:message code="rangeSearchCriteria.min.label" default="Min" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="min" type="number" class="form-control" value="${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? searchCriteriaInstance?.min : ''}" required=""/>
</blockquote>

<blockquote class=" range-search-field ${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? hasErrors(bean: searchCriteriaInstance, field: "step", 'has-error') : ''} required">
    <label for="ordering">
        <g:message code="rangeSearchCriteria.step.label" default="Step" />
        <span class="required-indicator">*</span>
    </label>
    <g:field name="step" type="number" class="form-control" value="${searchCriteriaInstance instanceof com.swapper.item.criteria.RangeSearchCriteria ? searchCriteriaInstance?.step : ''}" required=""/>
</blockquote>


<g:javascript>

    $(function() {

        var selectedSearchCriteriaType = $(":selected", $("#searchCriteriaType")).attr("value");
        if ("${com.swapper.enums.criteria.SearchCriteriaType.NUMERIC}" == selectedSearchCriteriaType) {
            $(".range-search-field").show(300);
        } else {
            $(".range-search-field").hide(300);
        }

        $("#searchCriteriaType").change(function(){
            if("${com.swapper.enums.criteria.SearchCriteriaType.NUMERIC}" == $(":selected", this).attr("value")) {
                $(".range-search-field").show(300);
            } else {
                $(".range-search-field").hide(300);
            }
        });
    });

</g:javascript>