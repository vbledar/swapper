<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="top.up.payment.selection"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="/wallet/topUpAccount/stepIndicator" model="[stepIndicator: 3]"/>
    </content>

    <content tag="flowStepBody">
        <blockquote>
            <g:message code="top.up.verify.selection.header"/>
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

        <g:form name='topUpAccountForm' controller="wallet" action="topUpAccount" role="form" class="form-horizontal">
            <div class="alert alert-info">
                <g:message code="user.message.redirection.occuring"/>
            </div>

            <blockquote>
                <g:message code="top.up.scheme.selected"/>

                <br>

                <h5>
                    <g:message code="form.field.top.scheme"/> <strong><g:message code="${topUpSchemeSelected.title}"/></strong>
                </h5>
                <h5>
                    <g:message code="form.field.amount"/> <strong><g:message code="${topUpSchemeSelected.amount}"/></strong>
                </h5>
                <h5>
                    <g:message code="form.field.points"/> <strong><g:message code="${topUpSchemeSelected.points}"/></strong>
                </h5>
            </blockquote>

            <blockquote>
                <g:message code="top.up.payment.method.selected"/>

                <br>

                <h5>
                    <g:message code="form.field.payment.type"/> <strong><g:message code="${paymentMethodSelected.paymentType.i18nCode}"/></strong>
                </h5>
                <h5>
                    <g:message code="form.field.account"/> <strong><g:message code="${paymentMethodSelected.account}"/></strong>
                </h5>
            </blockquote>
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
            <span class="glyphicon glyphicon-chevron-right"></span> <span class="hidden-xs"><g:message code="button.label.redirect"/></span>
        </g:link>
    </content>

</g:applyLayout>