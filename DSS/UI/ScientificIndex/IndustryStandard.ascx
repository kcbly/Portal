<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IndustryStandard.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ScientificIndex.IndustryStandard" %>
<table class="tz-table" width="100%">
    <tr id="tr1">
        <td class="box-title">
            <img src="<%=WebAppPath%>/themes/images/rightnavlink.png" />
            <asp:Label ID="lbName" runat="server" />
        </td>
        <td class="box-header">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbInfo" runat="server" />
        </td>
        <td style="text-align: right">
            <asp:Label ID="lbRight" runat="server" CssClass="color:red"></asp:Label>
        </td>
    </tr>
</table>
<table>
    <tr>
        <td>
            <zhongsoft:EChart ID="IndustryStandardPieByType" runat="server" Width="525px" Height="400px"
                ShowLegend="false" TitleXAlign="Center" TitleYAlign="Top" ToolboxXAlign="Right"
                ToolboxYAlign="Top" MainTitle="科标业项目统计图（按标准级别）" LegendXAlign="Center" LegendYAlign="Bottom"
                LegendOrient="Horizontal" ItemLabelFormatter="{b}" ClientClickFunction="ShowStandardByType">
            </zhongsoft:EChart>
        </td>
        <td>
            <zhongsoft:EChart ID="IndustryStandardPieByMajor" runat="server" Width="525px" Height="400px"
                ShowLegend="false" TitleXAlign="Center" TitleYAlign="Top" ToolboxXAlign="Right"
                ToolboxYAlign="Top" MainTitle="科标业项目统计图（按参编情况）" LegendXAlign="Center" LegendYAlign="Bottom"
                LegendOrient="Horizontal" ItemLabelFormatter="{b}" ClientClickFunction="ShowStandardByMajor">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiTypeCondition" />
<input type="hidden" runat="server" id="hiMajorCondition" />
<script type="text/javascript">
    function ShowStandardByType(p1, p2, p3) {
        var type = p2;
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx",
        {
            "secid": "F1B955E6-F6D3-4E3A-B26E-31B6119AE4DB",
            "pType": encodeURI(type) //对汉字进行编码
        });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>
<script type="text/javascript">
    function ShowStandardByMajor(p1, p2, p3) {
        var major = p2;
        var url = buildQueryUrl("/Custom/List/DispListNew.aspx",
        {
            "secid": "F1B955E6-F6D3-4E3A-B26E-31B6119AE4DB",
            "pMajor": encodeURI(major) //对汉字进行编码
        });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }
</script>
