<%@ Page Language="C#" AutoEventWireup="true" Title="专家人才" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SpecialistEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SpecialistEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="white-space:nowrap">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_Specialist" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserName" tablename="EHR_Specialist" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_Specialist" activestatus="(23.*)" style="width: 80%" />
            </td>
            
        </tr>
        <tr>
        <td class="td-l" style="white-space:nowrap">
                专家称号名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbSpecialistName" field="SpecialistName" tablename="EHR_Specialist"
                    MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
<%--                <asp:DropDownList ID="ddlSpecialistName" runat="server" activestatus="(23.*)" field="SpecialistName"
                    tablename="EHR_Specialist" req="1">--%>
                </asp:DropDownList>
            </td>
            <td class="td-l">
                专家级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSPECIALLEVEL" field="SPECIALLEVEL" tablename="EHR_Specialist"
                    req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专家称号批准日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAPPOINTDATE"
                    class="kpms-textbox-comparedate" field="APPOINTDATE" tablename="EHR_Specialist"
                    activestatus="(23.*)" req="1" compare="1" />
            </td>
            <td class="td-l">
                专家称号终止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtLEAVEDATE"
                    class="kpms-textbox-comparedate" field="LEAVEDATE" tablename="EHR_Specialist"
                    activestatus="(23.*)" compare="1" />
            </td>
        </tr>
         <tr>
           
            <td class="td-l">
            专家授予部门或机构
            </td>
            <td class="td-m">
            <zhongsoft:LightTextBox runat="server" ID="tbAwardUnit" field="AWARDCORP" tablename="EHR_Specialist"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
             <td class="td-l">
                专家津贴标准
            </td>
            <td class="td-m">
              <zhongsoft:LightTextBox ID="tbSpecialAllowancesRate" runat="server"
                    class="kpms-textbox-money" field="SpecialAllowancesRate" tablename="EHR_Specialist" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" Maxtext="256" tablename="EHR_Specialist" field="Memo" Width="94%"
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
                <asp:ImageButton ID="ibtnAttach" ImageUrl="../../../Themes/Images/btn_dg_upfile.gif"
                    runat="server" Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click"
                    ToolTip="上传附件" CausesValidation="false" OnClientClick="upLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_Specialist" />
    <input type="hidden" runat="server" id="hiSpecialistID" field="SpecialistID" tablename="EHR_Specialist" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        function upLoadFile() {
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
