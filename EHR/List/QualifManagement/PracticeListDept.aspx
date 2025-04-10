<%@ Page Title="一级执业注册资质统计_按部门统计" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="PracticeListDept.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.PracticeListDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                <%--执业注册资质
                <asp:RadioButtonList runat="server" ID="rblPractice" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblPractice_Change">
                    <asp:ListItem Value="一级" Selected="True">一级</asp:ListItem>
                    <asp:ListItem Value="二级">二级</asp:ListItem>
                </asp:RadioButtonList>--%>
                <asp:CheckBox ID="cbGetDate" runat="server" Text="资格证书取得日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiPracticeLevel" runat="server" value="一级" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%-- <div class="kpms-longtable" style="width: 1000px; overflow-x: scroll; border: none;">
        <div class="kpms-longertable" style="border: none;">--%>
    <zhongsoft:LightPowerGridView ID="gvList" RowStyle-HorizontalAlign="Left" AutoGenerateColumns="true"
        Width="100%" UseDefaultDataSource="true" runat="server" OnExport="gvList_Export"
        ShowExport="true" OnRowCreated="gvList_RowCreated" AllowPaging="true" PageSize="15"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" AllowFrozing="true"
        ShowFooter="true" FrozenColNum="2" ShowHeader="false">
        <FooterStyle Font-Bold="true" ForeColor="Red" HorizontalAlign="Right "></FooterStyle>
    </zhongsoft:LightPowerGridView>
    <%--    </div>
    </div>--%>
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
