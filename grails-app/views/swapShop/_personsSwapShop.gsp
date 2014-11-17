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

<g:javascript>
    $(function() {

        <!-- Upload item action handler -->
        $('#uploadItemButton').off('click').on('click', function(event) {
            event.preventDefault();

            $('#flow-step-progress').removeClass('hidden');

            var url = $(this).attr('href');
            var container = $(this).attr('container');
            var parameters = [];
            submitFormWithContainer(url, parameters, successHandler, failureHandler, container);
        });

        function successHandler(data, container) {
            $('#'+container).fadeOut(300, function() {
                $(this).html(data).fadeIn(300);
            })
        }

        function failureHandler(data) {
            $.notify(data.message, 'error');
            $('#flow-step-progress').addClass('hidden');
        }
    });
</g:javascript>