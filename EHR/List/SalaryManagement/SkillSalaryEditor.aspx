<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SkillSalaryEditor.aspx.cs" Title="技能工资编辑" 
Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.SkillSalaryEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                技能工资职级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSkillSalaryRank" req="1" field="SKILLSALARYRANK"
                    tablename="EHR_SKILLSALARY" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                技能工资(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSkillSalary" CssClass="kpms-textbox" regex="^[0-9]+(\.[0-9]{2})?$"
                    req="1" field="SKILLSALARY" tablename="EHR_SKILLSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal"
                    field="FLAG" tablename="EHR_SKILLSALARY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                启用日期
            </td>
            <td class="td-r">
               <zhongsoft:XHtmlInputText ID="txtEnableDate" runat="server" class="kpms-textbox-date" 
                    field="ENABLEDATE" tablename="EHR_SKILLSALARY" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="MEMO"
                    tablename="EHR_SKILLSALARY">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiSkillSalaryId" field="SKILLSALARYID" tablename="EHR_SKILLSALARY" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
