<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PrizeInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PrizeInfoEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_PrizeInfo" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserName" tablename="EHR_PrizeInfo" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_PrizeInfo" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPrizeName" field="PrizeName" tablename="EHR_PrizeInfo"
                    req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                获奖级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPrizeLevel" field="PrizeLevel"
                    tablename="EHR_PrizeInfo" req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPrizeType" field="PrizeType" tablename="EHR_PrizeInfo"
                    req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                获奖日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtPRIZEDATE"
                    class="kpms-textbox-date" req="1" field="PRIZEDATE" tablename="EHR_PrizeInfo"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" field="ProjectName"
                    tablename="EHR_PrizeInfo" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                获奖项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" field="ProjectCode"
                    tablename="EHR_PrizeInfo" MaxLength="20" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                个人排名
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPERSONALRANK" field="PERSONALRANK" tablename="EHR_PrizeInfo"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
         <td class="td-l">
                担任角色
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPrizeRole" field="ROLENAME" tablename="EHR_PrizeInfo"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                授奖单位
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAwardUnit" field="AWARDCORP" tablename="EHR_PrizeInfo"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="EHR_PrizeInfo" field="Memo"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                批准文件
            </td>
            <td class="td-m" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传批准文件</span>
                <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif"
                    runat="server" Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click"
                    ToolTip="上传附件" CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_PrizeInfo" />
    <input type="hidden" runat="server" id="hiPrizeInfoID" field="PrizeInfoID" tablename="EHR_PrizeInfo" />

    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "OrgUsers";
            var buildSelf = "False";

            var url = "<%=WebAppPath%>" +"/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    
    </script>

</asp:Content>
