<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_UserStatistics.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.UI.Controls.C_UserStatistics" %>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span>人员统计</span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rbl_OnSelectIndexChanged"
                AutoPostBack="true">
                <asp:ListItem Value="性别" Selected="True">性别</asp:ListItem>
                <asp:ListItem Value="年龄">年龄</asp:ListItem>
            </asp:RadioButtonList>
            <zhongsoft:LightPowerGridView runat="server" ID="gvSex" AllowPaging="false"
                UseDefaultDataSource="true" AutoGenerateColumns="false" ShowFooter="true" ShowExport="false"
                DataKeyNames="Sex" OnRowDataBound="gvSex_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="性别">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbSex" Text='<%#Eval("SEX")%>' ToolTip='<%#Eval("SEX") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="50px" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="人数" DataField="COUNT" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="比例(%)" DataField="RATIO" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <input type="hidden" id="hiSexCount" runat="server" />
            <zhongsoft:LightPowerGridView runat="server" ID="gvAge" AllowPaging="false" PageSize="3"
                UseDefaultDataSource="true" AutoGenerateColumns="false" ShowFooter="true" ShowExport="false"
                DataKeyNames="AGE" OnRowDataBound="gvAge_RowDataBound" Visible="false">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="年龄">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbAge" Text='<%#Eval("AGE")%>' ToolTip='<%#Eval("AGE") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="80px" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="人数" DataField="COUNT" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="比例(%)" DataField="RATIO" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <input type="hidden" id="hiAgeCount" runat="server" />
        </div>
    </div>
</div>
<script>
    function initCustomerPlugin() {
        $(window.parent.iFrameHeight(self.frameElement.id, "left"));
    }

        function setVisible() {
            setAllInVisible();
            var value = $("#<%=rbl.ClientID%>").find("[checked]").val();
            if (value == "性别") {
                $("#<%=gvSex.ClientID%>").show();
            }
            if (value == "年龄") {
                $("#<%=gvAge.ClientID%>").show();
            }
        }

        function setAllInVisible() {
            $("#<%=gvSex.ClientID%>").hide();
            $("#<%=gvAge.ClientID%>").hide();
        }

    function openCarUseOfDept() {
        var url = buildQueryUrl("/GM/List/GVM/CarUseApplyList_Dept.aspx", { PageType: 'Custom', secid: 'AE40911C-0D8B-4AD5-B224-4D7D3F87862A' });
        return checkReturn(showModal(url, null, 1080, 600));
    }
</script>
