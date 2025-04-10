<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnnualYearStandardApprovalEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.AnnualYearStandardApprovalEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                核定年份
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlApprovalYear" req="1" field="APPROVALYEAR"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" class="kpms-textbox" field="USERCODE"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" field="USERNAME" tablename="EHR_ANNUALLEAVEAPPROVAL"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tbUserName':'UserName','hiDeptId':'OrgUnitId','hiDeptCode':'OrgUnitCode','tbDeptName':'OrgUnitName','tbSex':'Sex','tbAge':'Age','tbWorkDate':'WORKDATE'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="lbtnChooseUser_Click">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_ANNUALLEAVEAPPROVAL" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_ANNUALLEAVEAPPROVAL" />
                <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_ANNUALLEAVEAPPROVAL" />
            </td>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" class="kpms-textbox" field="DEPTNAME"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSex" class="kpms-textbox" field="SEX"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                年龄
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbAge" class="kpms-textbox" field="AGE"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                参加工作日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbWorkDate" runat="server" class="kpms-textbox" field="WORKDATE"
                    tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工龄
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkingAge" CssClass="kpms-textbox"
                    field="WORKINGAGE" tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)"
                    ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                年休假标准(年/天)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAnnualLeaveStDays" CssClass="kpms-textbox"
                    regex="^-[0-9]*[1-9][0-9]*$" req="1" field="ANNUALLEAVESTDAYS" tablename="EHR_ANNUALLEAVEAPPROVAL"
                    activestatus="(23.*)" MaxLength="2">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                正式工/外聘工
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox runat="server" ID="tbFormalExternal" CssClass="kpms-textbox"
                    field="FORMALEXTERNAL" tablename="EHR_ANNUALLEAVEAPPROVAL" activestatus="(23.*)"
                    ReadOnly="true">
                </zhongsoft:LightTextBox>
                <%--  <asp:RadioButtonList ID="radFormalExternal" runat="server" RepeatDirection="Horizontal"
                    ActiveStatus="(.*)" field="FORMALEXTERNAL" tablename="EHR_ANNUALLEAVEAPPROVAL" ReadOnly="true">
                    <asp:ListItem Text="正式工" Value="正式工"></asp:ListItem>
                    <asp:ListItem Text="外聘工" Value="外聘工"></asp:ListItem>
                </asp:RadioButtonList>--%>
            </td>
        </tr>
        <tr>
            <td>
                备注
            </td>
            <td colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="MEMO"
                    tablename="EHR_ANNUALLEAVEAPPROVAL">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiAnnualLeaveApprovalID" field="ANNUALLEAVEAPPROVALID"
        tablename="EHR_ANNUALLEAVEAPPROVAL" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
