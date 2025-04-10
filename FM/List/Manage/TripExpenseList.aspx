<%@ Page Language="C#" AutoEventWireup="true" Title="差旅费报销申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="TripExpenseList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.TripExpenseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">报销人</span><span>
        <zhongsoft:LightTextBox ID="tbApplyUserName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbApplyDeptName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">报销单编号</span><span>
        <zhongsoft:LightTextBox ID="tbBorrowNo" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目编号</span><span>
        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="TripExpenseFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ExpenseNo" HeaderText="报销单号"  HeaderStyle-Width="5%" EditItemClick="ViewFlow" DataParamFields="TripExpenseFormId" />
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="报销人" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="部门" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="TravelCause" HeaderText="出差事由" Width="500px" ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="ExpenseMoney" HeaderText="总计金额（小写）" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="IsProjectText" HeaderText="是否计入项目成本" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="8%" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Width="300px" ShowToolTip="true" />            
            <zhongsoft:LightBoundField DataField="IsBorrowText" HeaderText="是否充抵借款" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="BackMoney" HeaderText="本次还款（元）" HeaderStyle-Width="5%" />
            <asp:TemplateField HeaderText="流程状态" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
