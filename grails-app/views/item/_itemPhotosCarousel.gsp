<div id="item-${item?.id}" class="carousel carousel-hidden slide" data-ride="carousel" data-interval="false">
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <g:each in="${item?.photos}" var="photo" status="i">
            <div class="item text-center ${i == 0 ? 'active' : ''}">
                <a class="image-photo-gallery" href="${photo?.url}">
                    <g:if test="${photo instanceof com.swapper.multimedia.photo.Photo}">
                        <sw:photo photo="${photo}" size="m" cssClass="img-thumbnail img-responsive img-rounded image-max-180-180" cssStyle="margin-left: auto; margin-right: auto;"/>
                    </g:if>
                    <g:elseif test="${photo instanceof com.swapper.domain.multimedia.photo.ItemPhotoCommand}">
                        <sw:photoCommand photo="${photo}" size="m" cssClass="img-thumbnail img-responsive img-rounded image-max-180-180" cssStyle="margin-left: auto; margin-right: auto;"/>
                    </g:elseif>
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
                    <g:if test="${photo instanceof com.swapper.multimedia.photo.Photo}">
                        <sw:photo photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-25-25" cssStyle="margin-left: auto; margin-right: auto;"/>
                    </g:if>
                    <g:elseif test="${photo instanceof com.swapper.domain.multimedia.photo.ItemPhotoCommand}">
                        <sw:photoCommand photo="${photo}" size="z" cssClass="img-thumbnail img-responsive img-rounded image-max-25-25" cssStyle="margin-left: auto; margin-right: auto;"/>
                    </g:elseif>
                </a>
            </g:each>
        </ol>
    </div>
</div>