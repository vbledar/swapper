<div class="page-header">
    <h1>
        <g:message code="item.management.shipping.information.header"/>
    </h1>
</div>

<g:form name="updateItemShippingInformationForm" controller="swapShop" action="updateItemShippingInformation" id="${item?.id}" role="form">

    <g:render template="/item/itemForms/itemShippingInfoFormFields" model="[item: item, itemShipping: item?.itemShipping]"/>

</g:form>

<div class="row">
    <div class="col-sm-12 text-right">
        <button id="updateItemShippingInformation" class="btn btn-primary" form-id="updateItemShippingInformationForm">
            <span class="glyphicon glyphicon-save"></span> <g:message code="button.label.update"/>
        </button>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#updateItemShippingInformation').off('click').on('click', function(event) {
            event.preventDefault();

            var formId = $(this).attr('form-id');
            var formElement = $('#'+formId);
            submitForm(formElement, updateSuccess, updateFailure);
        })
    });

</g:javascript>