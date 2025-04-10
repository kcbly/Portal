<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BidProject.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.BidProject" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="投标分析" />
<zhongsoft:EChart ID="bidProjChart" runat="server" Width="500px" TitleXAlign="Left"
    TitleYAlign="Top" ShowToolBox="false" LegendXAlign="Center" LegendYAlign="Top"
    LegendOrient="Horizontal" Height="400px">
</zhongsoft:EChart>
