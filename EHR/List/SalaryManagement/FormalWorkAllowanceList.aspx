<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkAllowanceList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkAllowanceList"
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
    <div class="subtoolbarbg">
        年
        <zhongsoft:LightDropDownList runat="server" ID="ddlYearUpload">
        </zhongsoft:LightDropDownList>
        月
        <zhongsoft:LightDropDownList runat="server" ID="ddlMonthUpload">
        </zhongsoft:LightDropDownList>
        <asp:FileUpload ID="fupAllowance" runat="server" />
        <asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click" OnClientClick="return isContinue();">
        <span>导入Excel</span>
        </asp:LinkButton>
         <a  href="javascript:download();" ><span style=" border-bottom:solid 1px">下载模板</span></a>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true"
        ShowExport="true" HideFieldOnExport="全选" ShowPageSizeChange="true" DataKeyNames="FORMALWORKALLOWANCEID"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="员工工号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="员工姓名" DataField="USERNAME" SortExpression="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DEPTNAME" SortExpression="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年" DataField="YEAR" SortExpression="YEAR">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月" DataField="MONTH" SortExpression="MONTH">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="补贴金额" DataField="SUMAMOUNT" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function download() {
            window.open("<%=WebAppPath%>/Sys/Download/EHR/正式职工补贴导入模板.xlsx");
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
