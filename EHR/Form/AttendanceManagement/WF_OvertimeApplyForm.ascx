<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OvertimeApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.AttendanceManagement.WF_OvertimeApplyForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input type="hidden" id="hiDeptID" runat="server" field="ApplyDeptID" tablename="EHR_UA_OvertimeApplyForm" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" style="width: 50%" readonly="readonly" class="kpms-textbox" field="ApplyDeptName" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.发起)" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ApplyDate" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.发起)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班人员<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" field="OverTimeUserNames" SelectPageMode="Dialog" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.发起)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" IsMutiple="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiApplyUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" FilterFunction="filterFuc();"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserID" field="OverTimeUserIDs" tablename="EHR_UA_OvertimeApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班时间
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-wholedate" readonly="readonly" field="StartDate" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.发起)" />
            至
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-wholedate" readonly="readonly" field="EndDate" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">计（小时）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOvertimeHours" runat="server" ActiveStatus="(23.发起)" Field="OvertimeHours" MaxLength="15" CssClass="kpms-textbox-money" TableName="EHR_UA_OvertimeApplyForm" DataType="Decimal1" req="1" EnableTheming="false" />
        </td>
        <td class="td-l">合计（天）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOvertimeDays" runat="server" ActiveStatus="(23.发起)" Field="OvertimeDays" MaxLength="5" CssClass="kpms-textbox-money" TableName="EHR_UA_OvertimeApplyForm" DataType="Decimal1" req="1" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">加班事由
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbOvertimeReasons" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="OvertimeReasons" tablename="EHR_UA_OvertimeApplyForm" activestatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiOvertimeApplyFormID" runat="server" field="OvertimeApplyFormID" tablename="EHR_UA_OvertimeApplyForm" />
<input type="hidden" runat="server" id="hiCreateUserName" field="CreateUserName" tablename="EHR_UA_OvertimeApplyForm" />
<script type="text/javascript"> 
    function filterFuc() {
        return "{OrganizationId:'" + $("#<%=hiDeptID.ClientID%>").val() + "'}";
    }

</script>
