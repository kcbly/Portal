<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IntellectualProperty.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ScientificResearchStaticInfo.IntellectualProperty" %>
<table>
    <tr>
        <td>
            <zhongsoft:echart id="PropertyLineChart" runat="server" width="550px" height="550px"
                TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" ShowLegend="true" 
                LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" clientclickfunction="showIntellectualProperty">
        </zhongsoft:echart>
        </td>
        <td>
            <zhongsoft:echart id="PropertyDonutChart" runat="server" width="500px" height="550px"
                TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" ShowLegend="false" 
                LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal">
        </zhongsoft:echart>
            <!---ToolboxYAlign="Top" 用于刷新保存按钮-->
        </td>
    </tr>
</table>
<input id="hiStaticDataType" runat="server" type="hidden" />
<script type="text/javascript">
    function showIntellectualProperty(pa1, pa2, pa3) {
        var type = $("#<%=hiStaticDataType.ClientID %>").val();
        var patent = "<%=Zhongsoft.Portal.DSS.IntellectualPropertyStaticType.Patent.ToString() %>";
        var Tech = "<%=Zhongsoft.Portal.DSS.IntellectualPropertyStaticType.Tech.ToString() %>";
        var Software = "<%=Zhongsoft.Portal.DSS.IntellectualPropertyStaticType.Software.ToString() %>";

        var start = Number(pa2);
        var end = Number(pa2);

        var selectFilter = pa1;
        if (pa1 == "合计") {
            selectFilter = "";
        }

        var url = buildQueryUrl("TSM/List/TSM/PatentTechnologyList.aspx", { "actionType": 1, "PatentType": escape(selectFilter), "StartYear": start, "EndYear": end });

        if (type == Tech) {
            var url = buildQueryUrl("TSM/List/TSM/ProprietaryTechnicalList.aspx", { "actionType": 1, "RightScope": escape(selectFilter), "StartYear": start, "EndYear": end });
        }
        else if (type == Software) {
            var url = buildQueryUrl("TSM/List/TSM/SoftwareCopyRightList.aspx", { "actionType": 1, "RightScope": escape(selectFilter), "StartYear": start, "EndYear": end });
        }
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }
</script>
