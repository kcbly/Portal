<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployAgreementList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.EmployAgreementList" Title="用工协议" MasterPageFile="~/UI/Master/ObjectWhList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">协议类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlAgreementType" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否派遣委托</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlIsPQWT" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">协议状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlAgreementState" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true"
        ShowPageSizeChange="true" DataKeyNames="EmployAgreementID" ShowExport="true" BindGridViewMethod="BindData" HideFieldOnExport="全选"
        UseDefaultDataSource="true" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="UserCode" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("EmployAgreementID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" ItemStyle-Wrap="false" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议开始日期" DataField="AgrStartDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="AgrStartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议终止日期" DataField="AgrEndDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="AgrEndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议类型" DataField="AgreementType" SortExpression="AgreementType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议到期提醒" DataField="AgrEndRemind" DataFormatString="{0:yyyy-MM-dd}" SortExpression="AgrEndRemind">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否派遣委托" DataField="IsPQWT" SortExpression="IsPQWT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="派遣单位" DataField="PQUnit" ShowToolTip="true" SortExpression="PQUnit">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议归属单位" DataField="BelongUnit" ShowToolTip="true" SortExpression="BelongUnit">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="协议状态" DataField="AgreementState" SortExpression="AgreementState">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/LaborContractManagement/EmployAgreementEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
