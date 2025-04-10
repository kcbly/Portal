<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MeetingSuperviseForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Meet.WF_MeetingSuperviseForm" %>
<%@ Register Src="~/KMS/UI/Controls/UCMeetingSuperviseFormDetail.ascx" TagName="UCMeetingSuperviseFormDetail" TagPrefix="uc1" %>
<table runat="server" class="kpms-table" width="100%">
    <tr>
        <td class="td-l">会议名称<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="losMeetingName" SelectPageMode="Dialog" activestatus="(23.发起人填写)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="MeetingName" tablename="KMS_Meet_MeetingSuperviseForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" OnClick="losMeetingName_Click" OnClientClick="return selectExamTemplate()"
                IsMutiple="false" ResultForControls="{'hiMeetMinutesCirculateFormId':'id'}" PageUrl="~/KMS/Obsolete/MeetMinutesCirculateSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiMeetMinutesCirculateFormId" field="MeetMinutesCirculateFormId" tablename="KMS_Meet_MeetingSuperviseForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注 </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Meet_MeetingSuperviseForm" Field="Remark" ActiveStatus="(23.发起人填写)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr id="Target">
        <td colspan="4" class="td-l">
            <uc1:UCMeetingSuperviseFormDetail ID="UCMeetingSuperviseFormDetail" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Meet_MeetingSuperviseForm" field="MeetingSuperviseFormId" />
<input id="hiXml" runat="server" type="hidden" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }
    function selectExamTemplate() {
        var param = new InputParamObject("m");
        var json = { '': '' };
        //先清空再传值
        $("#<%=hiXml.ClientID %>").val("");
            //选择会议纪要传阅数据
            getMeetResolutions("<%=hiXml.ClientID %>", param, json, affterFormsSelect);
        return false;
    }

    function getMeetResolutions(reid, param, filter, callback) {
        return buildDivSelector(reid, param, filter, buildQueryUrl("KMS/Obsolete/MeetMinutesCirculateSelector.aspx", null), 850, 550, callback);
    }

    //批量选择CallBack方法
    function affterFormsSelect() {
        <%=Page.ClientScript.GetPostBackEventReference(this.losMeetingName,"")%>;
    }



</script>

