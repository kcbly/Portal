<%@ Page Title="二级执业注册资质统计_按部门统计" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="PracticeList_Dept.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.PracticeList_Dept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                <asp:CheckBox ID="cbGetDate" runat="server" Text="资格证书取得日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" RowStyle-HorizontalAlign="Left" AutoGenerateColumns="true"
        Width="100%" UseDefaultDataSource="true" runat="server" OnExport="gvList_Export"
        ShowExport="true" OnRowCreated="gvList_RowCreated" AllowPaging="true" PageSize="15"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" AllowFrozing="true"
        ShowFooter="true" FrozenColNum="2" ShowHeader="false">
        <FooterStyle Font-Bold="true" ForeColor="Red" HorizontalAlign="Right "></FooterStyle>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function ShowDetail() {
            var url = buildQueryUrl("/EHR/List/QualifManagement/PracticeList.aspx");
            showModal(url, "", 1080, 600);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
