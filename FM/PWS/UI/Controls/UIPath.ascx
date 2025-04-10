<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UIPath.ascx.cs" Inherits="Zhongsoft.Portal.PWS.UI.Controls.UIPath" %>
<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<!--路径-->
<div class="news-detail-title" id="urldiv">
</div>
<script type="text/javascript">
    var $ColumnId = "<%=Request.QueryString["ColumnId"]%>";//栏目id
    //加载路径
    loadUrlInfo($ColumnId);
    //加载路径导航
    function loadUrlInfo(columnid) {
        var urldiv = $("#urldiv");
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>/PWS/Handler/NewsHandler.ashx',
            dataType: 'json',
            data: { asyfunc: "GetNavMenu", ColumnId: columnid },
            success: function (data) {
                if (data != "" && data.length > 0) {
                    var arry = eval(data);
                    var ht = '<img src="<%=WebAppPath%>/PWS/UI/img/home.png" /><span> 当前位置：</span><a href = "<%=WebAppPath%>/PWS/Index.aspx">首页</a>', spanht = '';
                    for (var i = 0; i < arry.length; i++) {
                        spanht += '><a  onclick=openList(&quot;' + arry[i].ColumnID + '&quot;,&quot;' + arry[i].ColumnClass + '&quot;)>' + arry[i].ColumnName + '</a>';
                    }
                    ht += spanht;
                    urldiv.empty().append(ht);
                }
            }
        });
    }     
</script>

