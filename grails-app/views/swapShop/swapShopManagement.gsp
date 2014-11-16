<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 10/29/2014
  Time: 12:08 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="internalMenu"/>

    <title>
        <g:message code="page.title.swap.shop.management"/>
    </title>
</head>

<body>

<content tag="internalMenu">
    <div class="row">
        <div class="col-sm-12 no-padding-no-margin">
            <g:render template="/standard/swapShopMenu"/>
        </div>
    </div>
</content>

<div class="internal_container">
    <div class="page-header text-center">
        <h1>
            <g:message code="swap.shop.management.header"/>
            <br />
            <small>
                <g:message code="swap.shop.management.sub.header"/>
            </small>
        </h1>
    </div>

    <div class="swapshop-container">
        <div class="row">
            <div class="col-sm-2">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <button id="uploadItemButton" class="btn btn-primary" style="width: 100px; height: 100px">
                            <span class="glyphicon glyphicon-plus-sign"></span><br> <g:message code="swap.shop.button.label.upload.item"/>
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-sm-10">
                <div class="row">
                    <div class="col-sm-12 swapshop-container">
                        <g:render template="itemsList" model="[items: items]"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<g:javascript>
	$(function() {

		<!-- Upload item action handler -->
		$('#uploadItemButton').off('click').on('click', function(event) {
			event.preventDefault();
            var previous = $('.swapshop-container').html();
			var uploadItemUrl = "${createLink(controller: 'swapShop', action: 'uploadItem')}"
			var posting = $.post(uploadItemUrl, function() {
			    console.log('Post away.');
            });

            posting.done(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $(this).html(data);
				    $(this).fadeIn(250);
				})
            });

            posting.fail(function(data) {
                $('.swapshop-container').fadeOut(250, function() {
				    $('.swapshop-container').html(previous);
				    $(this).fadeIn(250);
				});
            });
        });
    });
</g:javascript>
</body>
</html>