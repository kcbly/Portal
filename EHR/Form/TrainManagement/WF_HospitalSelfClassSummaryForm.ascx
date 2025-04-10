<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HospitalSelfClassSummaryForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_HospitalSelfClassSummaryForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">自办班编号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbCode" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiHospitalSelfClassFormID':'id','tbJoinPeopleNum':'JoinPeopleNum','tbTrainName':'ClassName','txtStartDate':'StartDate','txtEndDate':'EndDate','tbTrainingHours':'TrainingHours'}" EnableTheming="false"
                Text="选择自办班" PageUrl="/EHR/Obsolete/HospitalSelfClassSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.填写院内自办班总结)" TableName="EHR_HospitalSelfClassSummaryForm" Field="Code" />
            <input type="hidden" id="hiHospitalSelfClassFormID" runat="server" tablename="EHR_HospitalSelfClassSummaryForm" field="HospitalSelfClassFormID" />
        </td>
        <td class="td-l">参训人</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbJoinUserName" runat="server"  TableName="EHR_HospitalSelfClassSummaryForm" Field="JoinUserName" ActiveStatus="(23.填写院内自办班总结)" ReadOnly="true" />
            <input type="hidden" id="hiJoinUserID" name="hiJoinUserID" runat="server" tablename="EHR_HospitalSelfClassSummaryForm" field="JoinUserID" />
             <input type="hidden" id="hiDeptID" runat="server" tablename="EHR_HospitalSelfClassSummaryForm" field="DeptID" />
             <input type="hidden" id="hiDeptName" runat="server" tablename="EHR_HospitalSelfClassSummaryForm" field="DeptName" />
        </td>
        <td class="td-l">参训人数（人）</td>
        <td class="td-r"> 
            <zhongsoft:LightTextBox ID="tbJoinPeopleNum" runat="server"  TableName="EHR_HospitalSelfClassSummaryForm" Field="JoinPeopleNum" ActiveStatus="(23.填写院内自办班总结)" style="width:70px;text-align:right" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正确的参训人数(正整数)" maxtext="14" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训日期（起）</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassSummaryForm" Field="StartDate" ActiveStatus="(23.填写院内自办班总结)" />
        </td>

        <td class="td-l">培训日期（止）</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEndDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassSummaryForm" Field="EndDate" ActiveStatus="(23.填写院内自办班总结)" />
        </td>
        <td class="td-l">培训时长（小时）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainingHours" runat="server" TableName="EHR_HospitalSelfClassSummaryForm" Field="TrainingHours" ActiveStatus="(23.填写院内自办班总结)"  style="width:70px;text-align:right" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训时长(正整数或2位小数)" maxtext="14"/>
        </td>
        </tr>
    <tr>
        <td class="td-l">培训名称</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainName" runat="server" MaxText="50" TableName="EHR_HospitalSelfClassSummaryForm" Field="TrainName" ActiveStatus="(23.填写院内自办班总结)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训总结</td>
        <td class="td-r" colspan="5"> 
            <zhongsoft:LightTextBox ID="tbSummary" runat="server"  TableName="EHR_HospitalSelfClassSummaryForm" Field="Summary" ActiveStatus="(23.填写院内自办班总结)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_HospitalSelfClassSummaryForm" Field="Memo" ActiveStatus="(23.*)"  CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"/>
        </td>
    </tr>
</table>
<input type="hidden" id="hiHospitalSelfClassSummaryFormID" name="hiHospitalSelfClassSummaryFormID" runat="server" tablename="EHR_HospitalSelfClassSummaryForm" field="HospitalSelfClassSummaryFormID" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人（正职）" />  
<input type="hidden" id="hiRoleNameB" runat="server" value="培训专责" /> 
<script type="text/javascript"> 
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "填写院内自办班总结") {//$actName 系统变量
                var grid = $("#FormAttachmentView_dlAttachment")[0];
                if (grid == "" || grid == undefined || grid.rows.length <= 0) {
                    alert("请上传相关附件！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        return true;
    }
</script>
