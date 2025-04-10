<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BidBond.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.BidBond" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="投标保证金" />
<zhongsoft:EChart ID="bidProjChart" runat="server" Width="500px" TitleXAlign="Left"
    TitleYAlign="Top" ShowToolBox="false" ShowLegend="false" LegendXAlign="Center"
    LegendYAlign="Top" LegendOrient="Horizontal" Height="400px" SubText="万元">
</zhongsoft:EChart>
