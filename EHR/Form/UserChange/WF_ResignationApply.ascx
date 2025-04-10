<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ResignationApply.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_ResignationApply" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>
<table class="tz-table">
    <tr>
        <td class="td-l">姓名<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiApplyUserID" field="ApplyUserID" tablename="EHR_ResignationApply" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" readonly="readonly" class="kpms-textbox" style="width: 100px" field="ApplyUserName" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" req="1" />
            <input type="hidden" id="hiApplyUserCode" runat="server" field="ApplyUserCode" tablename="EHR_ResignationApply" />
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <input type="hidden" id="hiDeptID" runat="server" field="DEPTID" tablename="EHR_ResignationApply" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" style="width: 50%" readonly="readonly" class="kpms-textbox" field="DEPTNAME" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtResignationDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ResignationDate" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">离职类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlQuitType" runat="server" field="QuitType" tablename="EHR_ResignationApply" req="1" Width="100" activestatus="(23.填写离职申请)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">岗位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" class="kpms-textbox" readonly="readonly" field="Position" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">要求离职时间
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTimeRequired" runat="server" ActiveStatus="(23.填写离职申请)" Field="TimeRequired" MaxLength="64" CssClass="kpms-textbox" TableName="EHR_ResignationApply" />
        </td>
        <td class="td-l">合同期限
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtContractStartDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ContractStartDate" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" />
            至
            <zhongsoft:XHtmlInputText ID="txtContractEndDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ContractEndDate" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">离职手续是否办妥
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rdIsDone" runat="server" RepeatDirection="Horizontal" field="IsDone" tablename="EHR_ResignationApply" activestatus="(3.相关部门领导审批)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">减员日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="tbAttritionDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="AttritionDate" tablename="EHR_ResignationApply" DisplayStatus="(13.接收)" activestatus="(3.接收)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">离职说明
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbResignationReason" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="CHANGEREASON" tablename="EHR_ResignationApply" activestatus="(23.填写离职申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="Memo" tablename="EHR_ResignationApply" activestatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiResignationApplyID" runat="server" field="ResignationApplyID" tablename="EHR_ResignationApply" />
<script type="text/javascript"> 
    function checkForm() {
        if ($actName == "相关部门领导审批") {
            if ($formAction == 0) {
                var IsDone = $("#<%=rdIsDone.ClientID%> input:radio:checked").val();
                if (IsDone == undefined || IsDone != "已办妥") {
                    alert("不能提交“未办妥”离职手续的流程！");
                    return false;
                } else
                    return true;
            }
            return true;
        }
        return true;
    }
</script>

