<%@ Page Title="选择外出培训" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="OutTrainSelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.OutTrainSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    培训名称<asp:TextBox ID="tbTrainName" MaxLength="10" runat="server" Width="120px"></asp:TextBox>
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
            <zhongsoft:LightBoundField DataField="OutTrainCode" HeaderText="外出培训编号"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TrainName" HeaderText="培训名称"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TrainContent" HeaderText="培训内容" ShowToolTip="true"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
