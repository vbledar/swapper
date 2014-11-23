<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        ${criterio.shortDescription}
    </strong>
</h5>

<div class="hidden-xs hidden-sm">
<g:if test="${criterio.instanceOf(com.swapper.item.criteria.ListSearchCriteria)}">
    <div class="btn-group btn-group-justified flat-btn-group" data-toggle="buttons">
        <g:each in="${criterio.searchCriteriaAttributes}" var="attribute">
            <g:set var="cr" value="listcriteria.${criterio.id}_${attribute.id}_${attribute.descr}"/>
            <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
                ${attribute.descr}
                <g:checkBox name="${cr}" checked='${ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>
            </label>
        </g:each>
    </div>
</g:if>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.RangeSearchCriteria)}">
    <g:set var="stp" value="${1/criterio.step}" />
    <div class="btn-group btn-group-justified flat-btn-group" data-toggle="buttons">
        <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attribute">
            <g:set var="attr_val" value="${Double.valueOf(attribute).doubleValue()}" />
            <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
                ${attr_val}
                <g:checkBox name="rangecriteria.${criterio.id}_${attr_val}" checked='${ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>
            </label>
        </g:each>
    </div>
</g:elseif>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.BooleanSearchCriteria)}">
    <div class="btn-group flat-btn-group" data-toggle="buttons">
        <g:set var="cr" value="booleancriteria.${criterio.id}"/>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="${com.swapper.enums.general.YesNoType.YES.i18nCode}"/>
            <g:radio name="${cr}" value="true" checked='${ItemUtils.isCriteriaSelected(params,cr,['true'])?'true':null}'/>
        </label>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="${com.swapper.enums.general.YesNoType.NO.i18nCode}"/>
            <g:radio name="${cr}" value="false" checked='${ItemUtils.isCriteriaSelected(params,cr,['false'])?'true':null}'/>
        </label>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="search.criteria.any"/>
            <g:radio name="${cr}" value="any" checked='${ItemUtils.isCriteriaSelected(params,cr,['any'])?'true':null}'/>
        </label>
    </div>
</g:elseif>
</div>
<div class="visible-xs visible-sm">
<g:if test="${criterio.instanceOf(com.swapper.item.criteria.ListSearchCriteria)}">
    <div class="btn-group flat-btn-group" data-toggle="buttons">
        <g:each in="${criterio.searchCriteriaAttributes}" var="attribute">
            <g:set var="cr" value="listcriteria.${criterio.id}_${attribute.id}_${attribute.descr}"/>
            <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
                ${attribute.descr}
                <g:checkBox name="${cr}" checked='${ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>
            </label>
        </g:each>
    </div>
</g:if>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.RangeSearchCriteria)}">
    <g:set var="stp" value="${1/criterio.step}" />
    <div class="btn-group flat-btn-group" data-toggle="buttons">
        <g:each in="${(criterio.min*stp..criterio.max*stp)*.div(stp)}" var="attribute">
            <g:set var="attr_val" value="${Double.valueOf(attribute).doubleValue()}" />
            <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
                ${attr_val}
                <g:checkBox name="rangecriteria.${criterio.id}_${attr_val}" checked='${ItemUtils.isCriteriaSelected(params,cr,['on'])?'true':null}'/>
            </label>
        </g:each>
    </div>
</g:elseif>
<g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.BooleanSearchCriteria)}">
    <div class="btn-group flat-btn-group" data-toggle="buttons">
        <g:set var="cr" value="booleancriteria.${criterio.id}"/>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="${com.swapper.enums.general.YesNoType.YES.i18nCode}"/>
            <g:radio name="${cr}" value="true" checked='${ItemUtils.isCriteriaSelected(params,cr,['true'])?'true':null}'/>
        </label>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="${com.swapper.enums.general.YesNoType.NO.i18nCode}"/>
            <g:radio name="${cr}" value="false" checked='${ItemUtils.isCriteriaSelected(params,cr,['false'])?'true':null}'/>
        </label>
        <label class="btn btn-primary ${ItemUtils.isCriteriaSelected(params,cr,['on'])?'active':null}">
            <g:message code="search.criteria.any"/>
            <g:radio name="${cr}" value="any" checked='${ItemUtils.isCriteriaSelected(params,cr,['any'])?'true':null}'/>
        </label>
    </div>
</g:elseif>
</div>