<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:message code="upload.item.flow.step.information"/>
            </h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 1]"/>
    </div>
    <div class="col-xs-12 col-sm-9">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form" class="form-horizontal">
            <g:render template="/item/itemBasicInfoFormFields" model="[itemInstance: itemInstance, hasPaymentMethod: hasPaymentMethod]"/>
        </g:form>

        <div class="row">
            <div class="col-sm-12 text-right">
                <button type="button" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
                <button id="nextStep" type="submit" class="btn btn-primary" name="next"><span class="glyphicon glyphicon-chevron-right"></span> <g:message code="button.label.next" /></button>
            </div>
        </div>
    </div>
</div>


<g:javascript>

    $(function() {

        $('#nextStep').off('click').on('click', function(event) {
			console.log('Next step action...');
			event.preventDefault();

            var previous = $('.swapshop-container').html();
            var dataInForm = $('#uploadItemForm').serializeArray();
            var uploadItemUrl = '${createLink(controller: 'swapShop', action: 'uploadItem', event: 'next')}';
			var posting = $.post(uploadItemUrl, dataInForm, function() {
			    console.log('Posting success');
            });

            posting.done(function(data) {
                $('.swapshop-container').fadeOut(250, function() {

                    $("#uploadItemForm").find("input").each(function( index ) {
                        $(this).removeClass("alert").removeClass("alert-danger");
                    });

                    if (data.errors) {
                        $.map(data.errors, function(value, index) {
                            $.map(value, function(field, index) {


                                $("#uploadItemForm").find("input").each(function( index ) {
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
                    }

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

    });
</g:javascript>
