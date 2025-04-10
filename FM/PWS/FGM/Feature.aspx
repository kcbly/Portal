<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.Feature" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIHeader.ascx" TagPrefix="uc1" TagName="UIHeader" %>
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
    <link href="<%= WebAppPath %>/PWS/UI/css/custom.css" rel="stylesheet">
    <script src="<%= WebAppPath %>/PWS/UI/js/jquery.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/js/common.js"></script>
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
         <script src="<%= WebAppPath %>/PWS/UI/js/html5shiv.js"></script>
         <script src="<%= WebAppPath %>/PWS/UI/js/respond.min.js"></script>
      <![endif]-->
</head>
<body>   
    <!--顶部专题背景图-->
    <div class="topic-banner">
        <div class="body-85" id="TopicBanner">
            <img src="<%= WebAppPath %>/PWS/UI/img/扫黑除恶.jpg" class="img-responsive"/>
        </div>
    </div>
    <!--内容区-->
    <div class="body-85 margin-t-10">
        <div class="topic-div">
            <div class="topic-title-long">
                <span>专题栏目介绍</span>
            </div>
            <div class="topic-content-long">
                <!--焦点图/幻灯片-->
                <div id="slideBox" class="slideBox"> 
                </div>
                <!--专题介绍-->
                <div class="topic-info" id="TopicTitle">
                </div>
            </div>
        </div>
        <div class="clear-both"></div>
        <div id="ContentDiv" class="row">
        </div>
    </div> 
    <uc2:UIFooter runat="server" ID="UIFooter" />
    <script src="<%= WebAppPath %>/PWS/UI/js/jquery.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/js/bootstrap.min.js"></script> 
    <script src="jquery.ellipsis.js"></script>
    <script src="jquery.ellipsis.unobtrusive.js"></script>
    <script src="<%= WebAppPath %>/PWS/UI/js/jquery.SuperSlide.2.1.3.js"></script> 
    <script> 
        var $ColumnId = "<%=Request.QueryString["ColumnId"]%>";//栏目id 
        //加载轮播图片
        loadSlidePic();
        //加载文字
        loadTopicTitle();
        //加载模板
        loadTopicColumn(); 
        function loadSlidePic() {
            var slidePic = $("#slideBox"), slidePicHtml = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetSlidePic", pagecount: 5, ColumnId: $ColumnId },
                success: function (data) {
                    var imgli = "", barli = "";
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            imgli += "<li><a onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            imgli += "<img src=" + arry[i].ImgUrl + "  />";
                            imgli += "<div class='bdText'><span>" + arry[i].Title + "</span></div>";
                            imgli += "</a></li>";
                            barli += "<li>" + (i + 1) + "</li>";                             
                        }
                    }
                    slidePicHtml += "<div class='hd'>";
                    slidePicHtml += "<ul>";
                    slidePicHtml += barli;
                    slidePicHtml += "</ul>";
                    slidePicHtml += "</div>";
                    slidePicHtml += "<div class='bd'>";
                    slidePicHtml += "<ul>";
                    slidePicHtml += imgli;
                    slidePicHtml += "</ul>";
                    slidePicHtml += "</div>";
                    slidePic.empty().append(slidePicHtml);
                }
            });
            slidePic.empty().append(slidePicHtml);
        }
        function loadTopicTitle() {
            var topicTitle = $("#TopicTitle"), topicTitleHtml = "";
            var topicBanner = $("#TopicBanner"), topicImg = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetTopicTitle", ColumnId: $ColumnId },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            topicTitleHtml += " <h4>" + arry[i].Title + "</h4>";
                            topicTitleHtml += "<div class='topic-info-content' data-ellipsis='true' data-ellipsis-max-line='2'>";
                            topicTitleHtml += arry[i].Contents + "</div>";
                            topicTitleHtml += "<a  onclick='openDetail(&quot;" + $ColumnId + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>查看更多>></a>";
                            var imgurl = "<%=ImageUrl%>/" + arry[i].ImgMes;
                            topicImg = "<img src=" + imgurl + "  class='img-responsive'/>";
                            topicBanner.empty().append(topicImg);
                            topicTitle.empty().append(topicTitleHtml);
                        }
                    }
                }
            });           
        }
        function loadTopicColumn() {
            var contentDiv = $("#ContentDiv"), contentDivHtml = "";
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetTopicColumn", ColumnId: $ColumnId },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        for (var i = 0; i < arry.length; i++) {
                            var contentLi = "";
                            $.ajax({
                                type: 'POST',
                                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                                async: false,
                                dataType: 'json',
                                data: { asyfunc: "GetNewsList", ColumnId: arry[i].ColumnID, pageindex: 1, pagesize: 8 },
                                success: function (d) {
                                    if (d != "" && d.length > 0) {
                                        var arrys = eval(d);
                                        for (var i = 0; i < arrys.length; i++) {
                                            contentLi += "<li><a  onclick='openDetail(&quot;" + arrys[i].ColumnID + "&quot;,&quot;" + arrys[i].NewsMessageID + "&quot;)'>";
                                            contentLi += "<span class='topic-mode-item'>" + arrys[i].Title + "</span>";
                                            contentLi += "<span class='topic-mode-time'>" + arrys[i].SendTime + "</span>";
                                            contentLi += "</a></li>";
                                        }
                                    }
                                }
                            }); 
                            contentDivHtml += "<div class='col-md-4 col-lg-4 col-sm-6 col-xs-12'>";     
                            contentDivHtml += "<div class='topic-mode-div'>";                            
                            contentDivHtml += "<div class='topic-mode-title'>";
                            contentDivHtml += "<span>" + arry[i].ColumnName + "</span>";
                            contentDivHtml += "<a  onclick='openList(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].ColumnClass + "&quot;)'>更多>></a></div>";
                            contentDivHtml += "<div class='topic-mode-content'>";
                            contentDivHtml += "<ul>";
                            contentDivHtml += contentLi;
                            contentDivHtml += "</ul>";
                            contentDivHtml += "</div></div></div>";
                        }
                    }
                }
            });
            contentDiv.empty().append(contentDivHtml);
        }
        jQuery(".slideBox").slide({
				mainCell: ".bd ul",
				autoPlay: true,
				delayTime: 1000
			});
			$(document).ready(function() {				 
				$(".topic-info").width($(".topic-content-long").width() - $(".slideBox").width() - 30);
				$(".topic-mode-item").width($(".topic-mode-content").width() - $(".topic-mode-time").width() - 20);

			});
			$(window).resize(function() {
				$(".topic-info").width($(".topic-content-long").width() - $(".slideBox").width() - 30);
				$(".topic-mode-item").width($(".topic-mode-content").width() - $(".topic-mode-time").width() - 20);
			});
    </script>
</body>
</html>
