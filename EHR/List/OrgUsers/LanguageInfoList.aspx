<%@ Page Title="语言、计算机能力台账" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="LanguageInfoList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.LanguageInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">语种名称</span><span>
        <zhongsoft:LightTextBox ID="tbLanguageName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvLanguage" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" PageSize="15" DataKeyNames="LanguageInfoID"
        OnRowCommand="gvLanguage_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="PersonnelCode" ItemStyle-Wrap="false" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="PersonnelName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("LanguageInfoID")%>');" style="color: Blue;">
                        <%#Eval("PersonnelName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="语种名称" DataField="LanguageName" SortExpression="LanguageName"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="熟练程度" DataField="Proficiency" SortExpression="Proficiency"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="语言水平" DataField="LanguageLevel" SortExpression="LanguageLevel"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="证书编号" DataField="CertificateNO" SortExpression="CertificateNO"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="证书取得日期" DataField="CertificateDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="CertificateDate"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计算机水平级别" DataField="ComputerLevel" SortExpression="ComputerLevel"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计算机熟练程度" DataField="ComputerProficiency" SortExpression="ComputerProficiency"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvLanguage.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/LanguageInfoEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/LanguageInfoEditor.aspx";
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

