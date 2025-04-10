<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_LeaderLeaveApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.List.AttendanceManagement.WF_LeaderLeaveApplyForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiApplyUserID':'id'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写请假申请)" TableName="EHR_LeaveApplyForm" Field="ApplyUserName" />
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="EHR_LeaveApplyForm" field="ApplyUserID" />
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiDeptID':'id'}" EnableTheming="false" Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写请假申请)" TableName="EHR_LeaveApplyForm" Field="DeptName" />
            <input type="hidden" id="hiDeptID" name="hiDeptID" runat="server" tablename="EHR_LeaveApplyForm" field="DeptID" />
        </td>
        <td class="td-l">请假类型<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlLeaveType" runat="server" TableName="EHR_LeaveApplyForm" Field="LeaveType" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">计划请假开始日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="StartDate" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
        <td class="td-l">计划请假结束日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" TableName="EHR_LeaveApplyForm" Field="EndDate" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
        <td class="td-l">计划请假天数(天)<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbLeaveDay" runat="server" req="1" TableName="EHR_LeaveApplyForm" Field="LeaveDay" ActiveStatus="(23.填写请假申请)" Style="width: 70px; text-align: right" regex="^(([1-9]\d{0,9})|0)(\.\d{1})?$" errmsg="请输入正确的培训费用(正整数或1位小数)" MaxLength="14" />
        </td>
    </tr>
    <tr>
        <td class="td-l">在外地点<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbOutSide" runat="server" TableName="EHR_LeaveApplyForm" Field="OutSide" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">联络方式<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbContactWay" runat="server" TableName="EHR_LeaveApplyForm" Field="ContactWay" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
        <td class="td-l">是否需部门负责人审批<span class="req-star">*</span></td>
        <td class="td-r tdIsNeedCharger">
            <asp:RadioButtonList ID="rdIsNeedCharger" runat="server" RepeatDirection="Horizontal" TableName="EHR_LeaveApplyForm" Field="IsNeedCharger" ActiveStatus="(23.填写请假申请)" req="1"></asp:RadioButtonList>
        </td>
        <td class="td-l tdCharger">指定主管领导<span class="req-star">*</span></td>
        <td class="td-r tdCharger">
            <zhongsoft:LightObjectSelector runat="server" ID="tbChargerName" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiApplyUserID':'id'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写请假申请)" TableName="EHR_LeaveApplyForm" Field="ChargerName" />
            <input type="hidden" id="hiChargerID" runat="server" tablename="EHR_LeaveApplyForm" field="ChargerID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工作代理人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbWorkingAgent" runat="server" TableName="EHR_LeaveApplyForm" Field="WorkingAgent" ActiveStatus="(23.填写请假申请)" req="1" />
        </td>
        <td class="td-l">是否需主要领导审批<span class="req-star">*</span></td>
        <td class="td-r tdIsNeedLeader">
            <asp:RadioButtonList ID="rdIsNeedLeader" runat="server" RepeatDirection="Horizontal" TableName="EHR_LeaveApplyForm" Field="IsNeedLeader" ActiveStatus="(23.填写请假申请)" req="1"></asp:RadioButtonList>
        </td>
        <td class="td-l tdLeader">指定主要领导<span class="req-star">*</span></td>
        <td class="td-r tdLeader">
            <zhongsoft:LightObjectSelector runat="server" ID="tbLeaderName" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiApplyUserID':'id'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写请假申请)" TableName="EHR_LeaveApplyForm" Field="LeaderName" />
            <input type="hidden" id="hiLeaderID" runat="server" tablename="EHR_LeaveApplyForm" field="LeaderID" />
        </td>
    </tr>
    <tr class="tdIsAgree">
        <td class="td-l">是否同意<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <asp:RadioButtonList ID="rdIsAgree" runat="server" RepeatDirection="Horizontal" TableName="EHR_LeaveApplyForm" Field="IsAgree" activestatus="(23.部门负责人审核)(23.主管领导审核)(23.主要领导审核)"></asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">请假事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbAbsence" runat="server" MaxText="512" TableName="EHR_LeaveApplyForm" Field="Absence" ActiveStatus="(23.填写请假申请)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" req="1" />
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
<script type="text/javascript">
    function initCustomerPlugin() {
        hideTdCharger();
        hideTdLeader();
        if ($actName != "填写请假申请") {
            $(".tdIsAgree").show();
            $("#<%=rdIsAgree.ClientID%>").attr("req", "1");

        } else {
            $(".tdIsAgree").hide();
            $("#<%=rdIsAgree.ClientID%>").removeAttr("req");
        }
    }
    //是否需部门负责人审批
    $("#<%=rdIsNeedCharger.ClientID%>").live("change", function () {
        hideTdCharger();
    });
    function hideTdCharger() {
        var selectValue = $("#<%=rdIsNeedCharger.ClientID%> :checked").val();
        if (selectValue == "是") {
            $(".tdCharger").show();
            $("#<%=tbChargerName.ClientID%>").attr("req", "1");
            $(".tdIsNeedCharger").removeAttr("colspan");

        } else {
            $(".tdCharger").hide();
            $("#<%=tbChargerName.ClientID%>").removeAttr("req");
            $(".tdIsNeedCharger").attr("colspan", "3");
        }
    }
    //是否需主要领导审批
    $("#<%=rdIsNeedLeader.ClientID%>").live("change", function () {
        hideTdLeader();
    });
    function hideTdLeader() {
        var selectValue = $("#<%=rdIsNeedLeader.ClientID%> :checked").val();
        if (selectValue == "是") {
            $(".tdLeader").show();
            $("#<%=tbLeaderName.ClientID%>").attr("req", "1");
            $(".tdIsNeedLeader").removeAttr("colspan");
        } else {
            $(".tdLeader").hide();
            $("#<%=tbLeaderName.ClientID%>").removeAttr("req");
            $(".tdIsNeedLeader").attr("colspan", "3");
        }
    }   
</script>
