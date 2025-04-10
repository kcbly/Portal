<%@ Page MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="StaffAddressList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.StaffAddressList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">姓名/工号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbPersonnel" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px" MaxLength="20"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">部门</span>
        <span>
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px" MaxLength="80"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" PageSize="15" Width="100%" AllowPaging="true" ShowPageSizeChange="true" DataKeyNames="UserId" ShowExport="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="30px" OnClientClick="checkGridViewRow" Visible="false" />
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditItem" EditItemClick="EditItem"
                DataParamFields="UserId" ItemStyle-Width="40px" />
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName" ItemStyle-Width="100px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("UserId")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="LOGINID" SortExpression="LOGINID" Width="120" />
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgDEPTNAME" Width="120" SortExpression="OrgDEPTNAME" />
            <%--<zhongsoft:LightBoundField HeaderText="科室" DataField="SUBDEPTNAME" Width="120" SortExpression="SUBDEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="工作手机1" DataField="WorkPhone1" Width="100" SortExpression="WorkPhone1" />
            <zhongsoft:LightBoundField HeaderText="工作手机2" DataField="WorkPhone2" Width="100" SortExpression="WorkPhone2" />
            <zhongsoft:LightBoundField HeaderText="虚拟网短号" DataField="VirtualShortNo" Width="100" SortExpression="VirtualShortNo" />
            <zhongsoft:LightBoundField HeaderText="600虚拟号" DataField="VirtualNo600" Width="100" SortExpression="VirtualNo600" />
            <zhongsoft:LightBoundField HeaderText="固定电话" DataField="OfficePhone" Width="100" SortExpression="OfficePhone" />
            <zhongsoft:LightBoundField HeaderText="分机号" DataField="ExtensionNumber" ItemStyle-Width="100" SortExpression="ExtensionNumber" />
            <zhongsoft:LightBoundField HeaderText="固定虚拟号" DataField="VirtualNoFix" ItemStyle-Width="100" SortExpression="VirtualNoFix" />
            <zhongsoft:LightBoundField HeaderText="Email" DataField="EmailAdd" ItemStyle-Width="100" SortExpression="EmailAdd" />
            <zhongsoft:LightBoundField HeaderText="所在位置" DataField="Location" ItemStyle-Width="150" SortExpression="Location" />
            <zhongsoft:LightBoundField HeaderText="楼层" DataField="Floor" ItemStyle-Width="100" SortExpression="Floor" />
            <zhongsoft:LightBoundField HeaderText="房间号" DataField="Room" ItemStyle-Width="100" SortExpression="Room" />
            <zhongsoft:LightBoundField HeaderText="IP地址" DataField="IpAddr" ItemStyle-Width="100" SortExpression="IpAddr" />--%>
            <zhongsoft:LightBoundField HeaderText="办公电话" DataField="OfficePhone" Width="100" SortExpression="WorkPhone1" />
            <zhongsoft:LightBoundField HeaderText="常用手机号码" DataField="WorkPhone1" Width="100" SortExpression="WorkPhone1" />
            <zhongsoft:LightBoundField HeaderText="Email" DataField="EmailAdd" ItemStyle-Width="100" SortExpression="EmailAdd" />
            <zhongsoft:LightBoundField HeaderText="传真号" DataField="Fax" ItemStyle-Width="100" SortExpression="Fax" />
            <zhongsoft:LightBoundField HeaderText="QQ/微信号" DataField="QQWeiXinCode" ItemStyle-Width="100" SortExpression="Fax" />
            <zhongsoft:LightBoundField HeaderText="办公室所在位置" DataField="Location" ItemStyle-Width="150" SortExpression="Location" />
            <zhongsoft:LightBoundField HeaderText="楼层" DataField="Floor" ItemStyle-Width="100" SortExpression="Floor" />
            <zhongsoft:LightBoundField HeaderText="房间号" DataField="Room" ItemStyle-Width="100" SortExpression="Room" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiAdministrator" runat="server" value="企业通讯录管理员" />
       <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_OnClick" Visible="false" />
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/StaffAddressListEditor.aspx";
        $isFlow = "2";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
            $("#divToolBtn").hide();
        }
        function EditItem(bzid) {
            var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/OrgUsers/StaffAddressListEditor.aspx", { actionType: 3, bizId: bzid });
            showDivDialog(encodeURI(url), null, 900, 650, callBack);
            return false;
        }
         function callBack() {
            <%=Page.GetPostBackEventReference(this.btnSearch,"") %>;
        }
         function ViewCustomListLink(id) {
             var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/StaffAddressListEditor.aspx";
             var actionType = GetAcl();
             url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: id });
             showDivDialog(encodeURI(url), null, 1150, 800);
             return false;
         }
         function GetAcl() {
             var accessLevel = 1;
             var userId = '<%=KPMSUser.UserId%>';
            var objectId = '<%=base.ObjectId%>';
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/Sys/Handler/CheckUserSecurityRule.ashx", null),
                data: { UserId: userId, SecurityObjectId: objectId },
                async: false,
                cache: false,
                success: function (res) {
                    var $l = eval('(' + res + ')');
                    accessLevel = $l;

                },
                error: function (err) {
                    //alert(err);
                }
            });
            return accessLevel;
        }
    </script>
</asp:Content>
