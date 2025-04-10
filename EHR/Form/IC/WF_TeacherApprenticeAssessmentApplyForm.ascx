<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TeacherApprenticeAssessmentApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.IC.WF_TeacherApprenticeAssessmentApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">考核日期<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtAssessmentDate" runat="server" type="text" class="kpms-textbox-date"
                tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" field="AssessmentDate" readonly="readonly" req="1"
                activestatus="(23.发起申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">师傅姓名<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtMasterWorker" SelectPageMode="Dialog" activestatus="(23.发起申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="MasterWorker" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                IsMutiple="false" ResultForControls="{'hiMasterWorkerId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiMasterWorkerId" runat="server" field="MasterWorkerId" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" type="hidden" />
        </td>
        <td class="td-l">徒弟姓名<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApprentice" SelectPageMode="Dialog" activestatus="(23.发起申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="Apprentice" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                IsMutiple="false" ResultForControls="{'hiApprenticeId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiApprenticeId" runat="server" field="ApprenticeId" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" type="hidden" />
        </td>
    </tr>
    <tr>
        <td class="td-l">考核阶段<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblExaminationStage" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" req="1"
                field="ExaminationStage" RepeatDirection="Horizontal" ActiveStatus="(23.发起申请)">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiExaminationStageText" field="ExaminationStageText" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">考核方式<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblAssessmentMethod" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" req="1"
                field="AssessmentMethod" RepeatDirection="Horizontal" ActiveStatus="(23.发起申请)">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiAssessmentMethodText" field="AssessmentMethodText" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" />
        </td>
    </tr>
    <tr id="Target">
        <td class="td-l">说明<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtExplain" EnableTheming="false"
                activestatus="(23.发起申请)" field="Explain" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">考核成绩<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtAssessmentResult" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.发起申请)" field="AssessmentResult" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" req="1"
                TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtRemark" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.发起申请)" field="Remark" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm"
                TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="TeacherApprenticeAssessmentApplyFormId" tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" />
<input type="hidden" id="hiCreateDate"  runat="server" field="CreateDate"
    tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" />
<input type="hidden" id="hiCreateUserId" name="hiCreateDate" runat="server" field="CreateUserId"
    tablename="EHR_IC_TeacherApprenticeAssessmentApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#Target").hide();
        SetAttr();
    }

    $("#<%=rblAssessmentMethod.ClientID%>").live("change", function () {
        $("#<%=txtExplain.ClientID%>").val("")
        SetAttr();
    });

    function SetAttr() {
        var value = $('#<%=rblAssessmentMethod.ClientID %>').find("input:checked").val();
        $("#<%=txtExplain.ClientID%>").removeAttr("req");
        $("#Target").hide();
        if (value == "3") {
            $("#Target").show();
            setReq($("#<%=txtExplain.ClientID%>"));
        }
    }



</script>
