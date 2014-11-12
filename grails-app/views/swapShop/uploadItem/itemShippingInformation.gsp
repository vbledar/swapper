<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:message code="upload.item.flow.step.shipping"/>
            </h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 3]"/>
    </div>
    <div class="col-xs-12 col-sm-9">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form">
            <blockquote>
                <label for="shippingInfo" class="control-label col-sm-12">
                    <g:message code="form.field.item.shipping.info"/>
                </label>
                <g:textArea name="shippingInfo" class="form-control non-resizable" style="width: 100%;" cols="100" rows="6" maxlength="3000" value="${itemShippingInstance?.shippingInfo}"/>
            </blockquote>

            <g:if test="${ itemInstance?.itemExchangeType != com.swapper.enums.item.ItemExchangeType.SWAP }">
                <blockquote>
                    <div class="checkbox ${hasErrors(bean: itemShippingInstance, field: 'noCosts', 'has-error')}">
                        <label>
                            <g:checkBox id="noCosts" name="noCosts" value="${itemShippingInstance?.noCosts}" style="cursor: pointer"/>
                            <label id="no-costs-label" class="control-label"><g:message code="form.field.no.costs.label"/></label>
                        </label>
                    </div>
                </blockquote>

                <blockquote>
                    <label for="shippingCosts" class="text-muted"><g:message code="form.field.shipping.costs"/></label>
                    <div class="input-group input-group-sm col-sm-3">
                        <span class="input-group-addon">&euro;</span>
                        <g:textField type="number"
                                     id="shippingCosts"
                                     name="shippingCosts"
                                     class="form-control pricing text-right intNumeric priceDiv ${hasErrors(bean: itemShippingInstance, field: 'shippingCosts', 'alert alert-danger')}"
                                     autocomplete="off"
                                     min="0.0"
                                     value="${ !itemShippingInstance?.shippingCosts ? '0.0' : itemShippingInstance?.shippingCosts}"
                                     required=""/>
                    </div>
                </blockquote>

                %{--${itemInstance?.photos}--}%

                <div class="clear-fix"></div>
                <g:if test="${itemInstance?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
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
//				$('#domesticCosts').qtip({
//	               content: 'Fees applied to ship your item in domestic destination, this fees will be charged to the buyer.',
//	               show: { ready: true },
//	               position: {
//	                    my: 'left center',
//	                    at: 'right center',
//	                    viewport: $(window),
//	                    adjust: { x: 10, y: 0 }
//	               }
//	            });
			}
		});

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

		$('#no-costs-label').off('click').on('click', function(event) {
			event.preventDefault();
			
			if ($('#noCosts').is(':checked')) {    
				$('#domestic').removeAttr('disabled')
				$('#domestic').attr('checked', true)
				$('#shippingCosts').removeAttr('disabled').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideDown(300);
//				$('#domesticCosts').qtip({
//	               content: 'Fees applied to ship your item in domestic destination, this fees will be charged to the buyer.',
//	               show: { ready: true },
//	               position: {
//	                    my: 'left center',
//	                    at: 'right center',
//	                    viewport: $(window),
//	                    adjust: { x: 10, y: 0 }
//	               }
//	            });

				$('#noCosts').prop('checked', false);
			} else {
				$('#domestic').attr('disabled', 'true').attr('checked', false)
				$('#shippingCosts').attr('disabled', 'true').val('0.0')
				$('#userInformationPlaceholder').parent().parent().slideUp(300);
//				$('#domesticCosts').qtip('destroy');

				$('#noCosts').prop('checked', true);
			}
		});
	});

</g:javascript>