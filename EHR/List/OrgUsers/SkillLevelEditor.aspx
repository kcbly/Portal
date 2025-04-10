<%@ Page Language="C#" AutoEventWireup="true" Title="技术职称" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SkillLevelEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SkillLevelEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserName" tablename="EHR_SkillLevel" activestatus="(23.*)" />
            </td>
            <td class="td-l">员工编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" MaxLength="10" class="kpms-textbox"
                    field="UserCode" tablename="EHR_SkillLevel" activestatus="(23.*)" />
            </td>
            <td class="td-l">所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_SkillLevel" activestatus="(23.*)" />
            </td>

        </tr>
        <tr>
            <td class="td-l">排序码<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="Code" tablename="EHR_SkillLevel" activestatus="(23.*)" />
            </td>
            <td class="td-l">工种<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSKILLTITLE" field="SKILLTITLE"
                    tablename="EHR_SkillLevel" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">技能等级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSKILLLEVEL" runat="server" field="SKILLLEVEL"
                    tablename="EHR_SkillLevel" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">取得时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtDESERVEDATE"
                    class="kpms-textbox-date" field="DESERVEDATE" tablename="EHR_SkillLevel" activestatus="(23.*)"
                    req="1" />
            </td>
            <td class="td-l">证书名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCertificateName" field="CertificateName"
                    tablename="EHR_SkillLevel" MaxLength="50" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">证书号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCertificateNo" field="CertificateNo"
                    tablename="EHR_SkillLevel" MaxLength="50" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否聘任技术等级
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbIsNow" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsNow" runat="server" field="IsNow" tablename="EHR_SkillLevel" />
            </td>
            <td class="td-l">鉴定机构<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbIdentifyOrg" field="IdentifyOrg"
                    tablename="EHR_SkillLevel" MaxLength="50" class="kpms-textbox" activestatus="(23.*)"
                    req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">特殊工种标识<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsSpecialMark" runat="server" field="IsSpecialMark"
                    tablename="EHR_SkillLevel" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMEMO" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" MaxLength="500" tablename="EHR_SkillLevel" field="MEMO" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="kpms-rollist-hand" colspan="6">
                <img id="img2" src="../../../Themes/Images/btn_title.gif" />
                附件
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                    DisplayStatus="(3.*)">
                    <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                    <span>上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_SkillLevel" />
    <input type="hidden" runat="server" id="hiSkillLevelID" field="SkillLevelID" tablename="EHR_SkillLevel" />
    <script type="text/javascript">
        function initCustomerPlugin()
        {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>
