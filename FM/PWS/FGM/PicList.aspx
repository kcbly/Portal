<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PicList.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.PicList" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIHeader.ascx" TagPrefix="uc1" TagName="UIHeader" %>
<%@ Register Src="~/PWS/UI/Controls/UIFooter.ascx" TagPrefix="uc2" TagName="UIFooter" %>
<%@ Register Src="~/PWS/UI/Controls/UIFeature.ascx" TagPrefix="uc3" TagName="UIFeature" %>
<%@ Register Src="~/PWS/UI/Controls/UIPath.ascx" TagPrefix="uc4" TagName="UIPath" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=WebName %>列表页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- saved from url=(0013)about:internet -->
    <!-- 引入 Bootstrap -->
    <link href="<%=WebAppPath %>/PWS/UI/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=WebAppPath %>/PWS/UI/css/slideshow.css" rel="stylesheet" />
    <link href="<%=WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <link href="<%=WebAppPath %>/PWS/UI/css/custom2.css" rel="stylesheet">
    <link href="<%=WebAppPath %>/PWS/UI/myPagination/myPagination.css" type="text/css" rel="stylesheet" />
    <script src="<%=WebAppPath %>/PWS/UI/myPagination/myPagination.js" type="text/javascript"></script>
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
         <script src="<%= WebAppPath %>/PWS/UI/js/html5shiv.js"></script>
         <script src="<%= WebAppPath %>/PWS/UI/js/respond.min.js"></script>
      <![endif]-->
