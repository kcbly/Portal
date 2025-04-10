<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StaffLeaveApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.List.AttendanceManagement.WF_StaffLeaveApplyForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <div style="width: 65%">
                <zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiApplyUserID':'id','tbDeptName':'DEPTNAME','hiDeptID':'DEPTID'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.发起)" TableName="EHR_LeaveApplyForm" Field="ApplyUserName" />
                <input type="hidden" id="hiApplyUserID" runat="server" tablename="EHR_LeaveApplyForm" field="ApplyUserID" />
            </div>
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbDeptName" style="width: 70%" runat="server" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="DeptName" ActiveStatus="(23.发起)" req="1" />
            <input type="hidden" id="hiDeptID" name="hiDeptID" runat="server" tablename="EHR_LeaveApplyForm" field="DeptID" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtApplyDate" runat="server" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="ApplyDate" ActiveStatus="(23.发起)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假类型<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlLeaveType" runat="server" TableName="EHR_LeaveApplyForm" Field="LeaveType" ActiveStatus="(23.发起)" req="1" />
        </td>
        <td class="td-l">计划请假开始日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" compare="1" ID="txtStartDate" runat="server" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="StartDate" ActiveStatus="(23.发起)" req="1" />
        </td>
        <td class="td-l">计划请假结束日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" compare="1" ID="txtEndDate" runat="server" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="EndDate" ActiveStatus="(23.发起)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">计划请假天数(天)<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbLeaveDay" req="1" runat="server" TableName="EHR_LeaveApplyForm" Field="LeaveDay" ActiveStatus="(23.发起)" CssClass="kpms-textbox-money" EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1})?$" errmsg="请输入正确的计划请假天数(正整数或1位小数)" MaxLength="14" />
        </td>
        <td class="td-l">可补休假天数（天）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-money" ID="txtCanBXDays" runat="server" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="CanBXDays" ActiveStatus="(23.发起)" req="1" />
        </td>
        <td class="td-l">本次抵扣补休假（天）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtDKBXDays" req="1" runat="server" TableName="EHR_LeaveApplyForm" Field="DKBXDays" ActiveStatus="(23.发起)" CssClass="kpms-textbox-money" EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1})?$" errmsg="请输入正确的本次抵扣补休假(正整数或1位小数)" MaxLength="14" />
        </td>
    </tr>
    <tr>
        <td class="td-l">请假事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbAbsence" runat="server" MaxText="512" TableName="EHR_LeaveApplyForm" Field="Absence" ActiveStatus="(23.发起)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_LeaveApplyForm" Field="Memo" ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiLeaveApplyFormID" runat="server" tablename="EHR_LeaveApplyForm" field="LeaveApplyFormID" />
<input type="hidden" id="hiUserType" runat="server" tablename="EHR_LeaveApplyForm" field="UserType" />
<input type="hidden" id="hiRoleA" runat="server" value="部门负责人（正职）" />
<input type="hidden" id="hiRoleB" runat="server" value="考勤管理员" />
<script type="text/javascript">
    function initCustomerPlugin() {

    } 
</script>
