<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectTeamMemberList.aspx.cs"
    Title="项目组成员" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjectTeamMemberList" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeProject" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeProject_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工号/姓名</span> <span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs">
        <ul>
            <li><a href='#All' id='a0'>
                <asp:Label ID="lb0" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a1'>
                <asp:Label ID="lb1" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a2'>
                <asp:Label ID="lb2" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a3'>
                <asp:Label ID="lb3" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a4'>
                <asp:Label ID="lb4" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a5'>
                <asp:Label ID="lb5" runat="server"></asp:Label></a></li>
            <li><a href='#All' id='a6'>
                <asp:Label ID="lb6" runat="server"></asp:Label></a></li>
        </ul>
        <div id="All">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <ContentTemplate>
                    <zhongsoft:LightPowerGridView Width="100%" AllowPaging="True" PageSize="10" ID="gvAll"
                        runat="server" AllowSorting="true" AutoGenerateColumns="False" ShowExport="true"
                        DataKeyNames="OrganizationUsersInRolesID" UseDefaultDataSource="true" OnRowDataBound="gvAll_RowDataBound"
                        BindGridViewMethod="BindGrid">
                        <Columns>
                            <asp:BoundField DataField="UnitPostName" HeaderText="角色" ItemStyle-Width="120px" />
                            <asp:BoundField DataField="LoginId" HeaderText="工号" ItemStyle-Width="50px" />
                            <asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="60px" />
                            <asp:TemplateField HeaderText="部门" ItemStyle-Width="160px">
                                <ItemTemplate>
                                    <asp:Label ID="lbDept" runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AppointDate" HeaderText="任命时间" ItemStyle-Width="80px"
                                DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="LeaveDate" HeaderText="卸任时间" ItemStyle-Width="80px" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="MobilePhone" HeaderText="手机" ItemStyle-Width="140px" />
                            <asp:BoundField DataField="Phone" HeaderText="座机" ItemStyle-Width="80px" />
                            <asp:BoundField DataField="Email" HeaderText="邮箱" ItemStyle-Width="80px" />
                            <asp:TemplateField HeaderText="工作负荷" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <a onclick='return DetailOfWork("<%#Eval("UserId") %>")'>
                                        <asp:Label ID="lbMyWork" runat="server"></asp:Label>
                                        <img id="imgCurrWork" src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" />
                                    </a>
                                    <input type="hidden" id="hiUserID" value="<%#Eval("UserId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                    <asp:LinkButton ID="lbtnReBind" runat="server" OnClick="lbtnReBind_Click" Visible="false">LinkButton</asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                }
                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    $("#<%=hiIndex.ClientID %>").val(i);
                    <%=Page.GetPostBackEventReference(this.lbtnReBind,"") %>;
                    return true;
                });
            })
        }

        function ShowLoadStatisticDetailList(userID, loginID, userName) {
            var url = "../ProjectHR/LoadStatisticDetailList.aspx?UserID=" + userID + "&LoginID=" + loginID + "&UserName=" + escape(userName) + "&OrganizationId=" + "<%=OrganizationId %>";
            var stringFeatures = "dialogHeight: 700px; dialogWidth: 900px; edge: Raised; center: Yes; help: Yes; resizable: Yes; scroll: Yes; status: Yes;";
            window.showModalDialog(url, "", stringFeatures);
            return false;
        }
        //查看人员工作信息
        function DetailOfWork(userId) {
            var url = buildQueryUrl("/EPMS/List/OBS/CurrentTaskDetailList.aspx", { secid: "c3455630-e393-4f75-b471-0e9151c39a6b", IsDashboard: "1", ShowToolbar: "1", userid: userId });
            showDivDialog(url, null, 1000, 600);
            return false;
        }

        //加载列表查看按钮Title信息
        function setTitle(obj, userID) {
            var title = $(obj).find("#imgCurrWork").attr("title");

            if (title == "" || title == undefined) {
                //更具UserID异步加载当前人对应的所负担任务（状态为正在进行）的总数
                $.post("<%=WebAppPath %>" + "/EPMS/List/OBS/CurrentTaskDetailList.aspx",
                 { asyfunc: "GetUserTaskMassage", struserID: userID },
                 function (res) {
                     $(obj).find("#imgCurrWork").attr("title", res);
                 }
                );
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
