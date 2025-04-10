<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanExecute.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.PlanExecute" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="计划执行" />
<table>
    <tr>
        <td>
            <div style="float: right">
                <asp:RadioButtonList ID="rblType" runat="server" RepeatColumns="2" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblType_SelectedIndexChanged">
                    <asp:ListItem Text="室交出" Value="0" />
                    <asp:ListItem Text="院交出" Value="1" Selected="True" />
                </asp:RadioButtonList>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="planChart" runat="server" Width="500px" TitleXAlign="Left"
                TitleYAlign="Top" ShowToolBox="false" LegendXAlign="Center" LegendYAlign="Top"
                LegendOrient="Horizontal" Height="400px">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
