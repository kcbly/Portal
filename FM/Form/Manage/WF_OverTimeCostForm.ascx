<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OverTimeCostForm.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_OverTimeCostForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
     <tr>
        <td class="td-l">申请单编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplicationNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_OverTimeCostForm" Field="ApplicationNo" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班部门<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtOverTimeDeptName" field="OverTimeDeptName" req="1"
                SelectPageMode="Dialog" tablename="FM_Manage_OverTimeCostForm" activestatus="(23.填写申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" PageHeight="650px"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="false" ResultForControls="{'hiOverTimeDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiOverTimeDeptId" runat="server" type="hidden" tablename="FM_Manage_OverTimeCostForm" field="OverTimeDeptId" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班日期起<span class="req-star">*</span></td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiOverTimeStart" field="OverTimeStart" tablename="FM_Manage_OverTimeCostForm" />
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1" activestatus="(23.填写申请)" />
            <zhongsoft:LightTextBox ID="txtStartDateHour" activestatus="(23.填写申请)" regex="^([0-9]|(1[0-9])|(2[0-3]))$" errmsg="加班日期起的小时应为0-23的正整数"
                class="kpms-textbox" runat="server" req="1" Width="30px" />
            <zhongsoft:LightDropDownList ID="ddlStartDateMinute" runat="server" Width="75px" activestatus="(23.填写申请)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">加班日期止<span class="req-star">*</span></td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiOverTimeEnd" field="OverTimeEnd" tablename="FM_Manage_OverTimeCostForm" />
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1" activestatus="(23.填写申请)" />
            <zhongsoft:LightTextBox ID="txtEndDateHour" activestatus="(23.填写申请)" regex="^([0-9]|(1[0-9])|(2[0-3]))$" errmsg="加班日期止的小时应为0-23的正整数"
                class="kpms-textbox" runat="server" req="1" Width="30px" />
            <zhongsoft:LightDropDownList ID="ddlEndDateMinute" runat="server" Width="75px" activestatus="(23.填写申请)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">加班事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtOverTimeReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_OverTimeCostForm" field="OverTimeReason"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">加班人员<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtOverTimeUserNames" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="OverTimeUserNames" tablename="FM_Manage_OverTimeCostForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                IsMutiple="true" ResultForControls="{'hiOverTimeUserIDs':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOverTimeUserIDs" field="OverTimeUserIDs" tablename="FM_Manage_OverTimeCostForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班费用估算（元）</td>
        <td colspan="3">
            <table class="tz-table">
                <tr>
                    <td class="td-l">住宿</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtZhuSuCost" class="kpms-textbox-money" activestatus="(23.填写申请)" field="ZhuSuCost" Width="75"
                            errmsg="【住宿】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_OverTimeCostForm" onblur="autoComputeTotalMoney()">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">交通</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtJiaoTongCost" class="kpms-textbox-money" activestatus="(23.填写申请)" field="JiaoTongCost" Width="75"
                            errmsg="【交通】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_OverTimeCostForm" onblur="autoComputeTotalMoney()">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">用餐</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtDiningCost" class="kpms-textbox-money" activestatus="(23.填写申请)" field="DiningCost" Width="75"
                            errmsg="【用餐】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_OverTimeCostForm" onblur="autoComputeTotalMoney()">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">其他</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtOtherCost" class="kpms-textbox-money" activestatus="(23.填写申请)" field="OtherCost" Width="75"
                            errmsg="【其他】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_OverTimeCostForm" onblur="autoComputeTotalMoney()">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">合计（小写）<span class="req-star">*</span></td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="txtSumCost" runat="server" CssClass="kpms-textbox-money" Width="250" req="1"
                            TableName="FM_Manage_OverTimeCostForm" Field="SumCost" Activestatus="(23.填写申请)">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">合计（大写）<span class="req-star">*</span></td>
                    <td class="td-r" colspan="3">
                        <zhongsoft:LightTextBox ID="txtSumCostUpper" runat="server" CssClass="kpms-textbox-money" Width="250" req="1"
                            TableName="FM_Manage_OverTimeCostForm" Field="SumCostUpper" Activestatus="(23.填写申请)">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否计入项目<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_OverTimeCostForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_OverTimeCostForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_OverTimeCostForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_OverTimeCostForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_OverTimeCostForm"
                Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_OverTimeCostForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_OverTimeCostForm"
                field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_OverTimeCostForm" field="Remark"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>

