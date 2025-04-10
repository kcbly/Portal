<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TakeMoneyForm.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_TakeMoneyForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-l">领款单编号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtTakeNo" runat="server" class="kpms-textbox-money" Width="185" 
                readonly="readonly" TableName="FM_Manage_TakeMoneyForm" Field="TakeNo" Activestatus="(23.填写申请)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox type="text" ID="txtApplyDate" runat="server" req="1" field="ApplyDate" activestatus="(23.填写申请)"
                tablename="FM_Manage_TakeMoneyForm" CssClass="kpms-textbox-date" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <div style="width: 120px;">
                <zhongsoft:LightObjectSelector runat="server" ID="txtApplyDeptName" field="ApplyDepartment" req="1"
                    SelectPageMode="Dialog" tablename="FM_Manage_TakeMoneyForm" activestatus="(23.填写申请)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" PageHeight="650px"
                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                    IsMutiple="false" ResultForControls="{'hiApplyDepartmentId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input id="hiApplyDepartmentId" runat="server" type="hidden" tablename="FM_Manage_TakeMoneyForm" field="ApplyDepartmentId" />
            </div>
        </td>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <div style="width: 120px;">
                <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="FM_Manage_TakeMoneyForm"
                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                    IsMutiple="false" ResultForControls="{'hiApplyUserId':'id','txtApplyDeptName':'DEPTNAME','hiApplyDeptId':'DEPTID'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="FM_Manage_TakeMoneyForm" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否项目领款<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_TakeMoneyForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_TakeMoneyForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800" OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_TakeMoneyForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_TakeMoneyForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_TakeMoneyForm"
                Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_TakeMoneyForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_TakeMoneyForm"
                field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">领款金额小写（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTakeMoney" class="kpms-textbox-money" activestatus="(23.填写申请)" field="TakeMoney" Width="75" req="1"
                errmsg="【 领款金额小写（元）】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TakeMoneyForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">领款金额大写（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtTakeMoneyUpper" runat="server" CssClass="kpms-textbox-money" Width="250"
                TableName="FM_Manage_TakeMoneyForm" Field="TakeMoneyUpper" Activestatus="(23.填写申请)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">用途<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtApplyUse" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" req="1"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_TakeMoneyForm" field="ApplyUse"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_TakeMoneyForm" field="Remark"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>

<input type="hidden" id="hiKeyId" runat="server" field="TakeMoneyFormId" tablename="FM_Manage_TakeMoneyForm" value="" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
    }

    $("#<%=txtTakeMoney.ClientID %>").live("blur", function () {
        convertToCHNMoney("<%=txtTakeMoney.ClientID %>", "<%=txtTakeMoneyUpper.ClientID %>");
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
