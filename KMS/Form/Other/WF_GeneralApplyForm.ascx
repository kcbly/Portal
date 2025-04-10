<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GeneralApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_GeneralApplyForm" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Other_GeneralApplyForm" activestatus="(23.填写申请)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">主题<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="ltbTheme" TableName="KMS_Other_GeneralApplyForm" Field="Theme" ActiveStatus="(23.填写申请)" req="1" MaxLength="500"
                runat="server"  />
        </td>
    </tr>
    <tr>
        <td class="td-l">主要内容<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="ltbMainContent" TableName="KMS_Other_GeneralApplyForm" Field="MainContent" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_GeneralApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="ApplyDeptName" PageHeight="650px"
                SelectPageMode="Dialog" tablename="KMS_Other_GeneralApplyForm" activestatus="(23.填写申请)" ShowAttrs="name"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" field="ApplyDeptId" tablename="KMS_Other_GeneralApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" IsMutiple="false" req="1"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写申请)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiApplyUserId':'id'}" ShowJsonRowColName="true" PageHeight="650px"
                ResultAttr="name" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="ApplyUserName" DoCancel="false" tablename="KMS_Other_GeneralApplyForm"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="KMS_Other_GeneralApplyForm" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="xmlApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1"
                field="ApplyDate" tablename="KMS_Other_GeneralApplyForm" activestatus="(23.填写申请)" />
        </td>
    </tr>

</table>
<input type="hidden" id="hiKeyId" runat="server" field="GeneralApplyFormId" tablename="KMS_Other_GeneralApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            return true;
        }
    }
</script>