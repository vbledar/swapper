<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="upload.item.flow.step.details"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 2]"/>
    </content>

    <content tag="flowStepBody">
        <g:form name='uploadItemForm' controller="swapShop" action="uploadItem" role="form" class="form-horizontal">
            <g:render template="/item/itemDetailedInfoFormFields" model="[item: item, searchCriteria: searchCriteria]"/>
        </g:form>
    </content>

    <content tag="flowStepNavigation">
        <g:link elementId="cancelStep" controller="swapShop" action="cancelItemUpload" container="swapShopContainer" class="btn btn-danger flow-navigation">
            <span class="glyphicon glyphicon-remove-circle"></span> <div class="hidden-xs"><g:message code="button.label.cancel"/></div>
        </g:link>
        <g:link elementId="previousStep" controller="swapShop" action="uploadItem" event="previous" container="swapShopContainer" form="uploadItemForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-left"></span> <div class="hidden-xs"><g:message code="button.label.previous" /></div>
        </g:link>
        <g:link elementId="nextStep" controller="swapShop" action="uploadItem" event="next" container="swapShopContainer" form="uploadItemForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-right"></span> <div class="hidden-xs"><g:message code="button.label.next"/></div>
        </g:link>
    </content>

</g:applyLayout>



<g:javascript>

    $(function () {
        $("input:radio[checked]").each(function () {
            console.log($(this));
            $(this).parent().addClass('active');
        });
    });

</g:javascript>