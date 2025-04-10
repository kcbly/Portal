<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TravelApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_TravelApplyForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" type="text" class="kpms-textbox" field="ApplyUserName"
                tablename="EHR_TravelApplyForm" readonly="readonly" activestatus="(23.填写申请)" />
            <%--<zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hdnApplyUserId':'id'}" EnableTheming="false" Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写申请)" TableName="EHR_TravelApplyForm" Field="ApplyUserName" />--%>
            <input type="hidden" id="hdnApplyUserId" runat="server" tablename="EHR_TravelApplyForm" field="ApplyUserId" />
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" runat="server" type="text" class="kpms-textbox" field="ApplyDeptName"
                tablename="EHR_TravelApplyForm" readonly="readonly" activestatus="(23.填写申请)" />
            <%--<zhongsoft:LightObjectSelector runat="server" ID="losApplyDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiDeptID':'id'}" EnableTheming="false" Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写申请)" TableName="EHR_TravelApplyForm" Field="ApplyDeptName" />--%>
            <input type="hidden" id="hdnApplyDeptId" name="hdnApplyDeptId" runat="server" tablename="EHR_TravelApplyForm" field="ApplyDeptId" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出差类型<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightDropDownList runat="server" ID="ddlTravelType" req="1" activestatus="(23.填写申请)"
                field="TravelType" tablename="EHR_TravelApplyForm" Width="120px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnTravelTypeText" runat="server" field="TravelTypeText"
                tablename="EHR_TravelApplyForm" />
        </td>
        <td class="td-l">计划天数（天）<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="ltbLeaveDays" CssClass="kpms-textbox"
                field="PlanDays" tablename="EHR_TravelApplyForm"
                activestatus="(23.填写申请)" Style="text-align: right; width: 100px;"
                regex="^([1-9]\d{0,2}|[0])(\.\d{1})?$" errmsg="请输入正数,最多1位小数" MaxLength="5" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">出差开始日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtTravelStartDate" onblur="autoCompute()" runat="server" type="text" compare="2" onfocus="WdatePicker({minDate:'%y-%M-%d'})" class="kpms-textbox-comparedate"
                req="1" readonly="readonly" activestatus="(23.填写申请)" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlTravelStartDate" req="1" Width="80px" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnTravelStartDate" runat="server" field="TravelStartDate"
                tablename="EHR_TravelApplyForm" />
        </td>
        <td class="td-l">出差结束日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtTravelEndDate" runat="server" onblur="autoCompute()" type="text" compare="2" onfocus="WdatePicker({minDate:'%y-%M-%d'})" class="kpms-textbox-comparedate"
                req="1" readonly="readonly" activestatus="(23.填写申请)" />
            <zhongsoft:LightDropDownList runat="server" ID="ddlTravelEndDate" req="1" Width="80px" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hdnTravelEndDate" runat="server" field="TravelEndDate"
                tablename="EHR_TravelApplyForm" />
        </td>
    </tr>
    <tr class="isProject" style="display: none;">
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="losProjectName" IsMutiple="false" SelectPageMode="Dialog"  OnClick="txtManager_Click"  ResultForControls="{'hdnProjectId':'id','txtProjectCode':'ProjectCode','txtProjectManagerUserName':'ManagerUserName','hdnProjectManagerUserId':'ManagerUserID'}" EnableTheming="false" Text="选择项目" PageUrl="~/EHR/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写申请)" TableName="EHR_TravelApplyForm" Field="ProjectName" />
            <input type="hidden" id="hdnProjectId" runat="server" tablename="EHR_TravelApplyForm" field="ProjectId" />
        </td>

    </tr>
    <tr class="isProject" style="display: none;">
        <td class="td-l">项目编号
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" type="text" class="kpms-textbox" field="ProjectCode"
                tablename="EHR_TravelApplyForm" readonly="readonly" activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">项目经理/执行经理
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtProjectManagerUserName" runat="server" type="text" class="kpms-textbox" field="ProjectManagerUserName"
                tablename="EHR_TravelApplyForm" readonly="readonly" activestatus="(23.填写申请)" />
            <input type="hidden" id="hdnProjectManagerUserId" runat="server" tablename="EHR_TravelApplyForm" field="ProjectManagerUserId" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出差、事由<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="EHR_TravelApplyForm" Field="Reason" ActiveStatus="(23.填写申请)" req="1"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="EHR_TravelApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
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
<input type="hidden" id="hiKeyId" runat="server" field="TravelApplyFormId" tablename="EHR_TravelApplyForm" />
<input type="hidden" id="hdnApplyUserRoles" runat="server" tablename="EHR_TravelApplyForm" field="ApplyUserRoles" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        checkProject();
        $("#<%=ddlTravelType.ClientID%>").change(function () {
            checkProject();
        });
        $("#<%=ddlTravelStartDate.ClientID%>").change(function () {
            autoCompute();
        });
        $("#<%=ddlTravelEndDate.ClientID%>").change(function () {
            autoCompute();
        });




    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        if ($actCurrId == "act_47391" ) {
            if (!compareDate($("#<%=txtTravelStartDate.ClientID%>").val(), $("#<%=txtTravelEndDate.ClientID%>").val())) {
                alert("出差开始日期必须小于出差结束日期");
                return false;
            }
        }
        return true;
    }
    checkProject();
    function checkProject() {
        var travalType = $("#<%=ddlTravelType.ClientID%>").val();
        if (travalType == 3) {
            $(".isProject").show();
            $("#<%=losProjectName.ClientID%>").attr("req", "1");
        }
        else {
            $(".isProject").hide();
            $("#<%=losProjectName.ClientID%>").removeAttr("req");
        }
    }

    //自动计算天数
    function autoCompute() {
        var startTime = $("#<%=txtTravelStartDate.ClientID%>").val();
        var dllstartTime = $("#<%=ddlTravelStartDate.ClientID%>").val();
        var endTime = $("#<%=txtTravelEndDate.ClientID%>").val();
        var dllendTime = $("#<%=ddlTravelEndDate.ClientID%>").val();

        if (startTime != "" && endTime != "" && dllstartTime != "" && dllendTime != "") {
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
