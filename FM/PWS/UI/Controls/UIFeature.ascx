<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UIFeature.ascx.cs" Inherits="Zhongsoft.Portal.PWS.UI.Controls.UIFeature" %>
<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<!--顶部开始-->
<!--专题栏目2-->
<div class="right margin-t-10">
    <!--专题栏目1-->
    <a class="pull-right" onclick="openList('EAD15C63-24EA-4906-8AD1-DD3DED031B0D','3')">
        <img src="<%= WebAppPath %>/PWS/UI/img/zt1.png" class="img-responsive" />
    </a>
    <div class="zt2-title">
        <span>专题专栏</span>
    </div>
    <div class="zt2-content" id="Zt-Content">
    </div>
    <!--友情链接-->
    <div class="margin-t-10">
        <div class="zt3-title">
            <i class="iconfont icon-youqinglianjie news-title-icon"></i>
            <span>友情链接</span>
        </div>
        <div class="zt4-content" id="Yq-Content">
        </div>
    </div>
</div>
<script type="text/javascript">
    //加载专题专栏和友情链接
    loadRightNews();
    //加载专题专栏和友情链接
    function loadRightNews() {
        //专题专栏
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
            data: { asyfunc: "GetColumnByClasss", pagecount: 10, ColumnClass:<%=ColumnClass.专题专栏.GetHashCode()%> },
            success: function (data) {
                if (data != "" && data.length > 0) {
                    var arry = eval(data);
                    for (var i = 0; i < arry.length; i++) {
                        contentH += "<div class='zt2-item'>";
                        if (arry[i].VisitAddress != "" && arry[i].VisitAddress != null) {
                            contentH += "<a href='" + arry[i].VisitAddress + "' target='_blank'>";
                        } else if (arry[i].ColumnID == "E2EA67A0-438D-4315-AFA7-C3DC3A692C35") { //技术交流
                            contentH += "<a onclick='openDetail(&quot;" + columnId + "&quot;,&quot;" + newsMessageID + "&quot;)'>";
                        } else if (arry[i].ColumnID == "2F40BEDB-49CE-4937-A6D1-DE769829FEED") { //党建准提
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
        //友情链接
        var contentH1 = "", maxNum2 = 10, fileNum = 0;//友情链接FourthContent3展示的最大个数、FourthContent3计数
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
                            contentH1 += "<div class='zt4-item'>";
                            contentH1 += "<a href='" + arry[i].LinkAddress + "' target='_blank'>";
                            contentH1 += "<i class='iconfont icon-jiantou'></i>";
                            contentH1 += "       <span>" + arry[i].Title + "</span>";
                            contentH1 += "</a>";
                            contentH1 += "</div>";
                            fileNum++;
                        }
                    }
                }
                $("#Yq-Content").empty().append(contentH1);
            }
        });
    }
</script>