</head>
<body>
    <uc1:UIHeader runat="server" ID="UIHeader" />
     <!--顶部专题背景图-->
    <div id="TopicBanner">
    </div> 
    <!--内容区开始-->
    <div class="body-85">
        <div class="left">
            <div class="inner">
                <div class="row">
                    <div class="col-md-12 col-xs-12 col-lg-12">
                        <div class="news-detail">
                            <uc4:UIPath runat="server" ID="UIPath" /> 
                                <div class="img-list">
                                    <div class="img-list-content" id="listContent">
                                    </div>
                                </div>
                                <!--分页开始-->
                                <div id="pagination" class="pagination"></div>
                                <!--总条数-->
                                <span id="totalCount" hidden="hidden"></span>
                                <!--总页数-->
                                <span id="pageCount" hidden="hidden"></span>
                                <!--分页结束-->                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--专题栏目2-->
        <uc3:UIFeature runat="server" ID="UIUIFeature" />
    </div>
    <div class="clear-both"></div>
    <uc2:UIFooter runat="server" ID="UIFooter" />  
	<script src="<%=WebAppPath %>/PWS/UI/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 
        var $ColumnId = "<%=Request.QueryString["ColumnId"]%>";//栏目id 
        var $ColumnClass= "<%=Request.QueryString["ColumnClass"]%>";//栏目类型
        //加载新闻内容
        loadListInfo($ColumnId, 1, 20);
        var totalCount = 0;
        var pageCount = 0;
        function loadListInfo(columnid, curpage, pagesize) {
            var listContent = $("#listContent"), contentHtml = "", li = "";
            var topicBanner = $("#TopicBanner"), topicht = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetNewsList", ColumnId: $ColumnId, pageindex: curpage, pagesize: pagesize },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        $("#pagination").show();
                        var arry = eval(data);
                        var imgurl = "<%=CoverImageUrl%>/" + arry[0].ColumnCover;
                        if (arry[0].ColumnCover != null && arry[0].ColumnCover.length > 0) {
                            topicht += "<div class='topic-banner'>";
                            topicht += "<div class='body-85'>";
                            topicht += "<img src=" + imgurl + "  class='img-responsive'/>";
                            topicht += "</div>";
                            topicht += "</div>";
                        }
                        //总条数 
                        totalCount = arry[0].TotalCount;
                        for (var i = 0; i < arry.length; i++) {
                            var arry = eval(data);
                            var imgurl = "";
                            //图片路径
                            if (arry[i].ImgUrl == undefined || arry[i].ImgUrl == "") {
                                imgurl = "<%=ImageUrl%>/" + arry[i].ImgMes;
                            } else {
                                imgurl = arry[i].ImgUrl;
                            }   
                            //视频路径
                            if (arry[i].VideoUrl == undefined || arry[i].VideoUrl == "") {
                                videourl = "<%=VideoUrl%>/" + arry[i].VideoMes;
                            } else {
                                videourl = arry[i].VideoUrl;
                            }   
                            if ($ColumnClass == "1") {   //图片新闻
                                li += "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12 img-list-content-item'>";
                                li += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                                li += "<div class='img-list-content-item-div'>";
                                li += "<img class='img-list-content-item-img'  src=" + imgurl + " />";
                                li += "</div>";
                                li += "<div class='img-list-content-item-title'>" + arry[i].Title + "</div>";
                                li += "</a></div>";

                            } else if ($ColumnClass == "6") {       //视频新闻
                                li += "<div class='col-lg-3 col-md-4 col-sm-6 col-xs-12 video-list-content-item'>";
                                li += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                                li += "<div class='video-list-content-item-div'>";
                                li += "<div class='video-shadow'>";
                                li += " <img src='<%=WebAppPath %>/PWS/UI/img/play.png'  class='video-icon'/>";
                                 li += "</div>";
                                li += "<img class='img-list-content-item-img'   src=" + imgurl + " />";
                                li += "</div>";
                                li += "<div class='video-list-content-item-title'>" + arry[i].Title + "</div>";
                                li += "</a></div>";
                            }
                        }
                        contentHtml += "<div class='row'>";
                        contentHtml += li;
                        contentHtml += "</div>";
                        pageCount = Math.ceil(totalCount / 20);
                        new Page({
                            id: 'pagination',
                            pageTotal: pageCount, //必填,总页数
                            pageAmount: 35,  //每页多少条
                            dataTotal: totalCount, //总共多少条数据
                            curPage: curpage, //初始页码,不填默认为1
                            pageSize: 10, //分页个数,不填默认为5
                            showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                            showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                            getPage: function (page) {
                                //获取当前页数 
                                loadListInfo(columnid, page, 20);
                            }
                        })
                    } else {
                        $("#pagination").hide();
                    }
                    topicBanner.empty().append(topicht);
                    listContent.empty().append(contentHtml);
                }
            });
            $(".video-shadow").css("width", $(".video-list-content-item-div").width());
            $(".video-shadow").css("height", $(".video-list-content-item-div").height());
        }   
        $(function () {
            //图片新闻
            $(".img-list-content-item-title").css("width", $(".img-list-content-item").width());
            $(".img-list-content-item-img").each(function () {
                if ($(this).height() < 180) {
                    $(this).height(180);
                    $(this).css("width", "auto");
                } else if ($(this).width() < $(".img-list-content-item").width()) {
                    $(this).css("width", $(".img-list-content-item").width());
                    $(this).css("height", "auto");
                }
            })
            //视频新闻
            $(".video-list-content-item-title").css("width", $(".video-list-content-item").width());
            $(".video-shadow").css("width", $(".video-list-content-item-div").width());
            $(".video-shadow").css("height", $(".video-list-content-item-div").height());
            $(".video-list-content-item-img").each(function () {
                if ($(this).height() < 180) {
                    $(this).height(180);
                    $(this).css("width", "auto");
                } else if ($(this).width() < $(".video-list-content-item").width()) {
                    $(this).css("width", $(".video-list-content-item").width());
                    $(this).css("height", "auto");
                }
            })
        })
        $(window).resize(function () {
            //图片新闻
            $(".img-list-content-item-title").css("width", $(".img-list-content-item").width());
            $(".img-list-content-item-img").each(function () {
                if ($(this).height() < 180) {
                    $(this).height(180);
                    $(this).css("width", "auto");
                } else if ($(this).width() < $(".img-list-content-item").width()) {
                    $(this).css("width", $(".img-list-content-item").width());
                    $(this).css("height", "auto");
                }
            })
            //视频新闻
            $(".video-list-content-item-title").css("width", $(".video-list-content-item").width());
            $(".video-shadow").css("width", $(".video-list-content-item-div").width());
            $(".video-shadow").css("height", $(".video-list-content-item-div").height());
            $(".video-list-content-item-img").each(function () {
                if ($(this).height() < 180) {
                    $(this).height(180);
                    $(this).css("width", "auto");
                } else if ($(this).width() < $(".video-list-content-item").width()) {
                    $(this).css("width", $(".video-list-content-item").width());
                    $(this).css("height", "auto");
                }
            })
        });  
    </script>
</body>
</html>
