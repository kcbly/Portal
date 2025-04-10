<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearAssessmentResultUserEditor.aspx.cs"  Title="考核备案人员详细"
    MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.YearAssessmentResultUserEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
   <%-- <span class="filter-block"><span class="filter-block-lb">年度 </span><span>
        <asp:TextBox ID="tbYear1" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                MaxLength="20"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">至 </span><span>
         <asp:TextBox ID="tbYear2" runat="server" Width="140px" CssClass="kpms-textboxsearch"
                MaxLength="20"></asp:TextBox> 
    </span></span>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="false" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" DataKeyNames="UserId" BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="AssessmentYear" HeaderText="年度" ItemStyle-Width="20%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Result" HeaderText="考核结果" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
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
