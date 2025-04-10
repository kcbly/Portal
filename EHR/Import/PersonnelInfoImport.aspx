<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="PersonnelInfoImport.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Import.PersonnelInfoImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr style="height: 30px;">
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fileUploadWbs" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="btnImport_Click" OnClientClick="inport()">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="right">
                <a id="uploadLog" runat="server"><span style="color:blue;">下载报错日志</span></a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbCount" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="color: Red;">
                <asp:Label ID="lbErrorMsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function inport() {
            parent.returnValue = "Inported";
        }

        //下载
        function openUploadLog() {
            window.open("<%=WebAppPath %>/Log/人员导入报错信息.txt");
        }

    </script>
</asp:Content>
