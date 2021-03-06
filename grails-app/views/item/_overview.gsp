
<h4 class="text-center">
    <g:message code="item.management.overview.photos.header"/>
</h4>

<g:render template="/item/itemPhotosCarousel" model="[item: item]"/>

<div class="spacer10"></div>

<div class="row">
    <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
        <g:render template="/item/show/itemBasicInformation" model="[item: item, itemShipping: itemShipping]"/>
    </div>
</div>
<g:if test="${item.quantities[0].attributes.size() > 0}">
    <div class="row">
        <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
            <g:render template="/item/show/itemDetailedInformation" model="[item: item, itemShipping: itemShipping]"/>
        </div>
    </div>
</g:if>
<div class="row">
    <div class="col-sm-12 thumbnail" style="margin-left: 10px; margin-right: 10px; padding: 10px; border-radius: 0px;">
        <g:render template="/item/show/itemShippingInformation" model="[item: item, itemShipping: item.itemShipping]"/>
    </div>
</div>

    %{--<div class="col-xs-12 col-sm-2 col-md-3 text-center">--}%
        %{--<div class="col-sm-12">--}%
            %{--<h3>--}%
                %{--<g:message code="user.message.feeling.social"/>--}%
            %{--</h3>--}%
            %{--<!-- AddThis Button BEGIN -->--}%
            %{--<div class="addthis_toolbox addthis_default_style addthis_32x32_style text-center">--}%
            %{--<dl class='dl-horizontal'>--}%
                %{--<dt style="max-width: 80px !important;">Twitter</dt>--}%
                %{--<dd style="margin-left: 85px !important;"><a class="addthis_button_preferred_1"></a></dd>--}%
            %{--</dl>--}%
            %{--<br>--}%
            %{--<dl class='dl-horizontal'>--}%
                %{--<dt style="max-width: 80px !important;">Facebook</dt>--}%
                %{--<dd style="margin-left: 85px !important;"><a class="addthis_button_preferred_2"></a></dd>--}%
            %{--</dl>--}%
            %{--<br>--}%
            %{--<dl class='dl-horizontal'>--}%
                %{--<dt style="max-width: 80px !important;">Somewhere</dt>--}%
                %{--<dd style="margin-left: 85px !important;"><a class="addthis_button_compact"></a></dd>--}%
            %{--</dl>--}%
            %{--<br>--}%
            %{--<dl class='dl-horizontal'>--}%
                %{--<dt style="max-width: 80px !important;">Counter</dt>--}%
                %{--<dd style="margin-left: 85px !important;"><a class="addthis_counter "></a></dd>--}%
            %{--</dl>--}%
            %{--<script type="text/javascript"></script>--}%
            %{--<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52f8b2a42d320c34"></script>--}%
            %{--<!-- AddThis Button END -->--}%
        %{--</div>--}%
    %{--</div>--}%
</div>

<g:javascript>

    $(function() {
        $('a.image-photo-gallery').colorbox({ opacity:0.5 , rel:'group1' });

//        var addthis_config = {"data_track_addressbar":true};
//        $.getScript('http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-52f8b2a42d320c34');
    })
</g:javascript>
