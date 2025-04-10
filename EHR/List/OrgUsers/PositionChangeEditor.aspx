<%@ Page Language="C#" AutoEventWireup="true" Title="岗位变动" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="PositionChangeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PositionChangeEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
              <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                  <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode','txtOriginalDeptName':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)"   field="UserName" tablename="EHR_USERCHANGE"  />  
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPersonnelCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="USERCODE" tablename="EHR_USERCHANGE" activestatus="(23.*)" />
            </td>         
        </tr>
        <tr>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtOriginalDeptName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="OGDEPTNAME" tablename="EHR_USERCHANGE" activestatus="(23.*)"
                    style="width: 34%" />
                <input type="hidden" id="hiOriginalDeptId" runat="server" field="OGDEPTID" tablename="EHR_USERCHANGE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                原岗位
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPositionXml" runat="server" class="kpms-textbox-short"
                    readonly="readonly" activestatus="(23.*)" />
                <input type="hidden" id="hiPositionXml" runat="server" field="OGPOSITIONXML" tablename="EHR_USERCHANGE" />
                <asp:LinkButton runat="server" ID="lbtnChoosePost1" OnClientClick="return ChoosePostS();"
                    DisplayStatus="(23.*)" CausesValidation="false" OnClick="lbtnChoosePost1_Click"
                    EnableTheming="false">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <td class="td-l">
                离岗日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtLaidOffTime" class="kpms-textbox-date"
                    field="LEAVEDATE" tablename="EHR_USERCHANGE" activestatus="(23.*)" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                现岗位<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtChangePositionXml" runat="server" class="kpms-textbox-short"
                    readonly="readonly" activestatus="(23.*)" req="1" />
                <input type="hidden" runat="server" id="hiChangePositionXml" readonly="readonly"
                    field="CHANGEPOSITIONXML" tablename="EHR_USERCHANGE" />
                <asp:LinkButton runat="server" ID="lbtnChoosePost2" OnClientClick="return ChoosePostS2();"
                    DisplayStatus="(23.*)" CausesValidation="false" OnClick="lbtnChoosePost2_Click"
                    EnableTheming="false">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <td class="td-l">
                上岗日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtInductionTime" class="kpms-textbox-date"
                    field="APPOINTDATE" tablename="EHR_USERCHANGE" activestatus="(23.*)" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否主岗
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbIsMainPosition" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiISMAINPOSITION" runat="server" field="ISMAINPOSITION" tablename="EHR_USERCHANGE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" Maxtext="256" tablename="EHR_USERCHANGE" field="MEMO" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
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
                    ToolTip="上传附件" CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID" tablename="EHR_USERCHANGE" />
    <input type="hidden" runat="server" id="hiPersonnelChangeID" field="USERCHANGEID"
        tablename="EHR_USERCHANGE" />
    <input type="hidden" id="hiIsEffect" runat="server" field="ISPASS" tablename="EHR_USERCHANGE"
        value="1" />
    <input type="hidden" id="hiSourceTag" runat="server" field="SOURCETAG" tablename="EHR_USERCHANGE" />
    <input type="hidden" id="hiCHANGEREASON" runat="server" field="CHANGEREASON" tablename="EHR_USERCHANGE" />
    <input type="hidden" id="hiCHANGEDATE" runat="server" field="CHANGEDATE" tablename="EHR_USERCHANGE" />
    <input type="hidden" id="hiMAKEDATE" runat="server" field="MAKEDATE" tablename="EHR_USERCHANGE" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "UserChange";
            var buildSelf = "False";

            var url = "<%=WebAppPath%>" + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
        function ChoosePostS() {
            var param = new InputParamObject("m");
            var orgId = $("#<%=hiOriginalDeptId.ClientID %>").val();
            var userId = $("#<%=hiPersonnelInfoID.ClientID %>").val();
            var filter = "{OrgId:'" + orgId + "',UserId:'" + userId + "'}";
            var re = getPosition("<%=hiPositionXml.ClientID %>", param, filter);

            if (re != null) {
                return true;
            }
            return false;
        }
        function ChoosePostS2() {
            var param = new InputParamObject("m");
            var orgId = $("#<%=hiOriginalDeptId.ClientID %>").val();
            var filter = "{OrgId:'" + orgId + "'}";
            var re = getPosition("<%=hiChangePositionXml.ClientID %>", param, filter);

            if (re != null) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
