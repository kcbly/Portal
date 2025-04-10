<%@ Page Title="驾驶员信息台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="DriverInfoList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.DriverInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">驾驶员姓名</span>
        <span>
            <zhongsoft:LightTextBox ID="txtUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">驾照等级</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlLicenseLevel" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DriverInfoId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" />
            <zhongsoft:LightBoundField HeaderText="性别" DataField="GenderText" />
            <zhongsoft:LightBoundField HeaderText="联系电话" DataField="Phone" />
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptName" />
            <zhongsoft:LightBoundField HeaderText="驾照等级" DataField="LicenseLevelText" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Car/DriverInfoEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
