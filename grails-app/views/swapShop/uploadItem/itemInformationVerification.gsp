<%@ page import="com.swapper.enums.item.ItemExchangeType;"%>
<%@ page import="com.swapper.domain.commands.*" %>
<%@ page import="com.swapper.item.Item" %>

<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="upload.item.flow.step.verification"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="uploadItem/stepIndicator" model="[stepIndicator: 5]"/>
    </content>

    <content tag="flowStepBody">
        <div class="row">
            <div class="col-sm-12">
                <g:if test="${!userQualityUser}">
                    <div class=" alert alert-warning">
                        <h6>
                            <g:message code="user.message.item.upload.validation.required" />
                        </h6>
                    </div>
                </g:if>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-4">
                <g:render template="/item/itemPhotosCarousel" model="[item: item]"/>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-8">
                <g:render template="/item/itemBasicInformationOverview" model="[item: item, itemShipping: itemShipping]"/>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
                <g:render template="/item/itemDetailedInfoSummary" model="[item: item, itemShipping: itemShipping]"/>
            </div>
        </div>
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