<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ByAirApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_ByAirApplyForm" %>
<%@ Register Src="~/FM/UI/Controls/UCByAirApplyFormDetail.ascx" TagName="UCByAirApplyFormDetail" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">申请单编号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtApplicationNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_ByAirApplyForm" Field="ApplicationNo" Activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="losApplyDepartment" field="ApplyDepartment" req="1"
                SelectPageMode="Dialog" tablename="FM_Manage_ByAirApply" activestatus="(23.填写申请)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" PageHeight="650px"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="false" ResultForControls="{'hdnApplyDepartmentId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input id="hdnApplyDepartmentId" runat="server" type="hidden" tablename="FM_Manage_ByAirApply" field="ApplyDepartmentId" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox type="text" ID="txtApplyDate" runat="server" req="1" field="ApplyDate" activestatus="(23.填写申请)"
                tablename="FM_Manage_ByAirApply" CssClass="kpms-textbox-date" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否项目出差<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_ByAirApply" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_ByAirApply" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_ByAirApply" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_ByAirApply" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_ByAirApply"
                Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width:100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_ByAirApply"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_ByAirApply"
                field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出差事由
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="ltbApplyReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="FM_Manage_ByAirApply" field="ApplyReason"
                ActiveStatus="(23.填写申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-l">
            <uc1:UCByAirApplyFormDetail ID="UCByAirApplyFormDetail" runat="server" />
        </td>
    </tr>
</table>

<input type="hidden" id="hiKeyId" runat="server" field="ByAirApplyFormId" tablename="FM_Manage_ByAirApply" value="" />
<input type="hidden" id="hiSumCost" runat="server" field="SumCost" tablename="FM_Manage_ByAirApply" value="" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
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
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            if ("<%=this.ActionType %>" == "Update") {
                if ($actCurrId == "act_52609") {
                    if ($("#ctl10_UCByAirApplyFormDetail_gvList")[0].rows[1].cells[0].innerText == "没有超标申请明细") {
                        alert('-请至少添加一条超标申请明细记录！');
                        return false;
                    }
                }
            }
            return true;
        }
    }
</script>
