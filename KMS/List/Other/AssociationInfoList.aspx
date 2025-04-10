<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="AssociationInfoList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssociationInfoList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">协会名称</span><span>
        <zhongsoft:LightTextBox ID="tbAssociationName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlAssociationType" class="kpms-ddlsearch" EnableTheming="false" Width="80px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="AssociationInfoId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="协会名称" ItemStyle-HorizontalAlign="left" SortExpression="AssociationName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("AssociationInfoId")%>');" style="color: Blue;">
                        <%#Eval("AssociationName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="类别" DataField="AssociationTypeText" SortExpression="AssociationTypeText"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="入会日期" DataField="JoinDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="JoinDate"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开户行" DataField="Bank" SortExpression="Bank"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="账号" DataField="Account" SortExpression="Account"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="户名" DataField="BankAccountNumber" SortExpression="BankAccountNumber"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" ShowToolTip="true" SortExpression="Remark"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Other/AssociationInfoEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/KMS/List/Other/AssociationInfoEditor.aspx";
            var actionType = GetAcl();
            url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: id });
            showDivDialog(encodeURI(url), null, 1150, 800);
            return false;
        }
        function GetAcl() {
            var accessLevel = 1;
            var userId = '<%=KPMSUser.UserId%>';
            var objectId = '<%=base.ObjectId%>';
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/Sys/Handler/CheckUserSecurityRule.ashx", null),
                data: { UserId: userId, SecurityObjectId: objectId },
                async: false,
                cache: false,
                success: function (res) {
                    var $l = eval('(' + res + ')');
                    accessLevel = $l;

                },
                error: function (err) {
                    //alert(err);
                }
            });
            return accessLevel;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
