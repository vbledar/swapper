<g:each in="${addresses}" var="address">
    <ui:personAddress address="${address}" showRemove="true">
    </ui:personAddress>
</g:each>

<g:hiddenField id="addressIdField" name="addressId"/>

<div id="removeAddressModal" class="modal fade remove-address-modal" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgb(49, 59, 75); color: darkorange">
                <g:message code="user.message.remove.address.title"/>
            </div>
            <div class="modal-body">
                <g:message code="user.message.question.are.you.sure"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <g:message code="button.label.no"/>
                </button>
                <button id="removeAddress" type="button" class="btn btn-primary">
                    <g:message code="button.label.yes"/>
                </button>
            </div>
        </div>
    </div>
</div>

<g:javascript>

    $(function() {
        $('.remove-address').off('click').on('click', function(event) {
            event.preventDefault();

            var addressId = $(this).attr('address-id');
            $('#addressIdField').val(addressId);
            $('#removeAddressModal').modal('show');
        });

        $('#removeAddress').off('click').on('click', function(event) {
            var addressId = $('#addressIdField').val();
            var parameters = {};
            parameters.addressId = addressId;

            var url = '${createLink(controller: 'myProfile', action: 'removeAddress')}';
            $.post(url, parameters, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                if (data.success === false) {
                    $.notify(data.message, 'error');
                    return;
                }

                $('#removeAddressModal').modal('hide');
                $('.profile-container').fadeOut(250, function() {
                    $(this).html(data);
                    $(this).fadeIn(250);
                });
                var message = '<g:message code="user.message.address.deleted"/>';
                $.notify(message, 'success');
            }).fail(function() {
                var message = '<g:message code="user.message.action.failed.try.again"/>';
                $.notify(message, 'error');
            });
        })
    });

</g:javascript>