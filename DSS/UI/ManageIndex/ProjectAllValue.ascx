<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectAllValue.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.ProjectAllValue" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="项目产值" />
<table>
    <tr>
        <td>
            <div style="float: right">
                <span style="color: Blue">
                    <asp:Label ID="lbRate" runat="server" /></span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="projChart" runat="server" Width="500px" TitleXAlign="Left"
                TitleYAlign="Top" ShowToolBox="false" ShowLegend="false" LegendXAlign="Center"
                LegendYAlign="Top" LegendOrient="Horizontal" Height="400px" SubText="万元">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
