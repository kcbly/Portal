<%@ Page Title="印章选择" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="SealSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.SealSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">印章名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSealName" runat="server" Width="100px" CssClass="kpms-textboxsearch" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">印章类别</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSealType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="SealRegisterId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="印章名称" DataField="SealName" />
            <zhongsoft:LightBoundField HeaderText="印章类别" DataField="SealTypeText" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>

