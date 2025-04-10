<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReportBackForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_ReportBackForm" %>
<table class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">销假人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtReporterName" activestatus="(23.填写销假申请)(23.修改销假申请)"
                req="1" ReadOnly="true" field="ReporterName" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">工号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtReporterCode" activestatus="(23.填写销假申请)(23.修改销假申请)"
                ReadOnly="true" field="ReporterCode" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">所属部门
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:LightTextBox runat="server" ID="txtReporterDeptName" activestatus="(23.填写销假申请)(23.修改销假申请)"
                ReadOnly="true" field="ReporterDeptName" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">办公电话
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtPhone" activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false"
                regex="^\d+$" errmsg="请输入正确的电话号码" MaxLength="24" field="Phone" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">手机号码
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtMobilePhone" activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false"
                Style="width: 165px;" regex="^\d+$" errmsg="请输入正确的手机号码" MaxLength="24"
                field="MobilePhone" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">填表日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtReportBackDate" runat="server" activestatus="(23.填写销假申请)(23.修改销假申请)"
                req="1" class="kpms-textbox-date" field="ReportBackDate" tablename="EHR_ReportBackForm" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">请假申请</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="selHoliday" IsMutiple="false"
                SelectPageMode="Dialog" ShowSelectBtn="true" ResultForControls="{'hiAbsentApplyID':'id','hiAbsentName':'name',
                'txtAbsentType':'YearlLeaveType','hiAbsentType':'YearlLeaveType',
                'txtApplyStartDate':'StartDateStr','txtApplyEndDate':'EndDateStr',
                'txtApplyStartDatePeriod':'StartDatePeriod','hiApplyStartDatePeriod':'StartDatePeriod',
                'txtApplyEndDatePeriod':'EndDatePeriod','hiApplyEndDatePeriod':'EndDatePeriod',
                'txtApplyDays':'ApplyHolidayDays','hiApplyDays':'ApplyHolidayDays',
                'txtNewHolidayDays':'NewHolidayDays','hiNewHolidayDays':'NewHolidayDays',
                'txtUPHolidayDays':'UPHolidayDays','hiUPHolidayDays':'UPHolidayDays',
                'hiCheckReportBack':'ReportBackID'}"
                EnableTheming="false" Text="选择请假申请" PageUrl="~/EHR/Obsolete/AbsentApplySelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写销假申请)(23.修改销假申请)"
                PageWidth="800" AfterSelect="afterSelect()" field="AbsentName" tablename="EHR_ReportBackForm" valuetype="leave" />
            <input type="hidden" runat="server" id="hiAbsentName" field="AbsentName" tablename="EHR_ReportBackForm" valuetype="leave" />
            <input type="hidden" runat="server" id="hiAbsentApplyID" field="YearLeaveApplyID" tablename="EHR_ReportBackForm" valuetype="leave" />
            <input type="hidden" runat="server" id="hiCheckReportBack" />
        </td>
        <td class="td-l">请假类型<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtAbsentType" activestatus="(23.填写销假申请)(23.修改销假申请)"
                req="1" ReadOnly="true" group="1" field="AbsentType" tablename="EHR_ReportBackForm" valuetype="leave"></zhongsoft:LightTextBox>
            <input type="hidden" id="hiAbsentType" runat="server" group="1" field="AbsentType" tablename="EHR_ReportBackForm" valuetype="leave" />
        </td>
        <td class="td-l">请假天数
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtApplyDays" EnableTheming="false" activestatus="(23.填写销假申请)(23.修改销假申请)"
                CssClass="kpms-textbox-money" ReadOnly="true" group="2" valuetype="leave">
            </zhongsoft:LightTextBox>
            <input type="hidden" id="hiApplyDays" runat="server" group="2" valuetype="leave" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假时间</td>
        <td class="td-r">
            <span>起：</span>
            <zhongsoft:XHtmlInputText ID="txtApplyStartDate" runat="server" class="kpms-textbox-comparedate"
                activestatus="(23.填写销假申请)(23.修改销假申请)" readonly="readonly" valuetype="leave" time="start" />
            <zhongsoft:LightTextBox runat="server" ID="txtApplyStartDatePeriod" ReadOnly="true" EnableTheming="false"
                activestatus="(23.填写销假申请)(23.修改销假申请)" Width="60" group="8" valuetype="leave"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiApplyStartDatePeriod" group="8" valuetype="leave" period="start" />
            <br />
            <span>止：</span>
            <zhongsoft:XHtmlInputText ID="txtApplyEndDate" runat="server" class="kpms-textbox-comparedate"
                activestatus="(23.填写销假申请)(23.修改销假申请)" readonly="readonly" valuetype="leave" time="end" />
            <zhongsoft:LightTextBox runat="server" ID="txtApplyEndDatePeriod" ReadOnly="true" EnableTheming="false"
                activestatus="(23.填写销假申请)(23.修改销假申请)" Width="60" group="3" valuetype="leave"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiApplyEndDatePeriod" group="3" valuetype="leave" period="end" />
        </td>
        <td class="td-l">
            <span hidegroup="1" style="display: none">本年度休假天数</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtNewHolidayDays" CssClass="kpms-textbox-money"
                activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false" ReadOnly="true" hidegroup="1" Style="display: none"
                regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$" MaxLength="5" valuecompare="1" group="4" valuetype="leave"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiNewHolidayDays" group="4" valuetype="leave" />
        </td>
        <td class="td-l">
            <span hidegroup="1" style="display: none">补休上年度休假天数</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtUPHolidayDays" CssClass="kpms-textbox-money"
                activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false" ReadOnly="true" hidegroup="1" Style="display: none"
                regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$" MaxLength="5" valuecompare="2" group="5" valuetype="leave"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiUPHolidayDays" group="5" valuetype="leave" />
        </td>
    </tr>
    <tr>
        <td class="td-l">销假时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <span>起：</span>
            <zhongsoft:XHtmlInputText ID="txtReportBackStartDate" runat="server" class="kpms-textbox-comparedate" activestatus="(23.填写销假申请)(23.修改销假申请)"
                compare="back" req="1" readonly="readonly" field="ReportBackStartDate" tablename="EHR_ReportBackForm" time="start" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlStartDatePeriod" EnableTheming="false" activestatus="(23.填写销假申请)(23.修改销假申请)"
                field="ReportBackStartDatePeriod" tablename="EHR_ReportBackForm" Width="64" period="start">
                <asp:ListItem Text="全天" Value="全天"></asp:ListItem>
                <asp:ListItem Text="上午" Value="上午"></asp:ListItem>
                <asp:ListItem Text="下午" Value="下午"></asp:ListItem>
            </zhongsoft:LightDropDownList>
            <br />
            <span>止：</span>
            <zhongsoft:XHtmlInputText ID="txtReportBackEndDate" runat="server" class="kpms-textbox-comparedate" activestatus="(23.填写销假申请)(23.修改销假申请)"
                compare="back" req="1" readonly="readonly" field="ReportBackEndDate" tablename="EHR_ReportBackForm" time="end" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlEndDatePeriod" EnableTheming="false" activestatus="(23.填写销假申请)(23.修改销假申请)"
                field="ReportBackEndDatePeriod" tablename="EHR_ReportBackForm" Width="64" period="end">
                <asp:ListItem Text="全天" Value="全天"></asp:ListItem>
                <asp:ListItem Text="上午" Value="上午"></asp:ListItem>
                <asp:ListItem Text="下午" Value="下午"></asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">销假天数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtReportBackDateNum" EnableTheming="false" activestatus="(23.填写销假申请)(23.修改销假申请)"
                CssClass="kpms-textbox-money" ReadOnly="true" group="6" field="ReportBackDateNum" tablename="EHR_ReportBackForm">
            </zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiReportBackDateNum" group="6" field="ReportBackDateNum" tablename="EHR_ReportBackForm" />
        </td>
        <td class="td-l">实休天数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtActualAbsentDateNum" EnableTheming="false" activestatus="(23.填写销假申请)(23.修改销假申请)"
                CssClass="kpms-textbox-money" ReadOnly="true" group="7" field="ActualAbsentDateNum" tablename="EHR_ReportBackForm">
            </zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiActualAbsentDateNum" group="7" field="ActualAbsentDateNum" tablename="EHR_ReportBackForm" />
            <asp:Button runat="server" ID="btnCal" OnClick="btnCal_Click" Text="计算实休天数" displaystatus="(23.填写销假申请)(23.修改销假申请)"
                OnClientClick="return checkChooseValid()" />
        </td>
    </tr>
    <tr hidegroup="1" style="display: none">
        <td class="td-l">
            <span>
                <span>销本年度<br />
                    年休假天数
                <span class="req-star">*</span>
                </span>
            </span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtReportBackNewHolidayDays" CssClass="kpms-textbox-money"
                activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false" valuevalid="1" valuecompare="1" enabledinput="1"
                regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$" MaxLength="5" field="ReportBackNewHolidayDays" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            <span>
                <span>销上年度<br />
                    年休假天数
                <span class="req-star">*</span>
                </span>
            </span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtReportBackUPHolidayDays" CssClass="kpms-textbox-money"
                activestatus="(23.填写销假申请)(23.修改销假申请)" EnableTheming="false" valuevalid="1" valuecompare="2" enabledinput="1"
                regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$" MaxLength="5" field="ReportBackUPHolidayDays" tablename="EHR_ReportBackForm"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l"></td>
        <td class="td-r"></td>
    </tr>
    <tr>
        <td class="td-l">销假说明<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtReportBackDetails" TextMode="MultiLine"
                req="1" activestatus="(23.填写销假申请)(23.修改销假申请)" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" field="ReportBackDetails" tablename="EHR_ReportBackForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="txtRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Remark" tablename="EHR_ReportBackForm"
                activestatus="(23.填写销假申请)(23.修改销假申请)(3.审核)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--员工ID--%>
