<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MonthAttendanceForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_MonthAttendanceForm1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
             <zhongsoft:XHtmlInputText runat="server" ID="txtYear" field="Year" tablename="EHR_MonthAttendanceForm" activestatus="(23.填写考勤信息)" readonly="readonly" class="kpms-textbox" style="width: 70px; text-align: right"></zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">月度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" field="Month" req="1" tablename="EHR_MonthAttendanceForm"
                AutoPostBack="true" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" activestatus="(23.填写考勤信息)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbDeptName" ReadOnly="true" field="DeptName"
                tablename="EHR_MonthAttendanceForm" activestatus="(23.填写考勤信息)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">工作日（天）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbWorkDays" field="WorkDays"
                tablename="EHR_MonthAttendanceForm" activestatus="(23.填写考勤信息)" req="1"
                regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的工作日（天）(正整数或2位小数)"
                Style="width: 70px; text-align: right"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">部门职工人数（人）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="tbTotalNumber" field="TotalNumber" tablename="EHR_MonthAttendanceForm" activestatus="(23.填写考勤信息)" readonly="readonly" class="kpms-textbox" style="width: 70px; text-align: right"></zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">缺勤人数（人）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbNoInNumber" field="NoInNumber"
                tablename="EHR_MonthAttendanceForm" activestatus="(23.填写考勤信息)"
                regex="^[0-9]*[1-9][0-9]*$" errmsg="缺勤人数（人）应为正整数！"
                Style="width: 70px; text-align: right"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6">
            <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" Width="100%" ID="gvAttendceList" runat="server" ShowExport="true" UseDefaultDataSource="true" DataKeyNames="" AutoGenerateColumns="false" BindGridViewMethod="UserControl.BindDataGrid" ShowFooter="true" OnRowDataBound="gvAttendceList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号">
                        <ItemStyle Width="10px" HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%# (((GridViewRow)Container).DataItemIndex + 1) %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="应计出勤" DataField="YJCC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="实际出勤" DataField="SJCC" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="本月加班" DataField="BYJB" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                     <zhongsoft:LightBoundField HeaderText="本月补休" DataField="BYBX" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="病假" DataField="BingJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="事假" DataField="ShiJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="婚假" DataField="HunJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="丧假" DataField="SangJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="产假" DataField="ChanJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划生育假" DataField="JHSYJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="探亲假" DataField="TQJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="年休假" DataField="NXJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工伤假" DataField="GSJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="其他假" DataField="QTJ" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="本月欠休" DataField="BYQX" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input id="hiXml" type="hidden" runat="server" />
<input id="hiMonthInFormCreateUser" type="hidden" runat="server" />
<input type="hidden" runat="server" id="hiMonthAttendanceFormID" field="MonthAttendanceFormID" tablename="EHR_MonthAttendanceForm" />
<input type="hidden" runat="server" id="hiDeptId" field="DeptID" tablename="EHR_MonthAttendanceForm" />
<input type="hidden" runat="server" id="hiCreateUserName" field="CreateUserName" tablename="EHR_MonthAttendanceForm" />
<input type="hidden" runat="server" id="hiCreateDate" field="CreateDate" tablename="EHR_MonthAttendanceForm" />
<script type="text/javascript">

    function checkForm() {
        if ($formAction == 2) {
            if ($action == 2) {
                if ($("#<%=hiMonthInFormCreateUser.ClientID%>").val().length > 0) {
                    alert("本月已有考勤流程进行中或已完成，请联系发起人：" + $("#<%=hiMonthInFormCreateUser.ClientID%>").val() + "进行确认");
                    //可以自动关闭，也不会保存数据
                    closeWindow();
                    //return false;
                }
            }
        }
        return true;
    }
</script>

