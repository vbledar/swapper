<div class="col-sm-12">
    <g:render template="/item/overview" model="[item: item]"/>
</div>

<div class="spacer10"></div>

<div class="col-sm-12">
    <div class="panel panel-default" style="padding: 10px;">
        <ul class="nav nav-pills nav-justified" role="tablist">
            <g:render template="item/itemMenu" model="[item: item, tabSelected: tabSelected]"/>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade ${ tabSelected ? '' : 'in active'}" id="basicTab">
                <g:render template="/item/basicInformation" model="[item: item, rootCategories: rootCategories, categories: categories]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'details'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="detailsTab">
                <g:render template="/item/detailedInformation" model="[item: item]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'shipping'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="shippingTab">
                <g:render template="/item/shippingInformation" model="[item: item]"/>
            </div>

            <div role="tabpanel" class="tab-pane fade ${'photos'.equalsIgnoreCase(tabSelected) ? 'in active' : ''}" id="photosTab">
                <g:render template="/item/photosInformation" model="[item: item]"/>
            </div>
        </div>
    </div>
</div>