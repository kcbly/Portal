<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCHardwareChangeDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCHardwareChangeDetail" %>
<table class="tz-table">
    <tr>
                <td colspan="4" class="td-l" style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large">硬件变更子表
            </td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.*)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum2" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure2" OnClick="btnInSure2_Click" Text="确定" OnClientClick="return checkFillNum2()" displaystatus="(23.*)" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="BindData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" OnRowDataBound="gvDetail_RowDataBound" HideFieldOnExport="删除" activestatus="(23.*)">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="变更配件名称" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtChangePartsName" Field="ChangePartsName" runat="server" Text='<%#Eval("ChangePartsName") %>' activestatus="(23.*)"  />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="变更原因" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtChangeName" Field="ChangeName" runat="server" Text='<%#Eval("ChangeName") %>' EnableTheming="false"  activestatus="(23.*)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="价格" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                              <zhongsoft:LightTextBox ID="txtPrice" Field="Price" runat="server" Text='<%#Eval("Price") %>' EnableTheming="false" CssClass="kpms-textbox-money" activestatus="(23.*)" Regex="^[1-9]\d*$" errmsg="请输入正数" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="变更日期" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                             <zhongsoft:LightTextBox type="text" ID="txtChangeDate" Field="ChangeDate" runat="server" Text='<%#Eval("ChangeDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("ChangeDate").ToString()).ToString("yyyy-MM-dd") %>'
                                        Style="width: 100px" CssClass="kpms-textbox-date" Activestatus="(23.*)"
                                        EnableTheming="false">
                                    </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="操作人" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtOperator" Field="Operator" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("Operator") %>' activestatus="(23.*)" />
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
    function checkFillNum2() {
        var fillNum = $("#<%=tbInShowNum2.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
</script>
