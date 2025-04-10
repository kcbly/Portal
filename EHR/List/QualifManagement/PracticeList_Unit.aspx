<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="PracticeList_Unit.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.PracticeList_Unit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                <%--   资格证书级别
                <asp:DropDownList runat="server" ID="ddlQuaflificationLevel" AutoPostBack="True" 
                    onselectedindexchanged="ddlTechQualifLevel_SelectedIndexChanged">
                </asp:DropDownList>--%>
                资格证书取得日期
                <asp:CheckBox ID="cbGetDate" runat="server" Text="" />
                <input type="text" id="txtStartGetDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
                至
                <input type="text" id="txtEndGetDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
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
