<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OutTrainSummaryForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_OutTrainSummaryForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">参训人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbJoinUserName" runat="server" TableName="EHR_OutTrainSummaryForm" Field="JoinUserName" readonly="readonly" class="kpms-textbox" ActiveStatus="(23.填写外出培训总结申请)"></zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiJoinUserID" runat="server" tablename="EHR_OutTrainSummaryForm" field="JoinUserID" />
            <input type="hidden" id="hiApplyDeptID" runat="server" tablename="EHR_OutTrainSummaryForm" field="ApplyDeptID" />
        </td>
        <td class="td-l">部门</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApplyDeptName" runat="server" readonly="readonly" TableName="EHR_OutTrainSummaryForm" Field="ApplyDeptName" ActiveStatus="(23.填写外出培训总结申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训日期（起）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" TableName="EHR_OutTrainSummaryForm" Field="StartDate" readonly="readonly" class="kpms-textbox-date" ActiveStatus="(23.填写外出培训总结申请)" req="1"></zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">培训日期（止）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" TableName="EHR_OutTrainSummaryForm" Field="EndDate" readonly="readonly" class="kpms-textbox-date" ActiveStatus="(23.填写外出培训总结申请)" req="1"></zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">培训名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
             <zhongsoft:LightTextBox ID="tbTrainName" runat="server" MaxText="100" TableName="EHR_OutTrainForm" Field="TrainName" ActiveStatus="(23.填写外出培训总结申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">心得体会</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainContent" runat="server" TableName="EHR_OutTrainSummaryForm" Field="Summary" ActiveStatus="(23.填写外出培训总结申请)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />

        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_OutTrainSummaryForm" Field="Memo" ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiRZ" runat="server" value="w201708090000002" />
<input type="hidden" id="hiOutTrainSummaryFormID" runat="server" tablename="EHR_OutTrainSummaryForm" field="OutTrainSummaryFormID" />
<input type="hidden" id="hiCreateDate" name="hiCreateDate" runat="server" field="CreateDate"
    tablename="EHR_OutTrainSummaryForm" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人（正职）" />
<input type="hidden" id="hiRoleNameB" runat="server" value="培训专责" />
<script type="text/javascript"> 
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "填写外出培训总结申请") {//$actName 系统变量
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

