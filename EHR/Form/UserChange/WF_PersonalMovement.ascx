<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PersonalMovement.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_PersonalMovement" %>

<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            标 题<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtTitle" field="TITLE" tablename="EHR_PERSONALMOVEMENTFORM"
                activestatus="(23.征求意见并形成方案)" CssClass="kpms-textbox"
                MaxLength="128" req="1">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            拟稿人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillUserName" readonly="readonly"
                class="kpms-textbox" field="FILLUSERNAME" tablename="EHR_PERSONALMOVEMENTFORM"
                activestatus="(23.征求意见并形成方案)" />
            <input type="hidden" runat="server" id="hiFillUserID" field="FILLUSERID" tablename="EHR_PERSONALMOVEMENTFORM" />
            <input type="hidden" runat="server" id="hiFillUserCode" field="FILLUSERCODE" tablename="EHR_PERSONALMOVEMENTFORM" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhone" class="kpms-textbox" field="PHONE"
                readonly="readonly" tablename="EHR_PERSONALMOVEMENTFORM" activestatus="(23.征求意见并形成方案)" />
        </td>
        <td class="td-l">
            拟稿部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFillDeptName" readonly="readonly"
                activestatus="(23.征求意见并形成方案)" field="FILLDEPTNAME" tablename="EHR_PERSONALMOVEMENTFORM"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiFillDeptID" field="FILLDEPTID" tablename="EHR_PERSONALMOVEMENTFORM" />
            <input type="hidden" runat="server" id="hiFillDeptCode" field="FILLDEPTCODE" tablename="EHR_PERSONALMOVEMENTFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            拟稿日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                field="FILLDATE" tablename="EHR_PERSONALMOVEMENTFORM" activestatus="(23.征求意见并形成方案)" compare="1" />
        </td>
        <td class="td-l">
            需办结日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                field="FINISHDATE" tablename="EHR_PERSONALMOVEMENTFORM" activestatus="(23.征求意见并形成方案)" compare="1" />
        </td>
        <td  colspan="2">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" MaxLength="1024" field="MEMO" tablename="EHR_PERSONALMOVEMENTFORM"
                activestatus="(23.征求意见并形成方案)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiPersonalMovementFormID" field="PERSONALMOVEMENTFORMID"
    tablename="EHR_PERSONALMOVEMENTFORM" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    
</script>
