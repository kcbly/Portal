<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessInfoList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.BusinessInfoList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" BindGridViewMethod="BindGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="年度" DataField="Year" />
            <zhongsoft:LightBoundField HeaderText="月度" />
            <zhongsoft:LightBoundField HeaderText="类型" DataField="StaTypeName" />
            <zhongsoft:LightTemplateField HeaderText="金额" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbNum" runat="server" Text='<%# (Zhongsoft.Portal.CommonHelper.ChangeToViewNumber(Eval("Num").ToString()))%>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
