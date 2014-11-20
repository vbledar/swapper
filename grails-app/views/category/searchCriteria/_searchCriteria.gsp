<g:javascript>
    $('form #search').button();

    $(function(){	//Document ready

    $('#searchCriteriaForm').submit(function(event) {
        //validate prices in case of buy search
        var isBuyFilter = ($('#priceCriterio')).is(":visible");
        if(isBuyFilter ){
            var priceForm = $("input[name='priceFrom']").val();
            var priceTo = $("input[name='priceTo']").val();
            if(priceForm == '' || priceTo ==''){

            }
            else{
                var priceFormVal = parseInt($("input[name='priceFrom']").val());
                var priceToVal = parseInt($("input[name='priceTo']").val());
                if(priceFormVal > priceToVal){
                    infoNotify("${message(code: 'price.invalid.from.to.range')}");
                    return false;
                }
            }
        }
    });

    $('#searchCriteriaForm input[name=swapBuyType]:radio').change(function(){
        var selectedType = $(this).val();
        if(selectedType == 'SWAP' || selectedType == 'ANY'){
            $('#priceCriterio').hide();
        }
        else if(selectedType == 'MONETARY'){
            $('#priceCriterio').show();
        }
    });

    $('#searchCriteriaForm').bind('paginate',function(event,data){
        $('input[name="offset"]','#searchCriteriaForm').attr('value',data.offset);
        $('#searchCriteriaForm').trigger('submit');
    });

     $('input[name="search"]').click(function(){
         $('input[name="offset"]','#searchCriteriaForm').attr('value',0);
     });

});
</g:javascript>

<g:form controller="category" action="items" method="get" name="searchCriteriaForm" class="categorySearch" params="[maincat: maincat ,subcat: subcat]">
    <g:hiddenField name="offset" value="0" />
    <g:hiddenField name="searchTerm" value="${searchTerm}"/>
    <g:hiddenField name="maincat" value="${maincat}"/>
    <g:hiddenField name="subcat" value="${subcat}"/>
    <g:render template="/category/searchCriteria/swapBuy" />
    <g:render template="/category/searchCriteria/price" model="[subcat:subcat]" /> %{-- Contains #div.priceCriterio --}%
    <g:render template="/category/searchCriteria/conditionState" />
    <g:render template="/category/searchCriteria/dateOrderCriteria" />
   
    <g:each in="${searchCriteria}" var="criterio">
            <g:render template="/category/searchCriteria/criterio" model="[criterio: criterio]" />
    </g:each>
    <div class="submit">
    	<g:submitButton name="search" value="Search" class="btn btn-default-dark pull-right"/>
    </div>
</g:form>
