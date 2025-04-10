<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GeneralManagerRewardApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.IC.WF_GeneralManagerRewardApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">申报日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="EHR_IC_GeneralManagerRewardApplyForm" Field="ApplyDate" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly" req="1"></zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">申报人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" TableName="EHR_IC_GeneralManagerRewardApplyForm" Field="ApplyUserName" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly" req="1"></zhongsoft:XHtmlInputText>
            <input id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="EHR_IC_GeneralManagerRewardApplyForm" type="hidden" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申报部门<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" TableName="EHR_IC_GeneralManagerRewardApplyForm" Field="ApplyDeptName" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly" req="1"></zhongsoft:XHtmlInputText>
            <input id="hiApplyDeptId" runat="server" field="ApplyDeptId" tablename="EHR_IC_GeneralManagerRewardApplyForm" type="hidden" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申报项目<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="txtApplyProject" EnableTheming="false" req="1"
                activestatus="(23.发起申请)" field="ApplyProject" tablename="EHR_IC_GeneralManagerRewardApplyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">申报理由及成果描述<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="txtApplyReasonAchievements" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.发起申请)" field="ApplyReasonAchievements" tablename="EHR_IC_GeneralManagerRewardApplyForm" req="1"
                TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="txtRemark" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.发起申请)" field="Remark" tablename="EHR_IC_GeneralManagerRewardApplyForm"
                TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="GeneralManagerRewardApplyFormId" tablename="EHR_IC_GeneralManagerRewardApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
</script>

