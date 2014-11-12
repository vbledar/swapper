<div class="row">
    <div class="col-sm-12">
        <h3>
            <g:message code="profile.management.payment.methods"/>
        </h3>
    </div>
</div>
<div class="spacer10"></div>
<div class="row">
    <div class="col-sm-12 text-right">
        <button id="cancelPaymentMethod" class="btn btn-sm btn-danger" style="display: none;">
            <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.cancel"/>
        </button>
        <button id="showPaymentMethodForm" class="btn btn-sm btn-primary">
            <g:message code="button.label.add.with.glyphicon"/>
        </button>
    </div>
</div>

<div class="spacer10"></div>

<div id="newPaymentMethodForm" class="row" style="display: none">
    <div class="col-sm-12">
        <blockquote>
            <h4>
                <g:message code="profile.management.add.new.payment.method.header"/>
            </h4>
        </blockquote>
        <g:render template="paymentMethodForm" model="[paymentMethods: paymentMethods]"/>
    </div>
</div>
<div id="paymentMethodList" class="row">
    <div class="col-sm-12">
        <g:if test="${!paymentMethods}">
            <g:message code="user.message.no.payment.methods.defined.yet"/>
        </g:if>
        <g:else>
            <g:render template="paymentMethodList" model="[paymentMethods: paymentMethods]"/>
        </g:else>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#showPaymentMethodForm').off('click').on('click', function(event) {
            event.preventDefault();
            var shouldSubmit = $(this).hasClass("btn-success");
            if (shouldSubmit) {
                var dataInForm = $('#addNewPaymentMethodForm').serializeArray();
                var url = '${createLink(controller: 'myProfile', action: 'addPaymentMethod')}';
                $.post(url, dataInForm, function(data, textStatus, jqXHR) {
					console.log('Post succeeded...');
                    if (data.success === false) {
                        $.notify(data.message, 'error');

                        $("#addNewPaymentMethodForm").find("input").each(function( index ) {
                            $(this).removeClass("alert").removeClass("alert-danger");
                        });

                        $.map(data.errors, function(value, index) {
                            $.map(value, function(field, index) {


                                $("#addNewPaymentMethodForm").find("input").each(function( index ) {
                                     var fieldName = $(this).attr("name");
                                     if (fieldName === field.field) {
                                        $(this).addClass("alert").addClass("alert-danger");
                                     }
                                });
                            });
                        });
                        return;
                    }

                    $('.profile-container').fadeOut(250, function() {
                        $(this).html(data);
                        $(this).fadeIn(250);
                    });

                    var message = '<g:message code="user.message.payment.method.created"/>';
                    $.notify(message, 'success');
				}).fail(function() {
					var message = '<g:message code="user.message.action.failed.try.again"/>';
                    $.notify(message, 'error');
				});
            } else {
                var saveLabel = '<g:message code="button.label.save.with.glyphicon"/>';
                $(this).removeClass("btn-primary").addClass("btn-success");
                $(this).text("").append(saveLabel);

                $('#cancelPaymentMethod').fadeIn(250);
                $('#paymentMethodList').fadeOut(250, function() {
                    $('#newPaymentMethodForm').fadeIn(250);
                });
            }
        });

        $('#cancelPaymentMethod').off('click').on('click', function(event) {
            event.preventDefault();

            var addLabel = '<g:message code="button.label.add.with.glyphicon"/>';
            $('#showPaymentMethodForm').removeClass("btn-success").addClass("btn-primary");
            $('#showPaymentMethodForm').text("").append(addLabel);

            $('#cancelPaymentMethod').fadeOut(250);
            $('#newPaymentMethodForm').fadeOut(250, function() {
                $('#paymentMethodList').fadeIn(250);
            });
        })
    });
</g:javascript>