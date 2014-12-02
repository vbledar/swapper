<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title>
            <g:layoutTitle/>
        </title>

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>

		<g:layoutHead/>
	</head>
	<body>

        <g:render template="/standard/defaultHeader"/>

        <g:render template="/standard/categoriesMenu" model="[mainCategories: com.swapper.item.Category.getMainCategories()]"/>

        <div class="spacer30"></div>

        <g:if test="${errorMessage}">
            error exists
            <div class="spacer30"></div>
            <div class="internal_container">
                <g:render template="/standard/userInformation/userErrorMessage"/>
            </div>
        </g:if>

        <g:if test="${showPaymentMethodRequiredMessage}">
            <div class="spacer30"></div>
            <div class="internal_container">
                <g:render template="/standard/userInformation/paymentMethodRequiredMessage"/>
            </div>
        </g:if>

        <div class="container_80">
            <div class="row">
                <div class="col-sm-12">
                    <g:layoutBody/>
                </div>
            </div>
        </div>

        <div id="loading_bar" class="progress center-block hidden" style="width: 50%;">
            <div class="progress-bar progress-bar-striped active"  role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
            </div>
        </div>

        <!-- Go to www.addthis.com/dashboard to customize your tools -->
        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52f8b2a42d320c34" async="async"></script>
	</body>
</html>
