<div class="modal-dialog no-padding-no-margin" style="width: 100%">
    <div class="modal-content">
        <div class="modal-body" style="overflow-y: hidden;">
            <div class="col-sm-12 well well-sm ${stepIndicator > 1 ? 'step-done' : ''} ${stepIndicator == 1 ? 'step-on' : ''} ${stepIndicator < 1 ? 'step-not-yet' : ''}">
                <g:message code="upload.item.flow.step.information"/>
            </div>

            <div class="col-sm-12 text-center">
                <span class="glyphicon glyphicon-chevron-down"/>
            </div>
            <div class="spacer10"></div>

            <div class="col-sm-12 well well-sm ${stepIndicator > 2 ? 'step-done' : ''} ${stepIndicator == 2 ? 'step-on' : ''} ${stepIndicator < 2 ? 'step-not-yet' : ''}">
                <g:message code="upload.item.flow.step.attributes"/>
            </div>

            <div class="col-sm-12 text-center">
                <span class="glyphicon glyphicon-chevron-down"/>
            </div>
            <div class="spacer10"></div>

            <div class="col-sm-12 well well-sm ${stepIndicator > 3 ? 'step-done' : ''} ${stepIndicator == 3 ? 'step-on' : ''} ${stepIndicator < 3 ? 'step-not-yet' : ''}">
                <g:message code="upload.item.flow.step.shipping"/>
            </div>

            <div class="col-sm-12 text-center">
                <span class="glyphicon glyphicon-chevron-down"/>
            </div>
            <div class="spacer10"></div>

            <div class="col-sm-12 well well-sm ${stepIndicator > 4 ? 'step-done' : ''} ${stepIndicator == 4 ? 'step-on' : ''} ${stepIndicator < 4 ? 'step-not-yet' : ''}">
                <g:message code="upload.item.flow.step.photos"/>
            </div>

            <div class="col-sm-12 text-center">
                <span class="glyphicon glyphicon-chevron-down"/>
            </div>
            <div class="spacer10"></div>

            <div class="col-sm-12 well well-sm ${stepIndicator > 5 ? 'step-done' : ''} ${stepIndicator == 5 ? 'step-on' : ''} ${stepIndicator < 5 ? 'step-not-yet' : ''}">
                <g:message code="upload.item.flow.step.verification"/>
            </div>
        </div>
    </div>
</div>