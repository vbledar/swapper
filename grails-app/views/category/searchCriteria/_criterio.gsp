<%@ page import="com.swap.utils.ItemUtils" %>
<div class="criterio col-sm-10">
	<div class="title">
        <g:message code="criterio.name.${criterio?.descr?.replace(' ', '.')?.toLowerCase()}" default="${criterio?.shortDescr}"/></div>
	<div class= "divider"></div>  

	<g:if test="${criterio.instanceOf(com.swap.domain.item.criteria.ListSearchCriteria)}">
	    <g:if test="${criterio.searchCriteriaAttributes.size() > 10}">
	        <g:each in="${criterio.searchCriteriaAttributes}" var="attr">
	            <div class="two-column-aligned">
                    <g:set var="cr" value="listcriteria.${criterio.id}_${attr.id}_${attr.descr}"/>
	                <g:checkBox name="${cr}" checked='${com.swap.utils.ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>  <g:message code="criterio.attribute.${attr?.descr?.replace(' ', '.')?.toLowerCase()}" default="${attr?.descr}"/>
	            </div>
	        </g:each>
	    </g:if>
	    <g:else>
	        <g:each in="${criterio.searchCriteriaAttributes}" var="attr">
	            <div>
                    <g:set var="cr" value="listcriteria.${criterio.id}_${attr.id}_${attr.descr}"/>
	                <g:checkBox name="${cr}" checked='${com.swap.utils.ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>  <g:message code="criterio.attribute.${attr?.descr?.replace(' ', '.')?.toLowerCase()}" default="${attr?.descr}"/>
	            </div>
	        </g:each>
	    </g:else>
	</g:if>
	<g:elseif test="${criterio.instanceOf(com.swap.domain.item.criteria.RangeSearchCriteria)}">
	    <div style="overflow: auto; height: 200px">
            <g:set var="stp" value="${1/criterio.step}" />
	        <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attr">
	            <div>
	                <g:set var="attr_val" value="${Double.valueOf(attr).doubleValue()}" />
                    <g:set var="cr" value="rangecriteria.${criterio.id}_${attr_val}"/>
	                <g:checkBox name="${cr}" checked='${com.swap.utils.ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/> ${attr_val}
	            </div>
	        </g:each>
	    </div>
	</g:elseif>
    <g:elseif test="${criterio.instanceOf(com.swap.domain.item.criteria.BooleanSearchCriteria)}">
        <%@ page import="com.swap.utils.ItemUtils" %>
        <div>
            <g:set var="cr" value="booleancriteria.${criterio.id}"/>
            <g:radio name="${cr}" value="true" checked='${ItemUtils.isCriteriaSelected(params, cr,['true'])?'true':null}'  /> <g:message code="search.criteria.yes" default="Yes"/>
            <br/>
            <g:radio name="${cr}" value="false" checked='${ItemUtils.isCriteriaSelected(params, cr,['false'])?'true':null}'  /> <g:message code="search.criteria.no" default="No"/>
            <br/>
            <g:radio name="${cr}" value="any" checked='${ItemUtils.isCriteriaSelected(params, cr,['any', '', null])?'true':null}'  /> <g:message code="search.criteria.any" default="Any"/>
        </div>
    </g:elseif>
</div>
