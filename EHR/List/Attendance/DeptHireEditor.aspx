<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptHireEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.Attendance.DeptHireEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="人才需求详细" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%=WebAppPath %>/UI/Script/form.dsoframer.js"></script>
    <table class="tz-table" style="width: 100%">
        <tr id="trHY" runat="server">
            <td class="td-l">年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1"  Enabled="false" tablename="EHR_DeptHireItem" field="HireYear">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiYear" tablename="EHR_DeptHireItem" field="HireYear"/>
            </td>
            <td class="td-l">计划内外</td>
            <td class="td-r" colspan="2">
                <asp:RadioButtonList runat="server" ID="rblInPlan" RepeatDirection="Horizontal" Enabled="false" tablename="EHR_DeptHireItem" field="IsInPlan">
                    <asp:ListItem Value="计划内"></asp:ListItem>
                    <asp:ListItem Value="计划外"></asp:ListItem>
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiInPlan" tablename="EHR_DeptHireItem" field="IsInPlan"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">填报部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" type="text" class="kpms-textbox"
                    readonly="readonly" tablename="EHR_DeptHireItem" field="DeptName" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiDeptID" field="DeptID" tablename="EHR_DeptHireItem" />
            </td>
            <td class="td-l">建议毕业院校
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbGraduateSchool" field="GraduateSchool"
                    tablename="EHR_DeptHireItem" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">需求专业
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" field="Specialty" tablename="EHR_DeptHireItem" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">学历
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEducation" field="Education" tablename="EHR_DeptHireItem" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">性别
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex" tablename="EHR_DeptHireItem" activestatus="(23.*)">
                    <asp:ListItem Value="不限">不限</asp:ListItem>
                    <asp:ListItem Value="男">男</asp:ListItem>
                    <asp:ListItem Value="女">女</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">人数
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbNumber" field="Number" tablename="EHR_DeptHireItem"  DataType="Integer"
                    activestatus="(23.*)" EnableTheming="false" CssClass="kpms-textbox-money" Width="100%"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">需求岗位性质
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" field="EmploymentForm"
                    tablename="EHR_DeptHireItem" activestatus="(23.*)">
                    <asp:ListItem Value="">请选择</asp:ListItem>
                    <asp:ListItem Value="正式职工">正式职工</asp:ListItem>
                    <asp:ListItem Value="劳务派遣">劳务派遣</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">应届毕业生或<br />
                具有工作经验
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbWork" field="Work" tablename="EHR_DeptHireItem"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="EHR_DeptHireItem"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!--主键ID--->
    <input type="hidden" runat="server" id="hiItemId" field="ItemId"
        tablename="EHR_DeptHireItem" />
    <input type="hidden" runat="server" id="hiFormId" field="FormId"
        tablename="EHR_DeptHireItem" />
    <input type="hidden" runat="server" id="hiHireType" field="HireType" tablename="EHR_DeptHireItem" />
</asp:Content>
