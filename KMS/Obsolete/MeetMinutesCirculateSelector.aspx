<%@ Page Title="会议纪要传阅选择"  MasterPageFile="~/UI/Master/ObjectSelector.Master" Language="C#" AutoEventWireup="true" CodeBehind="MeetMinutesCirculateSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.MeetMinutesCirculateSelector" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">会议名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtMeetName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="MeetMinutesCirculateFormId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="会议名称" DataField="MeetName" />
            <zhongsoft:LightBoundField HeaderText="会议类型" DataField="MeetTypeText" />
            <zhongsoft:LightBoundField HeaderText="会议日期" DataField="MeetDate" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>

