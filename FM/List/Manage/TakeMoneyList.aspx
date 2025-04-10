<%@ Page Language="C#" AutoEventWireup="true" Title="领款申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="TakeMoneyList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.TakeMoneyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
 <span class="filter-block"><span class="filter-block-lb">申请人</span> <span>
        <zhongsoft:LightTextBox ID="tbApplyUserName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span> <span>
        <zhongsoft:XHtmlInputText ID="tbApplyDateStart" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">-
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="tbApplyDateEnd" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请部门</span> <span>
        <zhongsoft:LightTextBox ID="tbApplyDeptName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否项目领款</span> <span>
        <zhongsoft:LightDropDownList ID="ddlIsProject" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目名称/项目编号</span> <span>
        <zhongsoft:LightTextBox ID="tbProject" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="TakeMoneyFormId" PageSize="15" ShowFooter="true" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ApplyDate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}" HeaderStyle-Width="5%"/>
            <zhongsoft:LightBoundField DataField="ApplyDepartMent" HeaderText="申请部门" EditItemClick="ViewFlow" DataParamFields="TakeMoneyFormId" HeaderStyle-Width="5%"/>
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="申请人" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="TakeMoney" HeaderText="领款金额小写（元）" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="ApplyUse" HeaderText="用途" Width="500px" ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="IsProjectText" HeaderText="是否项目领款" HeaderStyle-Width="5%" />            
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="8%" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Width="300px" ShowToolTip="true" />
            <asp:TemplateField HeaderText="流程状态" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
