<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaborContractList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.LaborContractList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                    RepeatDirection="Horizontal" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-search" EnableTheming="false" runat="server" Width="120px">
        </zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" EnableTheming="false" class="kpms-ddlsearch" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">合同期限类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractTermType" EnableTheming="false" class="kpms-ddlsearch" Width="240px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">合同状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" EnableTheming="false" class="kpms-ddlsearch" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true"
        ShowExport="true" HideFieldOnExport="全选" ShowPageSizeChange="true" DataKeyNames="LABORCONTRACTID"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="USERNAME">
                <ItemTemplate>
                    <a onclick="return ViewLink('<%#Eval("LABORCONTRACTID")%>');" style="color: Blue;">
                        <%#Eval("USERNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME" SortExpression="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同类型" DataField="CONTRACTTYPE" SortExpression="CONTRACTTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同期限类型" DataField="ContractTermType" SortExpression="ContractTermType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE" SortExpression="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同签订日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="STARTDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="有效截止日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ENDDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同变动类型" DataField="ContractChangeType" SortExpression="ContractChangeType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同到期提醒" DataField="SIGNINGTERM" DataFormatString="{0:yyyy-MM-dd}" SortExpression="SIGNINGTERM">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同归属单位" DataField="CONTRACTBELONGTO" ShowToolTip="true" SortExpression="CONTRACTBELONGTO">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同状态" DataField="CONTRACTSTATE" SortExpression="CONTRACTSTATE">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            $("#ctl00_subToolBar_dlButtons tr").find("a").eq(2).hide();
        }
        function ViewLink(id) {
            url = buildQueryUrl("EHR/List/LaborContractManagement/LaborContractEditor.aspx", { actionType: "1", bizId: id });
            ViewCustomListLink(url);
            return false;
        }
    </script>
</asp:Content>
