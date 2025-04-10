<%@ Page Language="C#" AutoEventWireup="true" Title="业务招待费用申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ReceptionMoneyList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.ReceptionMoneyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">接待日期</span> <span>
        <zhongsoft:XHtmlInputText ID="tbReceptionDateStart" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
            -
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="tbReceptionDateEnd" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">接待部门</span> <span>
        <zhongsoft:LightTextBox ID="tbReceptionDepartMent" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">来宾单位名称</span> <span>
        <zhongsoft:LightTextBox ID="tbGuestUnit" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否计入项目</span> <span>
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
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ReceptionMoneyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="GuestUnit" HeaderText="来宾单位名称" Width="150px" ShowToolTip="true" EditItemClick="ViewFlow" DataParamFields="ReceptionMoneyFormId" />
            <zhongsoft:LightBoundField DataField="ReceptionReason" HeaderText="接待事由" Width="500px" ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="IsProjectText" HeaderText="是否计入项目" HeaderStyle-Width="5%" />            
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" HeaderStyle-Width="8%" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Width="300px" ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="SumCost" HeaderText="费用合计小写（元）" HeaderStyle-Width="5%" />            
            <zhongsoft:LightBoundField DataField="ReceptionDepartMent" HeaderText="接待部门" HeaderStyle-Width="5%" />
            <zhongsoft:LightBoundField DataField="ReceptionDate" HeaderText="接待日期" DataFormatString="{0:yyyy-MM-dd}" HeaderStyle-Width="5%" />
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
