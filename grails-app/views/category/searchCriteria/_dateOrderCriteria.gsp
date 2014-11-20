<%@ page import="com.swapper.util.ItemUtils" %>
<div class="criterio col-sm-10">
	<div class="title">
        <g:message code="search.criteria.upload.date" default="Upload Date"/></div>
	<div class= "divider"></div>  
	<g:radio name="dateOrder" value="newest" checked='${ItemUtils.isCriteriaSelected(params,'dateOrder',['newest'])?'true':null}' /> <g:message code="search.criteria.newest.to.oldest" default="Newest to Oldest" />
	<br/>
	<g:radio name="dateOrder" value="oldest" checked='${ItemUtils.isCriteriaSelected(params,'dateOrder',['oldest'])?'true':null}'/> <g:message code="search.criteria.oldest.to.newest" default="Oldest to Newest" />
</div>