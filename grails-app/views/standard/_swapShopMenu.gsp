<div class="btn-group flat-btn-group btn-group-justified">
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("swapShop") ? 'active' : ''}">
            <span class="glyphicon glyphicon-th-large"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.items"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("receivedRequests") ? 'active' : ''}">
            <span class="glyphicon glyphicon-cloud-download"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.received.requests"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("sentRequests") ? 'active' : ''}">
            <span class="glyphicon glyphicon-cloud-upload"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.sent.requests"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("conversations") ? 'active' : ''}">
            <span class="glyphicon glyphicon-comment"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.conversations"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("history") ? 'active' : ''}">
            <span class="glyphicon glyphicon-calendar"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.history"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("swapShop") && actionName.equalsIgnoreCase("notifications") ? 'active' : ''}">
            <span class="glyphicon glyphicon-bell"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="swap.shop.menu.notifications"/>
            </span>
        </button>
    </div>
</div>