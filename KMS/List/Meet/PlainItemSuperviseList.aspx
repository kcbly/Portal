<%@ Page Language="C#" Title="普通事项督办台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="PlainItemSuperviseList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.PlainItemSuperviseList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">标题</span>
        <span>
            <zhongsoft:LightTextBox ID="txtTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">主办部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtHostDept" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiHostDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiHostDeptId" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">要求最晚完成日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtComplateStartDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
        <span>-</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtComplateEndDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">事项内容</span>
        <span>
            <zhongsoft:LightTextBox ID="txtItemContent" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="PlainItemSuperviseFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="标题" ItemStyle-HorizontalAlign="left" ItemStyle-Width="100px">
                <ItemTemplate>
                    <a onclick="View('<%# Eval("PlainItemSuperviseFormId") %>','')" style="color: Blue;" title='<%#Eval("Title")%>'><%#Eval("Title")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="主办部门" DataField="HostDeptName" />
            <zhongsoft:LightBoundField HeaderText="要求最晚完成日期" DataField="LastCompleDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="事项内容" DataField="ItemContent" ShowToolTip="true"  Width="200px"/>
            <zhongsoft:LightBoundField HeaderText="进度说明" DataField="Progress" ShowToolTip="true"  Width="200px"/>
            <asp:TemplateField HeaderText="办理状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# "流程中".Equals(Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")))? "办理中":"办理完成"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {

            $("#divToolBtn").hide();
        }
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
        function View(bizId) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;

        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
