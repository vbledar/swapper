
<div class="visible-xs">
    <div class="spacer10"></div>
</div>

<div id="itemsList" class="row">
    <g:each in="${items}" var="item">
        <g:render template="/item/itemInListView" model="[item: item]"/>
    </g:each>

    <div class="row">
        <div class="col-sm-12 text-center">
            <util:remotePaginate controller="swapShop" action="personsItems" total="${itemsCounted}" update="itemsList"/>
        </div>
    </div>


</div>