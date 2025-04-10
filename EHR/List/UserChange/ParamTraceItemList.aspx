<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="流动人员办理事项参数维护" CodeBehind="ParamTraceItemList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ParamTraceItemList" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="toolBar">
    办理事项
    <asp:TextBox ID="tbContent" runat="server" Width="120px"></asp:TextBox>
    变动原因
    <asp:TextBox ID="tbReason" runat="server" Width="120px"></asp:TextBox>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="listGrid">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="TRACEITEMID"
        AutoGenerateColumns="False" AllowPaging="True" PageSize="20" ShowExport="true"
        AllowSorting="true" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="ITEMCONTENT" HeaderText="办理事项内容" ItemStyle-Width="40px"
                SortExpression="ITEMCONTENT" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CHANGEREASON" HeaderText="适用变动原因" ItemStyle-Width="50px"
                SortExpression="CHANGEREASON" ItemStyle-Wrap="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MGRDEPTNAME" HeaderText="管理部门" ItemStyle-Width="90px"
                SortExpression="MGRDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SORT" HeaderText="排序" ItemStyle-Width="160px"
                SortExpression="SORT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FLAG2" HeaderText="是否启用" ItemStyle-Width="160px"
                SortExpression="FLAG2">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

    </script>
</asp:Content>
