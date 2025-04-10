<%@ Page Language="C#" Title="薪资调整" AutoEventWireup="true" CodeBehind="SalaryAdjustmentList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.SalaryAdjustmentList" MasterPageFile="~/UI/Master/ObjectWhList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">年份</span><span>
        <zhongsoft:LightTextBox ID="tbYear" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="80px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false"
        Width="100%" AllowSorting="true" AllowPaging="true" ShowPageSizeChange="true"
        DataKeyNames="SalaryAdjustmentDetailID" ShowExport="true" BindGridViewMethod="BindData" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="年度" DataField="AdjustedYear" SortExpression="AdjustedYear">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调整起始月份" DataField="AdjustedMonth" SortExpression="AdjustedMonth">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("SalaryAdjustmentDetailID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="来源渠道" DataField="SourceChannel" SortExpression="SourceChannel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="原岗位名称" DataField="OldPost" SortExpression="OldPost">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗级" DataField="OldPostGrade" SortExpression="OldPostGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="薪级" DataField="OldSalaryGrade" SortExpression="OldSalaryGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="现岗位名称" DataField="NowPost" SortExpression="NowPost">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗级" DataField="NewPostGrade" SortExpression="NewPostGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="薪级" DataField="NewSalaryGrade" SortExpression="NewSalaryGrade">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="岗薪工资" DataField="NewWages" SortExpression="NewWages">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="预发奖金" DataField="AdvanceBonus" SortExpression="AdvanceBonus">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="调整理由和依据" DataField="ReasonsAndBasis" ShowToolTip="true" SortExpression="ReasonsAndBasis">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/SalaryManagement/SalaryAdjustmentDetail.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#divToolBtn").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
