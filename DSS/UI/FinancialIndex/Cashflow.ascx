<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cashflow.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.FinancialIndex.Cashflow" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="现金流量" />
<table style="width: 100%">
    <tr>
        <td>
            <div style="float: right">
                <asp:RadioButtonList ID="rblTime" runat="server" RepeatColumns="3" AutoPostBack="true"
                    OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="cashflowChart" runat="server" Width="100%" TitleXAlign="Left"
                TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" LegendXAlign="Center"
                LegendYAlign="Top" LegendOrient="Horizontal" Height="400px">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
