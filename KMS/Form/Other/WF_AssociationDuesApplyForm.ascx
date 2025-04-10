<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AssociationDuesApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_AssociationDuesApplyForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtSerialNumber" TableName="KMS_Other_AssociationDuesApplyForm" Field="SerialNumber" runat="server" ActiveStatus="(23.填写申请单)(23.退回修改)"  Width="350px" ReadOnly="true" />
        </td>
    </tr>
    <tr>
        <td class="td-l">协会名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtAssociationName" PageHeight="650px"
                SelectPageMode="Dialog" activestatus="(23.填写申请单)(23.退回修改)" Field="AssociationName"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name" req="1"
                IsMutiple="false" ResultForControls="{'hiAssociationInfoId':'id','txtBank':'Bank','txtAccount':'Account','txtBankAccountNumber':'BankAccountNumber'}" PageUrl="~/KMS/Obsolete/AssociationSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiAssociationInfoId" field="AssociationInfoId" tablename="KMS_Other_AssociationDuesApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">开户行</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtBank" TableName="KMS_Other_AssociationDuesApplyForm" Field="Bank" ActiveStatus="(23.填写申请单)(23.退回修改)" runat="server" Width="350px" />
        </td>
    </tr>
    <tr>
        <td class="td-l">账号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtAccount" TableName="KMS_Other_AssociationDuesApplyForm" Field="Account" ActiveStatus="(23.填写申请单)(23.退回修改)" runat="server" Width="180px" />
        </td>
        <td class="td-l">户名</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtBankAccountNumber" TableName="KMS_Other_AssociationDuesApplyForm" Field="BankAccountNumber" ActiveStatus="(23.填写申请单)(23.退回修改)" runat="server" Width="180px" />
        </td>
    </tr>
    <tr>
        <td class="td-l">金额小写（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtAmountSmall" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                errmsg="用户输入必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" MaxLength="13" CssClass="kpms-textbox-money"
                TableName="KMS_Other_AssociationDuesApplyForm" Field="AmountSmall" ActiveStatus="(23.填写申请单)(23.退回修改)" runat="server" Width="180px" />
        </td>
        <td class="td-l">金额大写</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtAmountBig" runat="server" class="kpms-textbox" Width="80"
                readonly="readonly" Activestatus="(23.填写申请单)(23.退回修改)" Field="AmountBig" TableName="KMS_Other_AssociationDuesApplyForm">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" IsMutiple="false" req="1"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写申请单)(23.退回修改)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiApplyUserId':'id'}" ShowJsonRowColName="true" PageHeight="650px"
                ResultAttr="name" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="ApplyUserName" DoCancel="false" tablename="KMS_Other_AssociationDuesApplyForm"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="KMS_Other_AssociationDuesApplyForm" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1"
                field="ApplyDate" tablename="KMS_Other_AssociationDuesApplyForm" activestatus="(23.填写申请单)(23.退回修改)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事由<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtReason" TableName="KMS_Other_AssociationDuesApplyForm" Field="Reason" ActiveStatus="(23.填写申请单)(23.退回修改)" req="1"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_AssociationDuesApplyForm" Field="Remark" ActiveStatus="(23.填写申请单)(23.退回修改)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="AssociationDuesApplyFormId" tablename="KMS_Other_AssociationDuesApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#<%=txtAmountSmall.ClientID%>").bind('blur', function () {
            convertToCHNMoney("<%=txtAmountSmall.ClientID %>", "<%=txtAmountBig.ClientID %>");
        });
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