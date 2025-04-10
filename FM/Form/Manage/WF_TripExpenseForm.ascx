<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TripExpenseForm.ascx.cs"
    Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_TripExpenseForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<%@ Register Src="~/FM/UI/Controls/UCTripExpenseDetail.ascx" TagName="UCTripExpenseDetail" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">报销单号<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtExpenseNo" runat="server" class="kpms-textbox-money" Width="185"
                readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="ExpenseNo" Activestatus="(23.填写申请)(23.修改)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyDeptName" field="ApplyDeptName" req="1"
                tablename="FM_Manage_TripExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="750" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(23.修改)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" Filter="{'ShowTree':'1'}" />
            <input type="hidden" id="hiApplyDeptID" runat="server" tablename="FM_Manage_TripExpenseForm" field="ApplyDeptID" />
        </td>
        <td class="td-l">报销人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" field="ApplyUserName" req="1"
                tablename="FM_Manage_TripExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="750" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(23.修改)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id','txtApplyDeptName':'OrgUnitName','hiApplyDeptID':'OrgUnitId'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="FM_Manage_TripExpenseForm" field="ApplyUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1" Field="ApplyDate" TableName="FM_Manage_TripExpenseForm"
                activestatus="(23.填写申请)(23.修改)" />
        </td>
        <td class="td-l">附单据数（张）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtBillNum" Width="65" req="1" class="kpms-textbox" activestatus="(23.填写申请)(23.修改)" field="BillNum" DataType="UInteger"
                tablename="FM_Manage_TripExpenseForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出差日期（起）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" ReadOnly="true" class="kpms-textbox-date" Field="StartDate" TableName="FM_Manage_TripExpenseForm"
                activestatus="(23.填写申请)(23.修改)" onblur="autoComputeDays()" />
        </td>
        <td class="td-l">出差日期（止）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" ReadOnly="true" class="kpms-textbox-date" Field="EndDate" TableName="FM_Manage_TripExpenseForm"
                activestatus="(23.填写申请)(23.修改)" onblur="autoComputeDays()" />
        </td>
    </tr>
    <tr>
        <td class="td-l">总天数<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSumDays" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" Width="65" readonly="readonly"
                DataType="Integer" field="SumDays" tablename="FM_Manage_TripExpenseForm">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">是否计入项目成本<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_TripExpenseForm" Field="IsProject"
                Activestatus="(23.填写申请)(23.修改)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_TripExpenseForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click"  Filter="{'isProjectState':'1'}" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_TripExpenseForm" Field="ProjectName" activestatus="(23.填写申请)(23.修改)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_TripExpenseForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)(23.修改)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_TripExpenseForm" Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)(23.修改)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_TripExpenseForm" Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_TripExpenseForm" field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">出差人<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="LightObjectSelector1" field="TripUserName" req="1"
                tablename="FM_Manage_TripExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="750" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(23.修改)" IsMutiple="true"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiTripUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
            <input type="hidden" id="hiTripUserID" runat="server" tablename="FM_Manage_TripExpenseForm" field="TripUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">事由及行程<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtTravelCause" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" EnableTheming="false" maxtext="500" req="1"
                tablename="FM_Manage_TripExpenseForm" field="TravelCause" ActiveStatus="(23.填写申请)(23.修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <uc1:UCTripExpenseDetail ID="UCTripExpenseDetail" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">其他公杂费</td>
    </tr>
    <tr>
        <td class="td-l">办公费</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOfficeCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="OfficeCost" Width="75"
                errmsg="【办公费】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiOfficeCostIsLock" field="OfficeCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"OfficeCostIsLock")' id="aOfficeCostIsLock"></a>
        </td>
        <td class="td-l">资料复印费</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtZiLiaoFuYinCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="ZiLiaoFuYinCost" Width="75"
                errmsg="【资料复印费】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiZiLiaoFuYinCostIsLock" field="ZiLiaoFuYinCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"ZiLiaoFuYinCostIsLock")' id="aZiLiaoFuYinCostIsLock"></a>
        </td>
    </tr>
    <tr>
        <td class="td-l">邮电费</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtYouDianCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="YouDianCost" Width="75"
                errmsg="【邮电费】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiYouDianCostIsLock" field="YouDianCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"YouDianCostIsLock")' id="aYouDianCostIsLock"></a>
        </td>
        <td class="td-l">业务费</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtYeWuCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="YeWuCost" Width="75"
                errmsg="【业务费】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiYeWuCostIsLock" field="YeWuCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"YeWuCostIsLock")' id="aYeWuCostIsLock"></a>
        </td>
    </tr>
    <tr>
        <td class="td-l">会议（培训）</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMeetCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="MeetCost" Width="75"
                errmsg="【 会议（培训）】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiMeetCostIsLock" field="MeetCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"MeetCostIsLock")' id="aMeetCostIsLock"></a>
        </td>
        <td class="td-l">其他</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOtherCost" class="kpms-textbox-money" activestatus="(23.填写申请)(23.修改)" field="OtherCost" Width="75"
                errmsg="【其他】请输入数字，可保留2位小数！" regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" tablename="FM_Manage_TripExpenseForm" onblur="autoComputeTotalMoney()" />
            <input type="hidden" runat="server" id="hiOtherCostIsLock" field="OtherCostIsLock" tablename="FM_Manage_TripExpenseForm" />
            <a style='color: blue' onclick='Triplock(this,"MeetCostIsLock")' id="aOtherCostIsLock"></a>
        </td>
    </tr>
    <tr>
        <td class="td-l">总计金额（小写）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbExpenseMoney" runat="server" class="kpms-textbox-money" Width="185" req="1"
                readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="ExpenseMoney" Activestatus="(23.填写申请)(23.修改)" />
        </td>
        <td class="td-l">总计金额（大写）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtExpenseMoneyUpper" runat="server" class="kpms-textbox" Width="85" req="1"
                readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="ExpenseMoneyUpper" Activestatus="(23.填写申请)(23.修改)" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%;">
                <tr>
                    <td class="td-l">是否冲抵借款<span class="req-star">*</span></td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rbtIsBorrow" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_TripExpenseForm" Field="IsBorrow" Activestatus="(23.填写申请)(23.修改)" />
                        <input type="hidden" runat="server" id="hiIsBorrowText" field="IsBorrowText" tablename="FM_Manage_TripExpenseForm" />
                    </td>
                    <td class="td-l" id="jiekuanTD1">借款单编号</td>
                    <td class="td-r" id="jiekuanTD2">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsBorrowNo" field="BorrowNo"
                            tablename="FM_Manage_TripExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            PageWidth="750" PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(23.修改)"
                            Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="BorrowNo" FilterFunction="filterApplyUser()"
                            ResultForControls="{'hiBorrowMoneyFormId':'id','txtBorrowMoney':'BorrowMoney','txtSumBackMoney':'SumBackMoney','txtNoBackMoney':'NoPayMoney'}" PageUrl="~/FM/Obsolete/BorrowMoneySelector.aspx"></zhongsoft:LightObjectSelector>
                        <input type="hidden" id="hiBorrowMoneyFormId" runat="server" tablename="FM_Manage_TripExpenseForm" field="BorrowMoneyFormId" />
                    </td>
                    <td class="td-l" id="bchkTD1">借款金额（元）</td>
                    <td class="td-r" id="bchkTD2">
                        <zhongsoft:XHtmlInputText ID="txtBorrowMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(23.修改)"
                            readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="BorrowMoney" />
                    </td>
                </tr>
                <tr id="borrwTR">
                    <td class="td-l" id="sbmTD1">累计已还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSumBackMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(23.修改)"
                            readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="SumBackMoney" />
                    </td>
                    <td class="td-l" id="nbmTD1">剩余未还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtNoBackMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(23.修改)"
                            readonly="readonly" TableName="FM_Manage_TripExpenseForm" Field="NoBackMoney" />
                    </td>
                    <td class="td-l" id="bmTD1">本次还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="txtBackMoney" class="kpms-textbox" activestatus="(23.填写申请)(23.修改)" errmsg="【 本次还款（元）】请输入数字，可保留2位小数！"
                            regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" field="BackMoney" tablename="FM_Manage_TripExpenseForm" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="500" tablename="FM_Manage_TripExpenseForm" field="Remark" ActiveStatus="(23.填写申请)(23.修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiTripExpenseFormId" runat="server" tablename="FM_Manage_TripExpenseForm" field="TripExpenseFormId" />
<input type="hidden" id="hiOldExpenseMoney" runat="server" tablename="FM_Manage_TripExpenseForm" field="OldExpenseMoney" />
<input type="hidden" id="hiIsAccounting" runat="server" tablename="FM_Manage_TripExpenseForm" field="IsAccounting" />
<input type="hidden" id="hiSumCost" runat="server" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
        $("#ctl10_lbsBorrowNo_btn").hide();
        $("#<%=txtBorrowMoney.ClientID %>").hide();
        $("#<%=txtBackMoney.ClientID %>").hide();
        $("#borrwTR").hide();
        $("#jiekuanTD1").hide();
        $("#bchkTD1").hide();
        $("#jiekuanTD2").hide();
        $("#bchkTD2").hide();
        SetIsBorrowShow();
        autoComputeTotalMoney();
        convertToCHNMoney("<%=tbExpenseMoney.ClientID %>", "<%=txtExpenseMoneyUpper.ClientID %>");
        ComputeDay();

        
        //会计办理：act_6852
        if ($actCurrId != "act_6852") {
            ///不是会计办理环节则隐藏所有 锁定，取消锁定按钮
            hideLockBtn();
        }
        if ($actCurrId == "act_6852") {
            //保存原总计金额
            if ($("#<%=hiOldExpenseMoney.ClientID%>").val() == "") {
                $("#<%=hiOldExpenseMoney.ClientID%>").val($("#<%=tbExpenseMoney.ClientID%>").val())
            }
            //显示按钮
            if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOfficeCostIsLock.ClientID %>").val() == "") {
                $("#aOfficeCostIsLock").html("锁定")
            }
            else if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "1") {
                $("#aOfficeCostIsLock").html("取消锁定")
            }
            if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "0" || $("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "") {
                $("#aZiLiaoFuYinCostIsLock").html("锁定")
            }
            else if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "1") {
                $("#aZiLiaoFuYinCostIsLock").html("取消锁定")
            }

            if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYouDianCostIsLock.ClientID %>").val() == "") {
                $("#aYouDianCostIsLock").html("锁定")
            }
            else if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "1") {
                $("#aYouDianCostIsLock").html("取消锁定")
            }
            if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYeWuCostIsLock.ClientID %>").val() == "") {
                $("#aYeWuCostIsLock").html("锁定")
            }
            else if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "1") {
                $("#aYeWuCostIsLock").html("取消锁定")
            }
            if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "0" || $("#<%=hiMeetCostIsLock.ClientID %>").val() == "") {
                $("#aMeetCostIsLock").html("锁定")
            }
            else if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "1") {
                $("#aMeetCostIsLock").html("取消锁定")
            }
            if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOtherCostIsLock.ClientID %>").val() == "") {
                $("#aOtherCostIsLock").html("锁定")
            }
            else if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "1") {
                $("#aOtherCostIsLock").html("取消锁定")
            }

        }
        //修改：act_47828
        if ($actCurrId == "act_47828") {
            //修改环节，未锁定的费用可编辑
            IsCanEdit();

            if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOfficeCostIsLock.ClientID %>").val() == "") {

                $("#<%=txtOfficeCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtOfficeCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "0" || $("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtZiLiaoFuYinCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtZiLiaoFuYinCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYouDianCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtYouDianCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtYouDianCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYeWuCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtYeWuCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtYeWuCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "0" || $("#<%=hiMeetCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtMeetCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtMeetCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOtherCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtOtherCost.ClientID %>").attr("style", 'color:red;width:75px');
            }
            else if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtOtherCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
        }


        ///流程走过会计办理环节后,未锁定的费用显示红色; act_47828：修改环节
        if (<%=getKuaiJiBanLi()%>>0 && $actCurrId != "act_47828") {

            SetColor();
            if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOfficeCostIsLock.ClientID %>").val() == "") {

                $("#<%=txtOfficeCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiOfficeCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtOfficeCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "0" || $("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtZiLiaoFuYinCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiZiLiaoFuYinCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtZiLiaoFuYinCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYouDianCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtYouDianCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiYouDianCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtYouDianCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "0" || $("#<%=hiYeWuCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtYeWuCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiYeWuCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtYeWuCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "0" || $("#<%=hiMeetCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtMeetCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiMeetCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtMeetCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }
            if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "0" || $("#<%=hiOtherCostIsLock.ClientID %>").val() == "") {
                $("#<%=txtOtherCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:75px');
            }
            else if ($("#<%=hiOtherCostIsLock.ClientID %>").val() == "1") {
                $("#<%=txtOtherCost.ClientID %>").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:75px');
            }

        }

    }

    function ComputeDay(computeDay) {
        if (computeDay != undefined) {
            var startDate = computeDay.split('%%')[1];
            var endDate = computeDay.split('%%')[0];
            if (startDate != "") {
                $('#<%=txtStartDate.ClientID %>').val(startDate);
            } if (endDate != "") {
                $('#<%=txtEndDate.ClientID %>').val(endDate);
            }
        } autoComputeDays();
    }
    $("#<%=rblIsProject.ClientID%>").live("change", function () {
        SetIsShow();
    });
    function filterApplyUser() {
        var ApplyUserID = $('#<%=hiApplyUserID.ClientID %>').val();
        return "{'ApplyUserID':'" + ApplyUserID + "'}";
    }
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

    $("#<%=rbtIsBorrow.ClientID%>").live("change", function () {
        SetIsBorrowShow();
    });

    function SetIsBorrowShow() {
        var isBorrow = $("#<%=rbtIsBorrow.ClientID %>").find("input[type='radio']:checked").val();
        if (isBorrow == "0") {
            //借款信息            
            $("#<%=lbsBorrowNo.ClientID %>").hide();
            $("#ctl10_lbsBorrowNo_btn").hide();
            $("#<%=txtBorrowMoney.ClientID %>").hide();
            $("#<%=txtBackMoney.ClientID %>").hide();
            $("#<%=txtSumBackMoney.ClientID %>").removeAttr("req");
            $("#<%=txtNoBackMoney.ClientID %>").removeAttr("req");
            $("#<%=txtBackMoney.ClientID %>").removeAttr("req");
            $("#borrwTR").hide();
            $("#jiekuanTD1").hide();
            $("#bchkTD1").hide();
            $("#jiekuanTD2").hide();
            $("#bchkTD2").hide();
        } else {
            $("#<%=lbsBorrowNo.ClientID %>").show();
            $("#ctl10_lbsBorrowNo_btn").show();
            $("#<%=txtBorrowMoney.ClientID %>").show();
            $("#<%=txtBackMoney.ClientID %>").show();
            $("#<%=txtSumBackMoney.ClientID %>").attr("req", "1");
            $("#<%=txtNoBackMoney.ClientID %>").attr("req", "1");
            $("#<%=txtBackMoney.ClientID %>").attr("req", "1");
            $("#sbmTD1").html("累计已还款（元）<span class='req-star'>*</span >");
            $("#nbmTD1").html("剩余未还款（元）<span class='req-star'>*</span >");
            $("#bmTD1").html("本次还款（元）<span class='req-star'>*</span >");
            $("#borrwTR").show();
            $("#jiekuanTD1").show();
            $("#bchkTD1").show();
            $("#jiekuanTD2").show();
            $("#bchkTD2").show();
        }
    }

    function autoComputeTotalMoney() {
        var sumValue = 0;
        $("#ctl10_UCTripExpenseDetail_gvList [id$=txtPiaoMianCost]").each(function () {
            sumValue += floatParse($(this).val());
        });
        $("#ctl10_UCTripExpenseDetail_gvList [id$=txtHuoShiCost]").each(function () {
            sumValue += floatParse($(this).val());
        });
        $("#ctl10_UCTripExpenseDetail_gvList [id$=txtJianKuDiQuCost]").each(function () {
            sumValue += floatParse($(this).val());
        });
        $("#ctl10_UCTripExpenseDetail_gvList [id$=txtGongZhaFeiCost]").each(function () {
            sumValue += floatParse($(this).val());
        });
        $("#ctl10_UCTripExpenseDetail_gvList [id$=txtZhuSuCost]").each(function () {
            sumValue += floatParse($(this).val());
        });
        var OfficeCost = $("#<%=txtOfficeCost.ClientID%>").val();
        var ZiLiaoFuYinCost = $("#<%=txtZiLiaoFuYinCost.ClientID%>").val();
        var YouDianCost = $("#<%=txtYouDianCost.ClientID%>").val();
        var YeWuCost = $("#<%=txtYeWuCost.ClientID%>").val();
        var MeetCost = $("#<%=txtMeetCost.ClientID%>").val();
        var OtherCost = $("#<%=txtOtherCost.ClientID%>").val();
        sumValue = accAddFloat6(OfficeCost, sumValue);
        sumValue = accAddFloat6(ZiLiaoFuYinCost, sumValue);
        sumValue = accAddFloat6(YouDianCost, sumValue);
        sumValue = accAddFloat6(YeWuCost, sumValue);
        sumValue = accAddFloat6(MeetCost, sumValue);
        sumValue = accAddFloat6(OtherCost, sumValue);
        $("#<%=tbExpenseMoney.ClientID%>").val(sumValue);
        convertToCHNMoney("<%=tbExpenseMoney.ClientID %>", "<%=txtExpenseMoneyUpper.ClientID %>");
    }

    function autoComputeDays() {
        var end = $('#<%=txtEndDate.ClientID %>').val();
        var start = $('#<%=txtStartDate.ClientID %>').val();
        if (start != "" && end != "") {
            if (start > end) {
                alert("-出差日期（起）应早于出差日期（止）！");
                return false;
            }
            var date1 = new Date(Date.parse(start.replace(/-/g, "/")));
            var date2 = new Date(Date.parse(end.replace(/-/g, "/")));
            var date3 = date2.getTime() - date1.getTime() //时间差的毫秒数
            var days = Math.floor(date3 / (24 * 3600 * 1000)) + 1; // 计算出相差天数
            $("#<%=txtSumDays.ClientID%>").val(days);
        }
    }

    function checkForm() {
        if ($action != "2") {
            $("#<%=txtEndDate.ClientID %>").attr("req", "1");
            $("#<%=txtStartDate.ClientID %>").attr("req", "1");
        }
        if (!checkReqField()) {
            return false;
        }
        else {
            if ("<%=this.ActionType %>" == "Update") {
                if ($actCurrId == "act_14197" || $actCurrId == "act_47828") {
                    if ($("#ctl10_UCTripExpenseDetail_gvList")[0].rows[1].cells[0].innerText == "没有费用明细") {
                        alert('-请至少添加一条费用明细记录！');
                        return false;
                    }
                    var sumValue = 0;
                    $("#ctl10_UCTripExpenseDetail_gvList [id$=txtPiaoMianCost]").each(function () {
                        sumValue += floatParse($(this).val());
                    });
                    $("#ctl10_UCTripExpenseDetail_gvList [id$=txtHuoShiCost]").each(function () {
                        sumValue += floatParse($(this).val());
                    });
                    $("#ctl10_UCTripExpenseDetail_gvList [id$=txtJianKuDiQuCost]").each(function () {
                        sumValue += floatParse($(this).val());
                    });
                    $("#ctl10_UCTripExpenseDetail_gvList [id$=txtGongZhaFeiCost]").each(function () {
                        sumValue += floatParse($(this).val());
                    });
                    $("#ctl10_UCTripExpenseDetail_gvList [id$=txtZhuSuCost]").each(function () {
                        sumValue += floatParse($(this).val());
                    });
                    var OfficeCost = $("#<%=txtOfficeCost.ClientID%>").val();
                    var ZiLiaoFuYinCost = $("#<%=txtZiLiaoFuYinCost.ClientID%>").val();
                    var YouDianCost = $("#<%=txtYouDianCost.ClientID%>").val();
                    var YeWuCost = $("#<%=txtYeWuCost.ClientID%>").val();
                    var MeetCost = $("#<%=txtMeetCost.ClientID%>").val();
                    var OtherCost = $("#<%=txtOtherCost.ClientID%>").val();
                    sumValue = accAddFloat6(OfficeCost, sumValue);
                    sumValue = accAddFloat6(ZiLiaoFuYinCost, sumValue);
                    sumValue = accAddFloat6(YouDianCost, sumValue);
                    sumValue = accAddFloat6(YeWuCost, sumValue);
                    sumValue = accAddFloat6(MeetCost, sumValue);
                    sumValue = accAddFloat6(OtherCost, sumValue);
                    if (sumValue == 0) {
                        alert("- 必须填写一条金额！");
                        return false;
                    }

                }
            }
            var isBorrow = $("#<%=rbtIsBorrow.ClientID %>").find("input[type='radio']:checked").val();
            if (isBorrow == "1") {
                var backmoney = $('#<%=txtBackMoney.ClientID %>').val();
                var nobackmoney = $('#<%=txtNoBackMoney.ClientID %>').val();
                if (backmoney != "" && nobackmoney != "") {
                    if (floatParse(backmoney) > floatParse(nobackmoney)) {
                        alert("-【 本次还款（元）】不能大于【 剩余未还款（元）】！");
                        return false;
                    }
                }
            }
            return true;
        }
    }

    //设置锁定状态
    function Triplock(e, t) {
        if (e.innerText == "锁定" && ($(e).prev("input").val() == "0" || $(e).prev("input").val() == "")) {
            e.innerText = "取消锁定"
            $(e).prev("input").val("1")//已锁定
            $(e).prev("input").prev("input").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:100px');
        }
        else if (e.innerText == "取消锁定" && $(e).prev("input").val() == "1") {
            e.innerText = "锁定"
            $(e).prev("input").val("0")//未锁定
            $(e).prev("input").prev("input").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:100px');
        }
        var param = { asyfunc: "updateIsLockByTrip" }
        //表名|字段名|id|锁定状态值|where字段名
        var data = "FM_Manage_TripExpenseForm" + "|" + t + "|" + $("#<%=hiTripExpenseFormId.ClientID%>").val() + "|" + $(e).prev("input").val() + "|" + "TripExpenseFormId";
        param.data = data;
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>/FM/Handler/DetailHandler.ashx',
            data: param,
            async: false,
            cache: false,
            success: function (res) {

            },
            error: function (err) {

            }
        });

    }
</script>
