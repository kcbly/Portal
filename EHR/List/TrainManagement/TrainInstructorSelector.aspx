<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainInstructorSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainInstructorSelector"
    MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                讲师类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlInstructorType">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                姓名
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
            <td>
                性别
            </td>
            <td>
                <asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" Width="80px">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                研究方向
                <zhongsoft:LightTextBox ID="tbResearchArea" runat="server" Width="360px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="10" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowCommand="gvList_RowCommand" ShowJsonRowColName="true" OnJsonClick="addObject"
        JsonClickMode="onclick" BindJsonClick="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="INSTRUCTORTYPE" HeaderText="讲师类型" ItemStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NAME" HeaderText="姓名" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SEX" HeaderText="性别" ItemStyle-Width="3%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RESEARCHAREA" HeaderText="研究方向">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="COMPANY" HeaderText="工作单位" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MOBILEPHONE" HeaderText="手机" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PHONE" HeaderText="电话" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EMAIL" HeaderText="邮箱" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WEBSITE" HeaderText="网址" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
