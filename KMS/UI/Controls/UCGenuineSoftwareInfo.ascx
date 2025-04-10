<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCGenuineSoftwareInfo.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCGenuineSoftwareInfo" %>
<table class="tz-table">
    <tr>
        <td colspan="4" class="td-l" style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large">附属正版软件信息
            </td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.*)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum1" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure1" OnClick="btnInSure1_Click" Text="确定" OnClientClick="return checkFillNum1()" displaystatus="(23.*)" />
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
                    <zhongsoft:LightTemplateField HeaderText="软件名称" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtSoftwareName" Field="SoftwareName" runat="server"  Text='<%#Eval("SoftwareName") %>' activestatus="(23.*)" MaxLength="100" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="序列号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtSerialNumber" Field="SerialNumber" runat="server" Text='<%#Eval("SerialNumber") %>' EnableTheming="false" activestatus="(23.*)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="软件授权类型" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                             <zhongsoft:LightDropDownList ID="ddlSoftwareAuthorizationType" runat="server" activestatus="(23.*)" Field="SoftwareAuthorizationType">
                                    </zhongsoft:LightDropDownList>
                            <input type="hidden" runat="server" id="hiSoftwareAuthorizationTypeText" Field="SoftwareAuthorizationTypeText" tablename="KMS_PM_AccessorySoftwareInfoDetail" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="注册号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtRegistrationNumber" Field="RegistrationNumber" runat="server" activestatus="(23.*)" Text='<%#Eval("RegistrationNumber") %>' EnableTheming="false" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="软件厂商" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtSoftwareFirm" Field="SoftwareFirm" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("SoftwareFirm") %>' activestatus="(23.*)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="服务电话" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtServicePhone" Field="ServicePhone" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("ServicePhone") %>' activestatus="(23.*)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系人" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtContacts" Field="Contacts" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("Contacts") %>' activestatus="(23.*)" />
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
    function checkFillNum1() {
        var fillNum = $("#<%=tbInShowNum1.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
</script>
