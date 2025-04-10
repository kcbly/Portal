<%@ Page Language="C#" AutoEventWireup="true" Title="现金借款申请台帐" CodeBehind="BorrowMoneyFormList.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.BorrowMoneyFormList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">借款人</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDept" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">借款事由</span><span>
        <zhongsoft:LightTextBox ID="tbBorrowCause" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">预计还款日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDateFrom" readonly="readonly" compare="2" class="kpms-textbox-comparedate" />
        至
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateTo" readonly="readonly" compare="2" class="kpms-textbox-comparedate" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowSorting="true"
        ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true" DataKeyNames="BorrowMoneyFormId"
        OnRowDataBound="gvList_RowDataBound" BindGridViewMethod="BindData" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="借款人" DataField="ApplyUserName" EditItemClick="ViewFlow" DataParamFields="BorrowMoneyFormId" HeaderStyle-Width="10%" />
            <zhongsoft:LightBoundField HeaderText="部门" DataField="ApplyDeptName" HeaderStyle-Width="10%"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借款金额小写（元）" DataField="BorrowMoney" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" HeaderStyle-Width="10%" />
            <zhongsoft:LightBoundField HeaderText="放款日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" HeaderStyle-Width="10%" />
            <zhongsoft:LightBoundField HeaderText="预计还款日期" DataField="PlanBackDate" DataFormatString="{0:yyyy-MM-dd}" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="累计已还款（元）" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="#" style="color: Blue;" title='<%#Eval("SumBackMoney") %>' onclick="return ViewDetail('<%#Eval("BorrowMoneyFormId") %>');"><%#Eval("SumBackMoney")%> </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="剩余未还款（元）" DataField="NoPayMoney" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right" HeaderStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="还款申请" HeaderStyle-Width="10%">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false;">
                        <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif"  title="还款申请" onclick="ReturnItem('<%# Eval("BorrowMoneyFormId") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //还款申请
        function ReturnItem(bizId) {
            $.post("BorrowMoneyFormList.aspx",
                { asyfunc: "ReturnApply", BusinessId: bizId },
                function (res) {
                    var $l = eval('(' + res + ')');
                    alert($l.Message);
                    if ($l.Code == 1) {
                        window.open($l.Url);
                    }
                }
            );
            return false;
        }
        function ViewDetail(bizId) {
            var param = { actionType: 2, BusinessId: bizId };
            var url = buildQueryUrl("/FM/List/Manage/BorrowMoneyFormItemList.aspx", param);
            var dom = showModal(url, "", 950, 550);
            if (dom != null && dom != "undefined") {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
