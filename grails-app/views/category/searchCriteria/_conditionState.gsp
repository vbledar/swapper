<%@ page import="com.swapper.util.ItemUtils;" %>
<div class="criterio col-sm-10">
	<div class="title">
        <g:message code="search.criteria.new.used" default="New/Used"/>
	</div>
	<div class="divider"></div>
	<g:radio name="conditionStateType" value="NEW" checked='${ItemUtils.isCriteriaSelected(params,'conditionStateType',['NEW'])?'true':null}'  /> <g:message code="search.criteria.new" default="New"/>
	<br/>
	<g:radio name="conditionStateType" value="USED" checked='${ItemUtils.isCriteriaSelected(params,'conditionStateType',['USED'])?'true':null}'  /> <g:message code="search.criteria.used" default="Used"/>
	<br/>
	<g:radio name="conditionStateType" value="ANY" checked='${ItemUtils.isCriteriaSelected(params,'conditionStateType',['ANY', '', null])?'true':null}'  /> <g:message code="search.criteria.any" default="Any"/>
</div>