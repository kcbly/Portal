<%@ Page Title="选择部门" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="OrganizationSelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.OrganizationSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    部门编号/名称<asp:TextBox ID="tbOrganizationName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" BindJsonClick="true" AutoGenerateColumns="false" AllowPaging="true"
        UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter" PageSize="10" DataKeyNames="OrgUnitId"
        OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemStyle Width="4%" HorizontalAlign="Center" />
                <ItemTemplate>
                    <%# (((GridViewRow)Container).DataItemIndex + 1) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="部门编号" DataField="OrgUnitCode" SortExpression="OrgUnitCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门名称" DataField="OrgUnitName" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门分类" DataField="OrgType1" SortExpression="OrgType1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门等级" DataField="OrgUnitLevel1" SortExpression="OrgUnitLevel1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上级部门" DataField="ParentName" SortExpression="ParentName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="成立日期" DataField="SETUPDATE" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="SETUPDATE">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
