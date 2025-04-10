<%@ Page Title="资质证照选择" MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#" AutoEventWireup="true" CodeBehind="CertificateSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.CertificateSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">证书编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCertificateCode" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">证书名称</span>
        <span>
           <zhongsoft:LightTextBox ID="txtCertificateName" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="CapacityInfoId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="证书编号" DataField="CertificateCode" />
            <zhongsoft:LightBoundField HeaderText="证书名称" DataField="CertificateName" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
