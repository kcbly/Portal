<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResearchDistribution.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.ScientificIndex.ResearchDistribution" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="科研项目分布" />
<table>
    <tr>
        <td>
            <zhongsoft:EChart ID="ResearchDistributionBar" runat="server" Width="550px" Height="400px"
                TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" ShowLegend="false"
                LegendXAlign="Center" LegendYAlign="Top" LegendOrient="Horizontal" CategoryAxisRotate="25" show
                 ClientClickFunction="ShowResearchDistributionBar" >
            </zhongsoft:EChart>
        </td>
        <td>
            <zhongsoft:EChart ID="ResearchDistributionPie" runat="server" Width="600px" Height="400px" ShowLegend="false"
                TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" 
                LegendXAlign="Center" LegendYAlign="Bottom" LegendOrient="Horizontal" ItemLabelFormatter="{b}" 
                ClientClickFunction="ShowResearchDistributionPie"  >
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiCondition" />
<script type="text/javascript" >

    function ShowResearchDistributionBar(p1, p2, p3) {
        
        var dept = p2;
        var sStartYear = "";
        var sEndYear = "";
        var myDate = new Date();
        var nowYear = myDate.getFullYear();
        var startYear = 0;
        var endYear = 0;
        /* p1为柱状图的项名称，如果是新项目：筛选当前年份的项目信息，如果是现有项目则筛选全部 */
        if (p1 == "新项目") {
            startYear = nowYear;
            endYear = nowYear;
        } else if (p1 == "现有项目") {
            startYear = 2015;
            endYear = nowYear;
        }
        if (startYear == 0 || endYear == 0) {
            startYear = 2015;
            endYear = nowYear;
        }
        sStartYear = startYear.toString() + "-01-01";
        sEndYear = endYear.toString() + "-12-31";
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx",
        {
            "secid": "71A42419-6F65-4C18-B727-E46C85C00E15",
            "pDeptName": encodeURI(dept), //对汉字进行编码
            "pType": " ",
            "pStartDate": sStartYear,
            "pEndDate" : sEndYear
         });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>
<script type="text/javascript">
    function ShowResearchDistributionPie(p1, p2, p3) {
        var sDeptName = p2;
        var sStartYear = "2015-01-01";
        var sEndYear = "2050-12-31";
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx",
        {
            "secid": "71A42419-6F65-4C18-B727-E46C85C00E15", //6C87F64D-058A-4BC1-8652-938BD90299B4这个ID不存在，改掉
            "pDeptName": encodeURI(sDeptName), //对汉字进行编码
            "pType": " ",
            "pStartDate": sStartYear,
            "pEndDate": sEndYear
        });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>