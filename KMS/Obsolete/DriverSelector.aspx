<%@ Page Title="驾驶员选择" MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#" AutoEventWireup="true" CodeBehind="DriverSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.DriverSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">姓名</span>
        <span>
            <zhongsoft:LightTextBox ID="txtUserName" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">执照等级</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlLicenseLevel" CssClass="kpms-textboxsearch" EnableTheming="false"
                runat="server" Width="90px" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="DriverInfoId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" />
            <zhongsoft:LightBoundField HeaderText="性别" DataField="GenderText" />
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptName" />
            <zhongsoft:LightBoundField HeaderText="执照等级" DataField="LicenseLevelText" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
