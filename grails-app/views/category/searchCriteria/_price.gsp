<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        <g:message code="search.criteria.sell.price"/>
    </strong>
</h5>

<div class="form-group">
    <div class="col-sm-10">
        <input type="email" name="priceFrom" class="form-control" value="${params.priceFrom}" placeholder="${message(code: 'search.criteria.sell.price.from')}">
    </div>
</div>

<div class="form-group">
    <div class="col-sm-10">
        <input type="number" name="priceTo" class="form-control" value="${params.priceTo}" placeholder="${message(code: 'search.criteria.sell.price.to')}">
    </div>
</div>

%{--<div class="btn-group flat-btn-group" data-toggle="buttons">--}%
    %{--<label class="btn btn-primary">--}%
        %{--<g:message code="search.criteria.sell.price.from"/>--}%
        %{--<g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemConditionType.NEW}"/>--}%
    %{--</label>--}%
    %{--<label class="btn btn-primary">--}%
        %{--<g:message code="search.criteria.sell.price.to"/>--}%
        %{--<g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemConditionType.USED}"/>--}%
    %{--</label>--}%
    %{--<label class="btn btn-primary">--}%
        %{--<g:message code="search.criteria.any"/>--}%
        %{--<g:radio name="swapBuyType" value="ANY"/>--}%
    %{--</label>--}%
%{--</div>--}%

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