<div id="topUpAccountContainer" class="row">
    <div class="col-sm-3 text-center">
        <h3>
            <g:message code="wallet.management.status"/>
        </h3>

        <div class="panel panel-default" style="padding: 10px;">
            <ii:informationLabel label="${message(code: "form.field.available.points")}" value="${wallet?.availablePoints ? wallet?.availablePoints : 0}"/>
            <ii:informationLabel label="${message(code: "form.field.reserved.points")}" value="${wallet?.reservedPoints ? wallet?.reservedPoints : 0}"/>
            <ii:informationLabel label="${message(code: "form.field.consumed.points")}" value="${wallet?.consumedPoints ? wallet?.consumedPoints : 0}"/>
        </div>

        %{--<div class="spacer10"></div>--}%

        <button id="topUpAccount" class="btn btn-primary" style="width: 100%; height: 100px" container="topUpAccountContainer" href="${createLink(controller: 'wallet', action: 'topUpAccount')}">
            <span class="glyphicon glyphicon-credit-card"></span><br> <g:message code="button.label.top.up"/>
        </button>

        <div class="spacer10"></div>

        <div class="row">
            <div class="col-sm-12">
                <g:if test="${!wallet?.availablePoints}">
                    <div class="alert alert-info text-left">
                        <h6>
                            <g:message code="user.message.top.up.account"/>
                        </h6>
                    </div>
                </g:if>
            </div>
        </div>

        <div class="spacer10"></div>
    </div>
    <div class="col-sm-9 profile-container">
        <h3>
            <g:message code="wallet.management.transactions.list"/>
        </h3>

        <g:if test="${!wallet?.walletTransactions}">
            <div class="alert alert-info">
                <g:message code="user.message.no.wallet.transactions"/>
            </div>
        </g:if>
    </div>
</div>

<g:javascript>
    $(function() {

        <!-- Upload item action handler -->
        $('#topUpAccount').off('click').on('click', function(event) {
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