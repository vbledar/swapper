<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        <g:message code="search.criteria.exchange.type"/>
    </strong>
</h5>

<div class="btn-group flat-btn-group" data-toggle="buttons">
    <label class="btn btn-primary">
        <g:message code="item.exchange.type.swap"/>
        <g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemExchangeType.SWAP}"/>
    </label>
    <label class="btn btn-primary">
        <g:message code="item.exchange.type.sell"/>
        <g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemExchangeType.SELL}"/>
    </label>
    <label class="btn btn-primary">
        <g:message code="search.criteria.any"/>
        <g:radio name="swapBuyType" value="ANY"/>
    </label>
</div>