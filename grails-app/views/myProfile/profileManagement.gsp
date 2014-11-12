<%--
  Created by IntelliJ IDEA.
  User: vbledar
  Date: 10/10/14
  Time: 18:30
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="internalMenu"/>

    <title>
        <g:message code="page.title.profile.management"/>
    </title>
</head>

<body>

<content tag="internalMenu">
    <div class="row">
        <div class="col-sm-12 no-padding-no-margin flat-btn-group">
            <g:render template="/standard/accountMenu"/>
        </div>
    </div>
</content>


<g:set var="socialNetworkType" value="${message(code: person?.socialNetworkType?.getI18nDescriptive())}"/>

<div class="internal_container">
    <div class="page-header">
        <h1>
            <g:message code="profile.management.header"/>
            <br />
            <small>
                <g:message code="profile.management.sub.header"/>
            </small>
        </h1>
    </div>


    <div class="row">
        <div class="col-sm-3 text-center">
            <h3>
                <g:message code="profile.management.profile.picture"/>
                <g:link controller="socialManager" action="getUserProfilePicture" class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-refresh pull-right"></span>
                </g:link>
            </h3>
            <g:if test="${person?.photo?.url}">
                <g:img uri="${person?.photo?.url}" class="img-thumbnail img-responsive" style="margin-left: auto; margin-right: auto; min-height: 150px; min-width: 150px;"/>
            </g:if>
            <g:else>
                <g:set var="socialNetworkType" value="${message(code: person?.socialNetworkType?.i18nDescriptive)}"/>
                <button class="btn btn-primary btn-sm">
                    <g:message code="button.label.load.from.social" args="[socialNetworkType]"/>
                </button>
            </g:else>

            <div class="spacer10"></div>

            <button id="personBasicManagement" class="btn btn-primary" style="width: 100%; height: 100px">
                <span class="glyphicon glyphicon-user"></span><br> <g:message code="profile.management.menu.item.basic.information"/>
            </button>
            <div class="spacer10"></div>
            <button id="personAddressesManagement" class="btn btn-primary" style="width: 100%; height: 100px">
                <span class="glyphicon glyphicon-briefcase"></span><br> <g:message code="profile.management.menu.item.addresses"/>
            </button>
            <div class="spacer10"></div>
            <button id="personPaymentMethodManagement" class="btn btn-primary" style="width: 100%; height: 100px">
                <span class="glyphicon glyphicon-credit-card"></span><br> <g:message code="profile.management.menu.item.payment.methods"/>
            </button>

            <div class="spacer10"></div>
        </div>
        <div class="col-sm-9 profile-container">
            <g:if test="${"address".equalsIgnoreCase(showContent)}">
                <g:render template="personAddressesInfo" model="[addresses: addresses]"/>
            </g:if>
            <g:else>
                <g:render template="personBasicInfo" model="[person: person]"/>
            </g:else>
        </div>
    </div>
</div>

<g:javascript>

    $(function() {

        $('#personBasicManagement').off('click').on('click', function(event) {
            event.preventDefault();

            var previous = $('.profile-container').html();
            var url = '<g:createLink controller="myProfile" action="profileBasicManagement"/>';
            var posting = $.post(url, function() {
                var progressIndicator = $('#loading_bar').removeClass("hidden");
                $('.profile-container').html(progressIndicator);
            });

            posting.done(function(data) {
                $('.profile-container').html(data);
            });

            posting.fail(function(data) {
                $('.profile-container').html(previous);
                var message = '<g:message code="user.message.action.failed.try.again"/>';
                $.notify(message, 'error');
            });
        });

        $('#personAddressesManagement').off('click').on('click', function(event) {
            event.preventDefault();

            var previous = $('.profile-container').html();
            var url = '<g:createLink controller="myProfile" action="profileAddressesManagement"/>';
            var posting = $.post(url, function() {
                var progressIndicator = $('#loading_bar').removeClass("hidden");
                $('.profile-container').html(progressIndicator);
            });

            posting.done(function(data) {
                $('.profile-container').html(data);
            });

            posting.fail(function(data) {
                $('.profile-container').html(previous);
                var message = '<g:message code="user.message.action.failed.try.again"/>';
                $.notify(message, 'error');
            });
        });

        $('#personPaymentMethodManagement').off('click').on('click', function(event) {
            event.preventDefault();

            var previous = $('.profile-container').html();
            var url = '<g:createLink controller="myProfile" action="profilePaymentMethodsManagement"/>';
            var posting = $.post(url, function() {
                var progressIndicator = $('#loading_bar').removeClass("hidden");
                $('.profile-container').html(progressIndicator);
            });

            posting.done(function(data) {
                $('.profile-container').html(data);
            });

            posting.fail(function(data) {
                $('.profile-container').html(previous);
                var message = '<g:message code="user.message.action.failed.try.again"/>';
                $.notify(message, 'error');
            });
        });
    });

</g:javascript>
</body>
</html>