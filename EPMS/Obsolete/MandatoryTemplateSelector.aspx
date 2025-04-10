<%@ Page Language="C#" AutoEventWireup="true" Title="选择强条模板" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="MandatoryTemplateSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.MandatoryTemplateSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                技术信息及处理意见
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="MandatoryTemplateID"
        ShowJsonRowColName="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="MandatoryTemplateID" HeaderText="MandatoryTemplateID"
                Visible="false" />
            <zhongsoft:LightBoundField DataField="TechInfo" HeaderText="技术信息及处理意见">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TechSource" HeaderText="信息来源">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="执行专业">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbExecuteSpecialty"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
 
    </script>
</asp:Content>
