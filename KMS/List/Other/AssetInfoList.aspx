<%@ Page Title="资产管理" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="AssetInfoList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssetInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">使用人姓名/工号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">设备名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtEquName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">设备编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtEquNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">购置日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">使用部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">状态</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlStatus" class="kpms-ddlsearch" EnableTheming="false" runat="server" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="AssetInfoId" PageSize="15"  OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="设备编号" DataField="EquNumber" SortExpression="EquNumber" />
            <zhongsoft:LightBoundField HeaderText="设备名称" DataField="EquName" SortExpression="EquName"/>
            <zhongsoft:LightBoundField HeaderText="类型" DataField="AssetTypeText" SortExpression="AssetTypeText"/>
            <zhongsoft:LightBoundField HeaderText="购置日期" DataField="PurchaseDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PurchaseDate" />
            <zhongsoft:LightBoundField HeaderText="使用部门" DataField="UseDepName" SortExpression="UseDepName"/>
            <zhongsoft:LightBoundField HeaderText="使用人" DataField="UseName" SortExpression="UseName"/>
            <zhongsoft:LightBoundField HeaderText="品牌型号" DataField="BrandType" SortExpression="BrandType"/>
            <zhongsoft:LightBoundField HeaderText="生产厂家" DataField="Manufacturer" SortExpression="Manufacturer"/>
            <zhongsoft:LightBoundField HeaderText="资产原值（元）" DataField="AssetValue" SortExpression="AssetValue"/>
            <zhongsoft:LightBoundField HeaderText="折旧年限" DataField="DepreciationYear" SortExpression="DepreciationYear"/>
            <zhongsoft:LightBoundField HeaderText="状态" DataField="AssetStatusText" SortExpression="AssetStatusText"/>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" ShowToolTip="true" SortExpression="Remark"/>
            <asp:TemplateField HeaderText="复制" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="btnCopy" runat="server" CommandName="EditCopy"  CommandArgument='<%#Eval("AssetInfoId") %>' 
                        EnableTheming="false"><img alt=""  src="../../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Other/AssetInfoEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
