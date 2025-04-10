<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearAssessmentResultList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.YearAssessmentResultList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年度 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">姓名/工号 </span>
        <span>
            <asp:TextBox ID="tbName" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                MaxLength="20" EnableTheming="False"></asp:TextBox>
        </span></span>
        <asp:Button runat="server" ID="btnResetYearAssessmentResult" Text="重置年度评估结果" Visible="False" OnClick="btnResetYearAssessmentResult_OnClick"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="查看" DataKeyNames="UserId"
        BindGridViewMethod="BindDataGrid" OnRowCreated="gvList_RowCreated" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门" ItemStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="1年" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label runat="server" Text="" ID="lblYear1"></asp:Label>
                    <input type="hidden" runat="server" id="hiUserId" value='<%#Eval("UserId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="2年" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label ID="lblYear2" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="3年" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label ID="lblYear3" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="4年" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label ID="lblYear4" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="5年" ItemStyle-Width="10%">
                <ItemTemplate>
                    <asp:Label ID="lblYear5" runat="server" Text=""></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="详细" ItemStyle-Width="40px"  ItemStyle-HorizontalAlign="center">
                <ItemTemplate>
                      <asp:ImageButton ID="ibtnView" ImageUrl="~/Themes/Images/btn_dg_view.gif"
                        ToolTip="查看详细" runat="server"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewItem(UserId) {
            var url = "<%=WebAppPath %>/EHR/List/SalaryManagement/YearAssessmentResultUserEditor.aspx?actionType=3&UserID=" + UserId;
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
