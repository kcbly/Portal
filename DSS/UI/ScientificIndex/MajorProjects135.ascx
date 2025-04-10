<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MajorProjects135.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ScientificIndex.MajorProjects135" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="十三五重大科技项目进度图" />
<table>
    <tr>
        <td>
            <!-- 可加入该字段使X轴字体倾斜 CategoryAxisRotate="45" -->
            <zhongsoft:EChart ID="MajorProjects135Bar" runat="server" Width="1050px" Height="400px"
                CategoryAxisRotate="5" TitleXAlign="Left" TitleYAlign="Top" ToolboxXAlign="Right"
                ToolboxYAlign="Top" ShowLegend="false" LegendXAlign="Center" LegendYAlign="Top"
                LegendOrient="Horizontal" AxisLabelFormatter="{value}%" ItemLabelFormatter="{c}%"
                ClientClickFunction="ShowMajorProjects135Bar">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function ShowMajorProjects135Bar(p1, p2, p3) {
        var sType = "重大";
        var sStartYear = "2014-01-01";
        var sEndYear = "2020-12-31";
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx",
        {
            "secid": "6C87F64D-058A-4BC1-8652-938BD90299B4",
            "pType": encodeURI(sType), //对汉字进行编码
            "pDeptName": " ",
            "pStartDate": sStartYear,
            "pEndDate": sEndYear
        });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>
