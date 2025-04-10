<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhongsoft.Portal.Default" %>

<%@ Import Namespace="EDPortal.BLL.Sys" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title></title>
    <link href="Themes/Styles/defaultpage.css" rel="stylesheet" type="text/css" />
    <style>
        .fhome
        {
            color: #ceeaf6;
        }
        a.fhome:hover
        {
            color: #ecf7fb;
        }
    </style>
    <script type="text/javascript">

        var flagTodo = "待办工作";
        var flagInfo = "信息传阅";
        var flagTodoOld = "旧平台";
        var flagTodoKPMS = "预算待办";
        var flagTodoProj = "项目预算";
        var flagTodoInteg = "集成待办";
        var flagTodoPowerOn="PowerOn待办"
        var todo; var info; var todoOld; var todoKPMS; var todoProj; var todoInteg;

        var pading = 6; //统一边框距离

        window.onresize = function () {

            setSize();
        }



        function setSize() {
            var headerH = $("#tdHeader").height();
            var footH = $("#tdFoot").height();
            var leftW = $('.left').width();
            var letftop = $('.lefttop').height();
            $('#workSpace').height(($(window).height() - headerH - footH) + 'px');
            $('#workSpace').width(($(window).width() - leftW - pading) + 'px');
            $('.left').height(($(window).height() - headerH - footH - letftop) + 'px');
            $('.closeleft').height($('.left').height() + letftop + 'px');
        }

        function initCustomerPlugin() {
            setSize();
            if ($(".current").length > 0) {
                $("#spanCatalog").html($($(".current")[0]).children('a').attr('catalog'));
            }

            $("#nav li").click(function () {
                var target = $(this).children('a').attr('target');
                $("#nav").children("li").removeClass('current');
                $(this).addClass('current');
                $('.leftmenu').css('display', 'none');
                $('#' + target).css('display', '');
                var span = $(this).children('a').attr('catalog');
                $("#spanCatalog").html(span);

                //1127 xiedx 自动滚到到最上方
                var e = document.getElementById("leftmenu");
                var divParent = document.getElementById("divParent");
                e.scrollTop = "0px";
                divParent.scrollTop = "0px";
            });

            //左侧菜单效果
            $('.leftmenu a').each(function () {
                var id = $(this).attr('target');
                if (id == 'workSpace' || id == '_blank') {
                    $(this).click(function () {
                        $('.leftmenu a').removeClass('leftmenuclick');
                        $(this).addClass('leftmenuclick');
                        $("#spanTitle").html($(this).children('span').text());
                    })
                } else {
                    $(this).toggle(function () {
                        $('#' + id).css('display', 'none');
                    }, function () {
                        $('#' + id).css('display', '');
                    })
                }
            })

            var todoResult = $(".leftmenu a:contains('" + flagTodo + "')");
            var infoResult = $(".leftmenu a:contains('" + flagInfo + "')");
            var todoOldResult = $(".leftmenu a:contains('" + flagTodoOld + "')");
            var todoKPMSResult = $(".leftmenu a:contains('" + flagTodoKPMS + "')");
            var todoProjResult = $(".leftmenu a:contains('" + flagTodoProj + "')");
            var todoPowerOnResult = $(".leftmenu a:contains('" + flagTodoPowerOn + "')");
            //获取集成待办对象
            var todoIntegResult = $(".leftmenu a:contains('" + flagTodoInteg + "')");

            if (infoResult.length > 0) {
                info = infoResult[0];
                getInfo();
                window.setInterval(getInfo, 120000);
            }

            //            if (todoResult.length > 0) {
            //                todo = todoResult[0];
            //                getTodo();
            //                window.setInterval(getTodo, 120000);
            //            }

            //            if (todoOldResult.length > 0) {
            //                todoOld = todoOldResult[0];
            //                getTodoOld();
            //                window.setInterval(getTodoOld, 120000);
            //            }

            //            if (todoKPMSResult.length > 0) {
            //                todoKPMS = todoKPMSResult[0];
            //                getTodoYS();
            //                window.setInterval(getTodoYS, 120000);
            //            }

            //            if (todoProjResult.length > 0) {
            //                todoProj = todoProjResult[0];
            //                getTodoPYS();
            //                window.setInterval(getTodoPYS, 120000);
            //            }
            //集成待办
            if (todoIntegResult.length > 0) {
                todoInteg = todoIntegResult[0];
                getTodoInteg();
                window.setInterval(getTodoInteg, 120000);
            }

            $("[pageurl]").bind("click", function () {
                if ($(this).attr("pageurl") != "") {
                    var url = $appCtx.appPath + "/" + $(this).attr("pageurl");
                    var mark = url.indexOf("?") == -1 ? "?" : "&";
                    url += mark + "secid=" + $(this).attr("pageid");
                    $("#workSpace").attr("src", url);
                }
            })
            //poweron待办
                    if (todoPowerOnResult.length > 0) {
                todoPowerOn = todoPowerOnResult[0];
                getTodoPowerOn();
                window.setInterval(getTodoPowerOn, 120000);
            }
        }
        

        //获取传阅
        function getInfo() {
            $.post("/Portal/Sys/Workflow/WorkForwardList.aspx",
                    { asyfunc: "GetForwardItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {

                            if (info != null) {
                                var index = info.innerHTML.indexOf(flagInfo);
                                info.innerHTML = info.innerHTML.substring(0, index) + flagInfo + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );
        }

        //获取待办
        function getTodo() {
            $.post("/Portal/Sys/Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {
                            if (todo != null) {
                                //                                alert("又调用了一次，返回结果" + res);
                                var index = todo.innerHTML.indexOf(flagTodo);
                                todo.innerHTML = todo.innerHTML.substring(0, index) + flagTodo + '(<font color="red">' + res + '</font>)';
                                newPortal = res;
                            }
                        }
                    }
            );
        }
        //获取旧平台待办
        function getTodoOld() {
            $.post("/Portal/Sys/Workflow/WorkToDoOld.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {
                            if (todoOld != null) {
                                //alert("又调用了一次，返回结果" + res);
                                var index = todoOld.innerHTML.indexOf(flagTodoOld);
                                todoOld.innerHTML = todoOld.innerHTML.substring(0, index) + flagTodoOld + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );

        }
        //获取全面预算待办
        function getTodoYS() {
            $.post("/Portal/Sys/Workflow/WorkToDoKPMS.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {
                            if (todoKPMS != null) {
                                //                                alert("又调用了一次，返回结果" + res);
                                var index = todoKPMS.innerHTML.indexOf(flagTodoKPMS);
                                todoKPMS.innerHTML = todoKPMS.innerHTML.substring(0, index) + flagTodoKPMS + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );
        }
        //获取全面预算待办
        function getTodoPYS() {
            $.post("/Portal/Sys/Workflow/WorkToDoProj.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {
                            if (todoProj != null) {
                                //                                alert("又调用了一次，返回结果" + res);
                                var index = todoProj.innerHTML.indexOf(flagTodoProj);
                                todoProj.innerHTML = todoProj.innerHTML.substring(0, index) + flagTodoProj + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );
        }

        //获取集成代办：新平台待办+新平台传阅+旧平台待办+项目预算+全面预算
        function getTodoInteg() {
            //集成待办
            $.post("/Portal/Sys/Workflow/WorkToDoIntegration.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function (res) {
                        if (res == "0") {
                        }
                        else {
                            if (todoInteg != null) {
                                var index = todoInteg.innerHTML.indexOf(flagTodoInteg);
                                todoInteg.innerHTML = todoInteg.innerHTML.substring(0, index) + flagTodoInteg + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );
        }

        //获取poweron待办
        function getTodoPowerOn() {
            $.post("/Portal/API/IPowerOn/WorkToDoPowerOnList.aspx",
                    { asyfunc: "GetPowerOnItemsCount" },  //参看WorkForwardList.aspx中的GetForwardItemsCount 
                    function (res) {
                        if (res == "0") {
                        }
                        else {

                            if (todoPowerOn != null) {
                                var index = todoPowerOn.innerHTML.indexOf(flagTodoPowerOn);
                                todoPowerOn.innerHTML = todoPowerOn.innerHTML.substring(0, index) + flagTodoPowerOn + '(<font color="red">' + res + '</font>)';
                            }
                        }
                    }
            );
        }


    </script>
    <script type="text/javascript">
        var isShow = false;
        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }

        var isOpen = true;


        function showLeft() {
            $("#tdleftMenu").toggle(null, null, 500);
            if (isOpen) {
                $("#leftStatus").attr("src", "Themes/Images/pic_openbtn.gif");
                $('#workSpace').width(($(window).width() - pading) + 'px');
                isOpen = false;
            }
            else {
                var leftW = $('.left').width();
                $("#leftStatus").attr("src", "Themes/Images/pic_closebtn.gif");
                $('#workSpace').width(($(window).width() - leftW - pading) + 'px');
                isOpen = true;
            }
        }

        function showUserConfig() {
            showModal(buildBizUrl("3", "", "Sys/OrgUsers/UserConfigEditor.aspx", null), "", 500, 500);
        }

        function showMoreMenu() {
            $("li[name='hiddenModule']").each(function () {
                $(this).attr("style", "display:block;");
            })
            $("#divMoreMenu").attr("style", "display:none;");
        }

        function setNoRemSignPwd() {
            $.post("Default.aspx",
                    { asyfunc: "SetNoRemSignPwd" },
                    function () {
                        $("#cbRemeberPwd").attr("disabled", "disabled");
                    }
                   )
        }
    </script>
</head>
<body>
    <style>
        .kpms-logintitle td
        {
            margin: 0 auto; /*display: none;*/
            color: #014c9d;
            font-family: 黑体;
            font-size: 18pt;
        }
        #imgLogo
        {
            padding-top: 5px;
        }
    </style>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td colspan="3" id="tdHeader" class="header">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <input type="hidden" runat="server" id="hiPageId" />
                        <div class="kpms-logintitle">
                            <table>
                                <tr>
                                    <td>
                                        &nbsp;
                                        <img id="imgLogo" alt="" src="<%=WebAppPath %><%=SysConfig.Instance.LogoImgUrl %>" />
                                    </td>
                                    <td>
                                        &nbsp;
                                        <%=AppConfig.Instance.PortalTitle%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="welcome">
                    欢迎您,<%= KPMSUser.Name%>
                    (<%=LoginID%>)
                    <asp:ImageButton runat="server" ID="ibtnUserCfg" ImageUrl="~/Themes/Images/btn-cfg.gif"
                        OnClientClick="showUserConfig();return false" />
                    <asp:LoginStatus Font-Bold="true" LogoutText="[注销]" ID="LoginStatus" runat="server" />
                    <asp:CheckBox ID="cbRemeberPwd" Text="是否记住电子签名密码?" runat="server" OnClick="setNoRemSignPwd()" />
                </div>
                <div style="position: absolute; width: 80px; height: 35px; color: #ceeaf6; font-weight: bold;
                    font-size: 12px; right: 15px; top: 25px;">
                    <a class="fhome" href="<%=WebAppPath%>/WorkPlat.aspx">
                        <img src="Themes/Images/fhome.png" style="margin-right: 3px;" />个人门户</a>
                </div>
            </td>
        </tr>
        <tr>
            <td rowspan="2" id="tdleftMenu">
                <div class="lefttop">
                    <span style="padding-left: 7px; color: #3a3a3a; font-size: 14px; font-weight: bold"
                        id="spanCatalog"></span><a style="float: right;" href="default.aspx">
                            <img src="Themes/images/ico_home.gif"></a>
                </div>
                <div class="left" id="divParent">
                    <div class="leftmenu-t" id="leftmenu" style="height: 75%">
                        <%=GenerateNavigatorHTML()%>
                    </div>
                    <div class="nav">
                        <ul id="nav">
                            <%=ParentMenuUrl%>
                        </ul>
                        <div id="divMoreMenu">
                            &nbsp;&nbsp;&nbsp;<a href="javascript:showMoreMenu()">更多…</a></div>
                    </div>
                </div>
            </td>
            <td rowspan="2" onclick="showLeft()">
                <div class="closeleft">
                </div>
            </td>
            <td style="display: none">
            </td>
        </tr>
        <tr>
            <td style="background-color: #fbfbfb; border-top: #bec3c7 1px solid;">
                <iframe name="workSpace" src="<%=WebAppPath%>/Sys/Workflow/WorkToDoList.aspx" frameborder="0"
                    id="workSpace"></iframe>
            </td>
        </tr>
        <tr>
            <td colspan="3" id="tdFoot">
                <div class="foot">
                    <%=AppConfig.Instance.BaseOrgUnitName %>©版权所有</div>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
