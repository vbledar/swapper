<blockquote>
    <label class="text-muted">
        <g:message code="form.field.item.shipping.info"/>
    </label>
    <g:textArea name="shippingInfo"
                class="form-control non-resizable"
                style="width: 100%;"
                cols="100"
                rows="6"
                maxlength="3000"
                value="${itemShipping?.shippingInfo}"/>
</blockquote>

<g:if test="${ item?.itemExchangeType != com.swapper.enums.item.ItemExchangeType.SWAP }">
    <blockquote>
        <label>
            <g:checkBox id="noCosts" name="noCosts" value="${itemShipping?.noCosts}" style="cursor: pointer"/>
            <label id="no-costs-label" class="control-label"><g:message code="form.field.no.costs.label"/></label>
        </label>
    </blockquote>

    <blockquote>
        <label for="shippingCosts" class="text-muted"><g:message code="form.field.shipping.costs"/></label>
        <div class="input-group input-group-sm col-sm-3">
            <span class="input-group-addon">&euro;</span>
            <g:textField type="number"
                         id="shippingCosts"
                         name="shippingCosts"
                         class="form-control pricing text-right intNumeric priceDiv ${hasErrors(bean: itemShipping, field: 'shippingCosts', 'alert alert-danger')}"
                         autocomplete="off"
                         min="0.0"
                         value="${ !itemShipping?.shippingCosts ? '0.0' : itemShipping?.shippingCosts}"
                         required=""/>
        </div>
    </blockquote>

    <div class="clear-fix"></div>
    <g:if test="${item?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
        <div class="spacer10"></div>
        <div class="row center-block font-medium font-normal" style="display: none;">
            <div class="col-sm-12 alert alert-warning">
                <blockquote id="userInformationPlaceholder" style=" margin: 0px;">
                    <g:message code="form.field.shipping.costs"/>
                </blockquote>
            </div>
        </div>
    </g:if>
</g:if>

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
//				$('#domesticCosts').qtip('destroy');
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