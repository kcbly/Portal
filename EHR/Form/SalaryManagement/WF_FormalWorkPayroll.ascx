<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_FormalWorkPayroll.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.SalaryManagement.WF_FormalWorkPayroll" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(23.通知部门提交薪酬发放明细表)"
                field="YEAR" tablename="EHR_FORMALWORKPAYROLLFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            月度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" req="1" activestatus="(23.通知部门提交薪酬发放明细表)"
                field="MONTH" tablename="EHR_FORMALWORKPAYROLLFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            填写日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_FORMALWORKPAYROLLFORM" req="1" activestatus="(23.通知部门提交薪酬发放明细表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填报部门
        </td>
        <td colspan="5">
            <asp:CheckBox ID="chkSelectAll" runat="server" Text="全选" activestatus="(23.通知部门提交薪酬发放明细表)" />
            <asp:CheckBoxList ID="cblFillDept" runat="Server" RepeatDirection="Vertical" RepeatColumns="6"
                activestatus="(23.通知部门提交薪酬发放明细表)">
            </asp:CheckBoxList>
            <input type="hidden" id="hiFillDeptIds" runat="server" field="FILLDEPTIDS" tablename="EHR_FORMALWORKPAYROLLFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            要求填报日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtReqFillDate" runat="server" class="kpms-textbox-date"
                field="REQFILLDATE" tablename="EHR_FORMALWORKPAYROLLFORM" req="1" activestatus="(23.通知部门提交薪酬发放明细表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填报要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbFillRequirements" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" field="FILLREQUIREMENTS"
                tablename="EHR_FORMALWORKPAYROLLFORM" activestatus="(23.通知部门提交薪酬发放明细表)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="6">
            <asp:Label ID="Label1" runat="server" displaystatus="(23.提交部门薪酬明细表)(23.审核)(23.汇总各部门薪酬明细表)(23.审核各部门薪酬明细表)(23.审批各部门薪酬明细表)(23.接收薪酬明细表)">
            <span style="font-weight: bold; font-size:medium">部门薪酬明细表</span>
            </asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right" runat="server" displaystatus="(23.提交部门薪酬明细表)(23.汇总各部门薪酬明细表)">
            工号/名称/简拼
            <zhongsoft:LightTextBox ID="tbUser" runat="server" Width="50px">
            </zhongsoft:LightTextBox>
            部室
            <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
            </zhongsoft:LightDropDownList>
            <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span>查找</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click">
                    <span>重置</span>
            </asp:LinkButton>
            <asp:Button ID="btnImport" runat="server" Text="导入" OnClientClick="return importFile()"
                OnClick="btnImport_Click"></asp:Button>
            <a href="javascript:download();"><span style="border-bottom: solid 1px">下载模板</span></a>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                UseDefaultDataSource="true" HideFieldOnExport="序号" AllowPaging="true" AllowSorting="true" ShowFooter="true"
                ShowExport="true" HeaderStyle-Wrap="true" BindGridViewMethod="UserControl.BindDataGrid"
                RowStyle-Wrap="false" ShowPageSizeChange="true" DataKeyNames="FORMALWORKPAYROLLDETAILID"
                OnRowCommand="gvList_RowCommand" AllowFrozing="true" FrozenColNum="4" displaystatus="(23.提交部门薪酬明细表)(23.审核)(23.汇总各部门薪酬明细表)(23.审核各部门薪酬明细表)(23.审批各部门薪酬明细表)(23.接收薪酬明细表)(1.*)" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="部门名称" DataField="DEPTNAME" SortExpression="DEPTNAME" />
                    <asp:BoundField HeaderText="员工工号" DataField="USERCODE" SortExpression="USERCODE" />
                    <asp:BoundField HeaderText="员工姓名" DataField="USERNAME" SortExpression="USERNAME" />
                    <zhongsoft:LightBoundField HeaderText="病假" DataField="SICKLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="事假" DataField="PERSONALLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="婚丧假/探亲假" DataField="WEDFUNHOMELEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="旷工" DataField="ABSENTEEISM" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="产假" DataField="MATERNITYLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="餐补扣款" DataField="MEALALLOWANCEDEDUCT" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="目标奖扣款" DataField="TARGETAWARDDEDUCT" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="出勤奖扣款" DataField="ATTENDENCEAWARDDEDUCT" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="岗位+技能工资扣款" DataField="POSANDSKIDEDUCT" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="缺勤扣款合计" DataField="ABSENCEDEDUCTSUM" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="法定节假日加班天数" DataField="LEGALHOLIDYOVERTIEMDAYS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="双休加班天数" DataField="WEEKENDOVERTIMEDAYS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="日常加班天数" DataField="DAILYOVERTIMEDAYS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="加班费合计" DataField="OVERTIEMSUM" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="奖金预支" DataField="BONUSINADWANCE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="单项奖" DataField="SINGLEAWARD" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="部门单项奖" DataField="DEPTSINGLEAWARD" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="地区补贴" DataField="AREAALLOWANCE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="部门绩效奖金" DataField="DEPTPERFORMENCEBONUS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" EditIdField="FORMALWORKPAYROLLDETAILID"
                        EditPageWidth="800px" EditPageHeight="400px" EditPageUrl="../../../EHR/List/SalaryManagement/FormalWorkPayrollEditor.aspx">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiFormalWorkPayrollFormId" field="FORMALWORKPAYROLLFORMID"
    tablename="EHR_FORMALWORKPAYROLLFORM" />
<input type="hidden" runat="server" id="hiPathToCheck" />
<input type="hidden" runat="server" id="hiSumBonusInadwance" />
<input type="hidden" runat="server" id="hiSumSingleAward" />
<input type="hidden" runat="server" id="hiSumDeptSingleAward" />
<input type="hidden" runat="server" id="hiSumAreaAllowance" />
<input type="hidden" runat="server" id="hiSumDeptPerformenceBonus" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    $(function () {
        $("#<%=chkSelectAll.ClientID %>").click(function () {
            // 很简单，一行代码搞定 
            $("#<%=cblFillDept.ClientID %> input[type=checkbox]").attr("checked", $("#<%=chkSelectAll.ClientID %>").is(":checked"));
        });
    });


    function importFile() {
        var url = "<%=WebAppPath%>/EHR/List/SalaryManagement/UploadExcel.aspx";
        var title = "上传正式职工薪酬明细表";
        var result = window.showModalDialog(url, title, "dialogHeight:20px;dialogWidth:350px;resizable:no;scroll:no;status:no");
        $("#<%=hiPathToCheck.ClientID%>").val(result);
    }

    function download() {
        window.open("<%=WebAppPath%>/Sys/Download/EHR/正式职工薪酬发放导入模板.xlsx");
    }
</script>
