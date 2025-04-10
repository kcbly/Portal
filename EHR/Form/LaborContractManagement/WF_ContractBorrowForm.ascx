<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractBorrowForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.LaborContractManagement.WF_ContractBorrowForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">姓名<span class="req-star">*</span>
        </td>
        <td class="td-r" style="width: 200px">
            <zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" field="ApplyUserName" SelectPageMode="Dialog"
                tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id','tbApplyUserCode':'LoginId','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" ></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserID" field="ApplyUserID" tablename="EHR_UC_ContractBorrowForm" />
        </td>
        <td class="td-l">登录号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbApplyUserCode" readonly="readonly"
                class="kpms-textbox" style="width: 100px" field="ApplyUserCode" tablename="EHR_UC_ContractBorrowForm"
                activestatus="(23.发起)" />
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <input type="hidden" id="hiDeptID" runat="server" field="ApplyDeptID" tablename="EHR_UC_ContractBorrowForm" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" style="width: 50%" readonly="readonly" class="kpms-textbox" field="ApplyDeptName" tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ApplyDate" tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)" req="1" />
        </td>
        <td class="td-l">借用合同数（份）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbContractNumber" runat="server" ActiveStatus="(23.发起)" Field="ContractNumber" MaxLength="64" CssClass="kpms-textbox" TableName="EHR_UC_ContractBorrowForm" DataType="Integer" req="1" />
        </td>
        <td class="td-l">预计归还日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanReturnDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="PlanReturnDate" tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">借用事由
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbBorrowCause" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="BorrowCause" tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同对应人员
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="tbUserNames" field="UserNames" SelectPageMode="Dialog"
                tablename="EHR_UC_ContractBorrowForm" activestatus="(23.发起)" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUserIDs':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" IsMutiple="true"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiUserIDs" field="UserIDs" tablename="EHR_UC_ContractBorrowForm" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(13.审核)(13.确认归还)">
        <td class="td-l">借出日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtBorrowDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="BorrowDate" tablename="EHR_UC_ContractBorrowForm" activestatus="(3.审核)" req="1" />
        </td>
        <td class="td-l">归还日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtReturnDate" runat="server" class="kpms-textbox-date" readonly="readonly" field="ReturnDate" tablename="EHR_UC_ContractBorrowForm" activestatus="(3.确认归还)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" maxtext="512" CssClass="kpms-textarea" EnableTheming="false" field="Memo" tablename="EHR_UC_ContractBorrowForm" activestatus="(23.*)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiContractBorrowFormID" runat="server" field="ContractBorrowFormID" tablename="EHR_UC_ContractBorrowForm" />
<script type="text/javascript"> 

</script>
