<%@ Page Title="选择自办班申请" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="HospitalSelfClassSelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.HospitalSelfClassSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    培训名称/编号<asp:TextBox ID="tbClassName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号">
                <ItemStyle Width="4%" HorizontalAlign="Center" />
                <ItemTemplate>
                    <%# (((GridViewRow)Container).DataItemIndex + 1) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Code" HeaderText="编号"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ClassName" HeaderText="培训班名称"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TrainContent" HeaderText="培训内容" ShowToolTip="true"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
