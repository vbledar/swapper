<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="top.up.payment.selection"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="/wallet/topUpAccount/stepIndicator" model="[stepIndicator: 2]"/>
    </content>

    <content tag="flowStepBody">
        <g:form name='topUpAccountForm' controller="wallet" action="topUpAccount" role="form" class="form-horizontal">
            <blockquote>
                <g:message code="top.up.payment.selection.header"/>
            </blockquote>

            <g:if test="${errorMessage}">
                <div class="row">
                    <div class="col-sm-12">
                        <h6 class="alert alert-danger">
                            ${errorMessage}
                        </h6>
                    </div>
                </div>
            </g:if>

            <div class="row" style="margin-left: auto; margin-right: auto;">
                <g:each in="${paymentMethods}" var="paymentMethod" status="i">
                    <div class="col-xs-12 col-sm-${paymentMethods.size() > 2 ? '6' : '12'} col-md-${paymentMethods.size() > 3 ? '4' : String.valueOf(12 / paymentMethods.size())}">
                        <div class="thumbnail btn btn-primary btn-lg selection-item ${paymentMethodSelection?.equals(String.valueOf(paymentMethod.id)) ? 'active' : ''}" paymentMethod="${paymentMethod.id}" style="background-color: darkorange; padding: 10px;">
                            <h5>
                                <g:message code="${paymentMethod.paymentType.i18nCode}"/>
                            </h5>
                            <asset:image src="topup/scheme-background.png"/>

                            <div class="spacer10"></div>
                            <div class="divider"></div>
                            <div class="spacer10"></div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="alert alert-info">
                                        <h6>
                                            ${paymentMethod.account}
                                        </h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </g:each>
            </div>

            <input type="hidden" id="paymentMethodSelected" name="paymentMethodSelection" value="${paymentMethodSelection}">
        </g:form>
    </content>

    <content tag="flowStepNavigation">
        <g:link elementId="cancelStep" controller="wallet" action="cancelTopUpAccount" container="topUpAccountContainer" class="btn btn-danger flow-navigation">
            <span class="glyphicon glyphicon-remove-circle"></span> <span class="hidden-xs"><g:message code="button.label.cancel"/></span>
        </g:link>
        <g:link elementId="previousStep" controller="wallet" action="topUpAccount" event="previous" container="topUpAccountContainer" form="topUpAccountForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-left"></span> <span class="hidden-xs"><g:message code="button.label.previous"/></span>
        </g:link>
        <g:link elementId="nextStep" controller="wallet" action="topUpAccount" event="next" container="topUpAccountContainer" form="topUpAccountForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-right"></span> <span class="hidden-xs"><g:message code="button.label.next"/></span>
        </g:link>
    </content>

</g:applyLayout>


<g:javascript>

    $(function() {

        $('.selection-item').off('click').on('click', function(event) {
            var paymentMethodId = $(this).attr('paymentMethod');
            $('#paymentMethodSelected').val(paymentMethodId);
            $('.selection-item').removeClass('active');
            $(this).addClass('active')
        });
    });

</g:javascript>