<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Zhongsoft.Portal.PWS.FGM.Detail" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/PWS/UI/Controls/UIHeader.ascx" TagPrefix="uc1" TagName="UIHeader" %>
<%@ Register Src="~/PWS/UI/Controls/UIFooter.ascx" TagPrefix="uc2" TagName="UIFooter" %>
<%@ Register Src="~/PWS/UI/Controls/UIFeature.ascx" TagPrefix="uc3" TagName="UIFeature" %>
<%@ Register Src="~/PWS/UI/Controls/UIPath.ascx" TagPrefix="uc4" TagName="UIPath" %>
<!DOCTYPE html>
<html>
<head>
    <title><%=WebName %>详情页</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <!-- saved from url=(0013)about:internet -->
    <!-- 引入 Bootstrap -->
    <link href="<%=WebAppPath %>/PWS/UI/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=WebAppPath %>/PWS/UI/css/iconfont.css" rel="stylesheet" />
    <link href="<%=WebAppPath %>/PWS/UI/css/custom.css" rel="stylesheet">

    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
         <script src="<%=WebAppPath %>/PWS/UI/js/html5shiv.js"></script>
         <script src="<%=WebAppPath %>/PWS/UI/js/respond.min.js"></script>
      <![endif]-->
    <script type="text/javascript">
        //获取文件后缀，显示不同图标
        function getFileTypeImage(fileName) {
            var index1 = fileName.lastIndexOf(".");
            var index2 = fileName.length;
            var extension = fileName.substring(index1, index2);//后缀名 
            switch (extension) {
                case ".doc":
                case ".docx":
                    return "<img src='<%=this.WebAppPath %>/themes/images/accessory_word.gif' />";
            case ".xls":
            case ".xlsx":
                return "<img src='<%=this.WebAppPath %>/themes/images/accessory_excel.gif' />";
                case ".ppt":
                case ".pptx":
                    return "<img src='<%=this.WebAppPath %>/themes/images/accessory_powerpoint.gif' />";
                case ".pdf":
                    return "<img src='<%=this.WebAppPath %>/themes/images/accessory_pdf.gif' />";
                case ".htm":
                case ".html":
                    return "<img src='<%=this.WebAppPath %>/themes/images/accessory_html.gif' />";
                default:
                    return "<img src='<%=this.WebAppPath %>/themes/images/accessory_unknown.gif' />";
        }
        }
    </script>
    <style>
        /*.news-detail-body p,
        .news-detail-body span,
        .news-detail-body ul,
        .news-detail-body li, 
        .news-detail-body a,       
        .news-detail-body h2,
        .news-detail-body h3,
        .news-detail-body h4,
        .news-detail-body h5,
        .news-detail-body h6,
        .news-detail-body h1,
        .news-detail-body strong{
            font-size: 14px !important;
            color: #000;
            font-weight: normal;
            line-height: 30px;
            padding:0px;
            margin:0px;
            text-align:justify;
            font-weight:normal;
        }*/ 
    </style>
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
                <div class="news-detail">
                    <uc4:UIPath runat="server" ID="UIPath" />
                    <div class="news-detail-content" id="wznr">
                    </div>
                </div>
            </div>
        </div>
        <!--专题栏目2-->
        <uc3:UIFeature runat="server" ID="UIUIFeature" />
    </div> 
    <uc2:UIFooter runat="server" ID="UIFooter" />
    <script src="<%=WebAppPath %>/PWS/js/bootstrap.min.js"></script>
    <script type="text/javascript">  
        //加载新闻内容
        loadDetailInfo();
        initView();        
        //加载新闻内容
        function loadDetailInfo() {
            var wznr = $("#wznr");
            var fileht = '', trht = '';
            var topicBanner = $("#TopicBanner"), topicht = "";
            var fileAll = {};
            //获取本条新闻的所有附件信息
            $.ajax({
                type: 'POST',
                url:  '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetAttachments", NewsMessageID: '<%=Request.QueryString["NewsMessageID"]%>' },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        fileAll = eval(data);
                        fileht += "<div style='margin-left:20px;font-size:16px'>附件：<table><tbody>";
                        for (var i = 0; i < fileAll.length; i++) {
                            trht += "<tr align=left>";
                            trht += "<td style='WIDTH: 23px'>";
                            trht += getFileTypeImage(fileAll[i].FileName);
                            trht += "</td><td>";
                            trht += "<a style='color:black' title='" + fileAll[i].FileName + "'  href='/Portal/Sys/Handler/FileDownloadHandler.ashx?fileId=" + fileAll[i].FileId + "' target = _blank >"; 
                            trht += fileAll[i].FileName;
                            trht += "</a>";
                            trht += "<a style='margin-left:10px;color: #0033FF !important;text-decoration: underline;' href='<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=" + fileAll[i].FileId + "' target='_blank'>下载</a>";
                            trht += "<a style='margin-left:10px;color: #0033FF !important;text-decoration: underline;' flag='view' fileid='" + fileAll[i].FileId + "'  filename='" + fileAll[i].FileName + "'  onclick='ViewFile(" + fileAll[i].IsCanView + ",\"" + fileAll[i].FileId + "\")'>在线预览</a></td>";
                            trht += "</tr>";
                        }
                        fileht += trht;
                        fileht += "</tbody></table></div>";
                    }
                }
            });
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                dataType: 'json',
                data: { asyfunc: "GetDetailNews", NewsMessageID: '<%=Request.QueryString["NewsMessageID"]%>' },
                success: function (data) {
                    if (data != "" && data.length > 0) {
                        var arry = eval(data);
                        var imgurl = "<%=CoverImageUrl%>/" + arry[0].ColumnCover;
                        if (arry[0].ColumnCover != null && arry[0].ColumnCover.length > 0) {
                            topicht += "<div class='topic-banner'>";
                            topicht += "<div class='body-85'>";
                            topicht += "<img src=" + imgurl + "  class='img-responsive'/>";
                            topicht += "</div>";
                            topicht += "</div>";
                        }     
                        //<!--标题-->
                        var ht = "<div class='news-detail-content-title'><h4>" + arry[0].Title + "</h4>";
                        //<!--文章信息-->                        
                        if (arry[0].NewsFrom != null && arry[0].NewsFrom.length > 0) {
                            ht += "<span>来源：</span><span class='margin-r-10'>" + arry[0].NewsFrom + "</span>";
                        }
                        if (arry[0].Author != null && arry[0].Author.length > 0) {
                            ht += "<span>作者：</span><span class='margin-r-10'>" + arry[0].Author + "</span>";
                        }
                        ht += "<span>发表时间：</span><span class='margin-r-10'>" + arry[0].SendTime + "&nbsp;" + showNewTime(arry[0].SendTime) + "</span>";
                        ht += "<span>阅读次数：</span><span>" + arry[0].HitCount + "</span>";
                        ht += "</div></div><div class='news-detail-body'>";
                        if (arry[0].Contents != null && arry[0].Contents.length > 0) {
                            ht += arry[0].Contents;
                            ht += "</div>";
                            ht += "<div class='news-detail-footer'>";
                            if (arry[0].Editor != null && arry[0].Editor.length > 0) {
                                ht += "<span>责任编辑：</span><span>" + arry[0].Editor + "</span>";
                            }
                        } else if (fileAll.length > 0) {     //如果没有内容同时有一个附件则直接打开附件
                            ht += '<div id="div" style="margin: 0 auto; -webkit-overflow-scrolling: touch">';
                            ht += '<iframe id="attach" frameborder=\'0\'></iframe></div>';
                        }
                        ht += "</div>";
                        ht += fileht;
                        document.title = arry[0].Title;
                        topicBanner.empty().append(topicht);
                        wznr.empty().html(ht);
                    }
                }
            });
            if (fileAll.length>0) {
                if (CheckKey(fileAll, "PdfBody")) {
                    for (var item in fileAll) {
                        if (String(item["FileType"]).toLowerCase() == "pdfbody") {
                            getfile(item["FileId"], "");
                        }
                    }
                }
                else {
                    getfile(fileAll[0]["FileId"], "");
                }
            }
        }
        function initView() {
            $('[flag="view"]').each(function () {
                //ceb文件不能预览，直接进行提示下载打开
                if ($(this).attr('filename').indexOf('.ceb') > -1) {
                    var fileId = $(this).attr('fileid');
                    $(this).attr('href', '<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=' + fileId);
                }
            });
        }
        function getfile(fileId, fileType) {
            $.ajax({
                type: 'POST',
                url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
                async: false,
                data: { asyfunc: "GetFileUrl", fileId: fileId, fileType: fileType },
                success: function (data) {
                    var fileUrl = data;
                    document.getElementById("attach").src = '<%=ViewUrl %>' + fileUrl;
                    document.getElementById("div").style.width = "100%";
                    document.getElementById("attach").width = "100%";
                    document.getElementById("div").style.height = "920px";
                    document.getElementById("attach").height = "920px";
                    window.onscroll = function () {
                        window.frames[0].postMessage(document.body.scrollTop, '*');
                    }
               }
            });
        }
        function CheckKey(arr, key) {
            for (var item in arr) {
                if (String(item["FileType"]).toLowerCase() == String(key).toLowerCase()) {
                    return true;
                }
            }
            return false;
        }
        //预览文件
        function ViewFile(txt, fileId) {
            if (txt != 1) {
                alert("该文件不支持在线浏览，请下载后查看");
                return false;
            }
            if (fileId.length > 0) {
                var url = "<%=WebAppPath %>" + "/Sys/FileView/AttachmentView.aspx?fileId=" + fileId;
                window.open(encodeURI(url), '_blank');
        }
        return false;
    }
    </script>
</body>
</html>
