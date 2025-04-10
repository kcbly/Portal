<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_AnnualLeaveApply.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.OrgUsers.WF_AnnualLeaveApply" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbApplyUserName" readonly="readonly"
                class="kpms-textbox" field="APPLYUSERNAME" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.*)" />
            <input type="hidden" runat="server" id="hiApplyUserId" field="APPLYUSERID" tablename="EHR_ANNUALLEAVEAPPLYFORM" />
            <input type="hidden" runat="server" id="hiApplyUserCode" field="APPLYUSERCODE" tablename="EHR_ANNUALLEAVEAPPLYFORM" />
        </td>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbApplyDeptName" readonly="readonly"
                activestatus="(23.*)" field="APPLYDEPTNAME" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiApplyDeptID" field="APPLYDEPTID" tablename="EHR_ANNUALLEAVEAPPLYFORM" />
        </td>
        <td class="td-l">
            填写日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbApplyDate" runat="server"  class="kpms-textbox-date" 
                field="APPLYDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM" activestatus="(23.提交年休假申请)(3.修改年休假申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            参加工作日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbWorkDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                field="WORKDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM" activestatus="(23.*)" />
        </td>
        <td class="td-l">
            本年带薪年休假天数
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAnnualLeaveDays" runat="server" ReadOnly="true" class="kpms-textbox"
                field="ANNUALLEAVEDAYS" tablename="EHR_ANNUALLEAVEAPPLYFORM" activestatus="(23.*)" />
        </td>
    </tr>
    <tr>
        <td>
            请假时间<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:XHtmlInputText ID="tbAskLeaveStDate" runat="server" req="1"
                class="kpms-textbox-date" field="ASKLEAVESTDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.提交年休假申请)(3.修改年休假申请)" />
            到
            <zhongsoft:XHtmlInputText ID="tbAskLeaveEndDate" runat="server" req="1"
                class="kpms-textbox-date" field="ASKLEAVEENDDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.提交年休假申请)(3.修改年休假申请)" />
        </td>
        <td>
            休假天数<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:LightTextBox ID="tbAskLeaveDays" runat="server" class="kpms-textbox" req="1"
                field="ASKLEAVEDAYS" tablename="EHR_ANNUALLEAVEAPPLYFORM" activestatus="(23.提交年休假申请)(3.修改年休假申请)" />
        </td>
    </tr>
    <tr id="trVacation">
        <td>
            实际休假时间<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:XHtmlInputText ID="tbVacationStDate" runat="server" req="1"
                class="kpms-textbox-date" field="VACATIONSTDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.填写实际休假日期)" />
            到
            <zhongsoft:XHtmlInputText ID="tbVacationEndDate" runat="server" req="1"
                class="kpms-textbox-date" field="VACATIONENDDATE" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.填写实际休假日期)" />
        </td>
        <td>
            实际休假天数<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:LightTextBox ID="tbVacationDays" runat="server" class="kpms-textbox" req="1"
                field="VACATIONDAYS" tablename="EHR_ANNUALLEAVEAPPLYFORM" activestatus="(23.填写实际休假日期)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" MaxLength="512" field="MEMO" tablename="EHR_ANNUALLEAVEAPPLYFORM"
                activestatus="(23.*)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center">
            本年度年休假请假记录
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
                runat="server" DataKeyNames="ANNUALLEAVEAPPLYFORMID" ShowFooter="true" OnRowDataBound="gvList_RowDataBound"
                BindGridViewMethod="BindDataGrid">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="APPLYUSERNAME" HeaderText="请假人" ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="APPLYDEPTNAME" HeaderText="部门" ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="VACATIONSTDATE" HeaderText="实际休假开始时间"
                        ItemStyle-Width="7%" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="VACATIONENDDATE" HeaderText="实际休假结束时间"
                        ItemStyle-Width="7%" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="VACATIONDAYS" HeaderText="实际休假天数" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MEMO" HeaderText="备注" ItemStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="查看流程" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif"onclick='return detailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiAnnualLeaveApplyFormId" field="ANNUALLEAVEAPPLYFORMID"
    tablename="EHR_ANNUALLEAVEAPPLYFORM" />
