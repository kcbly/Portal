<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Zhongsoft.Portal.DSS.List.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>决策支持系统</title>
    <link href="../UI/DSSStyle.css" rel="Stylesheet" type="text/css" />
    <link href="../../Themes/Styles/easyui.css" rel="Stylesheet" type="text/css" />
    <script src="../../UI/Script/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
    <form id="form1" runat="server">
    <div region="north" class="kpms-pccontainer" split="false" style="height: 86px;">
        <div class="kpms-pcheader" style="background: url(<%=WebAppPath%>/Themes/UserImages/logo.png) no-repeat top left;">
            <span class="logotitle">广西水电决策支持系统</span>
        </div>
        <table class="kpms-navtable">
            <tr>
                <td>
                    <div class="kpms-navleftbutton" id="pre" nowrap="nowrap" style="display: none;">
                        <a href="#" title="向前">
                            <img id="kpms-navimgleft" src="../UI/images/nav_left.gif" /></a>
                    </div>
                    <div class="kpms-pctab kpms-navagation">
                        <%=GenerateNavigatorHTML()%>
                    </div>
                    <div class="kpms-navrightbutton" id="next" nowrap="nowrap" style="display: none;">
                        <a href="#" title="向后">
                            <img id="kpms-navimgright" src="../UI/images/nav_right.gif" /></a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div region="center" style="overflow: hidden;">
        <iframe name="workSpace" frameborder="0" id="workSpace" width="100%" height="100%"
            scrolling="auto" allowtransparency="true"></iframe>
        <script type="text/javascript" language="javascript">
            function frameload() {
                var $proleft = $("#workSpace").contents().find("#prolefttree");
                var $proright = $("#workSpace").contents().find("#proright");
                if ($proright.html() != null) {
                    ChangeSize();
                    $(window).resize(ChangeSize);
                }
                function ChangeSize() {
                    var $w = $(window);
                    var H = $w.height() - 144;
                    var W = $w.width() - 226;
                    $proleft.height(H);
                    if (!$("#workSpace").contents().find("#prolefttd").is(":visible")) {
                        var W1 = $w.width();
                        $proright.css({ width: W1, height: H });
                    } else {
                        $proright.css({ width: W, height: H });
                    }

                }
            }

            var screenWidth = window.screen.width;
            $('#workSpace').height($(window).height() - $(".kpms-pccontainer").height());
        </script>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">

    $(document).ready(function () {
        $('.kpms-pctabli').hover(function () {
            $(this).addClass('kpms-pctablihover');
        }, function () {
            $(this).removeClass('kpms-pctablihover');
        })

        $('.kpms-pctabli').click(function () {
            $(this).addClass('kpms-pctablilink').siblings().removeClass('kpms-pctablilink');
        })
        $('div[id^="mm"]').click(function () {
            var menu0 = $(this).attr('id');
            var menu = "#" + menu0;
            $('li[menu=' + menu + ']').addClass('kpms-pctablilink').siblings().removeClass('kpms-pctablilink');
        })

        var $a = $('.kpms-pctabli a').eq(0);
        var href;
        if ($a.attr('href') == undefined || $a.attr('href') == "") {
            var id = $a.parent('li').attr('menu');
            href = $(id).find('a').attr('href');
        } else {
            href = $a.attr('href');
        }

        $("#workSpace").attr("src", encodeURI(href));

        //        frameload();

    });

    var $midw = 1;
    var $w = 1;
    var $i = 1;
    var $len = 1;
    var $pagecount = 1;
    var $cur = 1; //初始化显示的面
    $(document).ready(function () {
        ChangeNav();
        $(window).resize(function () {
            ChangeNav();
        });
        $('#pre').bind('click', PreClick);
        $('#next').bind("click", NextClick);
        var $showbox = $('#switchEnvBox');
        setInterval(function () {
            if ($showbox.offset().left == 33) {
                $('#kpms-navimgleft').attr('src', '../UI/images/nav_leftblack.gif');
            }
            else {
                $('#kpms-navimgleft').attr('src', '../UI/images/nav_left.gif');
            }
            if (Math.abs($showbox.offset().left) + $w > $len) {
                $('#kpms-navimgright').attr('src', '../UI/images/nav_rightblack.gif');
            }
            else {
                $('#kpms-navimgright').attr('src', '../UI/images/nav_right.gif');
            }
        }, 1000);
    })
    function ChangeNav() {
        var $showbox = $('#switchEnvBox');
        $midw = $(window).width();
        $('.kpms-navagation').width($midw - 0);
        $w = $('.kpms-navagation').width();
        $len = $('#switchEnvBox>li').length * 115; //计算列表总长度
        $pagecount = Math.ceil($len / $w); //计算展示版面数量
    }
    //向前滚动
    function PreClick() {
        var $showbox = $('#switchEnvBox');
        if (!$showbox.is(':animated')) { //判断展示区是否动画
            if (Math.abs($showbox.offset().left) < $len / $pagecount || ($showbox.offset().left == 33)) {
                $showbox.animate({
                    left: +0
                }, 500);
                $cur = 1;
                $('#kpms-navimgleft').attr('src', '../themes/images/nav_leftblack.gif');
            }
            else {
                $cur--;
                $showbox.animate({
                    left: '+=' + $len / $pagecount
                }, 500);
                $('#kpms-navimgleft').attr('src', '../themes/images/nav_left.gif');
            }
        }
    }
    //向后滚动
    function NextClick() {
        var $showbox = $('#switchEnvBox');
        if (!$showbox.is(':animated')) {
            if (Math.abs($showbox.offset().left) + $w > $len) {
                $('#kpms-navimgright').attr('src', '../themes/images/nav_rightblack.gif');
            }
            else {
                $cur++;
                $showbox.animate({
                    left: '-=' + $len / $pagecount
                }, 500);

                $('#kpms-navimgright').attr('src', '../themes/images/nav_right.gif');
            }
        }
    }   
  
</script>
