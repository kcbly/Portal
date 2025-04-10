<%@ Page Title="基本信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="UserInfoEdit.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.UserInfoEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="50%" style="margin:auto;">
        <tr id="trEdit" runat="server">
            <td colspan="6" align="right">
                <asp:LinkButton runat="server" ID="btnEdit" class="kpms-btn" OnClick="btnEdit_Click"
                    displaystatus="(1.*)">
                     <img alt ="" src="../../../Themes/Images/btn_editor.gif"/><span>编辑</span></asp:LinkButton>
                <asp:LinkButton runat="server" class="kpms-btn" ID="btnSave" OnClientClick="return checkForm();"
                    OnClick="btnSave_Click" displaystatus="(23.*)">
                     <img alt ="" src="../../../Themes/Images/btn_save.gif"/><span>保存</span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large" colspan="4">个人信息</td>
        </tr>
        <tr>
            <td class="td-l" style="width: 15%;">姓名 <span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 35%;">
                 <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" ActiveStatus="(23.*)" class="kpms-textbox" req="1" ReadOnly="true" />
            </td>
            <td class="td-l" style="width: 15%;">工号 <span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 35%;">
                <zhongsoft:XHtmlInputText ID="tbLoginId" runat="server" ActiveStatus="(23.*)" class="kpms-textbox" req="1" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">部门 <span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDept" class="kpms-textbox" activestatus="(23.*)" req="1" ReadOnly="true" />
            </td>
<%--            <td class="td-l">科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSubDept" class="kpms-textbox" activestatus="(23.*)" ReadOnly="true" />
            </td>--%>
            <td class="td-l">办公电话
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOfficePhone" runat="server" ActiveStatus="(23.*)" Field="OfficePhone" MaxLength="64" TableName="OrganizationUserProfile" DataType="Telphone"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">常用手机号码
            </td>
            <td class="td-r">                
                <zhongsoft:LightTextBox ID="tbWorkPhone1" runat="server" Field="WorkPhone1" tablename="OrganizationUserProfile" ActiveStatus="(23.*)" errmsg="请输入正确的手机号码"  DataType="Telphone"/>
            </td>
            <td class="td-l">Email
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEmailAdd" runat="server" ActiveStatus="(23.*)" Field="EmailAdd" MaxLength="64" TableName="OrganizationUserProfile" regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$" errmsg="请输入正确的Email" />
            </td>
        </tr>
        <tr>
            <td class="td-l">传真号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFax" runat="server" ActiveStatus="(23.*)" MaxLength="64" Field="Fax" TableName="OrganizationUserProfile" DataType="Telphone"/>
            </td>
            <td class="td-l">QQ/微信号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbQQWeChat" runat="server" ActiveStatus="(23.*)" MaxLength="64" Field="QQWeiXinCode" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">办公室所在位置
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbLocation" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Location" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">楼层
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFloor" runat="server" ActiveStatus="(23.*)" field="Floor" MaxLength="5" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">房间号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbRoom" runat="server" ActiveStatus="(23.*)" field="Room" MaxLength="20" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" EnableTheming="false" Maxtext="256" tablename="OrganizationUserProfile" field="Remark"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUserProfile" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
