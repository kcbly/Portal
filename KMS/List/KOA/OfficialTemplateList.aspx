<%@ Page Language="C#" Title="公文模板管理台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="OfficialTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.OfficialTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">红头类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlRedHeadType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" Width="180px" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">模板名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtTemplateName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData" OnRowCommand="gvList_RowCommand"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="OfficialTemplateId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="红头类型" DataField="RedHeadTypeText" />
            <zhongsoft:LightBoundField HeaderText="模板名称" DataField="TemplateName" />
            <zhongsoft:LightBoundField HeaderText="文件路径" DataField="TemplatePath" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" />
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/KOA/OfficialTemplateEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            //删除按钮

            $("#ctl00_btnDelete").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

