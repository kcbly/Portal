<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UIHeader.ascx.cs" Inherits="Zhongsoft.Portal.PWS.UI.Controls.UIHeader" %>
<link href="<%= WebAppPath %>/PWS/UI/css/custom2.css" rel="stylesheet" />
<link href="<%= WebAppPath %>/Themes/custom/styles/jquery-ui-1.10.4.custom.css" rel="stylesheet">
<script src="<%= WebAppPath %>/PWS/UI/js/jquery.js"></script> 
<script src="<%= WebAppPath %>/UI/Script/portal.resource.js" type="text/javascript"></script> 
<script src="<%= WebAppPath %>/UI/Script/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>   
<script src="<%= WebAppPath %>/PWS/UI/js/common.js"></script>
<!--通知栏-->
<style>
    .input-group-btn{
        top:-0.5px\9\0;
    }
</style> 
<!--网站LOGO&网站检索-->
<div class="div-head body-85">
    <div class="row">
        <div class="col-md-6 col-xs-6">
            <img src="<%= WebAppPath %>/PWS/UI/img/logo.png" /><span class="div-head-version">内网</span>
        </div>
        <div class="col-md-6 col-xs-6">
            <div class="row">
                <div class="col-md-6 col-xs-6"></div>
                <div class="col-md-6 col-xs-6">
                    <div class="input-group">
                        <input type="text" id="keword" class="form-control" placeholder="请输入检索关键字">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="button" id="btnSearch">搜索</button></span>
                    </div>
                </div>
            </div>
    </div>
</div>
</div> 
<script type="text/javascript">  
    initbtnSearch();     
    //输入搜索条件后，回车即可查询
    //document.getElementById("keword").addEventListener("keyup", function () {
    //    event.preventDefault();
    //    if (event.keyCode == 13) {
    //        $('#btnSearch').click();
    //    }
    //});
    //打开详细页面
    function initbtnSearch() {
        if ('<%=Jump%>' == 'True') {
            clickSearch();
        }
    }
    //触发搜索按钮的点击事件
    function clickSearch() {
        $("#btnSearch").click(function () {
            var keword = document.getElementById("keword").value;
            var url = "<%= WebAppPath %>/PWS/FGM/Search.aspx?keyword=" + keword;
            window.open(encodeURI(url), "_blank");
        });
    }
    //打开专题页面
    function openFeature(columnId) {
        var url = "<%= WebAppPath %>/PWS/FGM/Feature.aspx?ColumnId=" + columnId;
        window.open(encodeURI(url), "_blank");
    }
     //打开党建专题页面
    function openFeatureRed(columnId) {
        var url = "<%= WebAppPath %>/PWS/FGM/FeatureRed.aspx?ColumnId=" + columnId;
        window.open(encodeURI(url), "_blank");
    }
     $(document).ready(function () {
            $(".div-user-avatar").hover(function () {
                $(".pop-avatar").toggle();
            }); 
        });
</script>

