<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:message code="upload.item.flow.step.photos"/>
            </h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 4]"/>
    </div>
    <div class="col-xs-12 col-sm-9">
		<g:form name='uploadItemForm' controller="myPlace" action="uploadItem" role="form">
            <g:render template="/item/itemPhotosInfoFormFields" model="[item: item]"/>
		</g:form>

        <div class="row">
            <div class="col-sm-12 text-right">
                <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.cancel"/></button>
                <button id="previousStep" type="submit" class="btn btn-primary" name="previous"><span class="glyphicon glyphicon-chevron-left"></span> <g:message code="button.label.previous"/></button>
                <button id="nextStep" type="submit" class="btn btn-primary" name="next"><span class="glyphicon glyphicon-chevron-right"></span> <g:message code="button.label.next" /></button>
            </div>
        </div>
	</div>
</div>

<g:javascript>
	$(function() {

        $('#previousStep').off('click').on('click', function(event) {
            console.log('Next step action...');
            event.preventDefault();

            var dataInForm = $('#uploadItemForm').serializeArray();
            console.log("Serialized form data: " + dataInForm);

            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'previous')}';
            console.log(uploadItemUrl)
            $.post(uploadItemUrl, dataInForm, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                $('.swapshop-container').fadeOut(250, function() {
                    console.log(data);
                    $(this).html(data);
                    $(this).fadeIn(250);
                });
            }).fail(function() {
                console.log('Post failed...');
            });
        });

        $('#nextStep').off('click').on('click', function(event) {
            console.log('Next step action...');
            event.preventDefault();

            var dataInForm = $('#uploadItemForm').serializeArray();
            console.log("Serialized form data: " + dataInForm);

            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'next')}';
            console.log(uploadItemUrl)
            $.post(uploadItemUrl, dataInForm, function(data, textStatus, jqXHR) {
                console.log('Post succeeded...');
                $('.swapshop-container').fadeOut(250, function() {
                    $(this).html(data);
                    $(this).fadeIn(250);
                })
            }).fail(function() {
                console.log('Post failed...');
            });
        });
    });

</g:javascript>