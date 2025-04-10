<%@ Page Title="车辆维修记录台账" MasterPageFile="~/UI/Master/ObjectList.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarRepairList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarRepairList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartApplyDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndApplyDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">车牌号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCarNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <%--<span class="filter-block">
        <span class="filter-block-lb">维修厂家</span>
        <span>
            <zhongsoft:LightTextBox ID="txtRepairCompany" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>--%>
    <span class="filter-block">
        <span class="filter-block-lb">申请事项</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlApplyType" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">问题描述</span>
        <span>
            <zhongsoft:LightTextBox ID="txtDescribe" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="CarRepairId" PageSize="15">
        <Columns>
            <%--<zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>--%>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="单据号" DataField="Numbers"  EditItemClick="viewForm" DataParamFields="CarRepairId" SortExpression="Numbers"/>
            <zhongsoft:LightBoundField HeaderText="车牌号" DataField="CarNumber" EditItemClick="viewForm" DataParamFields="CarRepairId" SortExpression="CarNumber"/>
            <%--<zhongsoft:LightBoundField HeaderText="品牌" DataField="CarBrand" Width="80px" />
            <zhongsoft:LightBoundField HeaderText="维修内容" DataField="RepairContent" Width="40%" />
            <zhongsoft:LightBoundField HeaderText="维修日期" DataField="RepairDate" Width="80px" />
            <zhongsoft:LightBoundField HeaderText="维修金额" DataField="RepairCost" Width="80px" />
            <zhongsoft:LightBoundField HeaderText="维修厂家" DataField="RepairCompany" Width="120px" />
            <zhongsoft:LightBoundField HeaderText="送修人" DataField="GiveRepairUserName" Width="80px" />--%>
            <zhongsoft:LightBoundField HeaderText="迄今行驶里程（KM）" DataField="TotalMileage"  ItemStyle-Width="10px" SortExpression="TotalMileage"/>
            <zhongsoft:LightBoundField HeaderText="申请事项" DataField="ApplyTypeText"  SortExpression="ApplyTypeText"/>
            <zhongsoft:LightBoundField HeaderText="申请事项" DataField="EstimatedCosts"  SortExpression="EstimatedCosts"/>
            <zhongsoft:LightBoundField HeaderText="问题描述" DataField="Describe" ShowToolTip="true"  SortExpression="Describe" Width="200px"/>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}"  SortExpression="ApplyDate"/>
            <zhongsoft:LightBoundField HeaderText="经手人" DataField="ApplyUserName"  SortExpression="ApplyUserName"/>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" ShowToolTip="true" SortExpression="Remark"/>
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" SortExpression="Flag">
                <ItemTemplate> 
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Car/CarRepairEditor.aspx";
        $isFlow = "0";
        function viewForm(formId) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: formId };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

