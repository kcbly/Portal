<%@ Page Language="C#" AutoEventWireup="true" Title="选择流动人员办理事项" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ParamTraceItemSelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.ParamTraceItemSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    办理事项
    <asp:TextBox ID="tbContent" runat="server" Width="120px"></asp:TextBox>
    变动原因
    <asp:TextBox ID="tbReason" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="TraceItemList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="TraceItemList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="ITEMCONTENT" HeaderText="办理事项内容">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CHANGEREASON" HeaderText="适用变动原因">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MGRDEPTNAME" HeaderText="管理部门">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
