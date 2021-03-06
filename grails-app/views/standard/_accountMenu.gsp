<div class="btn-group btn-group-justified">
    <div class="btn-group">
        <g:link controller="myProfile" action="profileManagement" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("myProfile") && actionName.equalsIgnoreCase("profileManagement") ? 'active' : ''}">
            <span class="glyphicon glyphicon-user"></span>
            <span class="hidden-xs">
                <span class="visible-sm"><br/></span>
                <g:message code="account.menu.profile"/>
            </span>
        </g:link>
    </div>
    <div class="btn-group">
        <g:link controller="wallet" action="walletManagement" class="btn btn-lg btn-primary ${controllerName.equalsIgnoreCase("wallet") && actionName.equalsIgnoreCase("walletManagement") ? 'active' : ''}">
            <span class="glyphicon glyphicon-credit-card"></span>
            <span class="hidden-xs">
                <span class="visible-sm"><br/></span>
                <g:message code="account.menu.wallet"/>
            </span>
        </g:link>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary">
            <span class="glyphicon glyphicon-star"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="account.menu.my.ratings"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-lg btn-primary">
            <span class="glyphicon glyphicon-star-empty"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="account.menu.left.for.others"/>
            </span>
        </button>
    </div>
    <div class="btn-group">
        <g:link controller="swapShop" action="swapShop" class="btn btn-lg btn-primary">
            <span class="glyphicon glyphicon-shopping-cart"></span>
            <span class="hidden-xs">
                <span class="visible-xs visible-sm"><br/></span>
                <g:message code="account.menu.swap.shop"/>
            </span>
        </g:link>
    </div>
</div>