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
ul.sdt_menu.li{
    margin-right: 25px;
}
</style>

<div class="content">

    %{--<nav class="navbar navbar-default" role="navigation">--}%
        %{--<div class="container-fluid">--}%

            <!-- Collect the nav links, forms, and other content for toggling -->
            %{--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--}%
                %{--<ul class="nav navbar-nav">--}%
                    %{--<li>--}%
                        <ul id="sdt_menu" class="sdt_menu">
                            <li class="btn btn-primary">
                                <a href="#">
                                    <g:img dir="assets/menus/" file="women-hover.png"/>
                                    <span class="sdt_active"></span>
                                    <span class="sdt_wrap">
                                        <span class="sdt_link">About me</span>
                                        <span class="sdt_descr">Get to know me</span>
                                    </span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <g:img dir="assets/menus/" file="men-hover.png"/>
                                    <span class="sdt_active"></span>
                                    <span class="sdt_wrap">
                                        <span class="sdt_link">Portfolio</span>
                                        <span class="sdt_descr">My work</span>
                                    </span>
                                </a>
                                <div class="sdt_box">
                                    <a href="#">Websites</a>
                                    <a href="#">Illustrations</a>
                                    <a href="#">Photography</a>
                                </div>
                            </li>
                            <li>
                                <a href="#">
                                    <g:img dir="assets/menus/" file="kids-hover.png"/>
                                    <span class="sdt_active"></span>
                                    <span class="sdt_wrap">
                                        <span class="sdt_link">About me</span>
                                        <span class="sdt_descr">Get to know me</span>
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            %{--</div><!-- /.navbar-collapse -->--}%
        %{--</div><!-- /.container-fluid -->--}%
    %{--</nav>--}%
</div>

<script type="text/javascript">
    $(function() {
        /**
         * for each menu element, on mouseenter,
         * we enlarge the image, and show both sdt_active span and
         * sdt_wrap span. If the element has a sub menu (sdt_box),
         * then we slide it - if the element is the last one in the menu
         * we slide it to the left, otherwise to the right
         */
        $('#sdt_menu > li').bind('mouseenter',function(){
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
</script>