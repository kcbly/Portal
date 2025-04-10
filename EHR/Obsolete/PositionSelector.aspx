<%@ Page Title="选择岗位" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="PositionSelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.PositionSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    岗位编号/名称<asp:TextBox ID="tbPositionName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="PositionList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField DataField="PositionCode" HeaderText="岗位编号"></asp:BoundField>
            <asp:BoundField DataField="PositionName" HeaderText="岗位名称"></asp:BoundField>
            <asp:BoundField DataField="POSITIONLEVEL" HeaderText="岗位职级"></asp:BoundField>
            <asp:BoundField DataField="BELONGRANK" HeaderText="所属职务"></asp:BoundField>
            <asp:BoundField DataField="PositionClassify" HeaderText="岗位分类"></asp:BoundField>
            <asp:BoundField DataField="OrgUnitName" HeaderText="所属部门" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
