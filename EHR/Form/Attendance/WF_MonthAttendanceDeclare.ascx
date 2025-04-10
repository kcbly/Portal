<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MonthAttendanceDeclare.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.Attendance.WF_MonthAttendanceDeclare" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="kpms-table">
    <tr>
        <td class="td-l">
            统计部门<span class="kpms-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                req="1" style="width: 150px" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)"
                field="DeptName" tablename="EHR_MonthAttendanceDeclareForm" />
            <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EHR_MonthAttendanceDeclareForm" />
            <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept()"
                DisplayStatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" CausesValidation="false" OnClick="lbtnChooseDept_Click">
                        <img alt="选择" src="../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
            </asp:LinkButton>
        </td>
        <td class="td-l">
            考勤年<span class="kpms-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlYears" runat="server" field="AttendanceYears"
                req="1" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" tablename="EHR_MonthAttendanceDeclareForm">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            考勤月<span class="kpms-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlMonths" runat="server" field="AttendanceMonths"
                AutoPostBack="true" OnSelectedIndexChanged="SelectedIndexChanged_ddlSel" req="1"
                activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" tablename="EHR_MonthAttendanceDeclareForm">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            考勤小时数(小时)<span class="kpms-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAttendanceHours" class="kpms-textbox" runat="server"
                req="1" maxText="10" Regex="^[0-9]+(.[0-9]{1,2})?$" ErrMsg="请填写正整数或带1-2位小数的正数!"
                field="AttendanceHours" tablename="EHR_MonthAttendanceDeclareForm" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" />
        </td>
        <td class="td-l">
            考勤工作日<span class="kpms-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAttendanceDays" class="kpms-textbox" runat="server"
                req="1" maxText="10" Regex="^[0-9]+(.[0-9]{1,2})?$" ErrMsg="请填写正整数或带1-2位小数的正数!"
                field="AttendanceDays" tablename="EHR_MonthAttendanceDeclareForm" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" />
        </td>
        <td class="td-l">
            部门职工人数(人)
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbDeptMumbers" ReadOnly="true" runat="server" field="DeptMumbers"
                tablename="EHR_MonthAttendanceDeclareForm" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            缺勤人数(人)
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAbsenceMumbers" ReadOnly="true" runat="server" field="AbsenceMumbers"
                tablename="EHR_MonthAttendanceDeclareForm" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" />
        </td>
        <td class="td-l">
            缺勤总计工时(小时)
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbAbsenceHours" ReadOnly="true" runat="server" field="AbsenceHours"
                tablename="EHR_MonthAttendanceDeclareForm" activestatus="(23.填写部门月度考勤申报表)(23.修改部门月度考勤申报表)" />
        </td>
        <td class="td-r" colspan="2">
        </td>
    </tr>
    <tr>
        <td class="td-l" colspan="6" style="text-align: center">
            <b />详细信息
        </td>
    </tr>
    <tr id="trAdd" runat="server" displaystatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
        <td class="td-m" colspan="6" style="text-align: right">
            <asp:Button runat="server" ID="btnAddAbsence" Text="添加缺勤人员" OnClientClick="return SelectAbsence();"
                DisplayStatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)" OnClick="btnAddAbsence_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="MonthAttendanceDeclareDetailID"
                AutoGenerateColumns="False" AllowPaging="True" Width="100%" ShowExport="true"
                OnExport="gvList_Export" OnRowCommand="gvList_RowCommand" PageSize="100" OnRowCreated="gvList_RowCreated"
                permissionstatus="true" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:BoundField HeaderText="工号" DataField="PersonnelCode" ItemStyle-Width="40px" />
                    <asp:BoundField HeaderText="姓名" DataField="PersonnelName" ItemStyle-Width="40px"
                        Visible="false" />
                    <asp:TemplateField HeaderText="姓名">
                        <ItemTemplate>
                            <span class="lblPersonnelName">
                                <asp:Label runat="server" ID="lblPersonnelName" Text='<%#Eval("PersonnelName") %>' />
                                <input type="hidden" id="hiPersonnelName" runat="server" class="PersonnelName" value='<%#Eval("PersonnelName") %>' />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="病假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSick" runat="server" Style="text-align: right;" maxText="10"
                                apply="Sick" Width="30px" req="1" regex="^[0-9]+(.[0-9]{1,2})?$" errmsg="请填写正整数或带1-2位小数的正数!"
                                Text='<%#Eval("Sick") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="事假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbThing" runat="server" Style="text-align: right;" maxText="10"
                                apply="Thing" Width="30px" req="1" regex="^[0-9]+(.[0-9]{1,2})?$" errmsg="请填写正整数或带1-2位小数的正数!"
                                Text='<%#Eval("Thing") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="探亲假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbVisitFamily" runat="server" Style="text-align: right;"
                                apply="VisitFamily" Width="30px" req="1" maxText="10" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("VisitFamily") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="产假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMaternity" runat="server" Style="text-align: right;"
                                Apply="Maternity" Width="30px" req="1" maxText="10" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("Maternity") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="产长假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMaternityLong" runat="server" Style="text-align: right;"
                                apply="MaternityLong" Width="30px" req="1" maxText="10" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("MaternityLong") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="婚假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMarriage" runat="server" Style="text-align: right;"
                                apply="Marriage" Width="30px" req="1" maxText="10" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("Marriage") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="丧假">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbFuneralLeave" runat="server" Style="text-align: right;"
                                apply="FuneralLeave" Width="30px" req="1" maxText="10" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("FuneralLeave") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="学习">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbStudy" runat="server" Style="text-align: right;" maxText="10"
                                apply="Study" Width="30px" req="1" regex="^[0-9]+(.[0-9]{1,2})?$" errmsg="请填写正整数或带1-2位小数的正数!"
                                Text='<%#Eval("Study") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="迟到">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbLate" runat="server" Style="text-align: right;" maxText="10"
                                apply="Late" Width="30px" req="1" regex="^[0-9]+(.[0-9]{1,2})?$" errmsg="请填写正整数或带1-2位小数的正数!"
                                Text='<%#Eval("Late") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="早退">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbLeaveEarly" runat="server" Style="text-align: right;"
                                apply="LeaveEarly" Width="30px" maxText="10" req="1" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("LeaveEarly") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="旷工">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbTruancy" runat="server" Style="text-align: right;"
                                apply="Truancy" Width="30px" maxText="10" req="1" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("Truancy") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="节余公休">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbOfficialHoliday" runat="server" Style="text-align: right;"
                                apply="OfficialHoliday" Width="30px" maxText="10" req="1" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("OfficialHoliday") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                            <input type="hidden" id="hiMaxOfficialHoliday" runat="server" value='<%#Eval("MaxOfficialHoliday") %>'
                                apply="MaxOfficialHoliday" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="本年公休">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbOfficialHolidayNow" runat="server" Style="text-align: right;"
                                apply="OfficialHolidayNow" Width="30px" maxText="10" req="1" regex="^[0-9]+(.[0-9]{1,2})?$"
                                errmsg="请填写正整数或带1-2位小数的正数!" Text='<%#Eval("OfficialHolidayNow") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                            <input type="hidden" id="hiMaxOfficialHolidayNow" runat="server" value='<%#Eval("MaxOfficialHolidayNow") %>'
                                apply="MaxOfficialHolidayNow" />
                            <%--专门定义用户名，后续用于提示使用--%>
                            <input type="hidden" id="hiUserName" runat="server" value='<%#Eval("PersonnelName") %>'
                                apply="UserName" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="换休">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSwitch" runat="server" Style="text-align: right;" apply="Switch"
                                Width="30px" maxText="10" req="1" regex="^[0-9]+(.[0-9]{1,2})?$" errmsg="请填写正整数或带1-2位小数的正数!"
                                Text='<%#Eval("Switch") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:LightTextBox>
                            <input type="hidden" id="hiMaxSwitch" runat="server" value='<%#Eval("MaxSwitch") %>'
                                apply="MaxSwitch" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="缺勤合计小时">
                        <ItemTemplate>
                            <span class="tbAbsenceTotal">
                                <zhongsoft:XHtmlInputText ID="tbAbsenceTotal" runat="server" Style="text-align: right;
                                    width: 30px" class="kpms-textbox" ReadOnly="true" maxText="10" Apply="AbsenceTotal"
                                    Value='<%#Eval("AbsenceTotal") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                                </zhongsoft:XHtmlInputText>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="扣1/2伙补天">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="tbHalfFoodAllowance" runat="server" Style="text-align: right;
                                width: 30px" class="kpms-textbox" ReadOnly="true" maxText="10" Apply="HalfFoodAllowance"
                                Value='<%#Eval("HalfFoodAllowance") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="扣伙补天">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="tbFoodAllowance" runat="server" Style="text-align: right;
                                width: 30px" class="kpms-textbox" ReadOnly="true" maxText="10" Apply="FoodAllowance"
                                Value='<%#Eval("FoodAllowance") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="扣全勤天">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="tbAttendance" runat="server" Style="text-align: right;
                                width: 30px" class="kpms-textbox" ReadOnly="true" maxText="10" Apply="Attendance"
                                Value='<%#Eval("Attendance") %>' activestatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" Visible="false">
                        <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("MonthAttendanceDeclareDetailID") %>'
                                DisplayStatus="(3.填写部门月度考勤申报表)(3.修改部门月度考勤申报表)">
						    <img alt="" onclick="return window.confirm('您确定删除吗？')" src="../../Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!--主键 -->
