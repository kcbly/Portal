<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="AssociationDuesApplyList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssociationDuesApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly"/>
        <zhongsoft:XHtmlInputText ID="txtEndApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">协会名称</span><span>
        <zhongsoft:LightTextBox ID="txtAssociationName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">事由</span><span>
        <zhongsoft:LightTextBox ID="txtReason" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="AssociationDuesApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="SerialNumber" EditItemClick="viewForm" DataParamFields="AssociationDuesApplyFormId" SortExpression="SerialNumber"/>
            <zhongsoft:LightBoundField HeaderText="协会名称" DataField="AssociationName" SortExpression="AssociationName"/>
            <zhongsoft:LightBoundField HeaderText="事由" DataField="Reason" ShowToolTip="true" SortExpression="Reason" />
            <zhongsoft:LightBoundField HeaderText="金额小写" DataField="AmountSmall" SortExpression="AmountSmall"/>
            <zhongsoft:LightBoundField HeaderText="开户银行" DataField="Bank" SortExpression="Bank"/>
            <zhongsoft:LightBoundField HeaderText="账号" DataField="BankAccountNumber" SortExpression="BankAccountNumber"/>
            <zhongsoft:LightBoundField HeaderText="户名" DataField="Account" SortExpression="Account"/>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ApplyDate"/>
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate> 
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Other/AssociationInfoEditor.aspx";
        $isFlow = "0";
        function viewForm(formId) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: formId };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
