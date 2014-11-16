<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 11/14/14
  Time: 11:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9">
        <div class="page-header">
            <h3>
                <g:if test="${pageProperty(name: "page.flowStepHeader")}">
                    <g:pageProperty name="page.flowStepHeader"/>
                </g:if>
            </h3>
        </div>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
        <g:if test="${pageProperty(name: "page.flowStepIndicator")}">
            <g:pageProperty name="page.flowStepIndicator"/>
        </g:if>
    </div>
    <div class="col-xs-12 col-sm-9">
        <g:pageProperty name="page.flowStepBody"/>
    </div>
</div>

<div class="row">
    <div class="hidden-xs col-sm-3">
    </div>
    <div class="col-xs-12 col-sm-9 text-right">
        <div class="col-xs-12 col-sm-6">
            <div id="flow-step-progress" class="progress hidden">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                    <span class="sr-only">Please, wait!</span>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6">
            <g:pageProperty name="page.flowStepNavigation"/>
        </div>
    </div>
</div>

<g:javascript>

    $(function() {

        // Cancel flow action handler
        $('#cancelStep').off('click').on('click', function(event) {
            event.preventDefault();

            $('#flow-step-progress').removeClass('hidden');

            var url = $(this).attr('href');
            var container = $(this).attr('container');
            var parameters = [];
            submitFormWithContainer(url, parameters, successHandler, failureHandler, container);
        });
    });

    function successHandler(data, container) {
        $(container).fadeOut(300, function() {
            $(this).html(data).fadeIn(300);
        })
    }

    function failureHandler(data) {
        $.notify(data.message, 'error');
        $('#flow-step-progress').addClass('hidden');
    }


</g:javascript>