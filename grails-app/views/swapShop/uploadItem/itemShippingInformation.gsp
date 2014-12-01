<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="upload.item.flow.step.shipping"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 3]"/>
    </content>

    <content tag="flowStepBody">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form" class="form-horizontal">
            <g:render template="/item/itemForms/itemShippingInfoFormFields" model="[itemShipping: itemShipping]"/>
        </g:form>
    </content>

    <content tag="flowStepNavigation">
        <g:link elementId="cancelStep" controller="swapShop" action="cancelItemUpload" container="swapShopContainer" class="btn btn-danger flow-navigation">
            <span class="glyphicon glyphicon-remove-circle"></span> <span class="hidden-xs"><g:message code="button.label.cancel"/></span>
        </g:link>
        <g:link elementId="previousStep" controller="swapShop" action="uploadItem" event="previous" container="swapShopContainer" form="uploadItemForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-left"></span> <span class="hidden-xs"><g:message code="button.label.previous" /></span>
        </g:link>
        <g:link elementId="nextStep" controller="swapShop" action="uploadItem" event="next" container="swapShopContainer" form="uploadItemForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-right"></span> <span class="hidden-xs"><g:message code="button.label.next"/></span>
        </g:link>
    </content>

</g:applyLayout>

<g:javascript>
	$(function() {

		// Enable or disabled the shipping costs field.
		var noCostsChecked = $('#noCosts').attr('checked');
		if (noCostsChecked) {
			$('#shippingCosts').attr('disabled', 'true').val('0.0');
		} else {
			$('#shippingCosts').removeAttr('disabled');
		}
		
		$('#noCosts').click(function() {
			if ($('#noCosts').is(':checked')) {    				
				$('#domestic').attr('disabled', 'true').attr('checked', false)
				$('#shippingCosts').attr('disabled', 'true').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideUp(300);
			} else {
				$('#domestic').removeAttr('disabled')
				$('#domestic').attr('checked', true)
				$('#shippingCosts').removeAttr('disabled').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideDown(300);
			}
		});

		$('#no-costs-label').off('click').on('click', function(event) {
			event.preventDefault();
			
			if ($('#noCosts').is(':checked')) {    
				$('#domestic').removeAttr('disabled')
				$('#domestic').attr('checked', true)
				$('#shippingCosts').removeAttr('disabled').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideDown(300);
				$('#noCosts').prop('checked', false);
			} else {
				$('#domestic').attr('disabled', 'true').attr('checked', false)
				$('#shippingCosts').attr('disabled', 'true').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideUp(300);

				$('#noCosts').prop('checked', true);
			}
		});
	});

</g:javascript>