<input type="hidden" id="hiMonthAttendanceDeclareFormID" runat="server" field="MonthAttendanceDeclareFormID"
    tablename="EHR_MonthAttendanceDeclareForm" />
<!--主题 -->
<input type="hidden" id="hiFormTitle" runat="server" field="FormTitle" tablename="EHR_MonthAttendanceDeclareForm" />
<!-- 选择缺勤人员的xml-->
<input type="hidden" id="hiAbsenceXML" runat="server" value='<root></root>' />
<!-- 选择部门的xml-->
<input type="hidden" runat="server" id="hiDeptXml" value='<root></root>' />
<!-- 日工时-->
<input type="hidden" id="hiHours" runat="server" value='7.5' />
<input type="hidden" runat="server" id="hiCheckDataResult" />
<script type="text/javascript">
    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#<%=gvList.ClientID %> [apply='Sick']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Thing']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='VisitFamily']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Maternity']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='MaternityLong']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Marriage']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='FuneralLeave']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Study']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Late']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='LeaveEarly']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Truancy']").blur(function () { AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='OfficialHoliday']").blur(function () { if (CheckMaxData()) AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='OfficialHolidayNow']").blur(function () { if (CheckMaxData()) AutoAddSum(); });
        $("#<%=gvList.ClientID %> [apply='Switch']").blur(function () { if (CheckMaxData()) AutoAddSum(); });
    }
    //add by huwl on 14.8.11
    function KPMSCheckSubmit() {
        var bo = true;
        if ($readyFormSend) {
            if (!CheckMaxData()) {
                bo = false;
            }
            var checkData = $("#<%=this.hiCheckDataResult.ClientID %>").val();
            if (checkData != "") {
                alert(checkData);
                bo = false;
            }

            var CurrentActivityName = '<%=CurrentActivityName %>';
            if (CurrentActivityName == "填写部门月度考勤申报表" || CurrentActivityName == "修改部门月度考勤申报表") {
                var IsHours = false;
                var AttendanceHours = $("#<%=tbAttendanceHours.ClientID %>").val() == "" ? 0 : parseFloat($("#<%=tbAttendanceHours.ClientID %>").val());
                var PersonnelName = $(".lblPersonnelName .PersonnelName");
                //20150403zzx
                //只能计算本年公休、节余休假、换休、事假
                var AbsenceTotal = $(".tbAbsenceTotal .kpms-textbox");
               
                
                for (var i = 0; i < AbsenceTotal.length; i++) {
                    var thisAbsenceTotal = $(AbsenceTotal[i]).val() == "" ? 0 : parseFloat($(AbsenceTotal[i]).val());
                    var t = $($("#<%=gvList.ClientID %> [apply='VisitFamily']")[i]).val() == "" ? 0 : parseFloat($($("#<%=gvList.ClientID %> [apply='VisitFamily']")[i]).val());
                    var t1 = $($("#<%=gvList.ClientID %> [apply='Maternity']")[i]).val() == "" ? 0 : parseFloat($($("#<%=gvList.ClientID %> [apply='Maternity']")[i]).val());
                    var t2 = $($("#<%=gvList.ClientID %> [apply='Marriage']")[i]).val() == "" ? 0 : parseFloat($($("#<%=gvList.ClientID %> [apply='Marriage']")[i]).val());
                    var t3 = $($("#<%=gvList.ClientID %> [apply='FuneralLeave']")[i]).val() == "" ? 0 : parseFloat($($("#<%=gvList.ClientID %> [apply='FuneralLeave']")[i]).val());
                    var t4 = $($("#<%=gvList.ClientID %> [apply='Study']")[i]).val() == "" ? 0 : parseFloat($($("#<%=gvList.ClientID %> [apply='Study']")[i]).val());
                    
                    if (thisAbsenceTotal - (t + t1 + t2 + t3 + t4) > AttendanceHours) {
                        IsHours = true;
                        $(AbsenceTotal[i])[0].style.color = "Red";
                        $(AbsenceTotal[i])[0].style.fontSize = "15px";
                        $(AbsenceTotal[i])[0].style.fontWeight = "bold";
                    }
                }
                if (IsHours) {
                    alert("有员工【缺勤合计小时】超出【考勤小时数】！");
                    bo = false;
                }
            }
        }
        return bo;
    }

    function ChooseDept() {
        var param = new InputParamObject("s");
        var re = getOrgs("<%=hiDeptXml.ClientID %>", param, "2");
        if (re != null) {
            $("#<%=tbDeptName.ClientID %>").val(re.buildAttrJson("o", "name"));
            $("#<%=hiDeptID.ClientID %>").val(re.buildAttrJson("o", "id"));
        }
        return true;
    }

    //选择缺勤人员
    function SelectAbsence() {
        var orgID = $('#<%=hiDeptID.ClientID %>').val();
        if (orgID == "") {
            alert('请选择部门');
            return false;
        }
        var param = new InputParamObject("m");
        var condition = "|" + orgID;
        var reObj = getUsers("<%=hiAbsenceXML.ClientID %>", param, condition);
        if (null != reObj) {
            return true;
        }
        return false;
    }

    //字符转换
    function ChangeValue(str) {
        if (!isNaN(parseFloat(str))) {
            return parseFloat(str);
        }
        else {
            return 0;
        }
    }
    //自动求和
    function AutoAddSum() {
        var $daysArray = $("#<%=gvList.ClientID %> tr");
        for (i = 2; i < $daysArray.length - 1; i++) {
            var Sick = $($daysArray[i]).find('[apply="Sick"]');
            var Thing = $($daysArray[i]).find('[apply="Thing"]');
            var VisitFamily = $($daysArray[i]).find('[apply="VisitFamily"]');
            var Maternity = $($daysArray[i]).find('[apply="Maternity"]');
            var MaternityLong = $($daysArray[i]).find('[apply="MaternityLong"]');
            var Marriage = $($daysArray[i]).find('[apply="Marriage"]');
            var FuneralLeave = $($daysArray[i]).find('[apply="FuneralLeave"]');
            var Study = $($daysArray[i]).find('[apply="Study"]');
            var Late = $($daysArray[i]).find('[apply="Late"]');
            var LeaveEarly = $($daysArray[i]).find('[apply="LeaveEarly"]');
            var Truancy = $($daysArray[i]).find('[apply="Truancy"]');
            var OfficialHoliday = $($daysArray[i]).find('[apply="OfficialHoliday"]');
            var OfficialHolidayNow = $($daysArray[i]).find('[apply="OfficialHolidayNow"]');
            var Switch = $($daysArray[i]).find('[apply="Switch"]');

            var AbsenceTotal = ChangeValue(Sick.val()) + ChangeValue(Thing.val()) + ChangeValue(VisitFamily.val()) + ChangeValue(Maternity.val()) +
                               ChangeValue(MaternityLong.val()) + ChangeValue(Marriage.val()) + ChangeValue(FuneralLeave.val()) + ChangeValue(Study.val()) +
                               ChangeValue(Late.val()) + ChangeValue(LeaveEarly.val()) + ChangeValue(Truancy.val()) + ChangeValue(OfficialHoliday.val()) +
                               ChangeValue(OfficialHolidayNow.val()) + ChangeValue(Switch.val());
            $($daysArray[i]).find('[apply="AbsenceTotal"]').val(AbsenceTotal.toFixed(2));

            var HalfFoodAllowance = ChangeValue(OfficialHoliday.val()) + ChangeValue(OfficialHolidayNow.val()) + ChangeValue(Switch.val());
            $($daysArray[i]).find('[apply="HalfFoodAllowance"]').val((HalfFoodAllowance / 7.5).toFixed(2));

            var FoodAllowance = ChangeValue(Sick.val()) + ChangeValue(Thing.val()) + ChangeValue(VisitFamily.val()) + ChangeValue(Maternity.val()) +
                                ChangeValue(MaternityLong.val()) + ChangeValue(Marriage.val()) + ChangeValue(FuneralLeave.val()) + ChangeValue(Study.val()) +
                                ChangeValue(Late.val()) + ChangeValue(LeaveEarly.val()) + ChangeValue(Truancy.val());
            $($daysArray[i]).find('[apply="FoodAllowance"]').val((FoodAllowance / 7.5).toFixed(2));

            var Attendance = ChangeValue(Sick.val()) + ChangeValue(Thing.val()) + ChangeValue(VisitFamily.val()) +
                                ChangeValue(MaternityLong.val()) + ChangeValue(FuneralLeave.val()) + ChangeValue(Study.val()) +
                                ChangeValue(Late.val()) + ChangeValue(LeaveEarly.val()) + ChangeValue(Truancy.val());
            $($daysArray[i]).find('[apply="Attendance"]').val((Attendance / 7.5).toFixed(2));
        }
    }
    //检验是否超过最大值
    function CheckMaxData() {
        var $daysArray = $("#<%=gvList.ClientID %> tr");
        for (i = 2; i < $daysArray.length - 1; i++) {
            var MaxOfficialHoliday = $($daysArray[i]).find('[apply="MaxOfficialHoliday"]');
            var MaxOfficialHolidayNow = $($daysArray[i]).find('[apply="MaxOfficialHolidayNow"]');
            var MaxSwitch = $($daysArray[i]).find('[apply="MaxSwitch"]');
            if (MaxOfficialHoliday.val() == '') MaxOfficialHoliday.val(0);
            if (MaxOfficialHolidayNow.val() == '') MaxOfficialHolidayNow.val(0);
            if (MaxSwitch.val() == '') MaxSwitch.val(0);

            var OfficialHoliday = $($daysArray[i]).find('[apply="OfficialHoliday"]');
            var OfficialHolidayNow = $($daysArray[i]).find('[apply="OfficialHolidayNow"]');
            var Switch = $($daysArray[i]).find('[apply="Switch"]');
            var UserName = $($daysArray[i]).find('[apply="UserName"]');

            if (ChangeValue(OfficialHoliday.val()) > ChangeValue(MaxOfficialHoliday.val())) {
                alert(UserName.val() + "：最大节余公休为" + MaxOfficialHoliday.val());
                OfficialHoliday.val("0");
                OfficialHoliday.focus();
                return false;
            }

            if (ChangeValue(OfficialHolidayNow.val()) > ChangeValue(MaxOfficialHolidayNow.val())) {
                alert(UserName.val() + "：最大本年公休为" + MaxOfficialHolidayNow.val());
                OfficialHolidayNow.val("0");
                OfficialHolidayNow.focus();
                return false;
            }

            if (ChangeValue(Switch.val()) > ChangeValue(MaxSwitch.val())) {
                alert(UserName.val() + "：最大换休为" + MaxSwitch.val());
                Switch.val("0");
                Switch.focus();
                return false;
            }
        }
        return true;
    }
</script>
