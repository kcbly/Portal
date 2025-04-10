<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthAttendanceUser.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.Attendance.MonthAttendanceUser" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="月度考勤详细" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="LoadFileView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%=WebAppPath %>/UI/Script/form.dsoframer.js"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" type="text" class="kpms-textbox"
                    readonly="readonly" tablename="EHR_MonthAttendceUser" field="UserName" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_MonthAttendceUser" />
            </td>
            <td class="td-l">
                部门名称
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" type="text" class="kpms-textbox"
                    readonly="readonly" tablename="EHR_MonthAttendceUser" field="DeptName" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiDeptID" field="DeptID" tablename="EHR_MonthAttendceUser" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                旷工
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceKG" field="AttendanceKG" tablename="EHR_MonthAttendceUser"
                    regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-分值必须是数字，最多保留2位小数！"
                    activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                迟到
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceCD" field="AttendanceCD" tablename="EHR_MonthAttendceUser"
                    regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-分值必须是数字，最多保留2位小数！"
                    activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                早退
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceZT" field="AttendanceZT" tablename="EHR_MonthAttendceUser"
                    regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="-分值必须是数字，最多保留2位小数！"
                    activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
            </td>
            <td class="td-m">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                情况说明
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbAttendanceDescription" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="AttendanceDescription"
                    tablename="EHR_MonthAttendceUser" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                旷工(修改)
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceKGNew" field="AttendanceKGNew"
                    tablename="EHR_MonthAttendceUser" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="-分值必须是数字，最多保留2位小数！" activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                迟到(修改)
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceCDNew" field="AttendanceCDNew"
                    tablename="EHR_MonthAttendceUser" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="-分值必须是数字，最多保留2位小数！" activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                早退(修改)
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendanceZTNew" field="AttendanceZTNew"
                    tablename="EHR_MonthAttendceUser" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="-分值必须是数字，最多保留2位小数！" activestatus="(23.*)" Style="width: 50px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
            </td>
            <td class="td-m">
            </td>
        </tr>
        <tr id="trSelContract" displaystatus="(23.发起信息变更)(3.修改变更信息)" runat="server">
            <td class="td-l">
                <%--<asp:Button ID="btnUploadCG" runat="server" Text="上传附件" activestatus="(23.*)" OnClick="btnUploadCG_Click"
                    OnClientClick="return UpLoadFile();" />--%>
            </td>
            <td class="td-m" colspan="5">
               <%-- <uc1:LoadFileView ID="AttachmentView1" runat="server"></uc1:LoadFileView>--%>
            </td>
        </tr>
    </table>
    <!--主键ID--->
    <input type="hidden" runat="server" id="hiMonthAttendceUserID" field="MonthAttendceUserID"
        tablename="EHR_MonthAttendceUser" />
    <input type="hidden" runat="server" id="hiMonthAttendanceFormID" field="MonthAttendanceFormID"
        tablename="EHR_MonthAttendceUser" />
    <script type="text/javascript">
        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "Form";
            var buildSelf = "False";
            var webappicationpath = "<%=WebAppPath%>";
            var actionType = "<%=ActionType %>";
            var url = webappicationpath + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf + "&actionType=" + actionType + "&bizId=" + fileSrcId;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }

    </script>
</asp:Content>
