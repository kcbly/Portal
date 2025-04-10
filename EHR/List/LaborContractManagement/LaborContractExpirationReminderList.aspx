<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaborContractExpirationReminderList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.LaborContractExpirationReminderList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <style type="text/css">
        .list-red td {
            color: red;
        }
    </style>
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
    <span class="filter-block"><span class="filter-block-lb">工号/名称/简拼</span><span>
        <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-search" EnableTheming="false" runat="server" Width="120px">
        </zhongsoft:LightTextBox></span></span>

    <span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" Width="120px" EnableTheming="false" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同期限类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractTermType" EnableTheming="false" class="kpms-ddlsearch" Width="240px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">合同状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" Width="80px" EnableTheming="false" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="LABORCONTRACTID" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="USERNAME">
                <ItemTemplate>
                    <a onclick="return ViewLink('<%#Eval("LABORCONTRACTID")%>');" style="color: Blue;">
                        <%#Eval("USERNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DEPTNAME" SortExpression="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE" SortExpression="CONTRACTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同状态" DataField="CONTRACTSTATE" SortExpression="CONTRACTSTATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同起始日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="STARTDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同终止日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ENDDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="距到期天数" DataField="TODUEDAYS" SortExpression="TODUEDAYS">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同类型" DataField="CONTRACTTYPE" SortExpression="CONTRACTTYPE">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewLink(id) {
            url = buildQueryUrl("EHR/List/LaborContractManagement/LaborContractEditor.aspx", { actionType: "1", bizId: id });
            ViewCustomListLink(url);
            return false;
        }
    </script>
</asp:Content>
