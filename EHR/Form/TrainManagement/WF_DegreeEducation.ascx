<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DegreeEducation.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_DegreeEducation" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            姓名
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="FILLUSERNAME"
                Width="100px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
            <input type="hidden" id="hiUserId" runat="server" field="FILLUSERID" tablename="EHR_DEGREEEDUCATIONFORM" />
            <input type="hidden" id="hiUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_DEGREEEDUCATIONFORM" />
        </td>
        <td class="td-l">
            入院时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInCorpDate" runat="server" readonly="readonly" field="INCORPDATE"
                class="kpms-textbox-date" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="FILLDEPTNAME"
                Width="120px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
            <input type="hidden" id="hiDeptId" runat="server" field="FILLDEPTID" tablename="EHR_DEGREEEDUCATIONFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="FILLDEPTCODE" tablename="EHR_DEGREEEDUCATIONFORM" />
        </td>
        <td class="td-l">
            岗位名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSpecialty" runat="server" field="SPECIALTY" Width="120px"
                tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            原学历<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPrimaryEducation" runat="server" field="PRIMARYEDUCATION"
                Width="120px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
        <td class="td-l">
            申请学历<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyEducation" runat="server" field="APPLYEDUCATION"
                Width="120px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            原学位<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPrimaryDegree" runat="server" field="PRIMARYDEGREE"
                Width="120px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
        <td class="td-l">
            申请学位<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplyDegree" runat="server" field="APPLYDEGREE" Width="120px"
                tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请学校<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbSchoolName" runat="server" field="SCHOOLNAME" Width="120px"
                tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
        <td class="td-l">
            申请专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbApplySecialty" runat="server" field="APPLYSPECIALTY"
                Width="120px" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            学习形式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlStudyForm" req="1" activestatus="(23.个人申请)(23.修改申请)"
                field="STUDYFORM" tablename="EHR_DEGREEEDUCATIONFORM">
            </zhongsoft:LightDropDownList>
        </td>
         <td class="td-l">
            学习方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlStudyWay" req="1" activestatus="(23.个人申请)(23.修改申请)"
                field="STUDYWAY" tablename="EHR_DEGREEEDUCATIONFORM">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            入学时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntranceDate" runat="server" readonly="readonly" field="ENTRANCEDATE"
                class="kpms-textbox-date" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
        <td class="td-l">
            毕（结）业时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtGraduateDate" runat="server" readonly="readonly" field="GRADUATEDATE"
                class="kpms-textbox-date" tablename="EHR_DEGREEEDUCATIONFORM" req="1" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            学费
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTuition" runat="server" field="TUITION" tablename="EHR_DEGREEEDUCATIONFORM"
                Width="120px" Regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" ErrMsg="请输入正确的学费!" activestatus="(23.个人申请)(23.修改申请)" />
        </td>
        <td class="td-l">
            支付方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPaymentWay" req="1" activestatus="(23.个人申请)(23.修改申请)"
                field="PAYMENTWAY" tablename="EHR_DEGREEEDUCATIONFORM">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" field="MEMO"
                tablename="EHR_DEGREEEDUCATIONFORM" activestatus="(23.个人申请)(23.修改申请)"
                Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiDegreeEducationFormId" field="DEGREEEDUCATIONFORMID"
    tablename="EHR_DEGREEEDUCATIONFORM" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }


</script>
