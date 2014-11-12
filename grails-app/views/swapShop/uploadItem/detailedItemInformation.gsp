<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:message code="upload.item.flow.step.details"/>
            </h3>
        </div>
    </div>
</div>
<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 2]"/>
    </div>
    <div class="col-xs-12 col-sm-9">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form" class="form-horizontal">
            <g:render template="/item/itemDetailedInfoFormFields" model="[itemInstance: itemInstance, searchCriteria: searchCriteria]"/>
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
            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'previous')}';
			var previous = $('.swapshop-container').html();
			var posting = $.post(uploadItemUrl, dataInForm, function() {
                console.log("Post away.")
            });

            posting.done(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $(this).html(data);
				    $(this).fadeIn(250);
				})
            });

            posting.fail(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $('.swapshop-container').html(previous);
				    $(this).fadeIn(250);
				});
            });
		});

		$('#nextStep').off('click').on('click', function(event) {
			console.log('Next step action...');
			event.preventDefault();

            var dataInForm = $('#uploadItemForm').serializeArray();
            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'next')}';
            var previous = $('.swapshop-container').html();
			var posting = $.post(uploadItemUrl, dataInForm, function() {
			    console.log('Post away.')
            });

            posting.done(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $(this).html(data);
				    $(this).fadeIn(250);
				})
            });

            posting.fail(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $('.swapshop-container').html(previous);
				    $(this).fadeIn(250);
				});
            });
		});

        $(function () {
            $("input:radio[checked]").each(function () {
                console.log($(this));
                $(this).parent().addClass('active');
            });
        });
	});

</g:javascript>