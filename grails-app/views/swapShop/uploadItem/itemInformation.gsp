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
        <g:link elementId="cancelStep" controller="swapShop" action="cancelItemUpload" container="swapShopContainer" class="btn btn-danger flow-navigation">
            <span class="glyphicon glyphicon-remove-circle"></span> <div class="hidden-xs"><g:message code="button.label.cancel"/></div>
        </g:link>
        <g:link elementId="nextStep" controller="swapShop" action="uploadItem" event="next" container="swapShopContainer" form="uploadItemForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-right"></span> <div class="hidden-xs"><g:message code="button.label.next"/></div>
        </g:link>
    </content>

</g:applyLayout>
