<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        <g:message code="search.criteria.sell.price.to"/>
    </strong>
</h5>

<div class="input-group">
    <span class="input-group-addon label-primary">&euro;</span>
    <input type="number" name="priceTo" class="form-control text-right" value="${params.priceTo}">
    <span class="input-group-addon label-primary">.00</span>
</div>