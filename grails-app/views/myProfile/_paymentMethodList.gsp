<g:each in="${paymentMethods}" var="paymentMethod">
    <div class="thumbnail">
        <g:if test="${paymentMethod?.mainPaymentMethod}">
            <span class="text-muted">
                <g:message code="profile.management.user.main.payment.method"/>
            </span>
        </g:if>
        <span class="pull-right">
            <button class="btn btn-sm btn-danger remove-payment-method" payment-method-id="${paymentMethod?.id}">
                <span class="glyphicon glyphicon-remove"></span>
            </button>
        </span>

        <br>
        <br>

        <ii:informationLabel label="${message(code: "form.field.account")}" value="${paymentMethod?.account}"/>
        <ii:informationLabel label="${message(code: "form.field.payment.type")}" value="${message (code: paymentMethod?.paymentType?.i18nCode)}"/>
        <ii:informationLabel label="${message(code: "form.field.currency.type")}" value="${paymentMethod?.currencyType?.description}"/>

    </div>
</g:each>

<g:hiddenField id="paymentMethodIdField" name="paymentMethodId"/>

<div id="removePaymentMethodModal" class="modal fade remove-payment-method-modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(49, 59, 75); color: darkorange">
                <g:message code="user.message.remove.payment.method.title"/>
            </div>
            <div class="modal-body">
                <g:message code="user.message.question.are.you.sure"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <g:message code="button.label.no"/>
                </button>
                <button id="removePaymentMethod" type="button" class="btn btn-primary">
                    <g:message code="button.label.yes"/>
                </button>
            </div>
        </div>
    </div>
</div>

<g:javascript>

    $(function() {
        $('.remove-payment-method').off('click').on('click', function(event) {
            event.preventDefault();

            var paymentMethodId = $(this).attr('payment-method-id');
            $('#paymentMethodIdField').val(paymentMethodId);
            $('#removePaymentMethodModal').modal('show');
        });

        $('#removePaymentMethod').off('click').on('click', function(event) {
            var paymentMethodId = $('#paymentMethodIdField').val();
            var parameters = {};
            parameters.paymentMethodId = paymentMethodId;

            var url = '${createLink(controller: 'myProfile', action: 'removePaymentMethod')}';
            $.post(url, parameters, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                if (data.success === false) {
                    $.notify(data.message, 'error');
                    return;
                }

                $('#removePaymentMethodModal').modal('hide');
                $('.profile-container').fadeOut(250, function() {
                    $(this).html(data);
                    $(this).fadeIn(250);
                });
                var message = '<g:message code="user.message.payment.method.deleted"/>';
                $.notify(message, 'success');
            }).fail(function() {
                var message = '<g:message code="user.message.action.failed.try.again"/>';
                $.notify(message, 'error');
            });
        })
    });

</g:javascript>