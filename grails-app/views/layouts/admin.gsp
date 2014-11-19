<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>
        %{--<g:layoutTitle>--}%
            %{--<g:message code="application.header.name"/>--}%
        %{--</g:layoutTitle>--}%
        <g:layoutTitle default="Administration"/>
    </title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>


    <g:layoutHead/>
</head>
<body style="background-color: white; padding-top: 60px">
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span
                class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href='<g:createLink controller="landing"/>'>Swap</a>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Categories <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <g:link controller="category" action="index">
                            Categories
                        </g:link>
                    </li>
                    %{--<li>--}%
                        %{--<a href="<g:createLink controller="admin" action="subCategoriesAdministration" />">--}%
                            %{--<g:message code="administration.categories.child.category" />--}%
                        %{--</a>--}%
                    %{--</li>--}%
                    <li>
                        <a href="<g:createLink controller="admin" action="dashboardTemplateList" />">
                            <g:message code="administration.categories.dashboard" />
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Info Data <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<g:createLink controller="infoData" action="infoDataCategoryManagement" />">
                            <g:message code="administration.info.data.category" />
                        </a>
                    </li>
                    <li>
                        <a href="<g:createLink controller="infoData" action="infoDataSubCategoryManagement" />">
                            <g:message code="administration.info.data.sub.category" />
                        </a>
                    </li>
                    %{--<li>--}%
                    %{--<a href="<g:createLink controller="admin" action="subCategoriesAdministration" />">--}%
                    %{--<g:message code="administration.info.data.entries" />--}%
                    %{--</a>--}%
                    %{--</li>--}%
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Users <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a
                            href="<g:createLink controller="admin" action="userAdministration"/>">Users</a>
                    </li>
                    <li><a
                            href="<g:createLink controller="admin" action="walletTransactionAdministration"/>">Wallet
                        Transactions</a></li>
                </ul></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Items<b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="<g:createLink controller="admin" action="itemAdministration"/>">Items</a>
                    </li>
                    <li>
                        <a href="<g:createLink controller="admin" action="abuseAdministration"/>">Abuse Reports
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Requests<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a
                            href="<g:createLink controller="admin" action="requestAdministration"/>">Requests</a>
                    </li>
                    <li><a
                            href="<g:createLink controller="admin" action="pendingRequestAdministration"/>">Pending Requests</a>
                    </li>
                    <li><a
                            href="<g:createLink controller="admin" action="conversationAdministration"/>">Conversations</a>
                    </li>
                </ul></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown">Billing<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="<g:createLink controller="admin" action="billingAdministration"/>">Billing</a>
                    </li>
                    <li>
                        <a href="<g:createLink controller="admin" action="paymentAdministration"/>">Payments</a>
                    </li>
                </ul>
            </li>
            <li><a
                    href="<g:createLink controller="admin" action="carouselAdministration"/>">Carousel</a>
            </li>
        </ul>
        <span id="notification-area"
              class="label label-default navbar-text navbar-right"
              style="width: 350px; margin-right: 15px; color: white;">Notification
        area!</span>
    </div>
</nav>

<div class="container-fluid" style="margin-left: auto; margin-right: auto; width: 95%">
    <div class="panel panel-default" style="padding-bottom: 10px;">
        <div class="panel-heading"><g:pageProperty name="page.title" /></div>
        <div class="panel-body">

            <div class="row-">
            <!-- Side bar -->
                <g:if test="${pageProperty(name:"page.sidebar")}">
                    <div class="col-md-2">
                        <g:pageProperty name="page.sidebar" />
                    </div>
                </g:if>

            <!--Body content-->
                <div class="${pageProperty(name:"page.sidebar") ? 'col-md-10': 'col-md-12' }">
                    <g:pageProperty name="page.content" />
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>