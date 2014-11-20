<%@ page import="com.swapper.util.ItemUtils" %>
<div class="criterio col-sm-10">
	<div class="title">
        <g:message code="search.criteria.swap.buy" default="Swap/Buy"/>
    </div>
	<div class= "divider"></div>
	
	<g:radio name="swapBuyType" value="SWAP" checked='${ItemUtils.isCriteriaSelected(params,'swapBuyType',['SWAP'])?'true':null}' /> <g:message code="search.criteria.swap.only" default="Swap Only"/>
	<br/>
	<g:radio name="swapBuyType" value="SELL" checked='${ItemUtils.isCriteriaSelected(params,'swapBuyType',['SELL'])?'true':null}'/> <g:message code="search.criteria.swap.buy" default="Buy Only"/>
	<br/>
	<g:radio name="swapBuyType" value="ANY" checked='${ItemUtils.isCriteriaSelected(params,'swapBuyType',['ANY', '',null])?'true':null}'/> <g:message code="search.criteria.any" default="Any"/>
</div>