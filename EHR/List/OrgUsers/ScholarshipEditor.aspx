<%@ Page Language="C#" AutoEventWireup="true" Title="学术团体" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ScholarshipEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ScholarshipEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserCode" tablename="EHR_Scholarship" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserName" tablename="EHR_Scholarship" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_Scholarship" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                社团名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbScholarshipName" field="ScholarshipName"
                    tablename="EHR_Scholarship" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"
                    req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                最新学术团体
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbIsNew" runat="server" activestatus="(23.*)" Text="是" />
                <input type="hidden" id="hiIsNew" runat="server" field="IsNew" tablename="EHR_Scholarship" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主管单位名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManageUnit" field="ManageCorp" tablename="EHR_Scholarship"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                职务
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPosition" field="RANK" tablename="EHR_Scholarship"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                参加日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAppointStartTime"
                    class="kpms-textbox-comparedate" field="APPOINTDATE" tablename="EHR_Scholarship"
                    activestatus="(23.*)" req="1" compare="1" />
            </td>
            <td class="td-l">
                退出日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAppointEndTime"
                    class="kpms-textbox-comparedate" field="LEAVEDATE" tablename="EHR_Scholarship"
                    activestatus="(23.*)" compare="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" Maxtext="256" tablename="EHR_Scholarship" field="Memo"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                批准文件
            </td>
            <td class="td-m" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存在上传批准文件</span>
                <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                    Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click" ToolTip="上传附件"
                    CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_Scholarship" />
    <input type="hidden" runat="server" id="hiScholarshipID" field="ScholarshipID" tablename="EHR_Scholarship" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
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
