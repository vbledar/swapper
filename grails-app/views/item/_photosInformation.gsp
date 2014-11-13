<div class="page-header">
    <h1>
        <g:message code="item.management.overview.photos.header"/>
    </h1>
</div>

<div class="alert alert-warning">
    <h5>
        <g:message code="user.message.image.limitations"/>
    </h5>
    <ol>
        <li>
            <h6><g:message code="user.message.image.format.allowed"/></h6>
        </li>
        <li>
            <h6><g:message code="user.message.image.max.size"/></h6>
        </li>
        <li>
            <h6><g:message code="user.message.max.images.allowed"/></h6>
        </li>
    </ol>
</div>
<g:form name="updateItemPhotosInformationForm" controller="swapShop" action="updateItemPhotosInformation" id="${item?.id}" role="form">

    <g:render template="/item/itemPhotosInfoFormFields" model="[item: item]"/>

</g:form>

<div class="row">
    <div class="col-sm-12 text-right">
        <button id="updateItemPhotosInformation" class="btn btn-primary" form-id="updateItemPhotosInformationForm">
            <span class="glyphicon glyphicon-save"></span> <g:message code="button.label.update"/>
        </button>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#updateItemPhotosInformation').off('click').on('click', function(event) {
            event.preventDefault();

            var formId = $(this).attr('form-id');
            var formElement = $('#'+formId);
            submitForm(formElement, updateSuccess, updateFailure);
        })
    });

</g:javascript>

