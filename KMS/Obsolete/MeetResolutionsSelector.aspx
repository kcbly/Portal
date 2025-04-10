<%@ Page Title="会议决议事项选择" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="MeetResolutionsSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.MeetResolutionsSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">会议名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtMeetName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">文件编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtDocumentNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">议题决议</span>
        <span>
            <zhongsoft:LightTextBox ID="txtIssueResolution" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true" PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        BindGridViewMethod="DoSelectByFilter" OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true" DataKeyNames="DetailId">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="会议类型" DataField="MeetTypeText" />
            <zhongsoft:LightBoundField HeaderText="文件编号" DataField="DocumentNumber" />
            <zhongsoft:LightBoundField HeaderText="会议名称" DataField="MeetName" />
            <zhongsoft:LightBoundField HeaderText="会议日期" DataField="MeetDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="议题决议" DataField="IssueResolution" />
            <zhongsoft:LightBoundField HeaderText="主办部门" DataField="HostDept" />
            <zhongsoft:LightBoundField HeaderText="配合部门" DataField="FitDept" />
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>

