<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MeetMinutesCirculateForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Meet.WF_MeetMinutesCirculateForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table runat="server" class="kpms-table" width="100%">
      <tr>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
             <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Meet_MeetMinutesCirculateForm" activestatus="(23.发起传阅)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr> 
        <td class="td-l">会议类型<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlMeetType" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="MeetType" ActiveStatus="(23.发起传阅)" req="1"
                runat="server" Width="150px" OnSelectedIndexChanged="ddlMeetType_SelectedIndexChanged" AutoPostBack="true" />
            <input type="hidden" runat="server" id="hiMeetTypeText" field="MeetTypeText" tablename="KMS_Meet_MeetMinutesCirculateForm" />
        </td>
        <td class="td-l" id="Target2">文件编号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtDocumentNumber" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="DocumentNumber" ActiveStatus="(23.发起传阅)" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会议名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtMeetName" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="MeetName" ActiveStatus="(23.发起传阅)" runat="server" MaxLength="100" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会议日期<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtMeetDate" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="MeetDate" ActiveStatus="(23.发起传阅)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
    </tr>
    <tr>
        <td class="td-l">传阅对象</td>
        <td class="td-r" colspan="3">
            <asp:CheckBoxList runat="server" ID="cblSendObject" RepeatDirection="Horizontal" activestatus="(23.发起传阅)">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hdnSendObjectText" field="SendObjectText" tablename="KMS_Meet_MeetMinutesCirculateForm" />
            <input type="hidden" runat="server" id="hdnSendObject" field="SendObject" tablename="KMS_Meet_MeetMinutesCirculateForm" />

        </td>
    </tr>
    <tr>
        <td class="td-l">主要内容</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtContent" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="Content" ActiveStatus="(23.发起传阅)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">会议纪要</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" activestatus="(23.发起传阅)" displaystatus="(23.*)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
            </zhongsoft:LightFileUploader>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="5">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注 </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Meet_MeetMinutesCirculateForm" Field="Remark" ActiveStatus="(23.发起传阅)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Meet_MeetMinutesCirculateForm" field="MeetMinutesCirculateFormId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        Isshow();

        if ($actCurrId == "act_31737") {
            //需要自动发送的步骤，调用以下方法即可
            setAutoSend();
        }
    }

    $("#<%=ddlMeetType.ClientID%>").live("change", function () {
        Isshow();
    })
    function Isshow() {
        var namevalue = $('#<%=ddlMeetType.ClientID %> option:selected').text();
        //若会议类型为“党委会、领导班子会、院办公会”时文件编号必填
        if (namevalue == "党委会" || namevalue == "领导班子会" || namevalue == "院办公会") {
            $("#<%=txtDocumentNumber.ClientID%>").attr("req", "1");
            $("#<%=Target2.ClientID%>").html("文件编号" + "<span class='req-star'>*</span >");
        }
        else {
            $("#<%=txtDocumentNumber.ClientID%>").removeAttr("req");
            $("#<%=Target2.ClientID%>").html("文件编号");
        }
    }

</script>

