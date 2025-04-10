<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkSalaryDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkSalaryDetail"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                工号/名称/简拼
                <zhongsoft:LightTextBox ID="tbUser" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
            <td>
                部门
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                年
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                月
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg" runat="server" id="toolBar">
        年
        <zhongsoft:LightDropDownList runat="server" ID="ddlYearCalculateOrUpload">
        </zhongsoft:LightDropDownList>
        月
        <zhongsoft:LightDropDownList runat="server" ID="ddlMonthCalculateOrUpload">
        </zhongsoft:LightDropDownList>
        <asp:LinkButton ID="btnCalculateSalary" runat="server" OnClick="btnCalculateSalary_Click">
        <span>核定薪酬</span>
        </asp:LinkButton>
        <asp:FileUpload ID="fupAnnualBonus" runat="server" />
        <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click">
        <span>导入年终奖</span>
        </asp:LinkButton>
        <a href="javascript:download();"><span style="border-bottom: solid 1px">下载模板</span></a>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="6" PageSize="10" FrozenHeight="800" AllowPaging="true"
        AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="FORMALWORKSALARYDETAILID"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="计算机代码" DataField="COMPUTERCODE" SortExpression="COMPUTERCODE" />
            <zhongsoft:LightBoundField HeaderText="年月" DataField="YEARMONTH" SortExpression="YEARMONTH" />
            <zhongsoft:LightBoundField HeaderText="部门编号" DataField="DEPTCODE" SortExpression="DEPTCODE" />
            <zhongsoft:LightBoundField HeaderText="室部" DataField="DEPTNAME" SortExpression="DEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="员工工号" DataField="USERCODE" SortExpression="USERCODE" />
            <zhongsoft:LightBoundField HeaderText="员工姓名" DataField="USERNAME" SortExpression="USERNAME" />
            <zhongsoft:LightBoundField HeaderText="岗位工资" DataField="POSITIONSALARY" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="技能工资" DataField="SKILLSALARY" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="工龄工资" DataField="WORKINGAGESALARY" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="目标奖" DataField="TARGETAWARD" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="百强" DataField="HUNDREDALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="物价补贴" DataField="PRISEALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="书报" DataField="BOOKALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="水贴" DataField="WATERALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="洗理" DataField="WASHALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="儿保" DataField="CHILDALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="住房补贴" DataField="HOUSEALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="注册师奖励" DataField="REGALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="奖金预支" DataField="BONUSINADWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="单项奖" DataField="SINGLEAWARD" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="部门单项奖" DataField="DEPTSINGLEAWARD" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="地区补贴" DataField="AREAALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="加班费合计" DataField="OVERTIEMSUM" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="部门绩效奖金" DataField="DEPTPERFORMENCEBONUS" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="交通补贴" DataField="TRAFFICALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="餐补" DataField="MEALALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="取暖补贴" DataField="HEATINGALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="年休假补贴" DataField="YEARLEAVEALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="节日补贴" DataField="HOLIDAYALLOWANCE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="其它应发1" DataField="OTHERAMOUNT1" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="其它应发2" DataField="OTHERAMOUNT2" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="应发金额" DataField="SHOULDBESENTAMOUNT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="缺勤扣款合计" DataField="ABSENCEDEDUCTSUM" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="房租" DataField="HOUSERENT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣公积金" DataField="DEDUCTPUBLICFUND" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣医疗保险" DataField="DEDUCTMEDICARE" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="企业年金个人缴费" DataField="ENTERPRISEANNUITY" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣失业保险" DataField="DEDUCTUNEMPLOYEDINS" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣养老保险" DataField="DEDUCTENDOWMENTINS" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣取暖费" DataField="HEATINGDEDUCT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣水费" DataField="WATERDEDUCT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="其它扣款1" DataField="OTHERDEDUCT1" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="其它扣款2" DataField="OTHERDEDUCT2" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="扣款合计" DataField="SUMDEDUCT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="实发金额" DataField="ACTUALPAYAMOUNT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="应税企业年金个人缴费" DataField="TAXOFENTERPRISEANNUITY"
                ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="应税工资" DataField="TAXABLEWAGES" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="应交个税" DataField="PERSONALTAX" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="入卡金额" DataField="INCARDAMOUNT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="入石油卡金额" DataField="OILCARDAMOUNT" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="实际入卡金额" DataField="ACTUALINCARDAMOUNT" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function download() {
            window.open("<%=WebAppPath%>/Sys/Download/EHR/正式职工年终奖导入模板.xlsx");
        }
    </script>
</asp:Content>
