<div class="col-xs-12 col-sm-5 col-md-4">
    <g:render template="/item/overview" model="[item: item]"/>
</div>

<div class="col-xs-12 col-sm-7 col-md-8">
    <div class="" style="padding: 10px;">
        <ul class="nav nav-tabs nav-justified" role="tablist">
            <g:render template="item/itemMenu" model="[item: item, tabSelected: tabSelected]"/>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade ${ tabSelected ? '' : 'in active'}" id="basicTab">
                <g:render template="/item/itemInformationViews/basicInformation" model="[item: item, rootCategories: rootCategories, categories: categories]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'details'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="detailsTab">
                <g:render template="/item/itemInformationViews/detailedInformation" model="[item: item]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'shipping'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="shippingTab">
                <g:render template="/item/itemInformationViews/shippingInformation" model="[item: item]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'photos'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="photosTab">
                <g:render template="/item/itemInformationViews/photosInformation" model="[item: item]"/>
            </div>
        </div>
    </div>
</div>