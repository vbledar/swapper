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
                        <button class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> <g:message code="button.label.delete"/>
                        </button>
                    </span>
                </h1>
            </div>
        </div>

        <div class="spacer10"></div>

        <div class="col-sm-12">
            <g:render template="/item/overview" model="[item: item]"/>
        </div>

        <div class="spacer10"></div>

        <div class="col-sm-12">
            <ul class="nav nav-tabs nav-justified" role="tablist">
                <g:render template="item/itemMenu" model="[item: item]"/>
            </ul>
            <div class="tab-content">
                %{--<div role="tabpanel" class="tab-pane fade in active" id="overviewTab">--}%
                    %{--<g:render template="/item/overview" model="[item: item]"/>--}%
                %{--</div>--}%

                <div role="tabpanel" class="tab-pane fade in active" id="basicTab">
                    <g:render template="/item/basicInformation" model="[item: item, rootCategories: rootCategories, categories: categories]"/>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="detailsTab">
                    <g:render template="/item/detailedInformation" model="[item: item]"/>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="shippingTab">
                    <g:render template="/item/shippingInformation" model="[item: item]"/>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="photosTab">
                    <g:render template="/item/photosInformation" model="[item: item]"/>
                </div>
            </div>
        </div>
    </div>
</div>

<g:javascript>

    function updateSuccess(data) {
        console.log(data);
        $.notify(data.message, 'success')
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