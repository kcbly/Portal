<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkBasicSalaryEditor.aspx.cs"
    Title="正式职工基本工资编辑" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkBasicSalaryEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" class="kpms-textbox" field="USERCODE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 80px">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" field="USERNAME" tablename="EHR_FORMALWORKBASICSALARY"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false" Filter="{FormalOrExternal:'1'}"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tbUserName':'UserName','hiDeptId':'OrgUnitId','txtDeptCode':'OrgUnitCode','tbDeptName':'OrgUnitName'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="lbtnChooseUser_Click">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_FORMALWORKBASICSALARY" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_FORMALWORKBASICSALARY" />
            </td>
            <td class="td-l">
                部门编号
            </td>
            <td class="td-r" style="width: 100px">
                <zhongsoft:XHtmlInputText runat="server" ID="txtDeptCode" class="kpms-textbox" field="DEPTCODE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                室部
            </td>
            <td class="td-r" style="width: 200px">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" class="kpms-textbox" field="DEPTNAME"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                银行卡号
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtBankCardNumber" runat="server" class="kpms-textbox"
                    ReadOnly="true" MaxLength="20" field="BANKCARDNUMBER" tablename="EHR_FORMALWORKBASICSALARY"
                    activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                调薪日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtAjustSalaryDate" runat="server" class="kpms-textbox-date"
                    field="AJUSTSALARYDATE" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                岗位工资职级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionSalaryRank" field="POSITIONSALARYRANK"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="GetPositionSalary">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" nowrap="nowrap">
                岗位工资(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPositionSalary" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="POSITIONSALARY" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)"
                    ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                目标奖(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTargetAward" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="TARGETAWARD" tablename="EHR_FORMALWORKBASICSALARY" ReadOnly="true" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                工龄工资(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkingAgeSalary" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="WORKINGAGESALARY" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                技能工资职级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSkillSalaryRank" field="SKILLSALARYRANK"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="GetSkillSalary">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" nowrap="nowrap">
                技能工资(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSkillSalary" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="SKILLSALARY" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)"
                    ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                百强(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbBq" CssClass="kpms-textbox-money" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$"
                    EnableTheming="false" field="HUNDREDALLOWANCE" tablename="EHR_FORMALWORKBASICSALARY"
                    activestatus="(23.*)" errmsg="请输入正确的金额">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                物价补贴(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWjbt" CssClass="kpms-textbox-money"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" EnableTheming="false" field="PRISEALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)" errmsg="请输入正确的金额">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                书报(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSb" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="BOOKALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                水贴(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSt" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="WATERALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                洗理(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbXl" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="WASHALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                儿保(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEb" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="CHILDALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                住房补贴(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbZfbt" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="HOUSEALLOWANCE" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                注册师奖励(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbZcsjl" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="REGALLOWANCE" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap="nowrap">
                交通补贴(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbJtbt" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="TRAFFICALLOWANCE" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                餐补(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCb" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="MEALALLOWANCE"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                房租(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFz" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="HOUSERENT"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                扣公积金(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKgjj" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="DEDUCTPUBLICFUND" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                扣医疗保险(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKylbx" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="DEDUCTMEDICARE" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                扣养老保险(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKyl" CssClass="kpms-textbox-money" EnableTheming="false"
                    regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额" field="DEDUCTENDOWMENTINS"
                    tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                扣失业保险(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbKsybx" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="DEDUCTUNEMPLOYEDINS" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap="nowrap">
                企业年金个人缴费(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbNjgrjf" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="ENTERPRISEANNUITY" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                应税企业年金个人缴费(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbYsnjgrjf" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="TAXOFENTERPRISEANNUITY" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap="nowrap">
                入石油卡金额(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRykje" CssClass="kpms-textbox-money"
                    EnableTheming="false" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的金额"
                    field="OILCARDAMOUNT" tablename="EHR_FORMALWORKBASICSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                调整理由
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbAjustSalaryReason" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="AJUSTSALARYREASON"
                    Width="97.7%" tablename="EHR_FORMALWORKBASICSALARY">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="8" align="center">
                <span class="req-star" style="font-size: medium">注意：金额填写时，小数点后最多两位，小数点前最多十位</span>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFormalWorkBasicSalaryId" field="FORMALWORKBASICSALARYID"
        tablename="EHR_FORMALWORKBASICSALARY" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
