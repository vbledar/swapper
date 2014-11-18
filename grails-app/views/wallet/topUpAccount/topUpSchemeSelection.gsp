<g:applyLayout name="flowStep">

    <content tag="flowStepHeader">
        <g:message code="top.up.payment.selection"/>
    </content>

    <content tag="flowStepIndicator">
        <g:render template="/wallet/topUpAccount/stepIndicator" model="[stepIndicator: 1]"/>
    </content>

    <content tag="flowStepBody">
        <blockquote>
            <g:message code="top.up.scheme.selection.header"/>
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
            <div class="row" style="margin-left: auto; margin-right: auto;">
                <g:each in="${topUpSchemes}" var="topUpScheme" status="i">
                    <div class="col-xs-12 col-sm-${topUpSchemes.size() > 2 ? '6' : '12'} col-md-${topUpSchemes.size() > 3 ? '4' : String.valueOf(12 / topUpSchemes.size())}">
                        <div class="thumbnail btn btn-primary btn-lg top-up-scheme-item ${topUpSchemeSelection?.equals(String.valueOf(topUpScheme.id)) ? 'active' : ''}" topUpScheme="${topUpScheme.id}" style="background-color: darkorange; padding: 10px;">
                            <h5>
                                ${topUpScheme.title}
                            </h5>
                            <asset:image src="topup/scheme-background.png"/>

                            <div class="spacer10"></div>
                            <div class="divider"></div>
                            <div class="spacer10"></div>

                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="alert alert-info">
                                        <h6>
                                            <g:message code="user.message.price.for.points" args="[topUpScheme.points, topUpScheme.amount]"/>
                                        </h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </g:each>
            </div>

            <input type="hidden" id="topUpSchemeSelected" name="topUpSchemeSelection" value="${topUpSchemeSelection}">
        </g:form>
    </content>

    <content tag="flowStepNavigation">
        <g:link elementId="cancelStep" controller="wallet" action="cancelTopUpAccount" container="topUpAccountContainer" class="btn btn-danger flow-navigation">
            <span class="glyphicon glyphicon-remove-circle"></span> <span class="hidden-xs"><g:message code="button.label.cancel"/></span>
        </g:link>
        <g:link elementId="nextStep" controller="wallet" action="topUpAccount" event="next" container="topUpAccountContainer" form="topUpAccountForm" class="btn btn-primary flow-navigation">
            <span class="glyphicon glyphicon-chevron-right"></span> <span class="hidden-xs"><g:message code="button.label.next"/></span>
        </g:link>
    </content>

</g:applyLayout>

<g:javascript>

    $(function() {

        $('.top-up-scheme-item').off('click').on('click', function(event) {
            var topUpSchemeId = $(this).attr('topUpScheme');
            $('#topUpSchemeSelected').val(topUpSchemeId);
            console.log(topUpSchemeId)
            $('.top-up-scheme-item').removeClass('active');
            $(this).addClass('active')
        });
    });

</g:javascript>