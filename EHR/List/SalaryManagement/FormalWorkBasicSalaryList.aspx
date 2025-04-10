<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkBasicSalaryList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkBasicSalaryList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                工号/名称/简拼
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
            <td>
                部室
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                调薪日期
                <asp:CheckBox ID="cbDate" runat="server" Text="" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtDateFrom" readonly="readonly" compare="1"
                    class="kpms-textbox-comparedate" />
                至
                <zhongsoft:XHtmlInputText runat="server" ID="txtDateTo" readonly="readonly" compare="1"
                    class="kpms-textbox-comparedate" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:FileUpload ID="fupBasicSalary" runat="server" />
        <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click" OnClientClick="return isContinue();">
        <span>导入Excel</span>
        </asp:LinkButton>
        <a href="javascript:download();"><span style="border-bottom: solid 1px">下载模板</span></a>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="5" FrozenHeight="1000" AllowPaging="true" AllowSorting="true"
        BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true" ShowExport="true"
        HideFieldOnExport="全选" ShowPageSizeChange="true" DataKeyNames="FORMALWORKBASICSALARYID"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="部门编号" DataField="DEPTCODE" SortExpression="DEPTCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="室部" DataField="FULLDEPTNAME" SortExpression="FULLDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="员工工号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="员工姓名" DataField="USERNAME" SortExpression="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="银行卡号" DataField="BANKCARDNUMBER">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调薪日期" DataField="AJUSTSALARYDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗位工资职级" DataField="POSITIONSALARYRANK">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗位工资" DataField="POSITIONSALARY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="技能工资职级" DataField="SKILLSALARYRANK">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="技能工资" DataField="SKILLSALARY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工龄工资" DataField="WORKINGAGESALARY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="目标奖" DataField="TARGETAWARD" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="百强" DataField="HUNDREDALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="物价补贴" DataField="PRISEALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="书报" DataField="BOOKALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="水贴" DataField="WATERALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="洗理" DataField="WASHALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="儿保" DataField="CHILDALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="住房补贴" DataField="HOUSEALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册师奖励" DataField="REGALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="交通补贴" DataField="TRAFFICALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="餐补" DataField="MEALALLOWANCE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="房租" DataField="HOUSERENT" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="扣公积金" DataField="DEDUCTPUBLICFUND" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="扣医疗保险" DataField="DEDUCTMEDICARE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="企业年金个人缴费" DataField="ENTERPRISEANNUITY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="扣失业保险" DataField="DEDUCTUNEMPLOYEDINS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="扣养老保险" DataField="DEDUCTENDOWMENTINS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="应税企业年金个人缴费" DataField="TAXOFENTERPRISEANNUITY"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="入石油卡金额" DataField="OILCARDAMOUNT" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调薪理由" DataField="AJUSTSALARYREASON">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function checkDate() {
            var startdate = $("#<%=txtDateFrom.ClientID %>").val();
            var enddate = $("#<%=txtDateTo.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("调薪时间下限应早于调薪时间上线限！");
                return false;
            }
            else
                return true;
        }


        function checkForm() {
            if (checkDate())
                return true;
            else
                return false;
        }


        function download() {
            window.open("<%=WebAppPath%>/Sys/Download/EHR/正式职工基本工资导入模板.xlsx");
        }

        function isContinue() {
            if (confirm("导入新数据将删除原有的数据，是否导入？")) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
