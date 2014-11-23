<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        <g:message code="search.criteria.sell.price.from"/>
    </strong>
</h5>

<div class="input-group">
    <span class="input-group-addon label-primary">&euro;</span>
    <input type="number" name="priceFrom" class="form-control text-right" value="${params.priceFrom}">
    <span class="input-group-addon label-primary">.00</span>
</div>