<div class="row">
    <div class="col-sm-12">
        <h3>
            <g:message code="profile.management.addresses"/>
        </h3>
    </div>
</div>
<div class="spacer10"></div>
<div class="row">
    <div class="col-sm-12 text-right">
        <button id="cancelAddress" class="btn btn-sm btn-danger" style="display: none;">
            <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.cancel"/>
        </button>
        <button id="showAddressForm" class="btn btn-sm btn-primary">
            <g:message code="button.label.add.with.glyphicon"/>
        </button>
    </div>
</div>

<div class="spacer10"></div>

<div id="newAddressForm" class="row" style="display: none">
    <div class="col-sm-12">
        <blockquote>
            <h4>
                <g:message code="profile.management.add.new.address.header"/>
            </h4>
        </blockquote>
        <g:render template="addressForm" model="[address: address]"/>
    </div>
</div>
<div id="addressList" class="row">
    <div class="col-sm-12">
        <g:if test="${!addresses}">
            <g:message code="user.message.no.addresses.defined.yet"/>
        </g:if>
        <g:else>
            <g:render template="addressList" model="[addresses: addresses]"/>
        </g:else>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#showAddressForm').off('click').on('click', function(event) {
            event.preventDefault();
            var shouldSubmit = $(this).hasClass("btn-success");
            if (shouldSubmit) {
                var dataInForm = $('#addNewAddressForm').serializeArray();
                var url = '${createLink(controller: 'myProfile', action: 'addAddress')}';
                $.post(url, dataInForm, function(data, textStatus, jqXHR) {
					console.log('Post succeeded...');
                    if (data.success === false) {
                        console.log("Failed!");
                        console.log(data.errors)

                        $("#addNewAddressForm").find("input").each(function( index ) {
                            $(this).removeClass("alert").removeClass("alert-danger");
                        });

                        $.map(data.errors, function(value, index) {
                            $.map(value, function(field, index) {


                                $("#addNewAddressForm").find("input").each(function( index ) {
                                     var fieldName = $(this).attr("name");
                                     if (fieldName === field.field) {
                                        $(this).addClass("alert").addClass("alert-danger");
                                     }
                                });
                            });
                        });
                        for (var errors in data.errors) {
                            for (var error in errors) {
                                console.log(error.field);
                            }
                        }
                        return;
                    }

                    $('.profile-container').fadeOut(250, function() {
                        $(this).html(data);
                        $(this).fadeIn(250);
                    });

                    var message = '<g:message code="user.message.address.created"/>';
                    $.notify(message);
				}).fail(function() {
					var message = '<g:message code="user.message.action.failed.try.again"/>';
                    $.notify(message, 'error');
				});
            } else {
                var saveLabel = '<g:message code="button.label.save.with.glyphicon"/>';
                $(this).removeClass("btn-primary").addClass("btn-success");
                $(this).text("").append(saveLabel);

                $('#cancelAddress').fadeIn(250);
                $('#addressList').fadeOut(250, function() {
                    $('#newAddressForm').fadeIn(250);
                });
            }
        });

        $('#cancelAddress').off('click').on('click', function(event) {
            event.preventDefault();

            var addLabel = '<g:message code="button.label.add.with.glyphicon"/>';
            $('#showAddressForm').removeClass("btn-success").addClass("btn-primary");
            $('#showAddressForm').text("").append(addLabel);

            $('#cancelAddress').fadeOut(250);
            $('#newAddressForm').fadeOut(250, function() {
                $('#addressList').fadeIn(250);
            });
        })
    });
</g:javascript>