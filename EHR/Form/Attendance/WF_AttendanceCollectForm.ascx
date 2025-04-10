<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AttendanceCollectForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_AttendanceCollectForm" %>
<%@ Register Src="~/EHR/UI/Controls/UCAttendanceCollectFormDetail.ascx" TagName="UCAttendanceCollectFormDetail" TagPrefix="uc1" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">部门名称<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="losDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hdnDeptId':'id'}" EnableTheming="false" Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(2.填写申请)" TableName="EHR_AttendanceCollectForm" Field="DeptName"  />
            <input type="hidden" id="hdnDeptId" name="hdnDeptId" runat="server" tablename="EHR_AttendanceCollectForm" field="DeptId" />
        </td>
        <td class="td-l">填报月份<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtYearAndMonth" field="YearAndMonth" tablename="EHR_AttendanceCollectForm" req="1" activestatus="(2.填写申请)" readonly="readonly" class="kpms-textbox-yearmonthdate" style="width: 70px; text-align: right"></zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-l">
            <uc1:UCAttendanceCollectFormDetail ID="UCAttendanceCollectFormDetail" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="AttendanceCollectFormId" tablename="EHR_AttendanceCollectForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            return true;
        }
    }

</script>
