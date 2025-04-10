<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResearchAward.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ScientificIndex.ResearchAward" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="科技成果获奖" />
<table>
    <tr>
        <td>
            <zhongsoft:EChart ID="ResearchAwardLine" runat="server" Width="550px" Height="400px"
                ShowLegend="false" TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right"
                ToolboxYAlign="Top" SubText="单位：个数" LegendXAlign="Center" LegendYAlign="Top"
                LegendOrient="Horizontal" ClientClickFunction="ShowResearchAwardLine">
            </zhongsoft:EChart>
        </td>
        <td>
            <zhongsoft:EChart ID="ResearchAwardPie" runat="server" Width="500px" Height="400px"
                ShowLegend="false" TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right"
                ToolboxYAlign="Top" LegendXAlign="Center" LegendYAlign="Bottom" LegendOrient="Horizontal"
                ItemLabelFormatter="{b}" ClientClickFunction="ShowResearchAwardPie">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiCondition" />
<script type="text/javascript">
    function ShowResearchAwardLine(p1, p2, p3) {
        var sYear = "";
        var url = "";
        if (p2.indexOf("年") > 0) {
            sYear = p2.substring(0, p2.indexOf("年"));

            url = buildQueryUrl("TSM/List/TSM/TechAchievementAwardList.aspx",
            {
                "actionType": 1,
                "baseType": "contract",
                "isReturn": 1,
                "secid": "2B725D5A-4FFE-46E6-8416-307685A06929",
                "TechYear": sYear,
                "TechType": " "
            });
        }
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }
</script>
<script type="text/javascript">
    function ShowResearchAwardPie(p1, p2, p3) {
        var type = p2;
        var nDate = new Date();
        var ny = nDate.getFullYear();
        var sy = ny - 9;
        var nYear = ny.toString();
        var sYear = sy.toString();

        var url = buildQueryUrl("TSM/List/TSM/TechAchievementAwardList.aspx",
        {
            "actionType": 1,
            "baseType": "contract",
            "isReturn": 1,
            "secid": "2B725D5A-4FFE-46E6-8416-307685A06929",
            "TechType": encodeURI(type), //对汉字进行编码
            "StartYear": sYear,
            "EndYear": nYear
        });
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }
</script>
