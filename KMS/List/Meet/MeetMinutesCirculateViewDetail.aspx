<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="MeetMinutesCirculateViewDetail.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetMinutesCirculateViewDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ForwardId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightBoundField HeaderText="传阅名称" DataField="ProcessInstanceName" />
            <zhongsoft:LightBoundField HeaderText="传阅人" DataField="SendUserName" />
            <zhongsoft:LightBoundField HeaderText="接受人" DataField="ReceiveUserName" />
            <zhongsoft:LightBoundField HeaderText="流程名称" DataField="ProcessName" />
            <zhongsoft:LightBoundField HeaderText="阅读状态" DataField="ReadState" />
            <zhongsoft:LightBoundField HeaderText="阅读时间" DataField="READDATETIME" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
