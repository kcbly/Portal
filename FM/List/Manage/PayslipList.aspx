<%@ Page Language="C#" Title="工资条台帐" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PayslipList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.PayslipList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
 <span>
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
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
        flag="import" OnClientClick="return InExport()">
        <span>
            <img id="Img1" runat="server" src="~/Themes/Images/btn_add.gif" alt="从Excel导入" width="16" height="16" />从Excel导入</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="PayslipId" PageSize="15" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
             <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return showPayslipQuire("<%#DataBinder.Eval(Container.DataItem,"SalaryDate") %>");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="SalaryDate" HeaderText="工资日期"  DataFormatString="{0:yyyy-MM}" ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="CreateUserCode" HeaderText="操作用户工号" ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="操作用户姓名" ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="操作日期" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <asp:Button ID="btnFileImport" runat="server" Style="display: none" OnClick="btnFileImport_Click" />
    <script type="text/javascript">
        function showPayslipQuire(salaryDate) {
            var json = { salaryDate: salaryDate, type: "1"};
            var url = buildQueryUrl('FM/List/Manage/PayslipQuire.aspx',json);
            showDivDialog(url, null, 1400, 600, FileImportDataSet);
            return false;
        }
        //导入
        function InExport() {
            var url = buildQueryUrl("FM/List/Manage/PayslipFileImport.aspx");
            showDivDialog(url, null, 460, 380, FileImportDataSet);
            return false;
        }
        function FileImportDataSet() {
          <%=Page.GetPostBackEventReference(this.btnFileImport,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
