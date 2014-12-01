<nav class="visible-xs flat-btn-group navbar navbar-default navbar-inverse" role="navigation">
    <div class="container-fluid">
        <ul class="nav navbar-nav">
            <g:each in="${mainCategories}" var="mainCategory">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${mainCategory.name} <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <g:each in="${mainCategory.categories}" var="category">
                            <li>
                                <g:link controller="category" action="items" params="[maincat: mainCategory.name, subcat: category.name]">
                                    ${category.name}
                                </g:link>
                            </li>
                        </g:each>
                        <li class="pull-right">
                            <g:link controller="swapShop" action="swapShop">
                                <g:message code="account.menu.swap.shop"/>
                            </g:link>
                        </li>
                    </ul>
                </li>
            </g:each>
        </ul>
    </div>
</nav>

<div class="container-fluid hidden-xs">
    <div class="row" style="background-color: #000000">
        <div class="col-xs-12 col-sm-offset-1 col-sm-10 container_80">
            <ul id="sdt_menu" class="sdt_menu">
                <li class="animation">
                    <a href="#">
                        <g:img dir="images" file="women-hover.png"/>
                        <span class="sdt_active"></span>
                        <span class="sdt_wrap">
                            <span class="sdt_link">${mainCategories[0]?.name}</span>
                            <span class="sdt_descr">${mainCategories[0]?.description}</span>
                        </span>
                    </a>
                    <div class="sdt_box">
                        <g:each in="${mainCategories[0].categories}" var="category">
                            <g:link controller="category" action="items" params="[maincat: mainCategories[0].name, subcat: category.name]">
                                ${category.name}
                            </g:link>
                        </g:each>
                    </div>
                </li>
                <li class="animation">
                    <a href="#">
                        <g:img dir="images" file="men-hover.png"/>
                        <span class="sdt_active"></span>
                        <span class="sdt_wrap">
                            <span class="sdt_link">${mainCategories[1]?.name}</span>
                            <span class="sdt_descr">${mainCategories[1]?.description}</span>
                        </span>
                    </a>
                    <div class="sdt_box">
                        <g:each in="${mainCategories[1].categories}" var="category">
                            <g:link controller="category" action="items" params="[maincat: mainCategories[1].name, subcat: category.name]">
                                ${category.name}
                            </g:link>
                        </g:each>
                    </div>
                </li>
                <li class="animation">
                    <a href="#">
                        <g:img dir="images" file="kids-hover.png"/>
                        <span class="sdt_active"></span>
                        <span class="sdt_wrap">
                            <span class="sdt_link">${mainCategories[2]?.name}</span>
                            <span class="sdt_descr">${mainCategories[2]?.description}</span>
                        </span>
                    </a>
                    <div class="sdt_box">
                        <g:each in="${mainCategories[2].categories}" var="category">
                            <g:link controller="category" action="items" params="[maincat: mainCategories[2].name, subcat: category.name]">
                                ${category.name}
                            </g:link>
                        </g:each>
                    </div>
                </li>
                <li class="pull-right">
                    <g:link controller="swapShop" action="swapShop">
                        <span class="sdt_wrap">
                            <span class="sdt_link">
                                <g:message code="account.menu.swap.shop"/>
                            </span>
                        </span>
                    </g:link>
                </li>
            </ul>
        </div>
    </div>
</div>
<style>
    body{
        background:#333 url(bg.jpg) repeat top left;
        font-family:Arial;
    }
    span.reference{
        position:fixed;
        left:10px;
        bottom:10px;
        font-size:12px;
    }
    span.reference a{
        color:#aaa;
        text-transform:uppercase;
        text-decoration:none;
        text-shadow:1px 1px 1px #000;
        margin-right:30px;
    }
    span.reference a:hover{
        color:#ddd;
    }
    ul.sdt_menu{
        /*margin-top:150px;*/
    }
    h1.title{
        text-indent:-9000px;
        background:transparent url(title.png) no-repeat top left;
        width:633px;
        height:69px;
    }
</style>

<g:javascript>
    $(function() {
        /**
         * for each menu element, on mouseenter,
         * we enlarge the image, and show both sdt_active span and
         * sdt_wrap span. If the element has a sub menu (sdt_box),
         * then we slide it - if the element is the last one in the menu
         * we slide it to the left, otherwise to the right
         */
        $('#sdt_menu > li.animation').bind('mouseenter',function(){
            var $elem = $(this);
            $elem.find('img')
                    .stop(true)
                    .animate({
                        'width':'170px',
                        'height':'170px',
                        'left':'0px'
                    },400,'easeOutBack')
                    .andSelf()
                    .find('.sdt_wrap')
                    .stop(true)
                    .animate({'top':'140px'},500,'easeOutBack')
                    .andSelf()
                    .find('.sdt_active')
                    .stop(true)
                    .animate({'height':'170px'},300,function(){
                        var $sub_menu = $elem.find('.sdt_box');
                        if($sub_menu.length){
                            var left = '170px';
                            if($elem.parent().children().length == $elem.index()+1)
                                left = '-170px';
                            $sub_menu.show().animate({'left':left},200);
                        }
                    });
        }).bind('mouseleave',function(){
            var $elem = $(this);
            var $sub_menu = $elem.find('.sdt_box');
            if($sub_menu.length)
                $sub_menu.hide().css('left','0px');

            $elem.find('.sdt_active')
                    .stop(true)
                    .animate({'height':'0px'},300)
                    .andSelf().find('img')
                    .stop(true)
                    .animate({
                        'width':'0px',
                        'height':'0px',
                        'left':'85px'},400)
                    .andSelf()
                    .find('.sdt_wrap')
                    .stop(true)
                    .animate({'top':'25px'},500);
        });
    });
</g:javascript>