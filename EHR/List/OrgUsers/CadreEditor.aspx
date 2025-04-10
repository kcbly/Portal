<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="CadreEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.CadreEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="UserId" tablename="EHR_Cadre" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelName" readonly="readonly"
                    class="kpms-textbox" style="width: 100px" req="1" field="UserName" tablename="EHR_Cadre"
                    activestatus="(23.*)" />
                <asp:ImageButton ID="btnChooseUser" ImageUrl="../../../Themes/Images/btn_select.gif"
                    runat="server" ToolTip="选择" CausesValidation="false" OnClientClick="return ChooseUser()"
                    DisplayStatus="(2.*)" />
            </td>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly"
                    class="kpms-textbox" style="width: 100px" req="1" field="UserCode" tablename="EHR_Cadre"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtOrganizationName" runat="server" class="kpms-textbox"
                    readonly="readonly" field="OrgUnitName" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSex" runat="server" class="kpms-textbox" readonly="readonly"
                    field="Sex" tablename="EHR_Cadre" activestatus="(23.*)" style="width: 30px">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                出生日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBirthday" class="kpms-textbox" style="width: 70px"
                    field="Birthday" tablename="EHR_Cadre" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                年龄
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtYears" class="kpms-textbox-money"
                    activestatus="(23.*)" field="Years" tablename="EHR_Cadre" readonly="readonly"
                    style="width: 30px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                从事专业
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSpecialty" runat="server" class="kpms-textbox" readonly="readonly"
                    field="Specialty" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                党政职务
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" class="kpms-textbox" readonly="readonly"
                    field="RANKNAME" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                技术职称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTitle" runat="server" class="kpms-textbox" readonly="readonly"
                    field="SKILLTITLE" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                政治面貌
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPoliticalAffiliation" runat="server" class="kpms-textbox"
                    readonly="readonly" field="PoliticalLandscape" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                文化程度
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtCulturalLevel" runat="server" class="kpms-textbox"
                    readonly="readonly" field="EDUCATION" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                办公电话
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtOfficePhone" runat="server" class="kpms-textbox"
                    readonly="readonly" field="Phone" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                手机号码
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtMobliePhone" runat="server" class="kpms-textbox"
                    readonly="readonly" field="MobilePhone" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                Email
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtEmail" runat="server" class="kpms-textbox" readonly="readonly"
                    field="Email" tablename="EHR_Cadre" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                干部类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCadreType" field="CadreType" tablename="EHR_Cadre"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                附件
            </td>
            <td class="td-m" colspan="5">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存在上传附件</span>
                <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif"
                    runat="server" Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click"
                    ToolTip="上传附件" CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiCadreID" field="CadreID" tablename="EHR_Cadre" />
    <input type="hidden" runat="server" id="hiUserXml" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function ChooseUser() {
            var param = new InputParamObject("s");
            var re = getUsersNew("<%=hiUserXml.ClientID %>", param, "{OrganizationId:'<%=KPMSUser.OrganizationId %>'}");
            if (re != null) {
                $("#<%=hiPersonnelInfoID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtPersonnelName.ClientID %>").val(re.buildAttrJson("o", "name"));
                $("#<%=txtPersonnelCode.ClientID %>").val(re.buildAttrJson("o", "UserCode"));
                $("#<%=txtOrganizationName.ClientID %>").val(re.buildAttrJson("o", "OrgUnitName"));
                $("#<%=txtSex.ClientID %>").val(re.buildAttrJson("o", "Sex"));
                $("#<%=txtBirthday.ClientID %>").val(re.buildAttrJson("o", "BIRTHDAY"));
                $("#<%=txtYears.ClientID %>").val(re.buildAttrJson("o", "Age"));
                $("#<%=txtSpecialty.ClientID %>").val(re.buildAttrJson("o", "Specialty"));
                $("#<%=txtPosition.ClientID %>").val(re.buildAttrJson("o", "RANKNAME"));
                $("#<%=txtTitle.ClientID %>").val(re.buildAttrJson("o", "SKILLTITLE"));
                $("#<%=txtPoliticalAffiliation.ClientID %>").val(re.buildAttrJson("o", "PoliticalLandscape"));
                $("#<%=txtOfficePhone.ClientID %>").val(re.buildAttrJson("o", "Phone"));
                $("#<%=txtMobliePhone.ClientID %>").val(re.buildAttrJson("o", "MobliePhone"));
                $("#<%=txtEmail.ClientID %>").val(re.buildAttrJson("o", "Email"));
            }
            return false;
        }

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "OrgUsers";
            var buildSelf = "False";

            var url = "<%=WebAppPath%>" + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
