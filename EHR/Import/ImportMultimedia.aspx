<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImportMultimedia.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.Import.ImportMultimedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>导入Excel</title>
    <base target="_self" />
    <link href="../../Themes/Styles/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript" src="../../UI/Script/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../../UI/Script/jquery-ui-1.8.21.custom.min.js"></script>
    <input id="ExcelFileName" name="ExcelFileName" type="hidden" runat="server" />
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
        <tr style="height: 40px" paramtable="paramTable">
            <td align="center" style="font-weight: bold; font-size: large">
                人力资源多媒体信息批量导入
            </td>
        </tr>
        <tr style="height: 30px; font-size:large" paramtable="paramTable">
            <td align="center" style="white-space:nowrap">
                文件类型：
                <asp:RadioButtonList ID="radType" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" Font-Size="Large">
                    <asp:ListItem Value="照片" Text="照 片"></asp:ListItem>
                    <asp:ListItem Value="多媒体" Text="多媒体"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="height: 30px;" paramtable="paramTable">
            <td align="center">
                <asp:Button ID="btnAttach" Text="批量导入" runat="server" Style="cursor: hand;" OnClick="btnAttach_Click"
                    ToolTip="批量导入" CausesValidation="false" OnClientClick="UpLoadFile()" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="height: 30px; color: Red; font-size:large" paramtable="paramTable">
                注：<br>
                &nbsp;&nbsp;&nbsp;&nbsp;照&nbsp;&nbsp;片文件命名：院号.扩展名；<br />
                &nbsp;&nbsp;&nbsp;&nbsp;多媒体文件命名：院号_文件类型_采集日期(yyyy-MM-dd)_其他信息.扩展名；其中院号和文件类型必有，采集日期和其他信息可以省略。
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
<script type="text/javascript">
    function UpLoadFile() {
        var type = $('#<%=radType.ClientID %> :radio[checked]').val();
        if (type == "" || type == undefined) {
            alert("请先选择上传文件类型！");
            return false;
        }

        var fileSrcId = "<%=BusinessObjectId%>";
        var fileSrcFlag = "Multimedia";
        var buildSelf = "False";

        var url = "../../Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
        var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
        window.showModalDialog(url, null, stringFeatures);
        return true;
    }
</script>
