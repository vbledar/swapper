<%@ page import="com.swapper.util.ItemUtils;" %>

<h5>
    <strong>
        <g:message code="search.criteria.condition.state"/>
    </strong>
</h5>

<div class="btn-group btn-group-justified flat-btn-group" data-toggle="buttons">
    <label class="btn btn-primary">
        <g:message code="item.condition.type.new"/>
        <g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemConditionType.NEW}"/>
    </label>
    <label class="btn btn-primary">
        <g:message code="item.condition.type.used"/>
        <g:radio name="swapBuyType" value="${com.swapper.enums.item.ItemConditionType.USED}"/>
    </label>
    <label class="btn btn-primary">
        <g:message code="search.criteria.any"/>
        <g:radio name="swapBuyType" value="ANY"/>
    </label>
</div>