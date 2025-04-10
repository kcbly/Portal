<%@ Page Title="通用审批流程台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="GeneralApplyList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.GeneralApplyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">主题</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbTheme" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtStartApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly"/>
            <zhongsoft:XHtmlInputText ID="txtEndApplyDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly"/>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtDepName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请人</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="GeneralApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="主题" DataField="Theme" EditItemClick="ViewFlow" DataParamFields="GeneralApplyFormId"  />
            <zhongsoft:LightBoundField HeaderText="主要内容" DataField="MainContent" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" />
            <zhongsoft:LightBoundField HeaderText="申请部门"  DataField="ApplyDeptName" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ApplyDate"/>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
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

