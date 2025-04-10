<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BusinessInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.BusinessInfo" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" />
<table>
    <tr runat="server" id="trRate">
        <td>
            <div style="float: right">
                <span style="color: Blue">
                    <asp:Label ID="lbRate" runat="server" /></span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="businessChart" runat="server" Width="500px" TitleXAlign="Left"
                TitleYAlign="Top" ShowToolBox="false" ShowLegend="false" LegendXAlign="Center"
                LegendYAlign="Top" LegendOrient="Horizontal" Height="400px">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<input id="hiBusinessYear" runat="server" type="hidden" />
<input id="hiCondition" runat="server" type="hidden" />
<script type="text/javascript">
    function showBusinessInfo<%=this.ClientID %>(pa1, pa2, pa3) {
        //按时间
        var year;
        var month="";
        var staTypeName="";
        var isTarget="";
        var condition = $("#<%=hiCondition.ClientID %>").val();
        if (pa2.indexOf("年") > 0) {
            year = pa2.substring(0, pa2.indexOf("年"));
        }
        else if (pa2.indexOf("季") > 0 || pa2.indexOf("月") > 0) {
            var myDate = new Date();
            year = myDate.getFullYear();
            if (pa2.indexOf("季") > 0) {
                var quarter = pa2.substring(0, pa2.indexOf("季"));
                var start = (quarter - 1) * 3;
                month = (start + 1).toString() + "," + (start + 2).toString() + "," + (start + 3).toString();
            }
            else {
                month = pa2.substring(0, pa2.indexOf("月"));
            }
        }
        //按照部门统计
        else {
            condition="";
            year = $("#<%=hiBusinessYear.ClientID %>").val();
            staTypeName = pa2;
            if(pa1=="目标值"){
                isTarget=1;
            }
        }
        var url = buildQueryUrl("DSS/List/BusinessInfoList.aspx", { "actionType": 1, "Year": year, "Month": month, "StaColumn": "<%=FactValueType %>", "StaTypeName": escape(staTypeName), "IsTarget":isTarget,"Condition":escape(condition) });
        showDivDialog(url, null, 850, 550, null);
        return false;
    }  
</script>
