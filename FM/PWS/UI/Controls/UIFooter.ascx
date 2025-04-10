<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UIFooter.ascx.cs" Inherits="Zhongsoft.Portal.PWS.UI.Controls.UIFooter" %>
<!--footer开始-->
<div style="clear: both;"></div>
<div class="footer body-85">
    <ul>
        <li>
            <a href="javascript:void(0);" onclick="SetHome(this,document.domain);">设为首页</a>
        </li>
        <li>
            <a href="javascript:addFavorite()">加入收藏</a>
        </li>
        <li>
            <a href="#yqlj">友情链接</a>
        </li> 
        <li>
              <a>管理登录</a>
        </li>
         <li style="background: none;">
           <a href="<%=WebAppPath %>/Sys/Download/download.htm" target="_blank">资源下载</a>
        </li>
    </ul>
    <div class="banquan">版权所有@2020陕西省水利电力勘测设计研究院 Corporation. All Rights Reserved</div>
</div>
<!--footer结束-->
<script type="text/javascript">
    function openDetail(columnId, id) {
        //每点击一次点击量加1
        $.ajax({
            type: 'POST',
            url: '<%= WebAppPath %>/PWS/Handler/NewsHandler.ashx',
            cache: false,
            dataType: 'text',
            data: { asyfunc: "UpdateHitCount", NewsMessageID: id },
            success: function (data) {
                if (data != "False") {
                    var url = "<%= WebAppPath %>/PWS/FGM/Detail.aspx?ColumnId=" + columnId + "&NewsMessageID=" + id;
                    window.open(encodeURI(url), "_blank");
                }
            }
        });
    }
    //打开列表页面
    function openList(columnId, columnclass) {
        var url = "";
        if (columnclass == "1" ||
            columnclass == "6" ) {
            url = "<%= WebAppPath %>/PWS/FGM/PicList.aspx?ColumnId=" + columnId+"&ColumnClass="+columnclass;//图片、视频新闻类别
        } else {
            url = "<%= WebAppPath %>/PWS/FGM/List.aspx?ColumnId=" + columnId;
        }       
        window.open(encodeURI(url), "_blank");
    }
    //加入收藏
    function addFavorite() {
        var url = window.location;
        var title = document.title;
        var ua = navigator.userAgent.toLowerCase();
        if (ua.indexOf("msie 8") > -1) {
            external.AddToFavoritesBar(url, title, '');//IE8
        } else {
            try {
                window.external.addFavorite(url, title);
            } catch (e) {
                try {
                    window.sidebar.addPanel(title, url, "");//firefox
                } catch (e) {
                    alert("加入收藏失败，请使用Ctrl+D进行添加");
                }
            }
        }
    }
    //设为首页
    function SetHome(obj, vrl) {
        try {
            obj.style.behavior = 'url(#default#homepage)';
            obj.setHomePage(vrl);
        } catch (e) {
            if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage', vrl);
            } else {
                alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入：" + vrl + "点击确定。");
            }
        }
    }
</script>