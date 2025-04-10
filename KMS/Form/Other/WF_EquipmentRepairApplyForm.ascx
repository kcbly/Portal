<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_EquipmentRepairApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_EquipmentRepairApplyForm" %>
<table id="Table1" class="tz-table" style="width: 100%">
    <tr>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
             <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Other_EquipmentRepairApplyForm" activestatus="(23.填写申请)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
         <td class="td-l">申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <div style="width:180px;">
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="ApplyDeptName" PageHeight="650px"
                SelectPageMode="Dialog" tablename="KMS_Other_EquipmentRepairApplyForm" activestatus="(23.填写申请)" ShowAttrs="name"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" field="ApplyDeptId" tablename="KMS_Other_EquipmentRepairApplyForm" /></div>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Other_EquipmentRepairApplyForm" Field="ApplyDate" ActiveStatus="(23.填写申请)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-m"  >
            <div style="width:180px;">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" IsMutiple="false" req="1"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写申请)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiApplyUserId':'id'}" ShowJsonRowColName="true" PageHeight="650px"
                ResultAttr="name" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                field="ApplyUserName" DoCancel="false" tablename="KMS_Other_EquipmentRepairApplyForm"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="KMS_Other_EquipmentRepairApplyForm" />
            </div></td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">

            <zhongsoft:LightTextBox ID="txtEntryName" TableName="KMS_Other_EquipmentRepairApplyForm" Field="EntryName" ActiveStatus="(23.填写申请)" req="1"
                runat="server"  CssClass="kpms-textbox" EnableTheming="false"  MaxLength="200"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">维修、修缮原因<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRepairReason" TableName="KMS_Other_EquipmentRepairApplyForm" Field="RepairReason" ActiveStatus="(23.填写申请)" req="1" 
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxLength="500"/>
        </td>
    </tr>
     <tr>
        <td class="td-l">计划时间（起）</td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtLeaveStartDate" runat="server" type="text" class="kpms-textbox-comparedate" onblur="LeaveDate()" TableName="KMS_Other_EquipmentRepairApplyForm"
                Field="PlanStartTime"   compare="1" readonly="readonly" activestatus="(23.填写申请)" />
        </td>
        <td class="td-l">计划时间（止）</td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtLeaveEndDate" runat="server" type="text" class="kpms-textbox-comparedate" onblur="LeaveDate()" TableName="KMS_Other_EquipmentRepairApplyForm"
                Field="PlanEndTime"  compare="1"  readonly="readonly" activestatus="(23.填写申请)"  />
        </td>
    </tr>
    <tr>
        <td class="td-l">工期（天）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtWorkingHours" CssClass="kpms-textbox" regex="^[0-9]*[1-9][0-9]*$" errmsg="用户输入必填填写数字,并且应为正整数" req="1"
                TableName="KMS_Other_EquipmentRepairApplyForm" Field="WorkingHours" ActiveStatus="(23.填写申请)" runat="server" Width="100px" MaxLength="6"/>
        </td>
        <td class="td-l">预估费用（万元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtEstimatedCost" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" MaxLength="6" CssClass="kpms-textbox-money" req="1"
                errmsg="用户输入必填填写数字，并且小数点后最多保留2位" TableName="KMS_Other_EquipmentRepairApplyForm" Field="EstimatedCost" ActiveStatus="(23.填写申请)" runat="server" Width="100px" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主要项目或工程量
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtQuantities" TableName="KMS_Other_EquipmentRepairApplyForm" Field="Quantities" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxLength="500"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_EquipmentRepairApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxLength="500"/>
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="EquipmentRepairApplyFormId" tablename="KMS_Other_EquipmentRepairApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //自动计算天数
    function LeaveDate() {
        var startDate = $("#<%=txtLeaveStartDate.ClientID%>").val();
        var endDate = $("#<%=txtLeaveEndDate.ClientID%>").val();

        if (startDate != "" && endDate != "") {
            var d1 = new Date(startDate.replace(/-/g, "/"));
            var d2 = new Date(endDate.replace(/-/g, "/"));
            var time = d2.getTime() - d1.getTime();
            var days = parseInt(Math.abs(time / (1000 * 60 * 60 * 24)));
            $("#<%=txtWorkingHours.ClientID%>").val(days+1);
        }
    }

</script>
