<%@ Page Language="C#" Title="文件导入" MasterPageFile="~/UI/Master/ObjectEditor.Master"   AutoEventWireup="true" CodeBehind="PayslipFileImport.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.PayslipFileImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr style="height: 30px;">
            <td align="center" style="font-weight: bold">
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold;color:Red;">
                请在Excel中固定前三列为“人员编号、姓名、日期“，否则导入会不成功。
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fileUploadWbs" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtnInport"  CssClass="subtoolbarlink" EnableTheming="false" 
                    OnClick="btnImport_Click" OnClientClick="inport()">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCount" runat="server"></asp:Label>
            </td>
        </tr> 
        <tr>
            <td style=" color:Red;">
                <asp:Label ID="lbErrorMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lbErrMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <script type="text/javascript">
        function inport() {
            parent.returnValue = "Inported";
        }

    </script>
</asp:Content>
