<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StaffTransfer.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_StaffTransfer" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>

<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">姓名<span class="req-star">*</span>
        </td>
        <td class="td-r" style="width: 200px">
            <zhongsoft:LightObjectSelector runat="server" ID="tbUserlName" field="USERNAME" SelectPageMode="Dialog"
                tablename="EHR_StaffTransfer" activestatus="(23.发起)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiUserId':'id','tbUserCode':'LoginId','hiOrDeptId':'OrgUnitId','tbOgDeptName':'OrgUnitName','tbOgRankName':'RANKNAME'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUserId" field="USERID" tablename="EHR_StaffTransfer" />
        </td>
        <td class="td-l">登录号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" readonly="readonly"
                class="kpms-textbox" style="width: 100px" field="USERCODE" tablename="EHR_StaffTransfer"
                activestatus="(23.发起)" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMakeDate" class="kpms-textbox-date"
                field="APPLYDATE" tablename="EHR_StaffTransfer" activestatus="(23.发起)"
                readonly="readonly" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">调动日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbTransferDate" class="kpms-textbox-date" field="TransferDate" tablename="EHR_StaffTransfer"
                activestatus="(23.发起)" readonly="readonly" req="1" />
        </td>
        <td class="td-l">工资调整日期（起）<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="tbStartingSalaryDate" class="kpms-textbox-date" field="StartingSalaryDate" tablename="EHR_StaffTransfer" activestatus="(23.发起)" readonly="readonly" req="1" />
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-r" style="text-align: center; font-size: 15px; font-weight: bold">变动前岗位、岗薪工资
        </td>
    </tr>
    <tr>
        <td class="td-l">调出部门
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="tbOgDeptName" readonly="readonly"
                class="kpms-textbox" field="OGDEPTNAME" tablename="EHR_StaffTransfer" activestatus="(23.发起)" />
            <input type="hidden" runat="server" id="hiOrDeptId" field="OGDEPTID" tablename="EHR_StaffTransfer" />
        </td>
        <td class="td-l">原职务
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbOgRankName" class="kpms-textbox" field="OGRANKNAME" tablename="EHR_StaffTransfer" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">岗级
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbOldPostGrade" field="OldPostGrade"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">薪级
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbOldSalaryGrade" field="OldSalaryGrade"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">工资额
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbOldWages" field="OldWages"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-r" style="text-align: center; font-size: 15px; font-weight: bold">变动后岗位、岗薪工资
        </td>
    </tr>
    <tr>
        <td class="td-l">调入部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbOrgTargetName" field="CHANGEDEPTNAME" SelectPageMode="Dialog"
                tablename="EHR_StaffTransfer" activestatus="(23.发起)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                ResultForControls="{'hiTransferDeptID':'id'}"
                PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiTransferDeptID" readonly="readonly" field="CHANGEDEPTID" tablename="EHR_StaffTransfer" />
        </td>
        <td class="td-l">调动后职务
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtNowPost" class="kpms-textbox" field="NowPost" tablename="EHR_StaffTransfer" activestatus="(23.发起)" />
        </td>

    </tr>
    <tr>
        <td class="td-l">岗级
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbNewPostGrade" field="NewPostGrade"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">薪级
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbNewSalaryGrade" field="NewSalaryGrade"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">工资额
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbNewWages" field="NewWages"
                tablename="EHR_StaffTransfer" MaxLength="64" class="kpms-textbox" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">专业考核意见
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbOpinions" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Opinions" tablename="EHR_StaffTransfer"
                activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">调整理由和依据
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbReasons" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Reasons" tablename="EHR_StaffTransfer"
                activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_StaffTransfer"
                activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiStaffTransferID" field="STAFFTRANSFERID" tablename="EHR_StaffTransfer" />
<input type="hidden" id="hiRZ" runat="server" value="w201708090000002" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
</script>
