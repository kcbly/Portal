<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_LeaveApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_LeaveApplyForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" type="text" class="kpms-textbox" field="ApplyUserName"
                tablename="EHR_LeaveApplyForm" readonly="readonly" activestatus="(23.填写申请)" />
            <%--<zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hdnApplyUserId':'id'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写申请)" TableName="EHR_LeaveApplyForm" Field="ApplyUserName" />--%>
            <input type="hidden" id="hdnApplyUserId" runat="server" tablename="EHR_LeaveApplyForm" field="ApplyUserId" />
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="losApplyDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiDeptID':'id'}" EnableTheming="false" Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写申请)" TableName="EHR_LeaveApplyForm" Field="ApplyDeptName" />
            <input type="hidden" id="hdnApplyDeptId" name="hdnApplyDeptId" runat="server" tablename="EHR_LeaveApplyForm" field="ApplyDeptId" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假类型<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightDropDownList runat="server" ID="ddlLeaveType" req="1" activestatus="(23.填写申请)"
                field="LeaveType" tablename="EHR_LeaveApplyForm" Width="120px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnLeaveTypeText" runat="server" field="LeaveTypeText"
                tablename="EHR_LeaveApplyForm" />
        </td>
        <td class="td-l">请假总天数（天）<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="ltbLeaveDays" CssClass="kpms-textbox"
                field="LeaveDays" tablename="EHR_LeaveApplyForm"        activestatus="(23.填写申请)" Style="text-align: right; width: 100px;"
                regex="^([1-9]\d{0,2}|[0])(\.\d{1})?$" errmsg="请输入正数,最多1位小数" MaxLength="5" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">计划请假开始日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtLeaveStartDate" runat="server" type="text" class="kpms-textbox-comparedate" onblur="LeaveDate()" onfocus="WdatePicker({minDate:'%y-%M-%d'})" compare="1"
                req="1" readonly="readonly" activestatus="(23.填写申请)" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlLeaveStartDate" req="1" Width="80px" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnLeaveStartDate" runat="server" field="LeaveStartDate"
                tablename="EHR_LeaveApplyForm" />

        </td>
        <td class="td-l">计划请假截止日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtLeaveEndDate" runat="server" type="text" class="kpms-textbox-comparedate" onblur="LeaveDate()" onfocus="WdatePicker({minDate:'%y-%M-%d'})" compare="1"
                req="1" readonly="readonly" activestatus="(23.填写申请)" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlLeaveEndDate" req="1" Width="80px" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnLeaveEndDate" runat="server" field="LeaveEndDate"
                tablename="EHR_LeaveApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假事由<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="EHR_LeaveApplyForm" Field="Reason" ActiveStatus="(23.填写申请)" req="1"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="EHR_LeaveApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="3">相关附件</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.填写申请)" displaystatus="(23.填写申请)" OnClick="upLoadFile_Click">
<span><img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
            </zhongsoft:LightFileUploader>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="3">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="LeaveApplyFormId" tablename="EHR_LeaveApplyForm" />
<input type="hidden" id="hdnApplyUserRoles" runat="server" tablename="EHR_LeaveApplyForm" field="ApplyUserRoles" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#<%=ddlLeaveStartDate.ClientID%>").change(function () {
            LeaveDate();
        });
        $("#<%=ddlLeaveEndDate.ClientID%>").change(function () {
            LeaveDate();
        });
    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            return true;
        }
    }

    //自动计算天数
    function LeaveDate() {
        var startTime = $("#<%=txtLeaveStartDate.ClientID%>").val();
        var dllstartTime = $("#<%=ddlLeaveStartDate.ClientID%>").val();
        var endTime = $("#<%=txtLeaveEndDate.ClientID%>").val();
        var dllendTime = $("#<%=ddlLeaveEndDate.ClientID%>").val();

        if (startTime != "" && endTime != "" && dllstartTime != "" && dllendTime != "") {
            var timeStart = startTime + " " + dllstartTime;
            var timeEnd = endTime + " " + dllendTime;
            var d1 = new Date(startTime.replace(/-/g, "/"));
            var d2 = new Date(endTime.replace(/-/g, "/"));
            var days = interval(startTime, endTime);
            if (d1 == d2) {
                if (dllstartTime == "08:30:00" && dllendTime == "12:00:00") {
                    days += 0.5;
                }
                else if (dllstartTime == "08:30:00" && dllendTime == "17:30:00") {
                    days += 1;
                }
                else if (dllstartTime == "14:00:00" && dllendTime == "17:30:00") {
                    days += 0.5;
                }
            }
            else if (d1 <= d2) {
                if (dllstartTime == "08:30:00" && dllendTime == "12:00:00") {
                    days += 0.5;
                }
                else if (dllstartTime == "08:30:00" && dllendTime == "17:30:00") {
                    days += 1;
                }
                else if (dllstartTime == "14:00:00" && dllendTime == "17:30:00") {
                    days += 0.5;
                }
            }
            $("#<%=ltbLeaveDays.ClientID%>").val(days);
        }
    }

    //相差天数
    function interval(startDate, endDate) {
        var d1 = new Date(startDate.replace(/-/g, "/"));
        var d2 = new Date(endDate.replace(/-/g, "/"));
        var time = d2.getTime() - d1.getTime();
        var days = parseInt(Math.abs(time / (1000 * 60 * 60 * 24)));//取间隔天数的绝对值
        return days;
    }
</script>
