<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SendForeignApply.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_SendForeignApply" %>
<table class="tz-table">
    <tr>
        <td class="td-l">姓名<span class="req-star">*</span>
        </td>
        <td class="td-r" style="width: 200px">
            <zhongsoft:LightObjectSelector runat="server" ID="tbUserlName" field="ApplyUserName" SelectPageMode="Dialog"
                tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id','tbApplyUserCode':'LoginId','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" OnClick="tbUserlName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserID" field="ApplyUserID" tablename="EHR_UB_SendForeignApply" />
        </td>
        <td class="td-l">登录号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbApplyUserCode" readonly="readonly"
                class="kpms-textbox" style="width: 100px" field="ApplyUserCode" tablename="EHR_UB_SendForeignApply"
                activestatus="(23.发起)" />
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EHR_UB_SendForeignApply" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" style="width: 50%" readonly="readonly" class="kpms-textbox" field="DeptName" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">岗位
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPost" runat="server" class="kpms-textbox" readonly="readonly" field="Post" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)" />
        </td>
        <td class="td-l">学历
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtAcademicDegree" runat="server" class="kpms-textbox" readonly="readonly" field="AcademicDegree" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)" />
        </td>
        <td class="td-l">职称
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbJobTitle" runat="server" ActiveStatus="(23.发起)" Field="JobTitle" MaxLength="64" CssClass="kpms-textbox" TableName="EHR_UB_SendForeignApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">岗位证书
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPostCertificate" runat="server" ActiveStatus="(23.发起)" Field="PostCertificate" MaxLength="64" CssClass="kpms-textbox" TableName="EHR_UB_SendForeignApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">拟外派单位及岗位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbPlanSendUintAndPost" runat="server" ActiveStatus="(23.发起)" Field="PlanSendUintAndPost" MaxLength="64" CssClass="kpms-textbox" TableName="EHR_UB_SendForeignApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">外派/延长外派理由
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbSendReason" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="SendReason" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">拟外派时间（起）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanSendStartDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="PlanSendStartDate" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)" />
        </td>
        <td class="td-l">拟外派时间（止）
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtPlanSendEndDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="PlanSendEndDate" tablename="EHR_UB_SendForeignApply" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="Memo" tablename="EHR_UB_SendForeignApply" activestatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiSendForeignApplyID" runat="server" field="SendForeignApplyID" tablename="EHR_UB_SendForeignApply" />
<input type="hidden" id="hiCreateDate" runat="server" field="CreateDate" tablename="EHR_UB_SendForeignApply" />
<script type="text/javascript"> 

</script>
