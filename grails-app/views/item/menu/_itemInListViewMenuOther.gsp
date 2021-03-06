<div class="btn-group flat-btn-group btn-group-justified">
    <div class="btn-group">
        <g:link controller="item" action="viewItem" id="${item?.id}" class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-eye-open"></span>
            <span class="hidden-xs">
                <div class="row">
                    <div class="col-sm-12">
                        <g:message code="item.menu.view"/>
                    </div>
                </div>
            </span>
        </g:link>
    </div>
    <div class="btn-group">
        <g:link controller="swapShop" action="viewItem" id="${item?.id}" class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-random"></span>
            <span class="hidden-xs">
                <div class="row">
                    <div class="col-sm-12">
                        <g:message code="item.menu.swap"/>
                    </div>
                </div>
            </span>
        </g:link>
    </div>
    <div class="btn-group">
        <g:link controller="myProfile" action="profileManagement" class="btn btn-primary btn-sm">
            <span class="glyphicon glyphicon-euro"></span>
            <span class="hidden-xs">
                <div class="row">
                    <div class="col-sm-12">
                        <g:message code="item.menu.buy"/>
                    </div>
                </div>
            </span>
        </g:link>
    </div>
    <div class="btn-group">
        <button type="button" class="btn btn-danger btn-sm">
            <span class="glyphicon glyphicon-comment"></span>
            <span class="hidden-xs">
                <div class="row">
                    <div class="col-sm-12">
                        <g:message code="item.menu.conversation"/>
                    </div>
                </div>
            </span>
        </button>
    </div>
</div>