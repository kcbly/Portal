<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BorrowMoneyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_BorrowMoneyForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">借款单编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtBorrowNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyForm" Field="BorrowNo" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyDeptName" field="ApplyDeptName" req="1"
                tablename="FM_Manage_BorrowMoneyForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" Filter="{'ShowTree':'1'}"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyDeptID" runat="server" tablename="FM_Manage_BorrowMoneyForm"
                field="ApplyDeptID" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date" req="1"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyForm" Field="ApplyDate" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">借款人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" field="ApplyUserName" req="1"
                tablename="FM_Manage_BorrowMoneyForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="FM_Manage_BorrowMoneyForm" field="ApplyUserID" />
        </td>
        <td class="td-l">联系电话</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtTelNum" class="kpms-textbox" activestatus="(23.填写申请)" field="TelNum" DataType="Mobile"
                Width="100" tablename="FM_Manage_BorrowMoneyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">借款金额（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBorrowMoney" class="kpms-textbox-money" activestatus="(23.填写申请)" field="BorrowMoney" Width="75" req="1"
                errmsg="【 借款金额（元）】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_BorrowMoneyForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">借款金额（大写）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtBorrowMoneyUpper" runat="server" CssClass="kpms-textbox-money" Width="250" req="1"
                TableName="FM_Manage_BorrowMoneyForm" Field="BorrowMoneyUpper" Activestatus="(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否项目借款<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_BorrowMoneyForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_BorrowMoneyForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_BorrowMoneyForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_BorrowMoneyForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_BorrowMoneyForm"
                Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width:100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_BorrowMoneyForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_BorrowMoneyForm"
                field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">借款事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbBorrowCause" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_BorrowMoneyForm" field="BorrowCause"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">预计还款日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanBackDate" runat="server" class="kpms-textbox-date" req ="1"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyForm" Field="PlanBackDate" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">收款单位</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtAcceptUnit" class="kpms-textbox" activestatus="(23.填写申请)" field="AcceptUnit"
                tablename="FM_Manage_BorrowMoneyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">开户行</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtOpeningBank" class="kpms-textbox" activestatus="(23.填写申请)" field="OpeningBank"
                tablename="FM_Manage_BorrowMoneyForm">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">账号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtAccountNumber" class="kpms-textbox" activestatus="(23.填写申请)" field="AccountNumber"
                tablename="FM_Manage_BorrowMoneyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="2">相关附件</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false" DisplayStatus="(3.填写申请)" OnClick="lbtnUpload_Click">
                <img src="../../Themes/Images/btn_upload.gif" /><span>上传附件</span>
            </zhongsoft:LightFileUploader>
            <span class="req-star" id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
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
                EnableTheming="false" maxtext="512" tablename="FM_Manage_BorrowMoneyForm" field="Remark"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" id="bdTD">放款日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBorrowDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" TableName="FM_Manage_BorrowMoneyForm" Field="BorrowDate" Activestatus="(23.接收)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">办理人</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTransactor" field="Transactor"
                tablename="FM_Manage_BorrowMoneyForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.接收)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiTransactorId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiTransactorId" runat="server" tablename="FM_Manage_BorrowMoneyForm" field="TransactorId" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiBorrowMoneyFormId" runat="server" tablename="FM_Manage_BorrowMoneyForm" field="BorrowMoneyFormId" />

<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
        //填写借款金额后，转换大写金额
        $("#<%=txtBorrowMoney.ClientID %>").live("blur", function () {

            convertToCHNMoney("<%=txtBorrowMoney.ClientID %>", "<%=txtBorrowMoneyUpper.ClientID %>");
        });
        SetBorrowDate();
    }

    $("#<%=rblIsProject.ClientID%>").live("change", function () {
        SetIsShow();
    });

    function SetIsShow() {
        var value = $('#<%=rblIsProject.ClientID %>').find("input:checked").val();
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#<%=txtProjectCode.ClientID%>").attr("req", "1");
            $("#<%=txtManagerUserName.ClientID%>").attr("req", "1");
            $("#tdProjectName").html("项目名称<span class='req-star'>*</span >");
            $("#tdProjectCode").html("项目编号<span class='req-star'>*</span >");
            $("#tdManagerUserName").html("项目经理/执行经理<span class='req-star'>*</span >");
            $("#tr1").show();
            $("#tr2").show();
        }
        else {
            $("#<%=txtProjectName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectCode.ClientID%>").removeAttr("req");
            $("#<%=txtManagerUserName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectName.ClientID%>").val("");
            $("#<%=hiOrganizationID.ClientID%>").val("");
            $("#<%=txtProjectCode.ClientID%>").val("");
            $("#<%=hiManagerUserID.ClientID%>").val("");
            $("#<%=txtManagerUserName.ClientID%>").val("");
            $("#tr1").hide();
            $("#tr2").hide();
        }
    }

    function SetBorrowDate() {
        //接收
        if ($actCurrId == "act_53491") {
            $("#<%=txtBorrowDate.ClientID%>").attr("req", "1");
            $("#bdTD").html("放款日期<span class='req-star'>*</span >");
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
