<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FactValueInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.FactValueInfo" %>
<zhongsoft:LightPowerGridView AllowPaging="false" ID="gvList" AutoGenerateColumns="false"
    runat="server" OnRowDataBound="gvList_RowDataBound" ShowFooter="true" Width="50%">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="统计类型" ItemStyle-Width="150px">
            <ItemTemplate>
                <asp:Label ID="lbStaTypeName" runat="server" Text='<%# Eval("StaTypeName")%>' />
            </ItemTemplate>
            <FooterTemplate>
                合计
            </FooterTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="统计值" ItemStyle-HorizontalAlign="Right"
            FooterStyle-HorizontalAlign="Right">
            <ItemTemplate>
                <zhongsoft:LightTextBox ID="tbValue" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Label runat="server" ID="lbSum"></asp:Label>
            </FooterTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<script type="text/javascript">
    function initFactValuePlugin<%=this.ClientID %>() {
        $("#<%=gvList.ClientID %> [id$=tbValue]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>"); });
        autoCompleteValue("<%=gvList.ClientID %>");
    }
</script>
