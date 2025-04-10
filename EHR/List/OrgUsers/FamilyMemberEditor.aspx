<%@ Page Title="家庭成员" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FamilyMemberEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FamilyMemberEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                登录号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPersonnelCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="PersonnelCode" tablename="EHR_FamilyMember" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPersonnelName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="PersonnelName" tablename="EHR_FamilyMember" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_FamilyMember" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成员姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFamilyMemberName" field="MEMBERNAME"
                    tablename="EHR_FamilyMember" req="1" MaxLength="20" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                成员类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlRelationship" runat="server" field="Relationship"
                    tablename="EHR_FamilyMember" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出生日期 
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtBirthday" class="kpms-textbox-date"
                    field="Birthday" tablename="EHR_FamilyMember" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                性别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnSex" field="Sex" tablename="EHR_FamilyMember"
                    req="1" activestatus="(23.*)" RepeatDirection="Horizontal">
                    <asp:ListItem Value="男">男</asp:ListItem>
                    <asp:ListItem Value="女">女</asp:ListItem>
                </asp:RadioButtonList>
            </td>            
        </tr>

        <tr>
            <td class="td-l">
                工作单位
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkUnit" field="WORKCORP" tablename="EHR_FamilyMember"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                联系方式
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbTelPhone" field="Phone" tablename="EHR_FamilyMember"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)" ></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="EHR_FamilyMember" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID"
        tablename="EHR_FamilyMember" />
    <input type="hidden" runat="server" id="hiFamilyMemberID" field="FamilyMemberID"
        tablename="EHR_FamilyMember" />

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>

</asp:Content>
