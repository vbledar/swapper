<div class="row">
    <div class="col-xs-12 col-sm-5 col-md-4">
        <h3 class="text-center">
            <g:message code="item.management.overview.photos.header"/>
        </h3>
        <div id="item-${item?.id}" class="carousel carousel-hidden slide" data-ride="carousel" data-interval="false">
            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <g:each in="${item?.photos}" var="photo" status="i">
                    <div class="item text-center ${i == 0 ? 'active' : ''}">
                        <a class="image-photo-gallery" href="${photo?.url}">
                            <sw:photo photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-180-180" cssStyle="margin-left: auto; margin-right: auto;"/>
                        </a>
                    </div>
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

        <div class="spacer10"></div>

        <div class="row">
            <div class="col-sm-12 text-center">
                <!-- Indicators -->
                <ol class="carousel-indicators" style="display: block; position: relative; top: 0px;">
                    <g:each in="${item?.photos}" var="photo" status="i">
                        <a data-target="#item-${item?.id}" data-slide-to="${i}" class="${i == 0 ? 'active' : ''}">
                            <sw:photo photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-25-25" cssStyle="margin-left: auto; margin-right: auto;"/>
                        </a>
                    </g:each>
                </ol>
            </div>
        </div>

        <div class="spacer10"></div>
        <div class="spacer10"></div>
    </div>

    <div class="col-xs-12 col-sm-5 col-md-5">
        <h3 class="text-center">
            <g:message code="item.management.overview.basic.information.header"/>
        </h3>

        <ii:informationLabel label="${message(code: "form.field.item.status")}" value="${message(code: item?.itemStatusType?.i18nCode)}"/>
        <ii:informationLabel label="${message(code: "form.field.item.condition")}" value="${message(code: item?.itemConditionType?.i18nCode)}"/>
        <ii:informationLabel label="${message(code: "form.field.exchange.type")}" value="${message(code: item?.itemExchangeType?.i18nCode)}"/>
        <g:if test="${item?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SELL || item?.itemExchangeType == com.swapper.enums.item.ItemExchangeType.SWAPORSELL}">
            <ii:informationLabel label="${message(code: "form.field.item.price")}" value="${item?.price}"/>
            <g:if test="${ item.itemShipping.noCosts }">
                <g:set var="shippingCostsFound" value="${message (code: "form.field.no.shipping.costs.applied")}"/>
            </g:if>
            <g:else>
                <g:set var="shippingCostsFound" value="${String.valueOf(item?.itemShipping?.shippingCosts)}"/>
            </g:else>
            <ii:informationLabel label="${message(code: "form.field.shipping.costs")}" value="${shippingCostsFound}"/>
            <ii:informationLabel label="${message(code: "form.field.total.buy.value")}" value="${String.valueOf(item?.price + (item?.itemShipping?.shippingCosts ? item?.itemShipping?.shippingCosts : 0))}"/>
        </g:if>
    </div>

    <div class="col-xs-12 col-sm-2 col-md-3 text-center">
        <div class="col-sm-12">
            <h3>
                <g:message code="user.message.feeling.social"/>
            </h3>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style addthis_32x32_style text-center">
            <dl class='dl-horizontal'>
                <dt style="max-width: 80px !important;">Twitter</dt>
                <dd style="margin-left: 85px !important;"><a class="addthis_button_preferred_1"></a></dd>
            </dl>
            <br>
            <dl class='dl-horizontal'>
                <dt style="max-width: 80px !important;">Facebook</dt>
                <dd style="margin-left: 85px !important;"><a class="addthis_button_preferred_2"></a></dd>
            </dl>
            <br>
            <dl class='dl-horizontal'>
                <dt style="max-width: 80px !important;">Somewhere</dt>
                <dd style="margin-left: 85px !important;"><a class="addthis_button_compact"></a></dd>
            </dl>
            <br>
            <dl class='dl-horizontal'>
                <dt style="max-width: 80px !important;">Counter</dt>
                <dd style="margin-left: 85px !important;"><a class="addthis_counter "></a></dd>
            </dl>
            %{--<script type="text/javascript"></script>--}%
            %{--<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52f8b2a42d320c34"></script>--}%
            <!-- AddThis Button END -->
        </div>
    </div>
</div>

<g:javascript>

    $(function() {
        $('a.image-photo-gallery').colorbox({ opacity:0.5 , rel:'group1' });

        var addthis_config = {"data_track_addressbar":true};
        $.getScript('http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52f8b2a42d320c34');
    })
</g:javascript>
