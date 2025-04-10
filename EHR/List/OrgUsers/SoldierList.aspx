<%@ Page Title="复转军人信息" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="SoldierList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SoldierInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">部队名称</span><span>
        <zhongsoft:LightTextBox ID="tbArmyName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvSoldier" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" PageSize="15" DataKeyNames="SoldierInfoID"
        OnRowCommand="gvSoldier_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("SoldierInfoID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="类别" DataField="SoldierType" SortExpression="SoldierType"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部队名称" DataField="ARMYNAME" SortExpression="ARMYNAME"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="军内职级" DataField="SOLDIERLEVEL" SortExpression="SOLDIERLEVEL"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvSoldier.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/SoldierEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

