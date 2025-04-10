<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.List" %>

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
    <link href="<%=WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <link href="<%=WebAppPath %>/PWS/UI/css/custom.css" rel="stylesheet">
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
                            <div class="news-detail-content">
                                <div class="news-list-content" id="listContent"></div>
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
        </div>
        <!--专题栏目2-->
        <uc3:UIFeature runat="server" ID="UIUIFeature" />
    </div>
    <div class="clear-both"></div>
    <uc2:UIFooter runat="server" ID="UIFooter" /> 
	<script src="<%=WebAppPath %>/PWS/UI/js/bootstrap.min.js"></script>
    <script type="text/javascript"> 
        var $ColumnId = "<%=Request.QueryString["ColumnId"]%>";//栏目id 
        //加载新闻内容
        loadListInfo($ColumnId, 1, 35);         
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
                            li += "<li>";
                            li += "<a title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'>";
                            li += "<span class='news-list-item no-break'>" + arry[i].Title + "</span>";
                            li += "<span class='news-list-time'>" + arry[i].SendTime + "</span>";
                            li += "</a>";
                            li += "</li>";
                        }
                        contentHtml += "<div class='news-list-content'><ul>";
                        contentHtml += li;
                        contentHtml += "</ul></div>";
                        pageCount = Math.ceil(totalCount / 35);
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
                                loadListInfo(columnid, page, 35);
                            }
                        })
                    } else {
                        $("#pagination").hide();
                    }
                    topicBanner.empty().append(topicht);
                    listContent.empty().append(contentHtml);
                }
            });
        }   
        $(document).ready(function () {
            $(".news-list-item").width($(".news-detail-content").width() - $(".news-list-time").width() - 60);
        });
        $(window).resize(function () {
            $(".news-list-item").width($(".news-detail-content").width() - $(".news-list-time").width() - 60);
        });
    </script>
</body>
</html>
