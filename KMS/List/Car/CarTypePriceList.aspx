<%@ Page Title="院车队汽车运输价格表台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarTypePriceList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarTypePriceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">车辆类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlCarType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span> 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="CarTypePriceId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField> 
            <zhongsoft:LightBoundField HeaderText="车辆类型" DataField="CarTypeText"  Width="120px"/> 
            <zhongsoft:LightBoundField HeaderText="元/公里" DataField="CarPrice" Width="80px"/>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" Width="40%" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Car/CarTypePriceEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

