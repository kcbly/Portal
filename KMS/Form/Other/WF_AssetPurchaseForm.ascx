<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AssetPurchaseForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_AssetPurchaseForm" %>
<%@ Register Src="~/KMS/UI/Controls/UCAssetPurchaseFormDetail.ascx" TagName="AssetPurchaseFormDetail" TagPrefix="uc1" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_AssetPurchaseForm" activestatus="(23.填写申请)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" tablename="KMS_AssetPurchaseForm" field="ApplyDeptName" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" readonly="readonly" />
            <input type="hidden" runat="server" id="hiApplyDeptId" field="ApplyDeptId" tablename="KMS_AssetPurchaseForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="xmlApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1"
                field="ApplyDate" tablename="KMS_AssetPurchaseForm" activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">经办人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" tablename="KMS_AssetPurchaseForm" field="ApplyUserName" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" readonly="readonly" />
            <input type="hidden" id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="KMS_AssetPurchaseForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">拟采购物资类别<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="ltbMaterialCategory" runat="server" MaxText="50" TableName="KMS_AssetPurchaseForm" Field="MaterialCategory" ActiveStatus="(23.填写申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事由及说明
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbReason" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.填写申请)" field="Reason" tablename="KMS_AssetPurchaseForm"
                TextMode="MultiLine" maxtext="2000" Rows="4" Width="98%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" colspan="4">
            <uc1:AssetPurchaseFormDetail runat="server" ID="AssetPurchaseFormDetail" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="AssetPurchaseFormId" tablename="KMS_AssetPurchaseForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function checkForm() {
        var check = true;
        if ($formAction == 0) {
            if (!checkform()) {
                check = false;
            }
        }
        return check;

    }
</script>
