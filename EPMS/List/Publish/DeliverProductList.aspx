<%@ Page Title="成品交付记录" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="DeliverProductList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.DeliverProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
                    OnClientClick="return viewItem(2,'');" flag="isCanEdit">
        <span>
            <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbProj" EnableTheming="False" CssClass="kpms-textboxsearch"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">卷册编号/名称</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbWBS" EnableTheming="False" CssClass="kpms-textboxsearch"/>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">交付时间</span> <span>
        <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                                  ID="txtStartDate" compare="1" />
        至
        <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                                  ID="txtEndDate" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" DataKeyNames="PublishDeliverID,WBSID" PageSize="15" UseDefaultDataSource="True" BindGridViewMethod="BindData" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" ItemStyle-Width="7%"/>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="23%"/>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" ItemStyle-Width="5%"/>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" ItemStyle-Width="23%"/>
            <zhongsoft:LightBoundField HeaderText="份数" DataField="CoverCount" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="3%"/>
            <zhongsoft:LightBoundField HeaderText="业主信息" DataField="CustomerName" ItemStyle-Width="23%"/>
            <zhongsoft:LightBoundField HeaderText="交付时间" DataField="DeliverCustomerDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="5%"/>
            <zhongsoft:LightBoundField HeaderText="填写时间" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="5%"/>
            <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" ItemStyle-Width="3%" DataParamFields="Rd,PublishDeliverID" EditItemClick="viewItem"/>
            <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditData" ItemStyle-Width="3%" DataParamFields="Up,PublishDeliverID" EditItemClick="viewItem"/>
            <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="3%" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_OnClick" Style="display: none" />
    
    <script type="text/javascript">
        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/Publish/DeliverProductEditor.aspx', json);
            var callBack = null;
            if (actionType == '2' || actionType == '3') {
                callBack = bindData;
            }
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }

        //执行后台绑定列表
        function bindData() {
            $('#<%=btnBindData.ClientID %>').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
