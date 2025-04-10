<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainContractList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainContractList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                培训项目名称/编号
                <zhongsoft:LightTextBox ID="tbTrainProject" runat="server" Width="300px">
                </zhongsoft:LightTextBox>
                责任人
                <zhongsoft:LightTextBox ID="tbUnderTakerName" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                合同名称
                <zhongsoft:LightTextBox ID="tbContractName" runat="server">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                签订日期
                <asp:CheckBox ID="cbDate" runat="server" Text="" />
                <zhongsoft:XHtmlInputText ID="txtSignStDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
                至
                <zhongsoft:XHtmlInputText ID="txtSignEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                承办部门
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="全选,序号" DataKeyNames="TRAINCONTRACTID"
        BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="3%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTAMOUNT" HeaderText="合同金额(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SIGNDATE" HeaderText="签订日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERDEPTNAME" HeaderText="承办部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERTAKERNAME" HeaderText="责任人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MEMO" HeaderText="备注">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
