<div class="page-header">
    <h1>
        <g:message code="item.menu.detailed.information"/>
    </h1>
</div>

<g:form name="updateItemDetailedInfoForm" controller="swapShop" action="updateItemDetailedInformation" id="${item?.id}" role="form">

    <g:render template="/item/itemDetailedInfoFormFields" model="[itemInstance: item, searchCriteria: searchCriteria]"/>

</g:form>

<div class="row">
    <div class="col-sm-12 text-right">
        <button id="updateItemDetailedInformation" class="btn btn-primary" form-id="updateItemDetailedInfoForm">
            <span class="glyphicon glyphicon-save"></span> <g:message code="button.label.update"/>
        </button>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#updateItemDetailedInformation').off('click').on('click', function(event) {
            event.preventDefault();

            var formId = $(this).attr('form-id');
            var formElement = $('#'+formId);
            submitForm(formElement, updateSuccess, updateFailure);
        })
    });

</g:javascript>