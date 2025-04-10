<%@ Page Language="C#" Title="工资条查询台帐" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PayslipQuire.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.PayslipQuire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
        <span class="filter-block" id="showLoginIdorname"><span class="filter-block-lb">工号/姓名</span>
            <span>
                <zhongsoft:LightTextBox ID="tbLoginIdorname" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" />
            </span>
        </span>
    <span id="showdate">
        <span class="filter-block"><span class="filter-block-lb">年</span>
            <span>
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" Width="100px" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" AutoPostBack="true" />
            </span>
        </span>
        <span class="filter-block"><span class="filter-block-lb">月</span>
            <span>
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" Width="100px" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" AutoPostBack="true" />
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="PayslipId" PageSize="15" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="LoginId" HeaderText="工号" />
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="SalaryDate" HeaderText="工资日期" />
            <zhongsoft:LightBoundField DataField="SalaryDate" HeaderText="工资日期1" />
         </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button ID="btnEditClick" runat="server" Style="display: none"  />
    <script type="text/javascript">
            var type ="<%=type%>";
            if (type == "1") {
                $("#showLoginIdorname").show();
                $("#showdate").hide();
            } else {
                $("#showdate").show();
                $("#showLoginIdorname").hide();
            }
        function showEditClick(typeSalaryDate, typeLoginId) {
            var json = { salaryDate: typeSalaryDate, loginId: typeLoginId };
            var url = buildQueryUrl('FM/List/Manage/PayslipQuireEditor.aspx', json);
            showDivDialog(url, null, 600, 600, FileImportDataSet);
            return false;
        }
        function FileImportDataSet() {
          <%=Page.GetPostBackEventReference(this.btnEditClick,"") %>;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
