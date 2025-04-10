<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HospitalSelfClassEffectForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_HospitalSelfClassEffectForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">参训人</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbJoinUserName" runat="server" MaxText="32" TableName="EHR_HospitalSelfClassEffectForm" Field="JoinUserName" ActiveStatus="(23.填写培训反馈)" ReadOnly="true" />
            <input type="hidden" id="hiJoinUserID" name="hiJoinUserID" runat="server" tablename="EHR_HospitalSelfClassEffectForm" field="JoinUserID" />
            <input type="hidden" id="hiDeptID" runat="server" tablename="EHR_HospitalSelfClassEffectForm" field="DeptID" />
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtDeptName" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassEffectForm" Field="DeptName" ActiveStatus="(23.填写培训反馈)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训日期（起）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassEffectForm" Field="StartDate" ActiveStatus="(23.填写培训反馈)" req="1" />
        </td>

        <td class="td-l">培训日期（止）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEndDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassEffectForm" Field="EndDate" ActiveStatus="(23.填写培训反馈)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbTrainName" runat="server" MaxText="50" TableName="EHR_HospitalSelfClassEffectForm" Field="TrainName" ActiveStatus="(23.填写培训反馈)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训反馈</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbEffect" runat="server" TableName="EHR_HospitalSelfClassEffectForm" Field="Effect" ActiveStatus="(23.填写培训反馈)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_HospitalSelfClassEffectForm" Field="Memo" ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiHospitalSelfClassEffectFormID" name="hiHospitalSelfClassEffectFormID" runat="server" tablename="EHR_HospitalSelfClassEffectForm" field="HospitalSelfClassEffectFormID" />
<input type="hidden" id="hiCreateDate" name="hiCreateDate" runat="server" field="CreateDate"
    tablename="EHR_HospitalSelfClassEffectForm" />
<script type="text/javascript"> 
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "填写培训反馈") {//$actName 系统变量
                var grid = $("#FormAttachmentView_dlAttachment")[0];
                if (grid == "" || grid == undefined || grid.rows.length <= 0) {
                    alert("请上传附件《培训效果反馈表》信息");
                    return false;
                } else {
                    return true;
                }
            }
        }
        return true;
    }
</script>

