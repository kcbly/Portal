<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AwardsStaticOfProject.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ScientificResearchStaticInfo.AwardsStaticOfProject" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="工程获奖" />
<zhongsoft:EChart ID="AwardsStaticOfProjectChart" runat="server" Width="1050px" Height="400px"
    ShowLegend="true" TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right"
    ToolboxYAlign="Top" SubText="单位：个数" LegendXAlign="Center" LegendYAlign="Top"
    LegendOrient="Horizontal" ClientClickFunction="showAward">
</zhongsoft:EChart>
<!-- 此处secid 值，需要根据实际服务器配置作出调整--->
<script type="text/javascript">
    function showAward(pa1, pa2, pa3) {
        var year = pa2.substring(0, pa2.indexOf("年"));
        var level = pa1;
        var url = buildQueryUrl("Custom/List/DispListNew.aspx", { "secid": "3B7D038C-6AFD-4DB9-A331-7D77104847DF", "AwardLevel": escape(level), "AwardYear": year });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>
