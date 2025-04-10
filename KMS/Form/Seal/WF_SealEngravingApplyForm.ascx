<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SealEngravingApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Seal.WF_SealEngravingApplyForm" %>
<table class="tz-table"> 
    <tr>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
             <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Seal_SealEngravingApplyForm" activestatus="(23.发起)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>

        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Seal_SealEngravingApplyForm" Field="ApplyDate" ActiveStatus="(23.发起)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>

        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.发起)"      PageHeight="650px"   
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="KMS_Seal_SealEngravingApplyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="false" ResultForControls="{'hiApplyUserId':'id','txtApplyDeptName':'DEPTNAME','hiApplyDeptId':'DEPTID'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="KMS_Seal_SealEngravingApplyForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" tablename="KMS_Seal_SealEngravingApplyForm" field="ApplyDeptName" activestatus="(23.发起)"
                class="kpms-textbox" runat="server" readonly="readonly" />
            <input type="hidden" runat="server" id="hiApplyDeptId" field="ApplyDeptId" tablename="KMS_Seal_SealEngravingApplyForm" />
        </td>
        <td class="td-l">印章类别<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSealType" TableName="KMS_Seal_SealEngravingApplyForm" Field="SealType" ActiveStatus="(23.发起)" req="1"
                runat="server" Width="128px" />
            <input type="hidden" runat="server" id="hiSealTypeText" field="SealTypeText" tablename="KMS_Seal_SealEngravingApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">印章名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtSealName" TableName="KMS_Seal_SealEngravingApplyForm" Field="SealName" runat="server" req="1"
                ActiveStatus="(23.发起)" Width="70%" MaxLength="50" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事由及说明<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="KMS_Seal_SealEngravingApplyForm" Field="Reason" ActiveStatus="(23.发起)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1"/></td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Seal_SealEngravingApplyForm" Field="Remark" ActiveStatus="(23.发起)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Seal_SealEngravingApplyForm" field="SealEngravingApplyFormId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        //if ($actName == "法人代表审核" ||$actName == "分管领导审核") {
        //    //需要自动发送的步骤，调用以下方法即可
        //    setAutoSend();
        //}
    }

</script>
