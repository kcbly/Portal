<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DepartmentTrainSurvey.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_DepartmentTrainSurvey" %>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" style="text-align: center; font-size: medium; color: Red; line-height: 1.5">
            该调查问卷由各部门负责人填写，调查结果将作为我院培训工作改进的重要参考和依据。
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷)"
                field="YEAR" tablename="EHR_PERSONALTRAINSURVEYFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="DEPTNAME"
                Width="120px" tablename="EHR_DEPARTMENTTRAINSURVEYFORM" req="1" activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷)" />
            <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_DEPARTMENTTRAINSURVEYFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_DEPARTMENTTRAINSURVEYFORM" />
        </td>
        <td class="td-l">
            填表日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_DEPARTMENTTRAINSURVEYFORM" req="1" activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训现状调查
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainStatusSurvey" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINSTATUSSURVEY"
                tablename="EHR_DEPARTMENTTRAINSURVEYFORM" activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷"
                Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训需求调查
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainRequireSurvey" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINREQUIRESURVEY"
                tablename="EHR_DEPARTMENTTRAINSURVEYFORM" activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷"
                Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" style="line-height: 1.5">
            您对今后的培训工作有哪些建议
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbSuggest" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="SUGGEST" tablename="EHR_DEPARTMENTTRAINSURVEYFORM"
                activestatus="(23.填写年度部门培训调查问卷)(23.修改年度部门培训调查问卷" Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiDepartmentTrainSurveyFormId" field="DEPARTMENTTRAINSURVEYFORMID"
    tablename="EHR_DEPARTMENTTRAINSURVEYFORM" />
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
