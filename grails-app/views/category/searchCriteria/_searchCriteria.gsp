
<g:form controller="category" action="items" method="get" name="searchCriteriaForm" class="categorySearch" params="[maincat: maincat ,subcat: subcat]">
    <g:hiddenField name="offset" value="0" />
    <g:hiddenField name="searchTerm" value="${searchTerm}"/>
    <g:hiddenField name="maincat" value="${maincat}"/>
    <g:hiddenField name="subcat" value="${subcat}"/>
    %{--<g:render template="/category/searchCriteria/swapBuy" />--}%
    %{--<g:render template="/category/searchCriteria/price" model="[subcat:subcat]" /> --}%%{-- Contains #div.priceCriterio --}%
    %{--<g:render template="/category/searchCriteria/conditionState" />--}%
    %{--<g:render template="/category/searchCriteria/dateOrderCriteria" />--}%
   
    <g:each in="${searchCriteria}" var="criterio">
            <g:render template="/category/searchCriteria/criterio" model="[criterio: criterio]" />
    </g:each>
    <div class="submit">
    	<g:submitButton name="search" value="Search" class="btn btn-default-dark pull-right"/>
    </div>
</g:form>
