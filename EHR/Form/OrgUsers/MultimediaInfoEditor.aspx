<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="MultimediaInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.OrgUsers.MultimediaInfoEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_MULTIMEDIATEMP"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="工号" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserName" tablename="EHR_MULTIMEDIATEMP"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbOrgUnitName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_MULTIMEDIATEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    文件类型<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbFileType" field="FileType" tablename="EHR_MULTIMEDIATEMP"
                        status="0" fieldname="文件类型" activestatus="(23.申请人填写信息)(23.申请人修改信息)" req="1">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    采集日期<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="tbCollectionDate" runat="server" readonly="readonly"
                        field="CollectionDate" status="0" fieldname="采集日期" tablename="EHR_MULTIMEDIATEMP"
                        class="kpms-textbox-date" activestatus="(23.申请人填写信息)(23.申请人修改信息)" req="1" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    注册单位
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbREGCORP" field="REGCORP"
                        tablename="EHR_MULTIMEDIATEMP" status="0" fieldname="注册单位" MaxLength="128"
                        class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
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
                        runat="server" Style="cursor: hand; height: 16px;" OnClientClick="UpLoadFile()"
                        OnClick="ibtnAttach_Click" ToolTip="上传附件" CausesValidation="false" displaystatus="(3.*)" />
                    <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                        ShowDeleteBySelf="true" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    信息内容
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbContent" field="Content" tablename="EHR_MULTIMEDIATEMP"
                        status="0" fieldname="信息内容" Maxtext="512" class="kpms-textarea" EnableTheming="false"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" TextMode="MultiLine"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    信息说明
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbEXPLAIN" field="EXPLAIN"
                        tablename="EHR_MULTIMEDIATEMP" status="0" fieldname="信息说明" Maxtext="512"
                        class="kpms-textarea" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        TextMode="MultiLine"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    备注
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbMEMO" field="MEMO"
                        tablename="EHR_MULTIMEDIATEMP" status="0" fieldname="备注" Maxtext="512"
                        class="kpms-textarea" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        TextMode="MultiLine"></zhongsoft:LightTextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_MULTIMEDIATEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiMULTIMEDIAID" field="MULTIMEDIAID"
        tablename="EHR_MULTIMEDIATEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiMULTIMEDIATEMPID" field="MULTIMEDIATEMPID"
        tablename="EHR_MULTIMEDIATEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiUSERINFOPASSID" field="USERINFOPASSID"
        tablename="EHR_MULTIMEDIATEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiMediaName" value="多媒体信息" />
    <input type="hidden" runat="server" id="hiMediaUrl" value="/EHR/Form/OrgUsers/MultimediaInfoEditor.aspx" />
    <input type="hidden" runat="server" id="hiMediaFCode" value="FileType" />
    <input type="hidden" runat="server" id="hiMediaFName" value="文件类型" />
    <input type="hidden" runat="server" id="hiMediaTCode" value="EHR_MULTIMEDIATEMP" />
    <input type="hidden" runat="server" id="hiKeyName" value="MULTIMEDIATEMPID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="MULTIMEDIAID" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkMaxLength();
        }

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "Multimedia";
            var buildSelf = "False";

            var url = "<%=WebAppPath %>/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            SetBackGround();
        });
    </script>
</asp:Content>
