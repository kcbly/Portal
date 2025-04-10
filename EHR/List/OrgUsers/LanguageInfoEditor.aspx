<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LanguageInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.LanguageInfoEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="语言、计算机能力编辑" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPersonnelCode" runat="server" readonly="readonly" req="1"
                    class="kpms-textbox" field="PersonnelCode" tablename="EHR_LanguageInfo" activestatus="(23.*)" />
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="PersonnelName" tablename="EHR_LanguageInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">语种名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbLanguageName" field="LanguageName" tablename="EHR_LanguageInfo"
                    MaxLength="20" class="kpms-textbox" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">熟练程度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProficiency" runat="server" field="Proficiency"
                    tablename="EHR_LanguageInfo" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">外语水平等级
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbLanguageLevel" field="LanguageLevel"
                    tablename="EHR_LanguageInfo" MaxLength="20" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">证书编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCertificateNO" field="CertificateNO"
                    tablename="EHR_LanguageInfo" MaxLength="30" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">证书取得日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtCertificateDate"
                    class="kpms-textbox-date" field="CertificateDate" tablename="EHR_LanguageInfo"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">认证机构
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAgency" field="Agency" tablename="EHR_LanguageInfo"
                    class="kpms-textbox" MaxLength="64" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">计算机水平级别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlComputerLevel" runat="server" field="ComputerLevel"
                    tablename="EHR_LanguageInfo" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">计算机熟练程度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlComputerProficiency" runat="server" field="ComputerProficiency"
                    tablename="EHR_LanguageInfo" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" Maxtext="512" tablename="EHR_LanguageInfo" field="Remark"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="UserId"
        tablename="EHR_LanguageInfo" />
    <input type="hidden" runat="server" id="hiLanguageInfoID" field="LanguageInfoID"
        tablename="EHR_LanguageInfo" />

    <script type="text/javascript">

        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>

</asp:Content>
