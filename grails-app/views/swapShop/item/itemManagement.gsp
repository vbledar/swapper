<%--
  Created by IntelliJ IDEA.
  User: Bledar
  Date: 11/9/2014
  Time: 5:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="internalMenu"/>

    <title>
        ${item?.name}
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
            <g:message code="item.management.header"/>
            <br />
            <small>
                <g:message code="swap.shop.management.sub.header"/>
            </small>
        </h1>
    </div>

    <div class="spacer30"></div>

    <div class="row">
        <div class="col-sm-12">
            <div class="page-header">
                <h1>
                    ${item?.name}
                    <small style="color: darkorange">
                        <i>
                            <g:message code="swap.shop.item.uploaded.on" args="[formatDate(format: 'dd/MM/yyyy', date: item?.dateCreated)]"/>
                        </i>
                    </small>
                    <span class="pull-right">
                        <div class="visible-xs">
                            <br>
                        </div>
                        <button class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.delete"/>
                        </button>
                    </span>
                </h1>
            </div>
        </div>

        <div class="spacer10"></div>

        <div id="item-updatable-container">
            <g:render template="/swapShop/item/itemUpdatableContainer" model="[item: item]"/>
        </div>
    </div>
</div>

<g:javascript>

    function updateSuccess(data) {
        $('#item-updatable-container').html(data);

        var message = '<g:message code="user.message.item.update.success"/>';
        $.notify(message, 'success')
    }

    function updateFailure(data) {
        if (data.message) {
            $.notify(data.message, 'error');
        } else {
            var message = '<g:message code="user.message.action.failed.try.again"/>';
            $.notify(message, 'error');
        }
    }

</g:javascript>
</body>
</html>