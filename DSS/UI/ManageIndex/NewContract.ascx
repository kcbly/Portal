<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewContract.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.ManageIndex.NewContract" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="新签合同" />
<table>
    <tr>
        <td>
            <div style="float: right">
                <span style="color: Blue">
                    <asp:Label ID="lbRate" runat="server" /></span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:EChart ID="contractChart" runat="server" Width="500px" TitleXAlign="Left"
                SubText="合同额：万元" TitleYAlign="Top" LegendXAlign="Center" ShowToolBox="false"
                LegendYAlign="Top" LegendOrient="Horizontal" Height="400px" ClientClickFunction="showContractInfo">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
<input id="hiBusinessYear" runat="server" type="hidden" />
<input id="hiCondition" runat="server" type="hidden" />
<script type="text/javascript">
    function showContractInfo(pa1, pa2, pa3) {
        //按时间
        var year;
        var month = "";
        var staTypeName = "";
        var isTarget = "";
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
            year = $("#<%=hiBusinessYear.ClientID %>").val();
            staTypeName = pa2;
            if (pa1 == "目标值") {
                isTarget = 1;
            }
        }
        var url = buildQueryUrl("DSS/List/BusinessInfoList.aspx", { "actionType": 1, "Year": year, "Month": month, "StaColumn": "<%=Zhongsoft.Portal.DSS.FactValueName.新签合同.GetHashCode().ToString() %>", "StaTypeName": escape(staTypeName), "IsTarget": isTarget });
        if (isTarget != 1) {
            var start = "";
            var end = "";
            if (month == "") {
                start = year + "-01-01";
                end = year + "-12-31";
            }
            else if (pa2.indexOf("季") > 0) {
                var quarter = pa2.substring(0, pa2.indexOf("季"));
                var begin = (quarter - 1) * 3;
                var num = "30";
                start = year + "-" + (begin + 1).toString() + "-01";
                if ((begin + 3) == 3 || (begin + 3) == 12) {
                    num = "31";
                }
                end = year + "-" + (begin + 3).toString() + "-" + num;
            }
            else {
                start = year + "-" + month + "-01";
                var num = "30";
                if (month == 2) {
                    if (isLeapYear(year)) {
                        num = "29";
                    }
                    else {
                        num = "28";
                    }
                }
                else if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                    num = "31";
                }
                end = year + "-" + month + "-" + num;
            }
            var condition = $("#<%=hiCondition.ClientID %>").val();
            url = buildQueryUrl("MM/List/MCM/ContractList.aspx", { "actionType": 1, "baseType": "contract", "isReturn": 1, "startDate": start, "endDate": end, "undertakeDeptName": escape(staTypeName), "secid": "69CDD3E8-F2C3-4C28-A93B-D68709E69885", condition: escape(condition) });
        }
        showDivDialog(url, null, 850, 550, null);
        return false;
    }

    //是否闰年
    function isLeapYear(year) {
        return (year % 4 == 0) && (year % 100 != 0 || year % 400 == 0);
    }
</script>
