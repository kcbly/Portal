<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Zhongsoft.Portal.PWS.Index" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIHeader.ascx" TagPrefix="uc1" TagName="UIHeader" %>
<%@ Register Src="~/PWS/UI/Controls/UIFooter.ascx" TagPrefix="uc2" TagName="UIFooter" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=WebName %></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!-- 引入 Bootstrap -->
    <link href="<%= WebAppPath %>/PWS/UI/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= WebAppPath %>/PWS/UI/css/slideshow.css" rel="stylesheet" />
    <link href="<%= WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
         <script src="<%= WebAppPath %>/PWS/UI/js/html5shiv.js"></script>
         <script src="<%= WebAppPath %>/PWS/UI/js/respond.min.js"></script>
      <![endif]-->
    <style>
        .ui-menu .ui-menu-item a {
            text-align: left
        }
        /*新年皮肤开始*/
        /*body {
            background: url(UI/IMG/ph_2021.jpg) no-repeat 50% 0;
            padding-top: 0;
            margin-top: 0;
            background-color: #fff;
        }

        .left {
            background: #fff;
        }

        .right {
            padding-top: 10px;
        }

        .banner {
            margin: 0 auto !important;
            margin-top: 10px !important;
        }*/
        /*新年皮肤结束*/
    </style>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnLogin">
        <uc1:UIHeader runat="server" ID="UIHeader" />
        <!--banner图-->
        <div class="banner">
            <div id="myCarousel" class="carousel slide">
                <!-- 轮播（Carousel）指标 -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- 轮播（Carousel）项目 -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="UI/img/topbanner.jpg" alt="First slide">
                    </div>
                    <div class="item">
                        <img src="UI/img/topbanner2.jpg" alt="Second slide">
                    </div>
                    <div class="item">
                        <img src="UI/img/topbanner3.jpg" alt="Third slide">
                    </div>
                </div>
            </div>
        </div>
        <div class="body-85">
            <div class="left">
                <div class="inner">
                    <div class="row" id="private">
                        <div class="col-md-6">
                            <!--日常任务-->
                            <div class="news-div">
                                <div class="news-title-rcrw" id="DB-Head">
                                    <span>待办任务</span>
                                    <a href="#">更多>></a>
                                </div>
                                <div class="news-content-top" id="DB-Content">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!--部门园地-->
                            <div class="news-div">
                                <div class="news-title-bmyd" id="BM-Head">
                                </div>
                                <div class="news-content-top" id="BM-Content">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-t-10">
                        <div class="col-md-12">
                            <!--新闻中心-->
                            <div class="news-div">
                                <div class="news-title-long" id="Second1-Head">
                                </div>
                                <div class="news-content-long" id="Second1-Content">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12" id="Third1-Content">
                        </div>
                    </div>
                    <div class="row margin-t-5">
                        <div class="col-md-6">
                            <!--通知公告-->
                            <div class="news-div">
                                <div class="news-title-tzgg" id="Fourth1-Head">
                                </div>
                                <div class="news-content" id="Fourth1-Content">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!--项目动态-->
                            <div class="news-div">
                                <div class="news-title-xmdt" id="Fourth2-Head">
                                </div>
                                <div class="news-content" id="Fourth2-Content">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <!--轮播-->
                            <div class="row margin-t-10">
                                <div class="col-md-12 col-xs-12">
                                    <div id="ztCarousel" class="carousel slide" data-ride="carousel">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-t-10">
                        <div class="col-md-6">
                            <!--政策法规-->
                            <div class="news-div">
                                <div class="news-title-zcfg" id="Seventh1-Head">
                                </div>
                                <div class="news-content" id="Seventh1-Content">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!--技术质量与培训-->
                            <div class="news-div">
                                <div class="news-title-jszl" id="Seventh2-Head">
                                </div>
                                <div class="news-content" id="Seventh2-Content">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <!--政工平台-->
                            <div class="zgpt">
                                <div class="zt4-title" id="Fifth1-Head">
                                </div>
                                <div class="zgpt-content" id="Fifth1-Content">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row margin-t-10">
                        <!--青年园地-->
                        <div class="col-md-12 news-div">
                            <div class="news-title-qnyd" id="Eighth1-Head">
                            </div>
                            <div class="jsjl-content" id="Eighth1-Content">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right">
                <!--登录框-->
                <div class="login-content">
                    <div class="row">
                        <div class="col-xs-3"><span class="font-bold">账户：</span></div>
                        <div class="col-xs-9">
                            <input class="form-control" id="txtName" type="text" runat="server" />
                        </div>
                    </div>
                    <div class="row margin-t-10">
                        <div class="col-xs-3"><span class="font-bold">密码：</span></div>
                        <div class="col-xs-9">
                            <input class="form-control" id="txtPwd" type="password" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <span id="lbErrorLogin" style="color: red; float: right; padding-top: 5px; display: none">登录失败</span>
                        </div>
                    </div>
                    <div class="login-button">
                        <asp:LinkButton runat="server" ID="btnLogin" class="btn btn-sm btn-primary margin-r-10" OnClientClick="userLogin()" EnableTheming="false"><span>登录</span></asp:LinkButton>
                        <input type="button" value="注销" id="btnLoginOut" class="btn btn-sm btn-default disabled" />
                    </div>

                </div>
                <!--登陆后-->
                <div class="afterlogin-content" style="display: none">
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <img src="UI/img/avatar-male.jpg" id="imgPath" class="img-responsive" style="width: 70px; height: 70px" />
                            <input type="button" value="修改密码" id="btnUpdatePwd" onclick="openPassMondify()" class="btn btn-sm btn-link margin-t-5" />
                        </div>
                        <div class="col-xs-8">
                            <div><span class="letter3 font-bold">用户名：</span><span id="lblName"></span></div>
                            <div><span class="font-bold">档案号：</span><span id="lblLoginId"></span></div>
                            <div><span class="letter3 font-bold" id="divZW">职务：</span><span id="lblPosition"></span></div>
                            <div class="text-left">
                                <input type="button" value="进入系统" id="btnSystem" onclick="openSystem()" class="btn btn-sm btn-primary margin-t-10 margin-r-10" />
                                <input type="button" value="注销" id="btnLoginOut1" onclick="userLoginOut()" class="btn btn-sm btn-primary margin-t-10" />
                                <input type="button" value="进入云盘" id="btnGoYP" onclick="toGoYPLogin()" class="btn btn-sm btn-primary margin-t-10" />
                            </div>
                        </div>
                    </div>
                </div>
                <!--专题栏目1-->
                <a onclick="openList('EAD15C63-24EA-4906-8AD1-DD3DED031B0D','3')" class="pull-right">
                    <img src="UI/img/zt1.png" class="img-responsive" />
                </a>
                <!--专题栏目2-->
                <div>
                    <div class="zt2-title">
                        <span>专题专栏</span>
                    </div>
                    <div class="zt2-content" id="Zt-Content">
                    </div>
                </div>
                <!--友情链接-->
                <div class="margin-t-10">
                    <div class="zt3-title" id="Fourth3-Head">
                    </div>
                    <div class="zt4-content" id="Fourth3-Content">
                    </div>
                    <div style="width: 300px; margin-left: 10px">
                        <img src="<%=WebAppPath %>/PWS/UI/img/wfwjwgwt.jpg" alt="" />
                    </div>
                </div>
            </div>
        </div>
        <uc2:UIFooter runat="server" ID="UIFooter" />
    </form>
    <script src="<%=WebAppPath %>/PWS/UI/js/bootstrap.min.js"></script>
    <script src="<%=WebAppPath %>/PWS/UI/js/jquery.SuperSlide.2.1.3.js"></script>
    <script type="text/javascript">
        var $userid = "";
        var $deptid = "";
        var $isadmin = "";
        var $tempLoginId = "";
        //加载除部门园地外的所有的栏目、新闻信息
        loadAllInfo();
        //待办
        loadTodoList();
        //加载轮播栏目
        loadCarousel();
        //用户选择赋值
        setLoginId();
        $(function () {
            $("#txtName").autocomplete({
                source: function (request, response) {
                    $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        var split = ui.item.id.split(',');
                        $tempLoginId = split[1];
                        window.setTimeout(setLoginId, 200);
                    }
                }
            }).focus();
        })
        function setLoginId() {
            $("#txtName").val($tempLoginId);
        }
        $(document).ready(function () {
            //展示用户信息
            showUserInfo();
        });
        $(window).resize(function () {
            //展示用户信息
            showUserInfo();
        });
        //打开系统页面
        function openSystem() {
            var url = "<%=WebAppPath %>/WorkPlat.aspx";
            window.open(url, '_blank');
        }
        //打开修改密码页面
        function openPassMondify() {
            var url = "<%=WebAppPath %>/Sys/LoginPassMondify.aspx";
            window.open(url, '_blank');
        }
        //用户登录
        function userLogin() {
            var userName = $("#<%=txtName.ClientID%>").val();
            var userPwd = $("#<%=txtPwd.ClientID%>").val();
            if (userName == "") {
                alert("请输入账号！");
            } else if (userPwd == "") {
                alert("请输入密码！");
            } else {
                $.post("<%=WebAppPath %>/PWS/Index.aspx", { asyfunc: "LoginToKPMS", loginName: userName, pwd: userPwd },
                    function (res) {
                        if (res != "" && res.length > 0) {
                            var arry = eval(res);
                            if (arry[0].result == "0") {
                                var url = "<%=WebAppPath %>/PWS/Index.aspx";
                                window.open(url, '_self');
                            } else {
                                $("#lbErrorLogin").show();
                                $("#lbErrorLogin").text(arry[0].explain);
                            }
                        }
                    });
            }

        }
        function showUserInfo() {
            //显示用户信息,先判断是否登录
            <%if (this.Request.IsAuthenticated)
        {%>         
            $(".login-content").hide();
            $(".afterlogin-content").show();
            //待办和部门园地
            $("#private").show();
            //用户名
            $("#lblName").show();
            //工号
            $("#lblLoginId").show();
            $("#lblPwd").html("姓名：");
            $("#imgPath").attr("src","<%=SmallPhotoPath%>");
            $("#lblName").text("<%=KPMSUser.Name%>");
            $("#lblLoginId").text("<%=KPMSUser.LoginId %>");
            if ("<%=UserInfo%>" == "") {
                $("#divZW").hide();
            } else {
                $("#lblPosition").text("<%=UserInfo%>");
            }
            $("#<%=txtName.ClientID%>").hide();
            $("#<%=txtPwd.ClientID%>").hide();
            $("#btnLogin").hide();
            $("#btnSystem").show();
            $userid ="<%=KPMSUser.UserId%>";
            $deptid = "<%=KPMSUser.DeptId%>";
            if ("<%=KPMSUser.DeptName%>" == "院领导") {
                $isadmin = "true";
            }
            else {
                $isadmin = "<%=KPMSUser.IsAdmin%>";
            }
            loadDeptNews();
            loadTodoList();

            $(".news-item").width($(".news-content").width() - $(".news-time").width() - 32);
            $(".news-item-top").width($(".news-content-top").width() - $(".news-time-top").width() - 32);
            $(".news-list").width($(".news-content-long").width() - $(".slideBox").width() - 13);
            $(".news-item-long").width($(".news-content-long").width() - $(".news-time").width() - $(".slideBox").width() - 52);
            $(".zt7-title").width($(".zt7-img").width());
           <%}
        else
        {%>
            $userid = "";
            $deptid = "";
            $isadmin = "";
            $(".login-content").show();
            $(".afterlogin-content").hide();
            //待办和部门园地
            $("#private").hide();
            $("#btnSystem").hide();
            $("#BM-Content").empty();

            $(".news-item").width($(".news-content").width() - $(".news-time").width() - 32);
            $(".news-list").width($(".news-content-long").width() - $(".slideBox").width() - 13);
            $(".news-item-long").width($(".news-content-long").width() - $(".news-time").width() - $(".slideBox").width() - 52);
            $(".zt7-title").width($(".zt7-img").width());
            <%}%>
        }
        //用户注销
        function userLoginOut() {
            var url = "<%=WebAppPath %>/PWS/Index.aspx?action=LoginOutPws";
            window.open(url, "_self");
        }
        function loadAllInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                dataType: 'json',
                async: false,
                data: { asyfunc: "GetAllColumns" },
                success: function (dHead) {
                    if (dHead != "" && dHead.length > 0) {
                        var arryHead = eval(dHead);
                        for (var i = 0; i < arryHead.length; i++) {
                            var headId = "", headH = "", contentId = "";
                            headId = arryHead[i].ColumnPosition + "-Head";
                            contentId = arryHead[i].ColumnPosition + "-Content";
                            //文字、图片文字类新闻
                            if (arryHead[i].ColumnClass == "<%=ColumnClass.文字.GetHashCode()%>" ||
                                arryHead[i].ColumnClass == "<%=ColumnClass.图片文字.GetHashCode()%>") {
                                //栏目标题
                                headH = "<span>" + arryHead[i].ColumnName + "</span><a class='more-a' onclick='openList(&quot;" + arryHead[i].ColumnID + "&quot;)'>更多>></a>";
                                /*文字新闻*/
                                if (arryHead[i].ColumnClass == "<%=ColumnClass.文字.GetHashCode()%>") {
                                    //栏目内容
                                    loadTextNews(contentId, arryHead[i].ColumnID);
                                }
                                /*图片文字新闻（轮播）*/
                                else if (arryHead[i].ColumnClass == "<%=ColumnClass.图片文字.GetHashCode()%>") {
                                    loadOtherPicNews(contentId, arryHead[i].ColumnID);
                                }
                            }
                            //图片、专题专栏、友情链接类新闻
                            else {
                                //栏目标题
                                headH = "<span>" + arryHead[i].ColumnName + "</span>";
                                //栏目内容
                                /*图片新闻*/
                                if (arryHead[i].ColumnClass == "<%=ColumnClass.图片.GetHashCode()%>") {
                                    loadPicNews(contentId, arryHead[i].ColumnID);
                                }
                                /*友情链接*/
                                else if (arryHead[i].ColumnClass == "<%=ColumnClass.友情链接.GetHashCode()%>") {
                                    headH = "<i class='iconfont " + arryHead[i].Icon + " news-title-icon'></i><span>" + arryHead[i].ColumnName + "</span>";
                                    loadLinkNews(contentId);
                                }
                            }
                            /*专题专栏*/
                            loadFeatureNews();
                            //栏目名称
                            $("#" + headId).empty().append(headH);
                        }
                    }
                }
            });
        }
        //加载待办
        function loadTodoList() {
            var contentH = "", contentli = "", headH = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetTodoList", pagecount: 10, UserId: $userid },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            contentli += "<li>";
                            var url = "<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?token=" + $userid + "&formid=" + arry[i].FormId + "&actiontype=3&prcinstid=" + arry[i].PrcinstId + "&actinstid=" + arry[i].ActinstId + "&forwardid=&isread=0";
                            contentli += "<a title='" + arry[i].Title + "' href=" + url + " target='_blank'>";
                            contentli += "<span class='news-item-top no-break'>" + arry[i].Title + "</span>";
                            contentli += "<span class='news-time-top'>" + arry[i].ReceiveDateTime + "</span>";
                            contentli += "</a>";
                            contentli += "</li>";
                        }
                    }
                }
            })
            headH = "<span>待办任务</span><a class='more-a'  href='<%=WebAppPath%>/WorkPlat.aspx' target='_blank'>更多>></a>";
            //文字类条目
            contentH = "<ul>" + contentli + "</ul>";
            $("#DB-Head").empty().append(headH);
            $("#DB-Content").empty().append(contentH);
        }
        //加载部门园地新闻
        function loadDeptNews() {
            var contentH = "", contentli = "", headH = "", columnID = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetDeptNews", pagecount: 11, ColumnClass:<%=ColumnClass.文字.GetHashCode()%>, DeptId: $deptid, IsAdmin: $isadmin },
                success: function (data) {

                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            columnID = arry[i].ColumnID;
                            contentli += "<li>";
                            contentli += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            contentli += "<span class='news-item-top no-break'>" + arry[i].Title + "</span>";
                            contentli += "<span class='news-time-top'>" + arry[i].SendTime + "</span>";
                            contentli += "</a>";
                            contentli += "</li>";
                        }
                    }
                }
            })
            headH = "<span>部门园地</span><a class='more-a' onclick='openList(&quot;" + columnID + "&quot;)'>更多>></a>";
            //文字类条目
            contentH = "<ul>" + contentli + "</ul>";
            $("#BM-Head").empty().append(headH);
            $("#BM-Content").empty().append(contentH);
        }
        //加载文字新新闻
        function loadTextNews(contentId, columnId) {
            var contentH = "", contentli = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetAllNews", pagecount: 11, ColumnID: columnId, ColumnClass:<%=ColumnClass.文字.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            contentli += "<li>";
                            contentli += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            contentli += "<span class='news-item no-break'>" + arry[i].Title + "</span>";
                            contentli += "<span class='news-time'>" + arry[i].SendTime + "</span>";
                            contentli += "</a>";
                            contentli += "</li>";
                        }
                    }
                }
            })
            //文字类条目
            contentH = "<ul>" + contentli + "</ul>";
            $("#" + contentId).empty().append(contentH);
        }
        //加载图片新闻
        function loadPicNews(contentId, columnId) {
            var contentH = ''; maxNum = 4; contentli = "";//图片个数
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetAllNews", pagecount: 7, ColumnID: columnId, ColumnClass:<%=ColumnClass.图片.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            var imgurl = "";
                            if (arry[i].ImgUrl == undefined || arry[i].ImgUrl == "") {
                                imgurl = "<%=ImageUrl%>/" + arry[i].ImgMes;
                            } else {
                                imgurl = arry[i].ImgUrl;
                            }
                            contentli += "<div class='col-lg-2 col-md-3 col-sm-4 col-xs-6 margin-t-10'>";
                            contentli += "<a  onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            contentli += "<img src=" + imgurl + "  class='img-responsive' style='width:210px;height:131px;' />";
                            contentli += "<span class='zt7-title no-break'>" + arry[i].Title + "</span>";
                            contentli += "</a>";
                            contentli += "</div>";
                        }
                    }
                }
            })
            contentH += "<div class='row'>";
            contentH += contentli;
            contentH += "</div>";
            //图片类条目
            $("#" + contentId).empty().append(contentH);
        }
        //加载图片文字新闻
        function loadOtherPicNews(contentId, columnId) {
            var contentH = "", imgli = "", barli = "", listli = "";
            //左侧图片
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetOtherPicNews", pagecount: 6, ColumnID: columnId, ColumnClass:<%=ColumnClass.图片文字.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            imgli += "<li>";
                            imgli += "<a  onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            var imgurl = "";
                            if (arry[i].ImgUrl == undefined || arry[i].ImgUrl == "") {
                                imgurl = "<%=ImageUrl%>/" + arry[i].ImgMes;
                            } else {
                                imgurl = arry[i].ImgUrl;
                            }
                            imgli += "<img src=" + imgurl + "  class='img-responsive bd-slide' />";
                            imgli += "<div class='bdText'><span>" + arry[i].Title + "</span></div>";
                            imgli += "</a>";
                            imgli += "</li>";
                            barli += "<li>" + (i + 1) + "</li>";
                        }
                    }
                }
            });
            //右侧列表
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetOtherNews", pagecount: 11, ColumnID: columnId, ColumnClass:<%=ColumnClass.图片文字.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            listli += "<li>";
                            listli += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            listli += "<span class='news-item-long no-break'>" + arry[i].Title + "</span>";
                            listli += "<span class='news-time'>" + arry[i].SendTime + "</span>";
                            listli += "</a>";
                            listli += "</li>";
                        }
                    }
                }
            });
            contentH += "<div id='slideBox' class='slideBox' style='width:50%'>";
            contentH += "<div class='hd'>";
            contentH += "<ul>";
            contentH += barli;
            contentH += "</ul>";
            contentH += "</div>";
            contentH += "<div class='bd'>";
            contentH += "<ul>";
            contentH += imgli;
            contentH += "</ul>";
            contentH += "</div>";
            contentH += "</div>";
            //新闻列表
            contentH += "<ul class='news-list'>";
            contentH += listli;
            contentH += "</ul>";
            $("#" + contentId).empty().append(contentH);
        }
        //加载专题专栏
        function loadFeatureNews() {
            var contentH = "";
            var columnId = "", newsMessageID = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetTechnical" },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        columnId = arry[0].ColumnID;
                        newsMessageID = arry[0].NewsMessageID;
                    }
                }
            });
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetColumnByClasss", ColumnClass:<%=ColumnClass.专题专栏.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            contentH += "<div class='zt2-item'>";
                            if (arry[i].VisitAddress != "" && arry[i].VisitAddress != null) {
                                contentH += "<a href='" + arry[i].VisitAddress + "' target='_blank'>";
                            } else if (arry[i].ColumnID == "E2EA67A0-438D-4315-AFA7-C3DC3A692C35") { //技术交流
                                contentH += "<a onclick='openDetail(&quot;" + columnId + "&quot;,&quot;" + newsMessageID + "&quot;)'>";
                            } else if (arry[i].ColumnID == "2F40BEDB-49CE-4937-A6D1-DE769829FEED") {   //党建专题
                                contentH += "<a onclick='openFeatureRed(&quot;" + arry[i].ColumnID + "&quot;)'>";
                            } else {
                                contentH += "<a onclick='openFeature(&quot;" + arry[i].ColumnID + "&quot;)'>";
                            }
                            contentH += "<i class='iconfont  " + arry[i].Icon + "'></i>";
                            contentH += "       <span>" + arry[i].ColumnName + "</span>";
                            contentH += "</a>";
                            contentH += "</div>";
                        }
                    }
                    $("#Zt-Content").empty().append(contentH);
                }
            });
        }
        //加载友情链接
        function loadLinkNews(contentId) {
            var contentH = "", maxNum2 = 10, fileNum = 0;//友情链接FourthContent3展示的最大个数、FourthContent3计数
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetLinks", ColumnClass:<%=ColumnClass.友情链接.GetHashCode()%>},
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            if (maxNum2 > fileNum) {
                                contentH += "<div class='zt4-item'>";
                                contentH += "<a href='" + arry[i].LinkAddress + "' target='_blank'>";
                                contentH += "<i class='iconfont icon-jiantou'></i>";
                                contentH += "       <span>" + arry[i].Title + "</span>";
                                contentH += "</a>";
                                contentH += "</div>";
                                fileNum++;
                            }
                        }
                    }
                    $("#" + contentId).empty().append(contentH);
                }
            });
        }
        //加载轮播栏目
        function loadCarousel() {
            var contentH = "", contentOl = "", contentDiv = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetColumnByClasss", ColumnClass:<%=ColumnClass.轮播banner.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        if (arry.length == 1) {
                            var url = arry[0].VisitAddress; 
                            var imgurl = "<%=CoverImageUrl%>/" + arry[0].ColumnCover;
                            contentDiv += "<div class='item active'><a href='" + url + "' target='_blank'><img  src='" + imgurl + "' target='_blank' alt='First slide'></a></div>";
                        } else {
                            for (var i = 0; i < arry.length; i++) {
                                if (arry[i].ColumnCover != undefined) {
                                    var url = arry[i].VisitAddress; 
                                    var imgurl = "<%=CoverImageUrl%>/" + arry[i].ColumnCover;
                                    if (i == 0) {
                                        contentOl += " <li data-target='#ztCarousel' data-slide-to='0' class='active'></li>";
                                        contentDiv += "<div class='item active'><a  href='" + url + "' target='_blank'><img src='" + imgurl + "' alt='SlideImg1'></a></div>";
                                    } else {
                                        contentOl += " <li data-target='#ztCarousel' data-slide-to='" + i + "'></li>";
                                        contentDiv += "<div class='item'><a  href='" + url + "' target='_blank'><img src='" + imgurl + "' alt='SlideImg" + (i
                                            + 1) + "'></a></div>";
                                    }
                                }
                            }
                        }
                    }
                    //<!-- 轮播（Carousel）指标 -->
                    contentH += "<ol class='carousel-indicators'>";
                    contentH += contentOl;
                    contentH += "</ol>";
                    //<!-- 轮播（Carousel）项目 -->
                    contentH += "<div class='carousel-inner'>";
                    contentH += contentDiv;
                    contentH += "</div>";
                    $("#ztCarousel").empty().append(contentH);
                }
            });
        }
        jQuery(".slideBox").slide({
            mainCell: ".bd ul",
            autoPlay: true,
            delayTime: 1000
        });
        //顶部轮播
        $(function () {
            $("#myCarousel").carousel('cycle');
        });

        //进入云盘
        function toGoYPLogin() {
            //显示用户信息,先判断是否登录
            <%if (this.Request.IsAuthenticated)
        {%>  
            $.post("<%=WebAppPath %>/PWS/Index.aspx", { asyfunc: "LoginToYP", loginId:"<%=KPMSUser.LoginId%>" },
                function (res) {
                    if (res == "-1") {
                        alert("云盘用户不存在或者用户异常。");
                    }
                    else if (res != "" && res.length > 0) {
                        window.open(res, '_blank');
                    }

                });
             <%}%>
        }
    </script>
</body>
</html>
