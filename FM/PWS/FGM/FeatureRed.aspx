<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeatureRed.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.FeatureRed" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIFooter.ascx" TagPrefix="uc2" TagName="UIFooter" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=WebName %>专题</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- saved from url=(0013)about:internet -->
    <!-- 引入 Bootstrap -->
    <link href="<%= WebAppPath %>/PWS/UI/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= WebAppPath %>/PWS/UI/css/slideshow.css" rel="stylesheet" />
    <link href="<%= WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <link href="<%= WebAppPath %>/PWS/UI/css/custom2.css" rel="stylesheet">

    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
       <script src="../ui/js/html5shiv.js"></script>
       <script src="../ui/js/respond.min.js"></script>
    <![endif]-->
    <style>
        .slideBox {
            width: 100%;
            height: 235px;
            overflow: hidden;
            position: relative;
            border: 1px solid #ddd;
            display: inline-block;
            float: left;
            /* margin-right: 10px; */
            top: 10px;
        }

            .slideBox .bd img {
                display: block;
                width: 100%;
                height: 235px;
            }
    </style>
</head>
<body>
    <!--顶部专题背景图-->
    <div class="topic-banner-red">
        <img src="<%= WebAppPath %>/PWS/UI/img/ztbg.jpg" class="img-responsive" />
    </div>
    <!--内容区-->
    <div class="body-65" style="margin-top: 22%">
        <div class="row">
            <div class="col-md-4 col-lg-4 col-xs-12 col-sm-12" id="divImgBox">
                <!--焦点图/幻灯片-->
            </div>
            <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="First1-Head">
                    </div>
                    <div class="topic-mode-content-red-long" id="First1-Content">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Second1-Head">
                    </div>
                    <div class="topic-mode-content-red" id="Second1-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Second2-Head">
                    </div>
                    <div class="topic-mode-content-red" id="Second2-Content">
                    </div>
                </div>
            </div>
        </div>
        <div class="row margin-t-10">
            <div class="col-xs-12 col-md-12">
                <a onclick='openList("6D25EE38-64F3-4407-A76E-1883E1294F22","3")'>
                    <img src="<%= WebAppPath %>/PWS/UI/img/middle-banner1.jpg" class="img-responsive" />
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Third1-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Third1-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Third2-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Third2-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Third3-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Third3-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Fourth1-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Fourth1-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Fourth2-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Fourth2-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-lg-4 col-sm-6 col-xs-12">
                <div class="topic-mode-div">
                    <div class="topic-mode-title-red" id="Fourth3-Head">
                    </div>
                    <div class="topic-mode-content-red-3" id="Fourth3-Content">
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                <div class="picMarquee-left margin-t-10">
                    <div class="hd" id="Fifth1-Head">
                    </div>
                    <div class="bd" id="Fifth1-Content">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <uc2:UIFooter runat="server" ID="UIFooter" />
    <script src="<%= WebAppPath %>/PWS/UI/js/jquery.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/js/bootstrap.min.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/jquery.ellipsis.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/js/jquery.SuperSlide.2.1.3.js"></script>
    <script>
        var $ColumnId = "<%=Request.QueryString["ColumnId"]%>";//栏目id
        //加载所有新闻
        loadAllInfo();
        function loadAllInfo() {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                dataType: 'json',
                async: false,
                data: { asyfunc: "GetTopicColumn", ColumnId: $ColumnId },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arryHead = eval(data);
                        for (var i = 0; i < arryHead.length; i++) {
                            var headId = "", headH = "", contentId = "";
                            headId = arryHead[i].ColumnPosition + "-Head";
                            contentId = arryHead[i].ColumnPosition + "-Content";
                            headH = "<span>" + arryHead[i].ColumnName + "</span><a class='more-a' onclick='openList(&quot;" + arryHead[i].ColumnID + "&quot;)'>更多>></a>";
                            /*文字新闻*/
                            if (arryHead[i].ColumnClass == "<%=ColumnClass.文字.GetHashCode()%>") {
                                loadTextNews(contentId, arryHead[i].ColumnID, arryHead[i].ColumnName);
                            } else if (arryHead[i].ColumnClass == "<%=ColumnClass.图片文字.GetHashCode()%>") {
                                loadOtherPicNews(contentId, arryHead[i].ColumnID);
                            } else if (arryHead[i].ColumnClass == "<%=ColumnClass.图片.GetHashCode()%>") {
                                loadPicNews(contentId, arryHead[i].ColumnID);
                            }
                            //栏目名称
                            $("#" + headId).empty().append(headH);
                        }
                    }
                }
            });
        }
        //加载文字新新闻
        function loadTextNews(contentId, columnId, columnName) {
            var contentH = "", contentli = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetNewsList", ColumnId: columnId, pageindex: 1, pagesize: 8 },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            contentli += "<li>";
                            contentli += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            if (columnName == "党委通知" || columnName == "重要通知") {
                                contentli += "<span class='topic-mode-item'>" + arry[i].Title + "</span>";
                            } else {
                                contentli += "<span class='topic-mode-item-3'>" + arry[i].Title + "</span>";
                            }
                            contentli += "<span class='topic-mode-time'>" + arry[i].SendTime + "</span>";
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
        //加载图片文字新闻
        function loadOtherPicNews(contentId, columnId) {
            var imgH = "", listH = "", imgli = "", barli = "", listli = "";
            //左侧图片
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetOtherPicNews", pagecount: 4, ColumnID: columnId, ColumnClass:<%=ColumnClass.图片文字.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            imgli += "<li>";
                            imgli += "<a  onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            var imgurl = "";
                            if (arry[i].ImgMes != undefined && arry[i].ImgMes.length > 0) {
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
                            listli += "<span class='topic-mode-item-long'>" + arry[i].Title + "</span>";
                            listli += "<span class='topic-mode-time'>" + arry[i].SendDate + "</span>";
                            listli += "</a>";
                            listli += "</li>";
                        }
                    }
                }
            });
            imgH += "<div id='slideBox' class='slideBox'>";
            imgH += "<div class='hd'>";
            imgH += "<ul>";
            imgH += barli;
            imgH += "</ul>";
            imgH += "</div>";
            imgH += "<div class='bd'>";
            imgH += "<ul>";
            imgH += imgli;
            imgH += "</ul>";
            imgH += "</div>";
            imgH += "</div>";
            listH = "<ul>" + listli + "</ul>";
            //左侧轮播图片
            $("#divImgBox").empty().append(imgH);
            //右侧文字列表
            $("#" + contentId).empty().append(listH);
        }
        //加载轮播图片新闻
        function loadPicNews(contentId, columnId) {
            var contentH = ''; contentli = "";//图片个数
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetAllNews", pagecount: 100, ColumnID: columnId, ColumnClass:<%=ColumnClass.图片.GetHashCode()%> },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            var imgurl = "";
                            if (arry[i].ImgMes != undefined && arry[i].ImgMes.length > 0) {
                                imgurl = "<%=ImageUrl%>/" + arry[i].ImgMes;
                            } else {
                                imgurl = arry[i].ImgUrl;
                            }
                            contentli += "<li>";
                            contentli += "<div class='pic'>";
                            contentli += "<a  title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            contentli += "<img src=" + imgurl + "  />";
                            contentli += "</a>";
                            contentli += "</div>";
                            contentli += "<div class='title'>";
                            contentli += "<a  title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            contentli += "<div style='width:120px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden'>";
                            contentli += arry[i].Title;
                            contentli += "</div>";
                            contentli += "</a>";
                            contentli += "</div>";
                            contentli += "</li>";
                        }
                    }
                }
            })
            contentH += "<ul class='picList'>";
            contentH += contentli;
            contentH += "</ul>";
            //图片类条目
            $("#" + contentId).empty().append(contentH);
        }
        jQuery(".slideBox").slide({
            mainCell: ".bd ul",
            autoPlay: true,
            delayTime: 1000
        });
        jQuery(".picMarquee-left").slide({
            mainCell: ".bd ul",
            autoPlay: true,
            effect: "leftMarquee",
            vis: 10,
            interTime: 50
        });
        $(document).ready(function () {
            $(".div-user-avatar").hover(function () {
                $(".pop-avatar").toggle();
            });
            $(".topic-info").width($(".topic-content-long").width() - $(".slideBox").width() - 30);
            $(".topic-mode-item").width($(".topic-mode-content-red").width() - $(".topic-mode-time").width() - 20);
            $(".topic-mode-item-3").width($(".topic-mode-content-red-3").width() - $(".topic-mode-time").width() - 20);
            $(".topic-mode-item-long").width($(".topic-mode-content-red-long").width() - $(".topic-mode-time").width() - 20);

        });
        $(window).resize(function () {
            $(".topic-info").width($(".topic-content-long").width() - $(".slideBox").width() - 30);
            $(".topic-mode-item").width($(".topic-mode-content-red").width() - $(".topic-mode-time").width() - 20);
            $(".topic-mode-item-3").width($(".topic-mode-content-red-3").width() - $(".topic-mode-time").width() - 20);
            $(".topic-mode-item-long").width($(".topic-mode-content-red-long").width() - $(".topic-mode-time").width() - 20);
        });
    </script>
</body>
</html>