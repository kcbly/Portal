<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PlainItemSuperviseForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Meet.WF_PlainItemSuperviseForm" %>
<%@ Register Src="~/KMS/UI/Controls/UCPlainItemSuperviseFormDetail.ascx" TagName="UCPlainItemSuperviseFormDetail" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">标题<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtTitle" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="Title" ActiveStatus="(23.发起督办)" runat="server" MaxLength="100" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事项内容<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtItemContent" TableName="KMS_Meet_PlainItemSuperviseForm" Field="ItemContent" ActiveStatus="(23.发起督办)" req="1"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>

    </tr>
    <tr>

        <td class="td-l">主办部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="losHostDeptName" field="HostDeptName"
                SelectPageMode="Dialog" tablename="KMS_Meet_PlainItemSuperviseForm" activestatus="(23.发起督办)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiHostDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiHostDeptId" field="HostDeptId" tablename="KMS_Meet_PlainItemSuperviseForm" />
        </td>
        <td class="td-l">要求最晚完成日期<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtLastCompleDate" TableName="KMS_Meet_PlainItemSuperviseForm" Field="LastCompleDate" ActiveStatus="(23.发起督办)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">配合部门</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="losFitDeptName" field="FitDeptName"
                SelectPageMode="Dialog" tablename="KMS_Meet_PlainItemSuperviseForm" activestatus="(23.发起督办)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="true" ResultForControls="{'hiFitDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiFitDeptId" field="FitDeptId" tablename="KMS_Meet_PlainItemSuperviseForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">提醒频率</td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlWarnFrequency" runat="server" field="WarnFrequency" Style="width: 90px;"
                tablename="KMS_Meet_PlainItemSuperviseForm" activestatus="(23.发起督办)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiWarnFrequencyText" field="WarnFrequencyText" tablename="KMS_Meet_PlainItemSuperviseForm" />
        </td>
        <td class="td-l">提醒提前天数</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtWarnBeforeDay" TableName="KMS_Meet_PlainItemSuperviseForm" Field="WarnBeforeDay" runat="server"
                ActiveStatus="(23.发起督办)" Width="80px" regex="^[0-9]\d*$" errmsg="必须是整正数" CssClass="kpms-textbox-money" EnableTheming="false" />
        </td>
    </tr>

    <tr id="Target2">
        <td class="td-l">提醒接收人</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtWarnReceiver" SelectPageMode="Dialog" activestatus="(23.发起督办)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="WarnReceiver" tablename="KMS_Meet_PlainItemSuperviseForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="true" ResultForControls="{'hiWarnReceiverId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiWarnReceiverId" field="WarnReceiverId" tablename="KMS_Meet_PlainItemSuperviseForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发起人</td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtLaunchUserName" SelectPageMode="Dialog" activestatus="(23.发起督办)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="LaunchUserName" tablename="KMS_Meet_PlainItemSuperviseForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" 
                IsMutiple="false" ResultForControls="{'hiLaunchUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiLaunchUserId" field="LaunchUserId" tablename="KMS_Meet_PlainItemSuperviseForm" />
        </td>
        <td class="td-l">发起日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtLaunchDate" TableName="KMS_Meet_PlainItemSuperviseForm" Field="LaunchDate" ActiveStatus="(23.发起督办)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注 </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Meet_PlainItemSuperviseForm" Field="Remark" ActiveStatus="(23.发起督办)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-l">
            <uc1:UCPlainItemSuperviseFormDetail ID="UCPlainItemSuperviseFormDetail" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Meet_PlainItemSuperviseForm" field="PlainItemSuperviseFormId" />

