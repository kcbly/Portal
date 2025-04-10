<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentBatchDown.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.UI.Controls.AttachmentBatchDown" %>
<a class="aStyle" href="javascript:filesDown();" style="font-weight: normal;">[批量下载]</a>
<script type="text/javascript">
    //批量下载附件
    function filesDown() {
        var fileSouseID = "<%=FileSourceID %>"
        var url = "sys/FileDocument/BatchFileDownload.aspx?fileSourceId=" + fileSouseID;
        showDivDialog(url, null, 700, 530);
    }
</script>
