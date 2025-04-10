<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RewardOrPunishList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.RewardOrPunishList" MasterPageFile="~/UI/Master/ObjectWhList.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
            MaxLength="20" Width="120px"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
            MaxLength="20"  Width="120px"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">奖惩类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRewardOrPunish" class="kpms-ddlsearch" EnableTheming="false"  Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">奖惩日期</span><span>
        <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtStart" class="kpms-textbox-comparedate"
            compare="1" />
        <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtEnd" class="kpms-textbox-comparedate"
            compare="1" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">奖励类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRewardType" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">奖励级别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlRewardLevel" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">奖励名称</span><span>
        <zhongsoft:LightTextBox ID="tbRewardName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
            MaxLength="20"  Width="120px"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">惩处类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlPunishType" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">惩处名称</span><span>
        <zhongsoft:LightTextBox ID="tbPunishName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
            MaxLength="20"  Width="120px"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true" 
        ShowPageSizeChange="true" DataKeyNames="RewardOrPunishID" ShowExport="true" BindGridViewMethod="BindData" HideFieldOnExport="全选"  
        UseDefaultDataSource="true"  PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="奖惩类别" DataField="RewardOrPunish" SortExpression="RewardOrPunish">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="奖惩日期" DataField="RPDate" ItemStyle-Wrap="false" DataFormatString="{0:yyyy-MM-dd}" SortExpression="RPDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="LoginID" ItemStyle-Wrap="false" SortExpression="LoginID">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("RewardOrPunishID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="奖励类别" DataField="RewardType" SortExpression="RewardType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="奖励级别" DataField="RewardLevel" SortExpression="RewardLevel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="奖励名称" DataField="RewardName" SortExpression="RewardName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="处罚类型" DataField="PunishType" SortExpression="PunishType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="处罚名称" DataField="PunishName" SortExpression="PunishName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否解除" DataField="IsRelease" SortExpression="IsRelease">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/RewardOrPunishEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/RewardOrPunishEditor.aspx";
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
