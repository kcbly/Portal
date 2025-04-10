<%@ Page Title="职务变动台账" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="PartyGOVList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PartyGOVList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">担任职务时部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvPartyGovRank" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" PageSize="15" DataKeyNames="PARTYGOVRANKID"
        OnRowCommand="gvPartyGovRank_RowCommand"
        BindGridViewMethod="BindDataGrid" ShowExport="true" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("PARTYGOVRANKID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="担任职务时部门" DataField="RANKDEPTNAME" SortExpression="RANKDEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="职务名称" DataField="RANKNAME" SortExpression="RANKNAME"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="职务级别" DataField="RANKLEVEL" SortExpression="RANKLEVEL"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任职日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="APPOINTDATE"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="免职日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="LEAVEDATE"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否现行政<br />职务" DataField="IsNow2" HtmlEncode="false" SortExpression="IsNow2"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否最高<br />行政级别" DataField="ISHIGHEST2" HtmlEncode="false" SortExpression="ISHIGHEST2"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" SortExpression="Memo" ShowToolTip="true"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvPartyGovRank.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/PartyGOVEditor.aspx";
        $isFlow = "2";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PartyGOVEditor.aspx";
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
