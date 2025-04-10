<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SealDestructionApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Seal.WF_SealDestructionApplyForm" %>
<table class="tz-table">
    <tr>

        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Seal_SealDestructionApplyForm" Field="ApplyDate" ActiveStatus="(23.发起)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>

        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.发起)"      PageHeight="650px"   
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="KMS_Seal_SealDestructionApplyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="true" ResultForControls="{'hiApplyUserId':'id','txtApplyDeptName':'DEPTNAME','hiApplyDeptId':'DEPTID'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="KMS_Seal_SealDestructionApplyForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" tablename="KMS_Seal_SealDestructionApplyForm" field="ApplyDeptName" activestatus="(23.发起)"
                class="kpms-textbox" runat="server" readonly="readonly" />
            <input type="hidden" runat="server" id="hiApplyDeptId" field="ApplyDeptId" tablename="KMS_Seal_SealDestructionApplyForm" />
        </td>
        <td class="td-l">印章类别<span class="req-star">*</span></td>
        <td class="td-r">
          <zhongsoft:XHtmlInputText ID="txtSealTypeText" tablename="KMS_Seal_SealDestructionApplyForm" field="SealTypeText" activestatus="(23.发起)" req="1"
                class="kpms-textbox" runat="server" readonly="readonly" />
            <input type="hidden" runat="server" id="hiSealType" field="SealType" tablename="KMS_Seal_SealDestructionApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">印章名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtSealName" field="SealName"      PageHeight="650px"   
                SelectPageMode="Dialog" tablename="KMS_Seal_SealDestructionApplyForm" activestatus="(23.发起)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiSealRegisterId':'id','hiSealType':'SealType','txtSealTypeText':'SealTypeText'}" PageUrl="~/KMS/Obsolete/SealSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiSealRegisterId" field="SealRegisterId" tablename="KMS_Seal_SealDestructionApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事由及说明<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="KMS_Seal_SealDestructionApplyForm" Field="Reason" ActiveStatus="(23.发起)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" /></td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Seal_SealDestructionApplyForm" Field="Remark" ActiveStatus="(23.发起)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Seal_SealDestructionApplyForm" field="SealDestructionApplyFormId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        //if ($actName == "法人代表审批" ||$actName == "分管领导审批") {
        //    //需要自动发送的步骤，调用以下方法即可
        //    setAutoSend();
        //}
    }

</script>
