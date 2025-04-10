<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReceptionMoneyForm.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_ReceptionMoneyForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-l">申请单编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplicationNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_ReceptionMoneyForm" Field="ApplicationNo" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">来宾单位名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtGuestUnit" runat="server" ActiveStatus="(23.填写申请)" CssClass="kpms-textbox" req="1"
                Field="GuestUnit" TableName="FM_Manage_ReceptionMoneyForm"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">来宾主要人员（姓名、人数）<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtGuestName" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_ReceptionMoneyForm" field="GuestName"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">接待部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtReceptionDepartMent" field="ReceptionDepartMent" req="1"
                SelectPageMode="Dialog" tablename="FM_Manage_ReceptionMoneyForm" activestatus="(23.填写申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" PageHeight="650px"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="false" ResultForControls="{'hiReceptionDepartMentId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiReceptionDepartMentId" runat="server" type="hidden" tablename="FM_Manage_ReceptionMoneyForm" field="ReceptionDepartMentId" />
        </td>
        <td class="td-l">接待日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox type="text" ID="txtReceptionDate" runat="server" req="1" field="ReceptionDate" activestatus="(23.填写申请)"
                tablename="FM_Manage_ReceptionMoneyForm" CssClass="kpms-textbox-date" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">接待主要人员<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtReceptionUserNames" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ReceptionUserNames" tablename="FM_Manage_ReceptionMoneyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                IsMutiple="true" ResultForControls="{'hiReceptionUserIds':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiReceptionUserIds" field="ReceptionUserIds" tablename="FM_Manage_ReceptionMoneyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">接待地点<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtReceptionAddr" TableName="FM_Manage_ReceptionMoneyForm" Field="ReceptionAddr" CssClass="kpms-textbox" ActiveStatus="(23.填写申请)" req="1" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">接待事由<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtReceptionReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_ReceptionMoneyForm" field="ReceptionReason"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否计入项目<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_ReceptionMoneyForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_ReceptionMoneyForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_ReceptionMoneyForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_ReceptionMoneyForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_ReceptionMoneyForm"
                Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width:100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_ReceptionMoneyForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_ReceptionMoneyForm"
                field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">领款金额小写（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSumCost" class="kpms-textbox-money" activestatus="(23.填写申请)" field="SumCost" Width="75" req="1"
                errmsg="【 领款金额小写（元）】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_ReceptionMoneyForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">领款金额大写（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtSumCostUpper" runat="server" CssClass="kpms-textbox-money" Width="250"
                TableName="FM_Manage_ReceptionMoneyForm" Field="SumCostUpper" Activestatus="(23.填写申请)">
            </zhongsoft:LightTextBox>

        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_ReceptionMoneyForm" field="Remark"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>

<input type="hidden" id="hiKeyId" runat="server" field="ReceptionMoneyFormId" tablename="FM_Manage_ReceptionMoneyForm" value="" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
    }

    $("#<%=txtSumCost.ClientID %>").live("blur", function () {
        convertToCHNMoney("<%=txtSumCost.ClientID %>", "<%=txtSumCostUpper.ClientID %>");
    });

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

    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            return true;
        }
    }
</script>
