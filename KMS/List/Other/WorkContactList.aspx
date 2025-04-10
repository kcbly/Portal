<%@ Page Title="部门工作联系单台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="WorkContactList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.WorkContactList" %>
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
        <span class="filter-block-lb">发送部门名称</span>
        <span>
            <asp:DropDownList ID="ddlSendDeptName" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">发送人</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSendUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">完成时间</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtFinishDateStartDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtFinishDateEndDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="WORKCONTACTFORMID" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="标题" DataField="TITLE" />
            <zhongsoft:LightBoundField HeaderText="发送部门名称" DataField="SENDDEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="发送人" DataField="SENDUSERNAME" />
            <zhongsoft:LightBoundField HeaderText="发送时间" DataField="SENDDATE" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="工作单类型" DataField="WORKTYPE" />
            <zhongsoft:LightBoundField HeaderText="是否院高层审批" DataField="YGCAPPROVAL" />
            <zhongsoft:LightBoundField HeaderText="是否院长审批" DataField="YZAPPROVAL" />
            <zhongsoft:LightBoundField HeaderText="完成时间" DataField="FINISHDATE" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

