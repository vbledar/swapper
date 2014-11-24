<div class="panel panel-primary">
    <div class="panel-heading" style="background-color: rgb(49, 59, 75)">
        <h4>
            <g:message code="search.criteria.panel.header"/>
            <span class="pull-right">
            <g:link elementId="showHideSearchCriteriaPanel" controller="none" action="none" class="btn btn-primary btn-sm ">
                <span class="glyphicon glyphicon-plus-sign"></span>
            </g:link>
        </span>
        </h4>
    </div>
    <div id="searchCriteriaPanelBody" class="panel-body" rgb(89, 108, 137)>
        <g:form controller="category" action="items" method="get" name="searchCriteriaForm" class="categorySearch form-horizontal" role="form" params="[maincat: maincat ,subcat: subcat]">
            <g:hiddenField name="offset" value="0" />
            <g:hiddenField name="searchTerm" value="${searchTerm}"/>
            <g:hiddenField name="maincat" value="${maincat}"/>
            <g:hiddenField name="subcat" value="${subcat}"/>

            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <g:render template="/category/searchCriteria/swapBuy" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <g:render template="/category/searchCriteria/conditionState" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <g:render template="/category/searchCriteria/priceRangeFrom"/>
                    <g:render template="/category/searchCriteria/priceRangeTo"/>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-3">
                    <g:render template="/category/searchCriteria/dateOrderCriteria"/>
                </div>
            </div>

            <g:each in="${searchCriteria}" var="criterio">
                <div class="col-sm-12">
                    <g:render template="/category/searchCriteria/criterio" model="[criterio: criterio]" />
                </div>
            </g:each>

            <div class="spacer10"></div>

            <div class="col-sm-12">
                <g:submitButton name="search" value="Search" class="btn btn-primary pull-right">
                    <span class="glyphicon glyphicon-search"></span>
                </g:submitButton>
            </div>
        </g:form>
    </div>
</div>

<g:javascript>

    $(function() {
        $('#showHideSearchCriteriaPanel').off('click').on('click', function(event) {
            event.preventDefault();
            $('#searchCriteriaPanelBody').slideToggle(300);
        })
    })

</g:javascript>