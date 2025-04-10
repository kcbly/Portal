<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCEquipOfficePurchaseApplyDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCEquipOfficePurchaseApplyDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">采购详细信息</td>
    </tr>
    <tr id="trSure" runat="server">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="BindData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" OnRowDataBound="gvDetail_RowDataBound" HideFieldOnExport="删除" PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="购买物品名称<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtGoodsName" Field="GoodsName" runat="server" req="1" Text='<%#Eval("GoodsName") %>' activestatus="(23.填写申请)" MaxLength="100" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="采购类别" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                                 <zhongsoft:LightDropDownList ID="ddlPurchaseClass" runat="server" activestatus="(23.填写申请)" Field="PurchaseClass">
                                    </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiPurchaseClassText" Field="PurchaseClassText" tablename="KMS_PM_EquipOfficePurchaseApplyFormDetail" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="参考单价（元）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtReferenceUnitPrice" Field="ReferenceUnitPrice" runat="server" Text='<%#Eval("ReferenceUnitPrice") %>' EnableTheming="false" CssClass="kpms-textbox-money" activestatus="(23.填写申请)" Regex="^[1-9]\d*$" errmsg="请输入正数" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="数量<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtNumber" Field="Number" runat="server" req="1" Text='<%#Eval("Number") %>' EnableTheming="false" CssClass="kpms-textbox-money" activestatus="(23.填写申请)" regex="^[0-9]\d*$" errmsg="必须是整正数" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="参考总价（元）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtReferenceTotalPrice" Field="ReferenceTotalPrice" runat="server" Text='<%#Eval("ReferenceTotalPrice") %>' EnableTheming="false" CssClass="kpms-textbox-money" activestatus="(23.填写申请)" Regex="^[1-9]\d*$" errmsg="请输入正数" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtRemark" Field="Remark" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("Remark") %>' activestatus="(23.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除"></zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
</script>
