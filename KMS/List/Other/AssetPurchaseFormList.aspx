<%@ Page Title="物资采购申请台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="AssetPurchaseFormList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssetPurchaseFormList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">单据号</span><span>
        <zhongsoft:LightTextBox ID="tbNumbers" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px">
        </zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请部门</span><span>
        <zhongsoft:LightTextBox ID="tbApplyDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px">
        </zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartApplyDate" class="kpms-textbox-comparedate" readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
        -
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndApplyDate" class="kpms-textbox-comparedate" readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">拟采购物资类别</span><span>
        <zhongsoft:LightTextBox ID="tbMaterialCategory" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px">
        </zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">经办人</span><span>
        <zhongsoft:LightTextBox ID="tbApplyUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px">
        </zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">流程状态</span><span>
        <asp:DropDownList ID="ddlflag" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            <asp:ListItem Value="">全部</asp:ListItem>
            <asp:ListItem Value="0">流转中</asp:ListItem>
            <asp:ListItem Value="1">已完成</asp:ListItem>
        </asp:DropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" DownLoadFileName="耗材领用台账" ShowExportExcel="true"
        AllowPaging="true" AllowSorting="true" PageSize="15" UseDefaultDataSource="true"  BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="3%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Numbers" HeaderText="单据号" SortExpression="Numbers" Width="70" EditItemClick="viewForm" DataParamFields="AssetPurchaseFormId"/>
             <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="申请部门"  Width="60"/>
            <zhongsoft:LightBoundField DataField="ApplyDate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ApplyDate" Width="70"/>
            <asp:TemplateField HeaderText="拟采购物资类别" SortExpression="MaterialCategory">
                <ItemTemplate>
                    <asp:Label ID="lbMaterialCategory" runat="server" Text='<%# gvList.GetSubString(DataBinder.Eval(Container.DataItem, "MaterialCategory"), 30)%>'
                        ToolTip='<%#Eval("MaterialCategory") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="事由及说明" SortExpression="Reason">
                <ItemTemplate>
                    <asp:Label ID="lbReason" runat="server" Text='<%# gvList.GetSubString(DataBinder.Eval(Container.DataItem, "Reason"), 30)%>'
                        ToolTip='<%#Eval("Reason") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="sumSubtotal" HeaderText="金额合计（元）" />
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="经办人" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center" SortExpression="Flag">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag"))%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewForm(bizId) {
            var url = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizId });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


