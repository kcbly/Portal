<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ResolutionSuperviseForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Meet.WF_ResolutionSuperviseForm" %>
<%@ Register Src="~/KMS/UI/Controls/UCResolutionSuperviseFormDetail.ascx" TagName="UCResolutionSuperviseFormDetail" TagPrefix="uc1" %>
<table runat="server" class="kpms-table" width="100%">
    <tr>
        <td class="td-l">议题决议<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
              <zhongsoft:LightTextBox ID="txtIssueResolution" TableName="KMS_Meet_MeetResolutionSuperviseForm" Field="IssueResolution" ActiveStatus="(23.*)"  
               Columns="5"  runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" ReadOnly="true" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会议名称 </td>
        <td class="td-r" colspan="2">
            <zhongsoft:XHtmlInputText ID="txtMeetingName" TableName="KMS_Meet_ResolutionSuperviseForm" Field="MeetingName" ActiveStatus="(1.*)" class="kpms-textbox" runat="server" readonly="readonly" />
        </td>
        <td class="td-r">
            <a onclick="showFlow()" style="color: blue; display:none; font-weight: bold">查看会议纪要传阅</a>
        </td>
    </tr>
    <tr>
        <td class="td-l">主办部门 </td>
        <td class="td-r" >
            <input type="hidden" runat="server" id="hiHostDeptId" tablename="KMS_Meet_ResolutionSuperviseForm" field="HostDeptId" />
            <zhongsoft:XHtmlInputText ID="txtHostDeptName" TableName="KMS_Meet_ResolutionSuperviseForm" Field="HostDeptName" ActiveStatus="(1.*)" class="kpms-textbox" runat="server" readonly="readonly" />
        </td>
        <td class="td-l">要求最晚完成日期 </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtLatestCompleteDate" runat="server" tablename="KMS_Other_TrainSummaryForm" field="LatestCompleteDate" activestatus="(1.*)"
                readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">配合部门 </td>
        <td class="td-r" colspan="3">
            <input type="hidden" runat="server" id="hiFitDeptId" tablename="KMS_Meet_ResolutionSuperviseForm" field="FitDeptId" />
            <zhongsoft:XHtmlInputText ID="txtFitDeptName" TableName="KMS_Meet_ResolutionSuperviseForm" Field="FitDeptName" ActiveStatus="(1.*)" class="kpms-textbox" runat="server" readonly="readonly" />
        </td>

    </tr>
    <tr>
        <td colspan="4" class="td-l">
            <uc1:UCResolutionSuperviseFormDetail ID="UCResolutionSuperviseFormDetail" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Meet_ResolutionSuperviseForm" field="ResolutionSuperviseFormId" />
<!--会议纪要传阅流程主键-->
<input type="hidden" runat="server" id="hiMeetMinutesCirculateFormId" tablename="KMS_Meet_ResolutionSuperviseForm" field="MeetMinutesCirculateFormId" />
<!--会议决议督办流程主表主键-->
<input type="hidden" runat="server" id="hiMeetingSuperviseFormId" tablename="KMS_Meet_ResolutionSuperviseForm" field="MeetingSuperviseFormId" />
<!--会议决议督办流程子表主键-->
<input type="hidden" runat="server" id="hiMeetingSuperviseFormDetailId" tablename="KMS_Meet_ResolutionSuperviseForm" field="MeetingSuperviseFormDetailId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }
    function showFlow() {
        var url = '/Custom/List/C_FormDetailLoading.aspx';
        var json = { bizId: $("#<%=hiMeetMinutesCirculateFormId.ClientID%>").val() };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;

    }


</script>

