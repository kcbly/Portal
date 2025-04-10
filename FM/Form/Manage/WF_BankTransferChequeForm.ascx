<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BankTransferChequeForm.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_BankTransferChequeForm" %>

<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
        <td class="td-r">
        <td class="td-l">申请单编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_BankTransferChequeForm" Field="ApplyNo" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>

    <tr>
        <td class="td-l">工作部门<span class="req-star">*</span></td>
        <td class="td-r">
            <div style="width:50%">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWorkDeptName" field="WorkDeptName" req="1"
                tablename="FM_Manage_BankTransferChequeForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiWorkDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" Filter="{'ShowTree':'1'}"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiWorkDeptId" runat="server" tablename="FM_Manage_BankTransferChequeForm"
                field="WorkDeptId" /></div>
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date" req="1"
                readonly="readonly" TableName="FM_Manage_BankTransferChequeForm" Field="ApplyDate" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <div style="width:50%">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" field="ApplyUserName" req="1"
                tablename="FM_Manage_BankTransferChequeForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="FM_Manage_BankTransferChequeForm" field="ApplyUserId" /></div>
        </td>
        <td class="td-l">联系电话</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtTelNum" class="kpms-textbox" activestatus="(23.填写申请)" field="TelNum" DataType="Mobile"
                Width="100" tablename="FM_Manage_BankTransferChequeForm" MaxLength="20">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否项目转账<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_BankTransferChequeForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_BankTransferChequeForm" />
        </td>
        <td class="td-l">转账金额小写（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTransferMoney" class="kpms-textbox-money" activestatus="(23.填写申请)" field="TransferMoney" Width="75" req="1"
                errmsg="【 借款金额（元）】请输入数字，可保留2位小数！"  regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_BankTransferChequeForm">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">借款金额大写（元）</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtTransferMoneyUpper" runat="server" CssClass="kpms-textbox-money" Width="250"
                TableName="FM_Manage_BankTransferChequeForm" Field="TransferMoneyUpper" Activestatus="(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800" OnClick="txtManager_Click"
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_BankTransferChequeForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_BankTransferChequeForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l">项目设总</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_BankTransferChequeForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_BankTransferChequeForm"
                field="ManagerUserID" />
        </td>
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_BankTransferChequeForm"
                Field="ProjectCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">用途或事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="200" tablename="FM_Manage_BankTransferChequeForm" field="Reason"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">收款单位全称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="txtAcceptUnit" class="kpms-textbox" activestatus="(23.填写申请)" field="AcceptUnit" req="1"
                tablename="FM_Manage_BankTransferChequeForm" maxtext="50">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">收款单位开户行<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtOpeningBank" class="kpms-textbox" activestatus="(23.填写申请)" field="OpeningBank" req="1"
                tablename="FM_Manage_BankTransferChequeForm" maxtext="50">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">收款单位账号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtAccountNumber" class="kpms-textbox" activestatus="(23.填写申请)" field="AccountNumber" req="1"
                tablename="FM_Manage_BankTransferChequeForm" maxtext="40">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="2">相关附件</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" DisplayStatus="(3.填写申请)" OnClick="lbtnUpload_Click">
                <img src="../../Themes/Images/btn_upload.gif" /><span>上传附件</span>
            </zhongsoft:LightFileUploader>
            <span class="req-star" id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="3">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="250" tablename="FM_Manage_BankTransferChequeForm" field="Remark"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiBankTransferChequeFormID" runat="server" tablename="FM_Manage_BankTransferChequeForm" field="BankTransferChequeFormID" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
        //填写借款金额后，转换大写金额
        $("#<%=txtTransferMoney.ClientID %>").live("blur", function () {
            convertToCHNMoney("<%=txtTransferMoney.ClientID %>", "<%=txtTransferMoneyUpper.ClientID %>");
        }); $("#<%=rblIsProject.ClientID%>").live("change", function () {
            SetIsShow();
        });
    }
    function SetIsShow() {
        var value = $('#<%=rblIsProject.ClientID %>').find("input:checked").val();
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#<%=txtProjectCode.ClientID%>").attr("req", "1");
            $("#tdProjectName").html("项目名称<span class='req-star'>*</span >");
            $("#tdProjectCode").html("项目编号<span class='req-star'>*</span >");
            $("#tdManagerUserName").html("项目设总<span class='req-star'>*</span >");
            $("#tr1").show();
            $("#tr2").show();
        }
        else {
            $("#<%=txtProjectName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectCode.ClientID%>").removeAttr("req");
            $("#<%=txtProjectName.ClientID%>").val("");
            $("#<%=hiOrganizationID.ClientID%>").val("");
            $("#<%=txtProjectCode.ClientID%>").val("");
            $("#<%=hiManagerUserID.ClientID%>").val("");
            $("#<%=txtManagerUserName.ClientID%>").val("");
            $("#tr1").hide();
            $("#tr2").hide();
        }
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
