<%@ Page Language="C#" AutoEventWireup="true" Title="人事异动" CodeBehind="WorkStaffChangeList_New.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.UserChange.WorkStaffChangeList_New" MasterPageFile="~/UI/Master/ObjectWhList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
        <asp:TextBox ID="tbPersonnel" runat="server" Width="120px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">是否生效</span><span>
        <asp:DropDownList runat="server" ID="ddlEffice" Width="80px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="1">已生效</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">未生效</asp:ListItem>
        </asp:DropDownList></span></span>

    <span class="filter-block"><span class="filter-block-lb">变动原因</span><span>
        <asp:DropDownList runat="server" ID="ddlChangeReason" Width="120px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">变动日期</span><span>
        <asp:CheckBox ID="cbDate" runat="server" Text="" />
        <input type="text" id="tbStartDate" runat="server" readonly="readonly" compare="1"
            class="kpms-textbox-comparedate" />
        <input type="text" id="tbEndDate" runat="server" readonly="readonly" compare="1"
            class="kpms-textbox-comparedate" /></span></span>

    <span class="filter-block"><span class="filter-block-lb">现部门</span><span>
        <asp:DropDownList ID="ddlTargetDept" runat="server" Width="150px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">原部门</span><span>
        <asp:DropDownList ID="ddlOrgDept" runat="server" Width="150px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList></span></span>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
<%--    <asp:LinkButton runat="server" ID="lbtnBatchAudit" OnClick="lbtnBatchAudit_Click"
        EnableTheming="false">
                      <span>批量审核</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnBatchDel" OnClick="lbtnBatchDel_Click"
        EnableTheming="false">
                      <span>批量撤消</span>
    </asp:LinkButton>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="USERCHANGEID"
        AutoGenerateColumns="False" AllowPaging="True" PageSize="20" OnRowCommand="gvList_RowCommand"
        ShowExport="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="USERCODE" HeaderText="工号" ItemStyle-Width="40px"
                SortExpression="USERCODE" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="50px">
                <ItemTemplate>
                    <a onclick="return ViewLink('<%#Eval("USERCHANGEID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="ChangeReason" HeaderText="变动原因" ItemStyle-Width="90px"
                SortExpression="ChangeReason">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OGDEPTNAME" HeaderText="原部门" ItemStyle-Width="160px"
                SortExpression="OGDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CHANGEDEPTNAME" HeaderText="现部门" ItemStyle-Width="160px"
                SortExpression="CHANGEDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CHANGEDATE" HeaderText="变动日期" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="CHANGEDATE" ItemStyle-Width="70px" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MEMO" HeaderText="备注" Width="100" SortExpression="MEMO">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ISPASS2" HeaderText="是否<br />生效" ItemStyle-HorizontalAlign="Center"
                SortExpression="ISPASS2" HtmlEncode="false" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="审核" CommandName="DeleteAudit" ImageUrl="../../../Themes/Images/btn_examine.gif"
                DeleteText="确定审核{0}吗？" DeleteTipField="UserName" ToolTip="审核">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="撤消" CommandName="DeleteBack" ImageUrl="../../../Themes/Images/btn_chexiao.gif"
                DeleteText="确定撤销{0}吗？" DeleteTipField="UserName" ToolTip="撤销">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <!--人资部部门Code-->
    <input type="hidden" runat="server" id="hiRZDeptCode" value="06" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/UserChange/WorkStaffChangeEditor_New.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_subToolBar_dlButtons tr").find("a").eq(2).hide();
        }
        function ViewLink(id) {
            url = buildQueryUrl("EHR/List/UserChange/WorkStaffChangeEditor_New.aspx", { actionType: "1", bizId: id });
            ViewCustomListLink(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
