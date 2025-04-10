<%@ Page Language="C#" AutoEventWireup="true" Title="职务变动录入" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="PartyGOVEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PartyGOVEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
             <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)"  field="UserName" tablename="EHR_PARTYGOVRANK"  />   
            </td>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly" class="kpms-textbox" req="1"
                    field="UserCode" tablename="EHR_PARTYGOVRANK" activestatus="(23.*)" />
            </td> 
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox" req="1"
                    field="OrgUnitName" tablename="EHR_PARTYGOVRANK" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                担任职务时部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtThenDeptName" runat="server" readonly="readonly"
                    class="kpms-textbox-short" field="RANKDEPTNAME" tablename="EHR_PARTYGOVRANK"
                    activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiThenDeptID" field="RANKDEPTID" tablename="EHR_PARTYGOVRANK" />
                <asp:ImageButton runat="server" ID="ibtnChooseDept" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseDept();" CausesValidation="False"
                    ActiveStatus="(23.*)" DisplayStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任职日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAPPOINTDATE"
                    class="kpms-textbox-date" req="1" field="APPOINTDATE" tablename="EHR_PARTYGOVRANK"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                免职日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtLEAVEDATE" class="kpms-textbox-date"
                    field="LEAVEDATE" tablename="EHR_PARTYGOVRANK" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                职务<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlPositionName" runat="server" field="RANKNAME"
                    tablename="EHR_PARTYGOVRANK" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                职务级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlPositionLevel" runat="server" field="RANKLEVEL"
                    tablename="EHR_PARTYGOVRANK" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否现行政职务
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbIsNowPosition" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsNow" runat="server" field="IsNow" tablename="EHR_PARTYGOVRANK" />
            </td>
            <td class="td-l">
                是否最高职务级别
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbIsHight" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsHighest" runat="server" field="IsHighest" tablename="EHR_PARTYGOVRANK" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="MEMO" tablename="EHR_PARTYGOVRANK"
                    Maxtext="512" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                批准文件
            </td>
            <td class="td-m" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存在上传批准文件</span>
                <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" DisplayStatus="(3.*)" ActiveStatus="(3.*)" OnClick="upLoadFile_Click">
                    <span><img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
                </zhongsoft:LightFileUploader>
                <uc1:AttachmentView id="Attachment" runat="server" repeatcolumns="1" />
<%--                <asp:ImageButton ID="ibtnAttach" ImageUrl="../../../Themes/Images/btn_dg_upfile.gif"
                    runat="server" Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click"
                    ToolTip="上传附件" CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />--%>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="USERID" tablename="EHR_PARTYGOVRANK" />
    <input type="hidden" runat="server" id="hiPositionChangeID" field="PARTYGOVRANKID"
        tablename="EHR_PARTYGOVRANK" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

<%--        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "OrgUsers";
            var buildSelf = "False";

            var url = "<%=WebAppPath%>" + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }--%>

        function ChooseDept() {
            var param = new InputParamObject("s");
            var re = getOrgsNew("", param, "");
            if (re != null) {
                $("#<%=hiThenDeptID.ClientID%>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtThenDeptName.ClientID%>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
    </script>
</asp:Content>
