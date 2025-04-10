<%@ Page Language="C#" Title="" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="EquipmentRepairApplyList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.EquipmentRepairApplyList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">单据号</span><span>
        <zhongsoft:LightTextBox ID="tbNumbers" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">申请时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
        <zhongsoft:XHtmlInputText ID="txtEndApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目名称</span><span>
        <zhongsoft:LightTextBox ID="txtEntryName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">申请人</span><span>
        <zhongsoft:LightTextBox ID="txtApplyUserName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">流程状态</span><span>
        <asp:DropDownList ID="ddlPrcStatus" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            <asp:ListItem Value="" Selected="True">全部</asp:ListItem>
            <asp:ListItem Value="0">流转中</asp:ListItem>
            <asp:ListItem Value="1">已完成</asp:ListItem>
        </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="EquipmentRepairApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="单据号" DataField="Numbers" SortExpression="Numbers" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" SortExpression="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="EntryName" ShowToolTip="true" SortExpression="EntryName" EditItemClick="viewForm" DataParamFields="EquipmentRepairApplyFormId" />
            <zhongsoft:LightBoundField HeaderText="计划时间（起）" DataField="PlanStartTime" SortExpression="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="计划时间（止）" DataField="PlanEndTime" SortExpression="PlanEndTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="工期（天）" DataField="WorkingHours" SortExpression="WorkingHours" />
            <zhongsoft:LightBoundField HeaderText="预估费用（万元）" DataField="newEstimatedCost" SortExpression="newEstimatedCost"  DataFormatString="{0:F2}"/>
            
            <zhongsoft:LightBoundField HeaderText="维修、修缮原因" DataField="RepairReason" SortExpression="RepairReason" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="主要项目或工程量" DataField="Quantities" SortExpression="Quantities" ShowToolTip="true" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
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