<input type="hidden" id="hiSumVacationDays" runat="server" value="0"/>
<input type="hidden" id="hiLeaveYear" runat="server" field="LEAVEYEAR" tablename="EHR_ANNUALLEAVEAPPLYFORM" />
<!--人资部部门Code-->
<input type="hidden" runat="server" id="hiRZDeptCode" value="01017032" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

        accessOfVacationDisplay()
    }

    function checkDate1() {
        var startdate = $("#<%=tbAskLeaveStDate.ClientID %>").val();
        var enddate = $("#<%=tbAskLeaveEndDate.ClientID %>").val();
        if (Date.parse(startdate.replace('-', '/')) > Date.parse(enddate.replace('-', '/'))) {
            alert("请假开始时间应早于请假结束结束时间！");
            $("#<%=tbAskLeaveStDate.ClientID %>").focus();
            return false;
        }
        else
            return true;
    }

    function checkDate2() {
        var startdate = $("#<%=tbVacationStDate.ClientID %>").val();
        var enddate = $("#<%=tbVacationEndDate.ClientID %>").val();
        if (Date.parse(startdate.replace('-', '/')) > Date.parse(enddate.replace('-', '/'))) {
            alert("实际请假开始时间应早于实际请假结束结束时间！");
            $("#<%=tbVacationStDate.ClientID %>").focus();
            return false;
        }
        else
            return true;
    }

    function checkLeaveDays() {
        if ($actName == "提交年休假申请" || $actName == "修改年休假申请") {
            if (Number($("#<%=hiSumVacationDays.ClientID %>").val()) + Number($("#<%=tbAskLeaveDays.ClientID %>").val()) > Number($("#<%=tbAnnualLeaveDays.ClientID %>").val())) {
                alert("您申请的请假天数超过了剩余年休假天数，请重新输入！");
                //$("#<%=tbAskLeaveDays.ClientID %>").focus();
                $("#<%=tbAskLeaveDays.ClientID %>").select();
                return false;
            }
            else
                return true;
        }
        else
            return true;
    }

    function checkVacationDays() {
        if($actName == "填写实际休假日期") {
            if(Number($("#<%=hiSumVacationDays.ClientID %>").val()) + Number($("#<%=tbVacationDays.ClientID %>").val()) > Number($("#<%=tbAnnualLeaveDays.ClientID %>").val())) {
                alert("您的实际休假天数超过了剩余年休假天数，请重新输入！");
                //$("#<%=tbAskLeaveDays.ClientID %>").focus();
                $("#<%=tbVacationDays.ClientID %>").select();
                return false;
            }
            else
                return true;
        }
        else
            return true;
    }

    function checkForm() {
//        if (($actName == "提交年休假申请" || $actName == "修改年休假申请") && $formAction == 0) {
//            alert("如果您所在的室为二级室部门，请发送到【科室负责人审核】！如果您是部门负责人，请发送到【主管院长审核】！");
//        }

        if (checkDate1() && checkDate2() && checkLeaveDays() && checkVacationDays())
            return true;
        else
            return false;
    }

    //查看流程页面
    function detailItem(FId, PId) {
        var param = { formId: FId, prcInstId: PId };
        var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
        window.open(urlStr);
        return false;
    }

    function accessOfVacationDisplay() {
        if ($bizCtx.action == "1") {
            $('#trVacation').show();
            return true;
        }
        if ($actName == "填写实际休假日期" || $actName == "审核实际休假日期" || $actName == "备案") {

            $('#trVacation').show();
            return true;
        }
        else {
            $('#trVacation').hide();
            return true;
        }
    }


  


   
    
</script>
