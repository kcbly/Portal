<%@ Page Title="会议室维护台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="MeetingRoomList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">会议室名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtMeetingRoomName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <%--<span class="filter-block">
        <span class="filter-block-lb">正常座位数</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSeating" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="MeetingRoomID" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="会议室名称" DataField="MeetingRoomName" />
            <zhongsoft:LightBoundField HeaderText="所在楼层" DataField="FLOORS" />
            <zhongsoft:LightBoundField HeaderText="正常座位数" DataField="Seating" />
            <zhongsoft:LightBoundField HeaderText="最多可增加座位数" DataField="MaxSeating" />
            <zhongsoft:LightBoundField HeaderText="最大可容纳人数" DataField="Scale" />
            <zhongsoft:LightBoundField HeaderText="会议室面积（㎡）" DataField="Area" />
            <zhongsoft:LightBoundField HeaderText="设备情况" DataField="AssetInfoText" />
            <zhongsoft:LightBoundField HeaderText="描述" DataField="Description" />
            <zhongsoft:LightBoundField HeaderText="排序" DataField="SORTINDEX" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Meet/MeetingRoomEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


