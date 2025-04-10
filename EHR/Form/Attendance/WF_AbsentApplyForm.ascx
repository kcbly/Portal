<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AbsentApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_AbsentApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">请假人
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiPersonnelID" field="UserId" tablename="EHR_YearLeaveApply" />
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtPersonnelName" readonly="readonly"
                class="kpms-textbox" field="UserName" tablename="EHR_YearLeaveApply" activestatus="(23.填写请假单)(3.修改请假单)" />
        </td>
        <td class="td-l">工号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtPersonnelCode" readonly="readonly"
                class="kpms-textbox" field="LoginId" tablename="EHR_YearLeaveApply" activestatus="(23.填写请假单)(3.修改请假单)"
                style="width: 100px" />
        </td>
        <td class="td-l">所属部室
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtDeptName" readonly="readonly"
                class="kpms-textbox" field="DeptName" tablename="EHR_YearLeaveApply" activestatus="(23.填写请假单)(3.修改请假单)" />
            <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EHR_YearLeaveApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">办公电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" ID="txtPhone" runat="server" activestatus="(23.填写请假单)(3.修改请假单)"
                field="Phone" tablename="EHR_YearLeaveApply" readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">手机号码
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbMobilePhone" runat="server" activestatus="(23.填写请假单)(3.修改请假单)"
                field="MobilePhone" tablename="EHR_YearLeaveApply" MaxLength="16"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" ID="txtApplyTime" runat="server" class="kpms-textbox-date"
                field="ApplyTime" tablename="EHR_YearLeaveApply" readonly="readonly" req="1"
                activestatus="(23.填写请假单)(3.修改请假单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假时间<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" type="text" class="kpms-textbox-date"
                req="1" readonly="readonly" activestatus="(23.填写请假单)(3.修改请假单)" />
            <input type="hidden" runat="server" id="hiStartDate" field="StartDate" tablename="EHR_YearLeaveApply" />
            到
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" type="text" class="kpms-textbox-date"
                req="1" readonly="readonly" activestatus="(23.填写请假单)(3.修改请假单)" />
            <input type="hidden" runat="server" id="hiEndDate" field="EndDate" tablename="EHR_YearLeaveApply" />
            <asp:Button ID="btnCal" runat="server" displaystatus="(23.填写请假单)(3.修改请假单)" Text="计算请假天数"
                OnClick="btnCal_Click" Visible="false"></asp:Button>
        </td>
        <td class="td-l">请假类型<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightDropDownList runat="server" ID="ddlAbsenceTypeFlag" req="1" activestatus="(23.填写请假单)(3.修改请假单)"
                field="YearlLeaveType" tablename="EHR_YearLeaveApply" Width="120px" AutoPostBack="True"
                OnSelectedIndexChanged="ddlAbsenceTypeFlag_SelectedIndexChanged1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiYearlLeaveTypeName" runat="server" field="YearlLeaveTypeName"
                tablename="EHR_YearLeaveApply" />
        </td>
        <td class="td-l">参加工作日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" ID="txtWorkingTime" runat="server" class="kpms-textbox-date"
                field="WorkingTime" tablename="EHR_YearLeaveApply" readonly="readonly" activestatus="(23.填写请假单)(3.修改请假单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假总天数（天）<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tbApplyHolidayDays" CssClass="kpms-textbox"
                onblur="HolidayDay()" field="ApplyHolidayDays" tablename="EHR_YearLeaveApply"
                activestatus="(23.填写请假单)(3.修改请假单)(3.劳动组织岗核实)" Style="text-align: right; width: 100px;"
                regex="^([1-9]\d{0,2}|[0])(\.\d{1})?$" errmsg="请输入正数,最多1位小数" MaxLength="5" req="1"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            <asp:Label ID="lbNewDay" runat="server"> 本年度休假（天）<span class="req-star">*</span></asp:Label>
        </td>
        <td class="td-r">
            <asp:DropDownList ID="ddlYear" runat="server" Width="80px" Visible="false">
            </asp:DropDownList>
            <input type="hidden" id="hiLeaveYear" runat="server" field="LeaveYear" tablename="EHR_YearLeaveApply" />
            <zhongsoft:LightTextBox runat="server" ID="tbNewHolidayDays" CssClass="kpms-textbox"
                onblur="newDay()" field="NewHolidayDays" tablename="EHR_YearLeaveApply" activestatus="(23.填写请假单)(3.修改请假单)(3.劳动组织岗核实)"
                Style="text-align: right; width: 100px;" regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$"
                errmsg="请输入正数,最多1位小数" MaxLength="5" req="1"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            <asp:Label ID="lbUpDay" runat="server"> 补休上年度休假（天）<span class="req-star">*</span></asp:Label>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tbUPHolidayDays" CssClass="kpms-textbox"
                onblur="upDay()" field="UPHolidayDays" tablename="EHR_YearLeaveApply" activestatus="(23.填写请假单)(3.修改请假单)(3.劳动组织岗核实)"
                Style="text-align: right; width: 100px;" regex="^([1-9]\d{0,1}|[0])(\.\d{1})?$" errmsg="请输入正数,最多1位小数 " MaxLength="5"
                req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">请假情况
        </td>
        <td colspan="5">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                Width="100%" AllowPaging="false" EmptyDataText="没有请假记录" UseDefaultDataSource="true">
                <Columns>
                    <zhongsoft:LightBoundField DataField="LeaveYear" HeaderText="请假年度" />
                    <zhongsoft:LightBoundField DataField="HolidayDaySum" HeaderText="已请天数" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">请假事由<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbHolidayReason" TextMode="MultiLine"
                req="1" activestatus="(23.填写请假单)(3.修改请假单)" maxtext="512" CssClass="kpms-textarea"
                EnableTheming="false" field="HolidayReason" tablename="EHR_YearLeaveApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Remark" tablename="EHR_YearLeaveApply"
                activestatus="(23.填写请假单)(3.修改请假单)(3.劳动组织岗核实)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiYearLeaveApplyID" field="YearLeaveApplyID"
    tablename="EHR_YearLeaveApply" />
