<g:each in="${searchCriteria}" var="criterio">
    <g:if test="${criterio.instanceOf(com.swapper.item.criteria.ListSearchCriteria)}">
        <g:render template="/item/criteria/listSearchCriteria" model="[item: item, criterio: criterio]"/>
    </g:if>
    <g:elseif test="${criterio.instanceOf(com.swapper.item.criteria.RangeSearchCriteria)}">
        <g:render template="/item/criteria/rangeSearchCriteria" model="[item: item, criterio: criterio]"/>
    </g:elseif>
</g:each>

<g:javascript>

    $(function() {
        $(function () {
            $("input:radio[checked]").each(function () {
                console.log($(this));
                $(this).parent().addClass('active');
            });
        });
    });
</g:javascript>