<input type="hidden" id="hiKeyId" runat="server" field="OverTimeCostFormId" tablename="FM_Manage_OverTimeCostForm" value="" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
    }

    $("#<%=rblIsProject.ClientID%>").live("change", function () {
        SetIsShow();
    });
    function SetIsShow() {
        var value = $('#<%=rblIsProject.ClientID %>').find("input:checked").val();
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#<%=txtProjectCode.ClientID%>").attr("req", "1");
            $("#<%=txtManagerUserName.ClientID%>").attr("req", "1");
            $("#tdProjectName").html("项目名称<span class='req-star'>*</span >");
            $("#tdProjectCode").html("项目编号<span class='req-star'>*</span >");
            $("#tdManagerUserName").html("项目经理/执行经理<span class='req-star'>*</span >");
            $("#tr1").show();
            $("#tr2").show();
        }
        else {
            $("#<%=txtProjectName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectCode.ClientID%>").removeAttr("req");
            $("#<%=txtManagerUserName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectName.ClientID%>").val("");
            $("#<%=hiOrganizationID.ClientID%>").val("");
            $("#<%=txtProjectCode.ClientID%>").val("");
            $("#<%=hiManagerUserID.ClientID%>").val("");
            $("#<%=txtManagerUserName.ClientID%>").val("");
            $("#tr1").hide();
            $("#tr2").hide();
        }
    }

    function autoComputeTotalMoney() {
        var sumValue = 0;
        var ZhuSuCost = $("#<%=txtZhuSuCost.ClientID%>").val();
        var JiaoTongCost = $("#<%=txtJiaoTongCost.ClientID%>").val();
        var DiningCost = $("#<%=txtDiningCost.ClientID%>").val();
        var OtherCost = $("#<%=txtOtherCost.ClientID%>").val();
        sumValue = accAddFloat6(ZhuSuCost, sumValue);
        sumValue = accAddFloat6(JiaoTongCost, sumValue);
        sumValue = accAddFloat6(DiningCost, sumValue);
        sumValue = accAddFloat6(OtherCost, sumValue);
        $("#<%=txtSumCost.ClientID%>").val(sumValue);
        convertToCHNMoney("<%=txtSumCost.ClientID %>", "<%=txtSumCostUpper.ClientID %>");
    }

    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            var end = $('#<%=txtEndDate.ClientID %>').val();
            var start = $('#<%=txtStartDate.ClientID %>').val();
            var starthour = $('#<%=txtStartDateHour.ClientID %>').val();
            var endhour = $('#<%=txtEndDateHour.ClientID %>').val();
            var endminute = $('#<%=ddlEndDateMinute.ClientID %>').find("option:selected").text();
            var startminute = $('#<%=ddlStartDateMinute.ClientID %>').find("option:selected").text();
            var startDate = start.toString() + " " + (starthour > 10 ? starthour.toString() : "0" + starthour.toString()) + ":" + startminute + ":00";
            var endDate = end.toString() + " " + (endhour > 10 ? endhour.toString() : "0" + endhour.toString()) + ":" + endminute + ":00";
            if (new Date(Date.parse(startDate.replace(/-/g, "/"))) >= new Date(Date.parse(endDate.replace(/-/g, "/")))) {
                alert("-加班日期起应早于加班日期止！");
                return false;
            }

            //if (start != "" && end != "") {
            //    var date1 = new Date(Date.parse(start.replace(/-/g, "/")));
            //    var date2 = new Date(Date.parse(end.replace(/-/g, "/")));
            //    var date3 = date2.getTime() - date1.getTime() //时间差的毫秒数
            //    if (date3 < 0) {
            //        alert("-加班日期起应早于加班日期止！");
            //        return false;
            //    }
            //    else {
            //        if (floatParse(starthour) > floatParse(endhour)) {
            //            alert("-加班日期起应早于加班日期止！");
            //            return false;
            //        }
            //        else {
            //            if (floatParse(startminute) >= floatParse(endminute)) {
            //                alert("-加班日期起应早于加班日期止！");
            //                return false;
            //            }
            //        }
            //    }
            //}
            var sumValue = 0;
            var ZhuSuCost = $("#<%=txtZhuSuCost.ClientID%>").val();
            var JiaoTongCost = $("#<%=txtJiaoTongCost.ClientID%>").val();
            var DiningCost = $("#<%=txtDiningCost.ClientID%>").val();
            var OtherCost = $("#<%=txtOtherCost.ClientID%>").val();
            sumValue = accAddFloat6(ZhuSuCost, sumValue);
            sumValue = accAddFloat6(JiaoTongCost, sumValue);
            sumValue = accAddFloat6(DiningCost, sumValue);
            sumValue = accAddFloat6(OtherCost, sumValue);
            if (sumValue == 0) {
                alert("-必须填写一项加班费用估算（元）！");
                return false;
            }
            return true;
        }
    }
</script>
