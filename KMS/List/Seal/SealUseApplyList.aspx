<%@ Page Title="印章使用申请台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="SealUseApplyList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Seal.SealUseApplyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">事由及说明</span>
        <span>
            <zhongsoft:LightTextBox ID="txtReason" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplayDeptName" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Filter="{OrganizationLevel:2}"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name" ResultForControls="{'hiApplyDeptId':'id'}"
                IsMutiple="false" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
        </span>
        <input type="hidden" runat="server" id="hiApplyDeptId" />
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">申请日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtApplyDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtApplyDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">项目编号/名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="SealUseApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="印章名称" DataField="SealName" />
            <zhongsoft:LightBoundField HeaderText="用章类型" DataField="ChapterTypeText" />
            <zhongsoft:LightBoundField HeaderText="印章数（个）" DataField="SealNumber" />
  <%--          <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />--%>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="联系方式" DataField="Contact" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ApplyDeptName" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
