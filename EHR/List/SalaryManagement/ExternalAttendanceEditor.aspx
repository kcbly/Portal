<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExternalAttendanceEditor.aspx.cs" Title="外聘职工考勤编辑页面"
Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.ExternalAttendanceEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" class="kpms-textbox" field="DEPTNAME" req="1"
                    tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" class="kpms-textbox" field="USERCODE" req="1"
                    tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                姓名
            </td>
             <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserName" class="kpms-textbox" field="USERNAME" req="1"
                    tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>           
        <tr>
            <td class="td-l">
                病假
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBj" CssClass="kpms-textbox" regex="^\d*$"
                    field="SICKLEAVE" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                事假
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSj" CssClass="kpms-textbox" regex="^\d*$"
                    field="PERSONALLEAVE" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                婚丧假/探亲假
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbHsjTqj" CssClass="kpms-textbox" regex="^\d*$"
                    field="WEDFUNHOMELEAVE" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                旷工
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKg" CssClass="kpms-textbox" regex="^\d*$"
                    field="ABSENTEEISM" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                产假
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCj" CssClass="kpms-textbox" regex="^\d*$"
                    field="MATERNITYLEAVE" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                法定节假日加班天数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFdJb" CssClass="kpms-textbox" regex="^\d*$"
                    field="LEGALHOLIDYOVERTIEMDAYS" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                双休加班天数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSxjb" CssClass="kpms-textbox" regex="^\d*$"
                    field="WEEKENDOVERTIMEDAYS" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                日常加班天数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRcjb" CssClass="kpms-textbox" regex="^\d*$"
                    field="DAILYOVERTIMEDAYS" tablename="EHR_EXTERNALATTENDANCEDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiExternalAttendanceDetailId" field="EXTERNALATTENDANCEDETAILID"
        tablename="EHR_EXTERNALATTENDANCEDETAIL" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
