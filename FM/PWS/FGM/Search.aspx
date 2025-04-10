<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.Search" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIHeader.ascx" TagPrefix="uc1" TagName="UIHeader" %>
<%@ Register Src="~/PWS/UI/Controls/UIFooter.ascx" TagPrefix="uc2" TagName="UIFooter" %>
<%@ Register Src="~/PWS/UI/Controls/UIPath.ascx" TagPrefix="uc4" TagName="UIPath" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=WebName %>检索页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- saved from url=(0013)about:internet -->
    <!-- 引入 Bootstrap -->
    <link href="<%= WebAppPath %>/PWS/UI/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%= WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <link href="<%= WebAppPath %>/PWS/UI/css/custom.css" rel="stylesheet">
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
    <!--内容区开始-->
    <div class="body-85">
        <div class="search">
            <div class="search-title">
                <img src="<%= WebAppPath %>/PWS/UI/img/home.png" />
                <span>当前位置：</span>
                <a href="<%=WebAppPath%>/PWS/Index.aspx">首页</a>>
				<a href="<%=WebAppPath%>/PWS/FGM/Search.aspx">搜索</a>
                <div class="search-sum">
                    共计<span id="tCount"></span>条
                </div>
            </div>
            <div class="search-content">
                <div class="search-content" id="searchcontent">
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
    <uc2:UIFooter runat="server" ID="UIFooter" />
</body>
</html>
<script src="<%= WebAppPath %>/PWS/UI/jqueryGaoliang/js/gaoliang.js"></script>
<script type="text/javascript">  
    //为了不登录可以访问，登录后看到本部门的数据
    var $deptid = "";
    var $isadmin = "False";
    var totalCount = 0;
    var pageCount = 0;
    $(function () {
        <% if (KPMSUser != null){ %>  
        $deptid ='<%=KPMSUser.DeptId%>';
        $isadmin = '<%=KPMSUser.IsAdmin%>';
       <% } %> 
        var keyword = "<%=Request.QueryString["keyword"]%>";
        loadSearchInfo(1, 10, keyword);
    })
    $("#btnSearch").click(function () {
        var keyword = $("#keword").val();
        loadSearchInfo(1, 10, keyword);
    });
    function loadSearchInfo(curpage, pagesize, keyword) {
        var searchcontent = $("#searchcontent");
        $("#keword").val(keyword);
        $.ajax({
            async: false,
            type: 'POST',
            url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
            dataType: 'json',
            data: { asyfunc: "GetNewsByKeyWord", keyword: keyword, pageindex: curpage, pagesize: pagesize, DeptId: $deptid, IsAdmin: $isadmin },
            success: function (data) {
                if (data != "" && data.length > 0) {
                    $("#pagination").show();
                    var arry = eval(data);
                    var ht = '', html = '';
                    for (var i = 0; i < arry.length; i++) {
                        ht += '<li>';
                        ht += "<h4><a  title='" + arry[i].Title + "' onclick='openDetail(&quot;" + arry[i].ColumnID + "&quot;,&quot;" + arry[i].NewsMessageID + "&quot;)'   class='text'>";
                        var title = arry[i].Title;
                        if (title != null && title.length > 100) {
                            title = title.substr(0, 100) + '...';
                        }
                        ht += title;
                        ht += "</a></h4>";
                        ht += '<div class="abstract text">';
                        ht += arry[i].Contents;
                        ht += '</div>';
                        ht += '<div class="search-footer">';
                        ht += '<a href="#"></a><span>' + arry[i].SendTime + '</span>';
                        ht += '</div>';
                        ht += '</li>';
                    }
                    html += '<ul>';
                    html += ht;
                    html += '</ul>';
                    searchcontent.empty().append(html);
                    var otext = keyword;
                    $('.text').GL({
                        ocolor: 'red',   //设置关键词高亮颜色
                        oshuru: otext  //设置要显示的关键词
                    });
                    getTotalCount(keyword, curpage);
                }
            }
        })
        $(".abstract").width($(".search-content").width() - 10);
    }
    function getTotalCount(keyword, curpage) {
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
            dataType: 'json',
            data: { asyfunc: "GetTotalCount", keyword: keyword, DeptId: $deptid, IsAdmin: $isadmin },
            success: function (data) {
                if (data != "" && data.length > 0) {
                    var arry = eval(data);
                    //总条数 
                    totalCount = arry[0].TotalCount;
                    pageCount = Math.ceil(totalCount / 10);
                    $("#tCount").html(totalCount);
                    new Page({
                        id: 'pagination',
                        pageTotal: pageCount, //必填,总页数
                        pageAmount: 10,  //每页多少条
                        dataTotal: totalCount, //总共多少条数据
                        curPage: curpage, //初始页码,不填默认为1
                        pageSize: 10, //分页个数,不填默认为5
                        showPageTotalFlag: true, //是否显示数据统计,不填默认不显示
                        showSkipInputFlag: true, //是否支持跳转,不填默认不显示
                        getPage: function (page) {
                            //获取当前页数 
                            loadSearchInfo(page, 10, $("#keword").val());
                        }
                    })
                } else {
                    $("#tCount").html("0");
                }
            }
        })
    }
    $(window).resize(function () {
        $(".abstract").width($(".search-content").width() - 10);
    });
</script>
