<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AssetBuyApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_AssetBuyApplyForm" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Other_AssetBuyApplyForm" activestatus="(23.填写申请单)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="ApplyDeptName" PageHeight="650px"
                SelectPageMode="Dialog" tablename="KMS_Other_AssetBuyApplyForm" activestatus="(23.填写申请单)" ShowAttrs="name"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" field="ApplyDeptId" tablename="KMS_Other_AssetBuyApplyForm" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Other_AssetBuyApplyForm" Field="ApplyDate" ActiveStatus="(23.填写申请单)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请购置理由<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="KMS_Other_AssetBuyApplyForm" Field="Reason" ActiveStatus="(23.填写申请单)" req="1"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请购置的固定<br />资产要求（包括<br />规格型号及功能）</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtDemand" TableName="KMS_Other_AssetBuyApplyForm" Field="Demand" ActiveStatus="(23.填写申请单)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">数量（个/台）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtQuantity" CssClass="kpms-textbox-money" regex="^[0-9]*[1-9][0-9]*$" errmsg="用户输入必填填写数字,并且应为正整数" req="1"
                TableName="KMS_Other_AssetBuyApplyForm" Field="Quantity" ActiveStatus="(23.填写申请单)" runat="server" Width="180px" />
        </td>
        <td class="td-l">预计总价（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtUnitPrice" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" MaxLength="13" CssClass="kpms-textbox-money" req="1"
                errmsg="用户输入必填填写数字，并且小数点后最多保留2位" TableName="KMS_Other_AssetBuyApplyForm" Field="UnitPrice" ActiveStatus="(23.填写申请单)" runat="server" Width="180px" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主管部门<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <asp:CheckBoxList ID="cblMainMgtDept" runat="server" ActiveStatus="(23.填写申请单)" req="1" RepeatDirection="Horizontal" RepeatColumns="10">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiMainMgtDeptId" field="MainMgtDeptId" TableName="KMS_Other_AssetBuyApplyForm" />
            <input type="hidden" runat="server" id="hiMainMgtDeptName" field="MainMgtDeptName" TableName="KMS_Other_AssetBuyApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_AssetBuyApplyForm" Field="Remark" ActiveStatus="(23.填写申请单)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="AssetBuyApplyFormId" tablename="KMS_Other_AssetBuyApplyForm" />
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
