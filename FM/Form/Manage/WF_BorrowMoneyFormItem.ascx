<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BorrowMoneyFormItem.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_BorrowMoneyFormItem" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">申请单编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplicationNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyFormItem" Field="ApplicationNo" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">借款人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBorrowUserName" runat="server" class="kpms-textbox" Width="185" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="BorrowUserName" Activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" runat="server" class="kpms-textbox" Width="185" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="ApplyDeptName" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">借款金额（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbBorrowMoney" runat="server" class="kpms-textbox-money" Width="185" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="BorrowMoney" Activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">放款日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBorrowDate" runat="server" class="kpms-textbox-date" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="BorrowDate" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">累计已还款（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSumBackMoney" runat="server" class="kpms-textbox-money" Width="185" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="SumBackMoney" Activestatus="(23.填写申请)" />
        </td>

        <td class="td-l">剩余未还款（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtNoBackMoney" runat="server" class="kpms-textbox-money" Width="185" req="1" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="NoBackMoney" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">本次还款（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtBackMoney" CssClass="kpms-textbox-money" EnableTheming="false" req="1" errmsg="【 本次还款（元）】请输入数字，可保留2位小数！"
                field="BackMoney" tablename="FM_Manage_BorrowMoneyFormItem" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">还款日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBackDate" runat="server" class="kpms-textbox-date" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="BackDate" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">还款说明</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtExplain" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                tablename="FM_Manage_BorrowMoneyFormItem" field="Explain" ActiveStatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" class="kpms-textbox" Width="185" readonly="readonly"
                TableName="FM_Manage_BorrowMoneyFormItem" Field="ApplyUserName" Activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">申请日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyFormItem" Field="ApplyDate" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">凭证类型及编号</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtVoucherCode" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                tablename="FM_Manage_BorrowMoneyFormItem" field="VoucherCode" ActiveStatus="(23.财务审核)" />
            <%--<zhongsoft:LightTextBox runat="server" ID="txtVoucherCode" class="kpms-textbox" activestatus="(23.财务审核)" field="VoucherCode"
                tablename="FM_Manage_BorrowMoneyFormItem" />--%>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="FM_Manage_BorrowMoneyFormItem" field="Remark"
                ActiveStatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="2">相关附件</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.*)" displaystatus="(3.*)" OnClick="upLoadFile_Click">
<span><img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
            </zhongsoft:LightFileUploader>
            <span class="req-star" id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="3">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiBorrowMoneyFormItemId" runat="server" tablename="FM_Manage_BorrowMoneyFormItem" field="BorrowMoneyFormItemId" />
<input type="hidden" id="hiBorrowMoneyFormId" runat="server" tablename="FM_Manage_BorrowMoneyFormItem" field="BorrowMoneyFormId" />
<input type="hidden" id="hdnSourceId" runat="server" tablename="FM_Manage_BorrowMoneyFormItem" field="BorrowMoneyFormItemId" />
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
            var backmoney = $('#<%=txtBackMoney.ClientID %>').val();
            var nobackmoney = $('#<%=txtNoBackMoney.ClientID %>').val();
            if (backmoney != "" && nobackmoney != "") {
                if (floatParse(backmoney) == 0) {
                    alert("-【 本次还款（元）】不能为0！");
                    return false;
                }
                if (floatParse(backmoney) > floatParse(nobackmoney)) {
                    alert("-【 本次还款（元）】不能大于【 剩余未还款（元）】！");
                    return false;
                }
            }
            return true;
        }
    }

</script>
