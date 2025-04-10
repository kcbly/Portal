<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadExcel.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.UploadExcel"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="上传Excel"%>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
<table>
    <tr>
        <td>
            <asp:FileUpload ID="fup" runat="server"/>
            <asp:Button ID="btnImport" runat="server" Text="导入Excel" OnClick="btnImport_Click"
             OnClientClick="SetValue();" />
        </td> 
    </tr>
</table>
<script type="text/javascript">

    document.title = window.dialogArguments;

    function SetValue() {
        var path_local = $("#<%=fup.ClientID%>").val();
        var pos = path_local.lastIndexOf('\\');
        var filename = path_local.toString().substring(pos + 1);
        window.returnValue = filename;
    }
</script>
</asp:Content> 