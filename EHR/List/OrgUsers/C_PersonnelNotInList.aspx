<%@ Page Title="人员识别信息台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="C_PersonnelNotInList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.C_PersonnelNotInList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">人员编号/姓名</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbUserInfo" CssClass="kpms-textboxsearch" EnableTheming="False" Width="120px" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" BindGridViewMethod="BindData" AllowPaging="True" AllowSorting="true" PageSize="15"
        ShowExport="True" DataKeyNames="UserId" OnRowDataBound="gvList_OnRowDataBound">
        <Columns>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditItem" EditItemClick="EditItem"
                DataParamFields="UserId" ItemStyle-Width="40px" />
            <asp:BoundField HeaderText="工号" DataField="LoginId" SortExpression="UserCode"/>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("UserId")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="部门" DataField="OrgUnitName" SortExpression="OrganizationName" />
            <asp:BoundField HeaderText="人员状态" DataField="State" SortExpression="State" />
            <asp:BoundField HeaderText="性别" DataField="Sex" SortExpression="Sex" />
            <asp:BoundField HeaderText="用工类型" DataField="EmploymentType" SortExpression="EmploymentType" />
            <asp:BoundField HeaderText="身份证号" DataField="IdentityCardNO" SortExpression="IdentityCardNO" />
            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}" SortExpression="Birthday" />
            <zhongsoft:LightBoundField HeaderText="参加工作日期" DataField="WORKDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="WORKDATE" />
            <zhongsoft:LightBoundField HeaderText="进入本单位工作日期" DataField="INNOWCORPDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="INNOWCORPDATE" />
        </Columns>
    </zhongsoft:LightPowerGridView>

    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_OnClick" Visible="false" />
    <script type="text/javascript">

        function EditItem(userID) {
            var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/OrgUsers/PersonnelInfoEditorNew.aspx", { actionType: 3, bizId: userID });
            showDivDialog(encodeURI(url), null, 1300, 850, callBack);
            return false;
        }
        function ViewItem(userID) {
            var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/OrgUsers/PersonnelInfoEditorNew.aspx", { actionType: 1, bizId: userID });
            ViewCustomListLink(url);
            return false;
        }
        function callBack() {
            <%=Page.GetPostBackEventReference(this.btnSearch,"") %>;
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
