<%@ Page Title="印章用章类型用章子类型维护台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="SealChapterTypeSetList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Seal.SealChapterTypeSetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">印章名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSealName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">用章类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlChapterType" class="kpms-ddlsearch" EnableTheming="false" OnSelectedIndexChanged="ddlChapterType_SelectedIndexChanged" AutoPostBack="true"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">用章子类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlChapterItemType" class="kpms-ddlsearch" runat="server" EnableTheming="false" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="SealChapterTypeSetId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                   <input type="hidden" id="hiSealRegisterId" runat="server" value='<%#Eval("SealRegisterId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="印章名称" DataField="SealName" />
            <zhongsoft:LightBoundField HeaderText="用章类型" DataField="ChapterTypeText" />
            <zhongsoft:LightBoundField HeaderText="用章子类型" DataField="ChapterItemTypeText" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Seal/SealChapterTypeSetEditor.aspx";
        $isFlow = "0";
        function beforeDialog(actionType, $gridCheckedClientID) {
            var keyUrl = "<%=WebAppPath %>" + $KeyUrl;
            var url = buildQueryUrl(keyUrl, { actionType: 2 });

            if ($isFlow != "1" || $isFlow == undefined) {
                if (actionType == '1' || actionType == '3') {
                    url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: $gridCheckedClientID });

                }
                showDivDialog(encodeURI(url), null, 1250, 450, rebindGridData);
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
