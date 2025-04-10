<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FamilyMemberList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FamilyMemberList" Title="家庭成员" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="btnNew" EnableTheming="false" CssClass="subtoolbarlink" AccessLevel="2" OnClientClick="return AddItem('')">
        <span><img  src="<%=WebAppPath %>/Themes/Images/btn_new.gif"  width="16" height="16"/>新建</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true" ShowPageSizeChange="true" DataKeyNames="FAMILYMEMBERID,USERID" ShowExport="true" BindGridViewMethod="BindDataGrid" HideFieldOnExport="全选" OnRowCommand="gvList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="UserCode" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" ItemStyle-Wrap="false" DataFormatString="{0:yyyy-MM-dd}" SortExpression="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName" ItemStyle-Wrap="false" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
             <asp:TemplateField HeaderText="家庭成员姓名" ItemStyle-HorizontalAlign="left" SortExpression="MemberName" 
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FAMILYMEMBERID")%>');" style="color: Blue;">
                        <%#Eval("MemberName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="家庭成员类型" DataField="Relationship" SortExpression="Relationship">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Birthday">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex" SortExpression="Sex">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作单位" DataField="WORKCORP" SortExpression="WORKCORP">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="联系方式" DataField="Phone" SortExpression="Phone">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true" SortExpression="Memo">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="ViewItem" DataParamFields="FAMILYMEMBERID" Visible="false">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="EditItem" DataParamFields="FAMILYMEMBERID">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {

        }

        function AddItem() {
            var json = { actionType: 3 };

            var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/OrgUsers/FamilyMemberDetail.aspx", json);
            showDivDialog(encodeURI(url), null, 900, 550, rebindGridData);
            return false;
        }

        function EditItem(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FamilyMemberEditor.aspx?&actionType=3&bizId=" + bzid;
            showDivDialog(url, "", 800, 400, rebindGridData);
            return false;
        }
        function ViewItem(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FamilyMemberEditor.aspx?&actionType=1&bizId=" + bzid;
            showDivDialog(url, "", 800, 400, null);
            return false;
        }

    </script>
</asp:Content>

