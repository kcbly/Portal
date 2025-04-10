<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationTreeList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.Organization.OrganizationTreeList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="min-width: 1000px; _width: 1000px;">
    <form id="form1" runat="server">
        <table width="100%" class="tz-table" id="tzOrganization">
            <tr>
                <td width="20%" valign="top">
                    <div style="border: 1px #6699FF solid;">
                        <asp:TreeView ID="tvOrganizationTree" runat="server" ShowLines="True" Height="100%"
                            Width="100%">
                            <SelectedNodeStyle BackColor="#F7F7F7" />
                        </asp:TreeView>
                    </div>
                </td>
                <td valign="top" style="width: 100%; height: 100%">
                    <iframe src="" frameborder="0" id="ListFrame" name="ListFrame" width="100%" height="100%"
                        scrolling="auto" runat="server"></iframe>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            $(function () {
                var orgHeight = $("#tzOrganization").height();
                if (orgHeight < 452) {
                    orgHeight = 452;
                }
                var hg = $(document).height() - 20;
                document.getElementById("ListFrame").height = hg > orgHeight ? hg : orgHeight;
            })
        </script>
    </form>
</body>
</html>
