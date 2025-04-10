<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ExternalAttendance.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.SalaryManagement.WF_ExternalAttendence" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(23.通知部门提交外聘职工考勤明细表)"
                field="YEAR" tablename="EHR_EXTERNALATTENDANCEFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            月度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" req="1" activestatus="(23.通知部门提交外聘职工考勤明细表)"
                field="MONTH" tablename="EHR_EXTERNALATTENDANCEFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            编制日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_EXTERNALATTENDANCEFORM" req="1" activestatus="(23.通知部门提交外聘职工考勤明细表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            要求填报日期<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtReqFillDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="REQFILLDATE" tablename="EHR_EXTERNALATTENDANCEFORM"
                req="1" activestatus="(23.通知部门提交外聘职工考勤明细表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填报部门<span class="req-star">*</span>
        </td>
        <td colspan="5">
            <asp:CheckBox ID="cbCheckAll" runat="server" AutoPostBack="true" Text="全选" OnCheckedChanged="CblChanged"
                activestatus="(23.通知部门提交外聘职工考勤明细表)" />
            <asp:CheckBoxList ID="cblFillDept" runat="Server" RepeatDirection="Vertical" RepeatColumns="6"
                req="1" activestatus="(23.通知部门提交外聘职工考勤明细表)">
            </asp:CheckBoxList>
            <input type="hidden" id="hiFillDeptIds" runat="server" field="FILLDEPTIDS" tablename="EHR_EXTERNALATTENDANCEFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            填报要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbFillRequirements" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="1024" field="FILLREQUIREMENTS"
                tablename="EHR_EXTERNALATTENDANCEFORM" activestatus="(23.通知部门提交外聘职工考勤明细表)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="6">
            <asp:Label ID="Label1" runat="server" displaystatus="(23.提交外聘职工考勤明细表)(23.审核)(23.汇总各部门考勤明细表)(23.审核各部门考勤明细表)">
            <span style="font-weight: bold; font-size:medium">考勤列表</span>
            </asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right" runat="server" displaystatus="(23.提交外聘职工考勤明细表)(23.汇总各部门考勤明细表)">
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
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                RowStyle-Wrap="false" UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true"
                ShowExport="true" HeaderStyle-Wrap="true" BindGridViewMethod="UserControl.BindDataGrid" 
                ShowPageSizeChange="true" DataKeyNames="EXTERNALATTENDANCEDETAILID" AllowFrozing="true" HideFieldOnExport="序号"
                OnRowCommand="gvList_RowCommand" FrozenColNum="4" displaystatus="(23.提交外聘职工考勤明细表)(23.审核)(23.汇总各部门考勤明细表)(23.审核各部门考勤明细表)(1.*)">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DEPTNAME" SortExpression="DEPTNAME" />
                    <zhongsoft:LightBoundField HeaderText="员工工号" DataField="USERCODE" SortExpression="USERCODE" />
                    <zhongsoft:LightBoundField HeaderText="员工姓名" DataField="USERNAME" SortExpression="USERNAME" />
                    <zhongsoft:LightBoundField HeaderText="病假" DataField="SICKLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="事假" DataField="PERSONALLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="婚丧假/探亲假" DataField="WEDFUNHOMELEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="旷工" DataField="ABSENTEEISM" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="产假" DataField="MATERNITYLEAVE" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="法定节假日加班天数" DataField="LEGALHOLIDYOVERTIEMDAYS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightBoundField HeaderText="双休加班天数" DataField="WEEKENDOVERTIMEDAYS" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField HeaderText="日常加班天数" DataField="DAILYOVERTIMEDAYS" ItemStyle-HorizontalAlign="Right"/>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" EditIdField="EXTERNALATTENDANCEDETAILID"
                        EditPageWidth="800px" EditPageHeight="200px" EditPageUrl="../../../EHR/List/SalaryManagement/ExternalAttendanceEditor.aspx">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiExternalAttendanceFormId" field="EXTERNALATTENDANCEFORMID"
    tablename="EHR_EXTERNALATTENDANCEFORM" />
<input type="hidden" runat="server" id="hiPathToCheck" />


<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function importFile() {
        var url = "<%=WebAppPath%>/EHR/List/SalaryManagement/UploadExcel.aspx"; 
        var title = "上传外聘职工考勤明细表";
        var result = window.showModalDialog(url,title,"dialogHeight:20px;dialogWidth:350px;resizable:no;scroll:no;status:no");
        $("#<%=hiPathToCheck.ClientID%>").val(result);
    }

    function download() {
        window.open("<%=WebAppPath%>/Sys/Download/EHR/外聘职工考勤导入模板.xlsx");
    }
</script>
