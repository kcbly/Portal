<%@ Page Language="C#" Title="人事档案编辑" AutoEventWireup="true" CodeBehind="EmployAgreementEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.EmployAgreementEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"   TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">登录号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserCode" Field="UserCode" tablename="EHR_UC_EmployAgreement"
                    Activestatus="(23.*)" DoCancel="true" req="1" ResultAttr="UserCode" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserName':'name','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
                <input type="hidden" id="hiUserId" runat="server" field="UserID" tablename="EHR_UC_EmployAgreement" />
            </td>
            <td class="td-l">姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="UserName" Tablename="EHR_UC_EmployAgreement" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="DeptName" Tablename="EHR_UC_EmployAgreement" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EHR_UC_EmployAgreement" />
            </td>
        </tr>
        <tr>
            <td class="td-l">协议状态<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAgreementState" req="1" Field="AgreementState" Tablename="EHR_UC_EmployAgreement" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">协议类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAgreementType" req="1" Field="AgreementType" Tablename="EHR_UC_EmployAgreement" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-r" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">协议开始日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAgrStartDate"
                    class="kpms-textbox-date" field="AgrStartDate" tablename="EHR_UC_EmployAgreement"
                    activestatus="(23.*)" req="1" />
            </td>
            <td class="td-l">协议终止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAgrEndDate"
                    class="kpms-textbox-date" field="AgrEndDate" tablename="EHR_UC_EmployAgreement"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">协议到期提醒
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAgrEndRemind"
                    class="kpms-textbox-date" field="AgrEndRemind" tablename="EHR_UC_EmployAgreement"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否派遣委托<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlIsPQWT" req="1" Field="IsPQWT" Tablename="EHR_UC_EmployAgreement" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">派遣单位

            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbPQUnit" runat="server" Field="PQUnit" Tablename="EHR_UC_EmployAgreement" Activestatus="(23.*)" MaxLength="64">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">协议归属单位
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbBelongUnit" runat="server" Field="BelongUnit" Tablename="EHR_UC_EmployAgreement" Text="浙江华云电力工程设计咨询有限公司" Activestatus="(23.*)" MaxLength="64">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="Memo" tablename="EHR_UC_EmployAgreement" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">相关附件
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                    DisplayStatus="(3.*)">
                    <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                    <span>上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <uc1:attachmentview id="AttachmentView1" runat="server" repeatcolumns="1" showdelete="true"
                    showdeletebyself="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiEmployAgreementID" tablename="EHR_UC_EmployAgreement" field="EmployAgreementID" />

    <script type="text/javascript">
        function initCustomerPlugin() {

        }

    </script>
</asp:Content>
