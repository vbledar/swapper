<%@ page import="com.swapper.util.ItemUtils" %>

<h5>
    <strong>
        <g:message code="search.criteria.sort.by.date"/>
    </strong>
</h5>

<div class="btn-group flat-btn-group" data-toggle="buttons">
    <label class="btn btn-primary">
        <g:message code="search.criteria.newest.to.oldest"/>
        <g:radio name="dateOrder" value="newest"/>
    </label>
    <label class="btn btn-primary">
        <g:message code="search.criteria.oldest.to.newest"/>
        <g:radio name="dateOrder" value="oldest"/>
    </label>
</div>