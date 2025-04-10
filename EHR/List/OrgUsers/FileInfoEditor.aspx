<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FileInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FileInfoEditor" %>

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
                    field="UserCode" tablename="EHR_FileInfo" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserName" tablename="EHR_FileInfo" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_FileInfo" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                转入日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtInTime" class="kpms-textbox-comparedate"
                    req="1" field="InDate" tablename="EHR_FileInfo" activestatus="(23.*)" compare="1" />
            </td>
            <td class="td-l">
                档案来处<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFromPlace" field="FromPlace" tablename="EHR_FileInfo"
                    req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                转出日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="tbOutTime" class="kpms-textbox-comparedate"
                    field="OutDate" tablename="EHR_FileInfo" activestatus="(23.*)" compare="1" />
            </td>
            <td class="td-l">
                档案去处
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbToPlace" field="ToPlace" tablename="EHR_FileInfo"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                档案形式
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="radFileForm" runat="server" RepeatDirection="Horizontal"
                    field="FileForm" tablename="EHR_FileInfo" activestatus="(23.*)">
                    <asp:ListItem Value="正本">正本</asp:ListItem>
                    <asp:ListItem Value="副本">副本</asp:ListItem>
                    <asp:ListItem Value="其他">其他</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                档案本数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFileCount" field="FileCount" tablename="EHR_FileInfo"
                    MaxLength="5" CssClass="kpms-textbox-money" EnableTheming="false" regex="^\d+$"
                    errmsg="请填写填写非负整数" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                档案类别
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFileType" field="FileType" tablename="EHR_FileInfo"
                    MaxLength="20" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                变动原因
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbChangeReason" field="ChangeReason" tablename="EHR_FileInfo"
                     MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                管理单位<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManageUnit" field="ManageCorp" tablename="EHR_FileInfo"
                    req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                说明
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbExplain" field="Explain" tablename="EHR_FileInfo"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                档案转递方式
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTransferForm" runat="server" field="TransferForm"
                    tablename="EHR_FileInfo" activestatus="(23.*)">
                    <asp:ListItem Value="">请选择</asp:ListItem>
                    <asp:ListItem Value="机要">机要</asp:ListItem>
                    <asp:ListItem Value="自提">自提</asp:ListItem>
                    <asp:ListItem Value="代领">代领</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                档案转递编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTransferCode" runat="server" field="TransferCode" tablename="EHR_FileInfo"
                    MaxLength="20" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                档案回执
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbReceipt" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" field="Receipt" tablename="EHR_FileInfo" maxtext="64" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="EHR_FileInfo" field="Memo" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                附件
            </td>
            <td class="td-m" colspan="3">
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
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_FileInfo" />
    <input type="hidden" runat="server" id="hiFileInfoID" field="FileInfoID" tablename="EHR_FileInfo" />
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