<input type="hidden" id="hiUserId" runat="server" field="ReporterID" tablename="EHR_ReportBackForm" />
<%--部门ID--%>
<input type="hidden" id="hiUserDeptID" runat="server" field="ReporterDeptID" tablename="EHR_ReportBackForm" />
<%--流程ID--%>
<input type="hidden" id="hiReportBackID" runat="server" field="ReportBackID" tablename="EHR_ReportBackForm" />
<%--EHR部门ID--%>
<input type="hidden" runat="server" id="hiEhrID" value="0F0D9FAA-0FEF-4E97-B259-30978888F284" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("*[valuevalid]").keyup(checkValid);
        $("*[enabledinput]").blur(checkCompare);
        $("*[group]").each(loadValue);
        afterSelect();
    }

    function checkForm() {
        var b = true;
        //保存或发送对带薪年休假的天数进行检查
        if (($formAction == 0 || $formAction == 2)
            && $("#<%=hiAbsentType.ClientID%>").val() == "带薪年休假") {
            $("*[enabledinput='1']").each(function () {
                if (!isNumber($(this).val())) {
                    b = false;
                }
            })
            if (!b) {
                alert("请填写年假销假天数！");
                $("*[enabledinput='1']").addClass("kpms-textboxred");
            }
        }
        return b;
    }

    function afterSelect() {
        if ($("#<%=hiCheckReportBack.ClientID%>").val().length > 0) {
            alert("该请假正在进行或已经完成销假，不能重复发起！");
            //清空已选的数据
            $("*[valuetype='leave']").val("");
        }
        if ($("#<%=hiAbsentType.ClientID%>").val() == "带薪年休假") {
            //自定义属性
            $("*[hidegroup='1']").show();
            $("input[valuevalid='1']").attr("req", "1");
        }
        else {
            $("*[hidegroup='1']").hide();
            $("input[valuevalid='1']").removeAttr("req");
        }
    }

    //检查值是否合法
    function checkValid() {
        var value = $(this).val();
        var sum = $("#<%=hiReportBackDateNum.ClientID%>").val();

        //在这个地方检查是否计算销假天数
        if (isNumber(sum)) {
            if (isNumber(value)) {
                var temp = parseFloat(value) % 0.5;
                //先检查输入是否为0.5的整数倍
                if (temp != 0) {
                    alert("天数错误，应为0.5的整数倍，请重新填写！");
                    $(this).val("");
                    $(this).addClass("kpms-textboxred");
                    $(this).focus();
                }//no
                else {
                    var $valuecompare = $(this).attr("valuecompare");
                    var temp2 = 0;
                    $("*[valuecompare='" + $valuecompare + "']").each(function (i) {
                        if (i == 0) {
                            temp2 = parseFloat($(this).val());
                        }
                        else if (isNumber($(this).val())) {
                            temp2 = temp2 - parseFloat($(this).val());
                            if (temp2 < 0) {
                                alert("年度销假天数不能大于该年度请假天数，请检查！");
                                $(this).val("");
                                $(this).addClass("kpms-textboxred");
                                $(this).focus();
                            }
                            //比较某年度销假天数与总销假天数
                            else if (parseFloat(value) > sum) {
                                alert("年假销假天数不能大于总销假天数！");
                                $(this).val("");
                                $(this).addClass("kpms-textboxred");
                                $(this).focus();
                            }
                        }//是数字
                    })//比较销假天数与请假天数
                }//yes
            }
        }
        else {
            alert("请先计算销假天数！");
        }
    }

    //比较值的大小
    function checkCompare() {
        //销年假的天数总和要等于销假天数
        var sum, sumTemp = 0;
        //输入时已经做了检查checkValid
        sum = parseFloat($("#<%=hiReportBackDateNum.ClientID%>").val());
        var b = true;
        $("*[enabledinput='1']").each(function () {
            if (isNumber($(this).val())) {
                sumTemp += parseFloat($(this).val());
            }
            else {
                b = false;
            }
        })
        //天数都填写了，再进行比较
        if (b) {
            if (sum != sumTemp) {
                alert("年假销假天数之和需要等于销假总天数，请检查！");
                $("*[enabledinput='1']").addClass("kpms-textboxred");
            }
            else {
                $("*[enabledinput='1']").removeClass("kpms-textboxred");
            }
        }//b=true
    }


    function loadValue() {
        if ($(this).val() != "") {
            $("*[group='" + $(this).attr("group") + "']").val($(this).val());
        }
    }

    //检查销假时间选择
    function checkChooseValid() {
        var b = true;
        //检查是否选择请假
        if (!checkLeaveApply()) {
            b = false;
            alert("请选择请假申请！");
        }
        //检查是否选择销假时间
        else if (!checkReportBackDate()) {
            b = false;
            alert("请选择销假起止时间！");
        }
        //检查销假时间段选择是否正确
        else if (!checkReportBackDateValid()) {
            b = false;
            alert("请选择正确的销假时段！");
        }
        //return false;
        return b;
    }

    //检查是否选择请假
    function checkLeaveApply() {
        var b = true;
        if ($.trim($("[field='YearLeaveApplyID']").eq(0).val()).length <= 0) {
            b = false;
        }
        return b;
    }

    //检查是否选择销假时间
    function checkReportBackDate() {
        var b = true;
        if ($.trim($("'[field='ReportBackStartDate']").eq(0).val()).length <= 0
            || $.trim($("'[field='ReportBackEndDate']").eq(0).val()).length <= 0) {
            b = false;
        }
        return b;
    }

    //检查销假时间段选择是否正确，正确为true，错误为false
    function checkReportBackDateValid() {
        var b = false;
        var applyStartDate = $("[time='start']").eq(0).val();
        var backStartDate = $("[time='start']").eq(1).val();
        var applyStartPeriod = $("[period='start']").eq(0).val();
        var backStartPeriod = $("[period='start']").eq(1).val();
        var applyEndDate = $("[time='end']").eq(0).val();
        var backEndDate = $("[time='end']").eq(1).val();
        var applyEndPeriod = $("[period='end']").eq(0).val();
        var backEndPeriod = $("[period='end']").eq(1).val();
        //请假与销假开始时间比较
        var numCompareStart = compareDateNew(applyStartDate, backStartDate);
        //结束时间比较
        var numCompareEnd = compareDateNew(applyEndDate, backEndDate);
        //销假结束时间
        var numCompareBack = compareDateNew(backStartDate, backEndDate);
        //申请开始等于销假开始，申请结束大于销假结束
        if (numCompareStart == 0 && numCompareEnd > 0) {
            //检查StartPeriod
            if (checkPeriodWithTwoStart(applyStartPeriod, backStartPeriod)) {
                b = reBWithStartAndEnd(numCompareBack, backStartPeriod, backEndPeriod, b);
            }
        }
        //申请开始等于销假开始，申请结束等于销假结束
        else if (numCompareStart == 0 && numCompareEnd == 0) {
            //都需要检查
            if (checkPeriodWithTwoStart(applyStartPeriod, backStartPeriod)
                && checkPeriodWithTwoEnd(applyEndPeriod, backEndPeriod)) {
                b = reBWithStartAndEnd(numCompareBack, backStartPeriod, backEndPeriod, b);
            }
        }
        //申请开始小于销假开始，申请结束等于销假结束
        else if (numCompareStart < 0 && numCompareEnd == 0) {
            if (checkPeriodWithTwoEnd(applyEndPeriod, backEndPeriod)) {
                b = reBWithStartAndEnd(numCompareBack, backStartPeriod, backEndPeriod, b);
            }
        }
        //申请开始小于销假开始，申请结束大于销假结束
        else if (numCompareStart < 0 && numCompareEnd > 0) {
            b = reBWithStartAndEnd(numCompareBack, backStartPeriod, backEndPeriod, b);
        }
        return b;
    }

    //检查请假与销假的StartPeriod，正确为true，错误为false
    function checkPeriodWithTwoStart(applyStartPeriod, backStartPeriod) {
        var b = false;
        if (applyStartPeriod.trim().length > 0) {
            if (applyStartPeriod == "全天" || applyStartPeriod == "上午") {
                b = true;
            }
            else if (backStartPeriod == "下午") {
                b = true;
            }
        }
        else {
            b = true;
        }
        return b;
    }

    //检查请假与销假的EndPeriod，正确为true，错误为false
    function checkPeriodWithTwoEnd(applyEndPeriod, backEndPriod) {
        var b = false;
        if (applyEndPeriod.trim().length > 0) {
            if (applyEndPeriod == "全天" || applyEndPeriod == "下午") {
                b = true;
            }
            else if (backEndPriod == "上午") {
                b = true;
            }
        }
        else {
            b = true;
        }
        return b;
    }

    //检查销假的StartPeriod和EndPeriod，正确为true，错误为false
    function checkPeriodWithStartAndEnd(startPeriod, endPeriod) {
        var b = false;
        if (startPeriod == "全天" && endPeriod == "全天") {
            b = true;
        }
        else if (startPeriod == "上午" && (endPeriod == "上午" || endPeriod == 下午)) {
            b = true;
        }
        else if (startPeriod == "下午" && endPeriod == "下午") {
            b = true;
        }
        return b;
    }

    //根据销假起止是否相等返回结果
    function reBWithStartAndEnd(numCompareBack, backStartPeriod, backEndPeriod, b) {
        //销假开始时间与结束时间相等
        if (numCompareBack == 0) {
            if (checkPeriodWithStartAndEnd(backStartPeriod, backEndPeriod)) {
                b = true;
            }
        }
        else {
            b = true;
        }
        return b;
    }

    function compareDateNew(startDate, endDate) {
        var num = 0;
        if (startDate != '' && endDate != '') {
            var begin = startDate.replace('-', '/');
            var end = endDate.replace('-', '/');
            num = Date.parse(begin) - Date.parse(end);
        }
        return num;
    }


</script>
