<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectState.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.ProjectState" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="各项目状态对比" />
<zhongsoft:EChart ID="projStateChart" runat="server" Width="500px" TitleXAlign="Left"
    TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" ShowLegend="false"
    LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" Height="400px">
</zhongsoft:EChart>
