<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="upload.item.flow.step.information"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 1]"/>
    </content>

    <content tag="flowStepBody">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form" class="form-horizontal">
            <g:render template="/item/itemBasicInfoFormFields" model="[itemInstance: itemInstance, hasPaymentMethod: hasPaymentMethod]"/>
        </g:form>
    </content>

    <content tag="flowStepNavigation">
        <g:link elementId="cancelStep" controller="swapShop" action="cancelItemUpload" container="swapShopContainer" class="btn btn-danger">
            <span class="glyphicon glyphicon-remove-circle"></span> <g:message code="button.label.cancel"/>
        </g:link>
        <g:link elementId="nextStep" controller="swapShop" action="uploadItem" event="next" container="swapShopContainer" class="btn btn-primary">
            <span class="glyphicon glyphicon-chevron-right"></span> <g:message code="button.label.next"/>
        </g:link>
    </content>

</g:applyLayout>

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
