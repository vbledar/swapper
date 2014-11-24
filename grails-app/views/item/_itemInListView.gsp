<div class="col-xs-12 col-sm-6 col-md-4">
    <div class="thumbnail" style="">
        <div class="caption">
            <h3 class="media-heading">${item?.name}</h3>
            <small style="color: darkorange"><i><g:message code="swap.shop.item.uploaded.on" args="[formatDate(format: 'dd/MM/yyyy', date: item?.dateCreated)]"/></i></small>
        </div>
        <div id="item-${item?.id}" class="carousel carousel-hidden slide" data-ride="carousel" data-interval="false">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <g:each in="${item?.photos}" var="photo" status="i">
                    <g:if test="${i == 0}">
                        <li data-target="#item-${item?.id}" data-slide-to="0" class="active"></li>
                    </g:if>
                    <g:else>
                        <li data-target="#item-${item?.id}" data-slide-to="0"></li>
                    </g:else>
                </g:each>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <g:each in="${item?.photos}" var="photo" status="i">
                    <g:if test="${i == 0}">
                        <div class="item text-center active">
                            <sw:photo photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-180-180" cssStyle="margin-left: auto; margin-right: auto;"/>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="item text-center">
                            <sw:photo photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-180-180" cssStyle="margin-left: auto; margin-right: auto;"/>
                        </div>
                    </g:else>
                </g:each>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#item-${item?.id}" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#item-${item?.id}" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="caption">
            <div class="row">
                <div class="col-sm-12">
                    <strong><g:message code="form.field.exchange.type"/></strong> <span style="color: darkorange"><i>${item?.itemExchangeType?.description}</i></span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <strong><g:message code="form.field.item.condition"/></strong> <span style="color: darkorange"><i>${item?.itemConditionType?.description}</i></span>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <strong><g:message code="form.field.item.status"/></strong> <span style="color: darkorange"><i>${item?.itemStatusType?.description}</i></span>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <g:render template="/item/itemInListViewMenu" model="[item: item]"/>
            </div>
        </div>
    </div>
</div>

<browser:isMobile>

    <g:javascript>
        $(function() {
            $('.carousel').removeClass('carousel-hidden');
        })
    </g:javascript>

</browser:isMobile>