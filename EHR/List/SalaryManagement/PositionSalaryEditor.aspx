<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PositionSalaryEditor.aspx.cs"
    Title="岗位工资编辑" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.PositionSalaryEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                岗位工资职级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionSalaryRank" req="1" field="POSITIONSALARYRANK"
                    tablename="EHR_POSITIONSALARY" activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                岗位工资(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPositionSalary" CssClass="kpms-textbox" regex="^[0-9]+(\.[0-9]{2})?$"
                    req="1" field="POSITIONSALARY" tablename="EHR_POSITIONSALARY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal"
                    field="FLAG" tablename="EHR_POSITIONSALARY" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                启用日期
            </td>
            <td class="td-r">
               <zhongsoft:XHtmlInputText ID="txtEnableDate" runat="server" class="kpms-textbox-date" 
                    field="ENABLEDATE" tablename="EHR_POSITIONSALARY" activestatus="(23.*)">
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
                    tablename="EHR_POSITIONSALARY">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPositionSalaryId" field="POSITIONSALARYID" tablename="EHR_POSITIONSALARY" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
