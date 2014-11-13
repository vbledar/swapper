<div class="page-header">
    <h1>
        <g:message code="item.management.overview.basic.information.header"/>
    </h1>
</div>

<g:form name="updateItemBasicInformationForm" controller="swapShop" action="updateItemBasicInformation" id="${item?.id}" role="form">

    <g:render template="/item/itemBasicInfoFormFields" model="[item: item]"/>

</g:form>

<div class="row">
    <div class="col-sm-12 text-right">
        <button id="updateItemBasicInformation" class="btn btn-primary" form-id="updateItemBasicInformationForm">
            <span class="glyphicon glyphicon-save"></span> <g:message code="button.label.update"/>
        </button>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#updateItemBasicInformation').off('click').on('click', function(event) {
            event.preventDefault();

            var formId = $(this).attr('form-id');
            var formElement = $('#'+formId);
            submitForm(formElement, updateSuccess, updateFailure);
        })
    });

</g:javascript>