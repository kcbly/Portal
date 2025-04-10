<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkPayrollEditor.aspx.cs"
    Title="正式工薪酬发放流程明细表编辑页面" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkPayrollEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                部门名称
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" class="kpms-textbox" field="DEPTNAME"
                    req="1" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                员工工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" class="kpms-textbox" field="USERCODE"
                    req="1" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_FORMALWORKPAYROLLDETAIL" />
            </td>
            <td class="td-l">
                员工姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserName" class="kpms-textbox" field="USERNAME"
                    req="1" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                病假<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBj" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="SICKLEAVE" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                事假<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSj" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="PERSONALLEAVE" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                婚丧假/探亲假<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbHsjTqj" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="WEDFUNHOMELEAVE" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                旷工<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKg" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="ABSENTEEISM" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                产假<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCj" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="MATERNITYLEAVE" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                餐补扣款
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCbkk" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="MEALALLOWANCEDEDUCT" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                目标奖扣款
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMbjkk" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="TARGETAWARDDEDUCT" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                出勤奖扣款
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCqjkk" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="ATTENDENCEAWARDDEDUCT" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                岗位+技能工资扣款
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbGwjngzkk" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="POSANDSKIDEDUCT" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                缺勤扣款合计
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbQqkkhj" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="ABSENCEDEDUCTSUM" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                法定节假日加班天数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFdJb" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="LEGALHOLIDYOVERTIEMDAYS" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                双休加班天数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSxjb" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="WEEKENDOVERTIMEDAYS" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                日常加班天数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRcjb" CssClass="kpms-textbox" regex="^\d*$" req="1"
                    field="DAILYOVERTIMEDAYS" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                加班费合计
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbJbfhj" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="OVERTIEMSUM" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)"
                    ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                奖金预支
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbJjyz" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="BONUSINADWANCE" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                单项奖
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDxj" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="SINGLEAWARD" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)"
                    >
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门单项奖
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBmdxj" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="DEPTSINGLEAWARD" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                地区补贴
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDqbt" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="AREAALLOWANCE" tablename="EHR_FORMALWORKPAYROLLDETAIL" activestatus="(23.*)"
                    >
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                部门绩效奖金
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBmjxjj" CssClass="kpms-textbox"
                    regex="^[0-9]+(\.[0-9]{2})?$" field="DEPTPERFORMENCEBONUS" tablename="EHR_FORMALWORKPAYROLLDETAIL"
                    activestatus="(23.*)" >
                </zhongsoft:LightTextBox>
            </td>
            <td>
            </td>
            <td>
            <asp:Button ID="btnCaculate" runat="server" OnClick="btnCaculate_Click" Text="重新计算金额"/>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFormalWorkPayrollDetailId" field="FORMALWORKPAYROLLDETAILID"
        tablename="EHR_FORMALWORKPAYROLLDETAIL" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
