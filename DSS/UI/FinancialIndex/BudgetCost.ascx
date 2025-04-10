<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BudgetCost.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.FinancialIndex.BudgetCost" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="预算与成本" />
<table style="width: 100%">
    <tr>
        <td>
            <div style="float: right">
                <table>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rblTime" runat="server" RepeatColumns="3" AutoPostBack="true"
                                OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                        </td>
                        <td>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblBudget" runat="server" RepeatColumns="3" AutoPostBack="true"
                                OnSelectedIndexChanged="rblBudget_SelectedIndexChanged" />
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="cashflowChart" runat="server" Width="100%" TitleXAlign="Left"
                TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" LegendXAlign="Center"
                LegendYAlign="Top" LegendOrient="Horizontal" Height="400px" SubText="万元">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
