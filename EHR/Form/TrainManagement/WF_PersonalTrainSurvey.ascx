<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PersonalTrainSurvey.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_PersonalTrainSurvey" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)"
                field="YEAR" tablename="EHR_PERSONALTRAINSURVEYFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            姓名
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="USERNAME"
                Width="100px" tablename="EHR_PERSONALTRAINSURVEYFORM"  activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
            <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_PERSONALTRAINSURVEYFORM" />
        </td>
        <td class="td-l">
            工号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserCode" runat="server" ReadOnly="true" field="USERCODE"
                Width="100px" tablename="EHR_PERSONALTRAINSURVEYFORM" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="DEPTNAME"
                Width="120px" tablename="EHR_PERSONALTRAINSURVEYFORM"  activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
            <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_PERSONALTRAINSURVEYFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_PERSONALTRAINSURVEYFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            年龄
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAge" runat="server" field="AGE" tablename="EHR_PERSONALTRAINSURVEYFORM"
                Width="50px" Regex="^\d{1,2}$" ErrMsg="请输入正确的年龄!" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
        </td>
        <td class="td-l">
            学历
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbEducation" runat="server" ReadOnly="true" field="EDUCATION"
                tablename="EHR_PERSONALTRAINSURVEYFORM" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
        </td>
       <%-- <td class="td-l">
            人员类别
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPersonnelCate" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)"
                field="PERSONNELCATEGORY" tablename="EHR_PERSONALTRAINSURVEYFORM">
            </zhongsoft:LightDropDownList>
        </td>--%>
        <td class="td-l">
            填表日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_PERSONALTRAINSURVEYFORM" req="1" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训现状调查
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="tbTrainStatusSurvey" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINSTATUSSURVEY"
                tablename="EHR_PERSONALTRAINSURVEYFORM" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)"
                Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训需求调查
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="tbTrainRequireSurvey" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINREQUIRESURVEY"
                tablename="EHR_PERSONALTRAINSURVEYFORM" activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)"
                Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" style="line-height: 1.5">
            您对今后的培训工作有哪些建议
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="tbSuggest" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="SUGGEST" tablename="EHR_PERSONALTRAINSURVEYFORM"
                activestatus="(23.填写年度个人培训调查问卷)(23.修改年度个人培训调查问卷)" Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="8" style="text-align: left; font-size: medium; color: Red; line-height: 1.5;">
            说明：培训现状调查即对培训现状的满意度以及存在问题和建议； 培训需求调查即近期想参加哪些培训。
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPersonalTrainSurveyFormId" field="PERSONALTRAINSURVEYFORMID"
    tablename="EHR_PERSONALTRAINSURVEYFORM" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function checkInput() {
        var trainStatusSurvey = $("#<%=tbTrainStatusSurvey.ClientID %>").val();
        var trainRequireSurvey = $("#<%=tbTrainRequireSurvey.ClientID %>").val();
        var suggest = $("#<%=tbSuggest.ClientID %>").val();

        if (trainStatusSurvey == "" && trainRequireSurvey == "" && suggest == "")
            return false;
        else
            return true;
    }

    function checkForm() {
        if (checkInput())
            return true;
        else {
            alert("培训现状调查、培训需求调查、您对今后的培训工作有哪些建议，这三项请至少填写一项内容！");
            return false;
        }

    }


</script>
