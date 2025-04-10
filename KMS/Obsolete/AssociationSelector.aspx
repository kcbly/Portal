<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="AssociationSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.AssociationSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">协会名称</span><span>
        <zhongsoft:LightTextBox ID="tbAssociationName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlAssociationType" class="kpms-ddlsearch" EnableTheming="false" Width="80px">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="AssociationInfoId">
        <columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="协会名称" DataField="AssociationName" />
            <zhongsoft:LightBoundField HeaderText="类别" DataField="AssociationTypeText" />
            <zhongsoft:LightBoundField HeaderText="入会日期" DataField="JoinDate" />
        </columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
