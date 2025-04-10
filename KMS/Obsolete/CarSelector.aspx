<%@ Page  Title="车辆选择" MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.CarSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">机动车号码</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSealName" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">车辆品牌</span>
        <span>
           <zhongsoft:LightTextBox ID="txtCarBrand" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
        <span class="filter-block">
        <span class="filter-block-lb">车辆型号</span>
        <span>
           <zhongsoft:LightTextBox ID="txtCarModel" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="CarInfoId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="机动车号码" DataField="CarNumber" />
            <zhongsoft:LightBoundField HeaderText="车辆品牌" DataField="CarBrand" />
            <zhongsoft:LightBoundField HeaderText="车辆型号" DataField="CarModel" />
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptName" ItemStyle-HorizontalAlign="Center" />
            <zhongsoft:LightBoundField HeaderText="车辆所属" DataField="CarBelongText" ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
