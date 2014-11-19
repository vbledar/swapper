<%@ page import="com.swap.utils.ItemUtils" %>
<g:javascript>
    $(".numberField").numeric({ negative: false });
</g:javascript>

<div class="criterio col-sm-10" id="priceCriterio" style="display: ${ItemUtils.isCriteriaSelected(params,'swapBuyType',['MONETARY'])?'block':'none'}">
	<div class="title">
        <g:message code="search.criteria.price.range" default="Price Range"/>
    </div>
	<div class= "divider"></div>  
	<g:message code="search.criteria.price.range.from" default="From"/>:<br/>
	<g:textField name="priceFrom" class="numberField" style="width: 50px" value="${params.priceFrom}"/> &euro;
	<br/>
    <g:message code="search.criteria.price.range.to" default="To"/>: <br/>
	<g:textField name="priceTo" class="numberField" style="width: 50px" value="${params.priceTo}"/> &euro;
</div>