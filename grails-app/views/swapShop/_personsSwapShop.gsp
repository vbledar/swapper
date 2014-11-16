<div class="swapshop-container">
    <div class="row">
        <div class="col-sm-2">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <g:link elementId="uploadItemButton" controller="swapShop" action="uploadItem" container="swapShopContainer" class="btn btn-primary" style="width: 100px; height: 100px; vertical-align: middle;">
                        <span class="glyphicon glyphicon-plus-sign"></span><br> <g:message code="swap.shop.button.label.upload.item"/>
                    </g:link>
                </div>
            </div>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12 swapshop-container">
                    <g:render template="itemsList" model="[items: items, itemsCounted: itemsCounted]"/>
                </div>
            </div>
        </div>
    </div>
</div>