<!--Add by xiedx 20130109 记录注销记录Id-->
<input type="hidden" runat="server" id="hiRelateYearLeaveApplyIDs" field="RelateYearLeaveApplyIDs"
    tablename="EHR_YearLeaveApply" />
<input type="hidden" runat="server" id="hiSameID" field="SameID" tablename="EHR_YearLeaveApply" />
<input type="hidden" runat="server" id="hiCreateDate" field="CreateDate" tablename="EHR_YearLeaveApply" />
<input type="hidden" runat="server" id="hiStart" />
<input type="hidden" runat="server" id="hiEnd" />
<input type="hidden" runat="server" id="hiIsShowGrid" />
<input type="hidden" runat="server" id="hiEhrID" value="0F0D9FAA-0FEF-4E97-B259-30978888F284" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        if ($('#<%=hiIsShowGrid.ClientID %>').val() == "1") {
            $('[type=absenceRecord]').hide();
        }
        else {
            $('[type=absenceRecord]').show();
        }
        $('#<%=btnCal.ClientID %>').live('click', function () {
            if ($('#<%=txtStartDate.ClientID %>').val() == "" || $('#<%=txtEndDate.ClientID %>').val() == "") {
                alert("请先选择起止日期！");
                return false;
            }
        })
    }

    function checkForm() {
        var startdate = document.all("<%=txtStartDate.ClientID%>").value;
        var enddate = document.all("<%=txtEndDate.ClientID%>").value;

        if ($formAction == 0) {
            if (startdate > enddate) {
                alert("开始时间应早于结束时间！");
                return false;
            }
        }
        return true;
    }

    function HolidayDay() {
        var holidayDay = document.all("<%=tbApplyHolidayDays.ClientID%>").value;

        var day = holidayDay / 0.5;

        if (parseInt(day) == day) {

            var newDay = document.all("<%=tbNewHolidayDays.ClientID%>").value;

            var upDay = document.all("<%=tbUPHolidayDays.ClientID%>").value;

            if (upDay == "") {
                document.all("<%=tbNewHolidayDays.ClientID%>").value = holidayDay;
                document.all("<%=tbUPHolidayDays.ClientID%>").value = "0";
            }
            else if (newDay == "") {
                document.all("<%=tbUPHolidayDays.ClientID%>").value = holidayDay;
            } else if (newDay != "") {
                document.all("<%=tbUPHolidayDays.ClientID%>").value = holidayDay - newDay;
            }
            else if (upDay != "") {
                document.all("<%=tbNewHolidayDays.ClientID%>").value = holidayDay - upDay;
            }
        } else { alert('输入请假总天数格式不正确，请重新输入！'); document.all("<%=tbApplyHolidayDays.ClientID%>").value = ""; }
    }

    function newDay() {
        var holidayDay = document.all("<%=tbApplyHolidayDays.ClientID%>").value;
        var newDay = document.all("<%=tbNewHolidayDays.ClientID%>").value;
        var upDay = document.all("<%=tbUPHolidayDays.ClientID%>").value;
        if (holidayDay == "") {
            holidayDay = 0;
        }

        if (newDay == "") {
            newDay = 0;
        }
        if ((holidayDay - newDay) < 0) {
            alert("本年度休假天数错误，请重新填写！");
            document.all("<%=tbNewHolidayDays.ClientID%>").value = "";
        } else {
            var nextDay = holidayDay - newDay;

            var dayupDay = (holidayDay - newDay) / 0.5;
            if (parseInt(dayupDay) == dayupDay) {
                document.all("<%=tbUPHolidayDays.ClientID%>").value = nextDay;
            } else {
                alert("补休上年休假天数最小为0.5的倍数正整数，请重新填写！");
                document.all("<%=tbNewHolidayDays.ClientID%>").value = "";
                document.all("<%=tbUPHolidayDays.ClientID%>").value = "";
            }

        }
    }

    function upDay() {
        var holidayDay = document.all("<%=tbApplyHolidayDays.ClientID%>").value;
        var newDay = document.all("<%=tbNewHolidayDays.ClientID%>").value;
        var upDay = document.all("<%=tbUPHolidayDays.ClientID%>").value;
        if (holidayDay == "") {
            holidayDay = 0;
        }
        if (upDay == "") {
            upDay = 0;
        }

        var uday = upDay / 0.5;

        if (parseInt(uday) == uday) {
            if ((holidayDay - upDay) < 0) {
                alert("补休上年休假天数错误，请重新填写！");
                document.all("<%=tbUPHolidayDays.ClientID%>").value = "0";
                document.all("<%=tbNewHolidayDays.ClientID%>").value = holidayDay;
            } else {
                document.all("<%=tbNewHolidayDays.ClientID%>").value = holidayDay - upDay;
            }
        } else {
            alert("补休上年休假天数最小为0.5的倍数正整数，请重新填写！");
            document.all("<%=tbUPHolidayDays.ClientID%>").value = "";
        }
    } 
</script>
