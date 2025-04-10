<%@ Page Language="C#" AutoEventWireup="true" Title="银行转账支票申请台帐"  MasterPageFile="~/UI/Master/ObjectList.Master" CodeBehind="BankTransferChequeFormList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.BankTransferChequeFormList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请人</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工作部门</span><span>
        <zhongsoft:LightTextBox ID="tbDept" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">用途或事由</span><span>
        <zhongsoft:LightTextBox ID="tbReason" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDateFrom" readonly="readonly" compare="2" class="kpms-textbox-comparedate" />
        至
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateTo" readonly="readonly" compare="2" class="kpms-textbox-comparedate" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">收款单位全称</span><span>
        <zhongsoft:LightTextBox ID="tbAcceptUnit" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" ></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目名称</span><span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowSorting="true"
        ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true" DataKeyNames="BankTransferChequeFormID"
        BindGridViewMethod="BindData" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="申请单编号" DataField="ApplyNo" EditItemClick="ViewFlow" DataParamFields="BankTransferChequeFormID" HeaderStyle-Width="10%" />
            <zhongsoft:LightBoundField HeaderText="收款单位全称" DataField="AcceptUnit" HeaderStyle-Width="10%"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="转账金额小写（元）" DataField="TransferMoney" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <zhongsoft:LightBoundField HeaderText="是否项目转账" DataField="IsProjectText" HeaderStyle-Width="10%"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" HeaderStyle-Width="10%"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" HeaderStyle-Width="10%"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作部门" DataField="WorkDeptName" ></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}"  />
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
