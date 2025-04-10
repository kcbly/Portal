<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCBookPurchaseApplyDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCBookPurchaseApplyDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">资料、图书清单</td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.填写申请)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" displaystatus="(23.填写申请)" />
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
                    <zhongsoft:LightTemplateField HeaderText="资料图书名称<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtBookName" Field="BookName" runat="server" req="1" Text='<%#Eval("BookName") %>' activestatus="(23.填写申请)" MaxLength="100" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="参考单价（元）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtUnitPrice" Field="UnitPrice" runat="server" Text='<%#Eval("UnitPrice") %>'  onblur="autoComputeRate()"  EnableTheming="false" CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.填写申请)"     />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="份数<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtCopies" Field="Copies" runat="server" req="1" Text='<%#Eval("Copies") %>'  onblur="autoComputeRate()" EnableTheming="false" CssClass="kpms-textbox-money" activestatus="(23.填写申请)"  DataType="Decimal2" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="参考总价（元）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtReferenceTotalPrice" Field="ReferenceTotalPrice"  onblur="autoComputeTotal()" runat="server" Text='<%#Eval("ReferenceTotalPrice") %>' EnableTheming="false" CssClass="kpms-textbox-money"  activestatus="(23.填写申请)" DataType="Decimal2" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="资料描述及说明" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtDescribe" Field="Describe" TextMode="MultiLine" runat="server" EnableTheming="false" Text='<%#Eval("Describe") %>' activestatus="(23.填写申请)"/>
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
    //计算预计总额
     function autoComputeTotal() {
        var sum = 0;
        $("#<%=gvDetail.ClientID %> [id$=txtReferenceTotalPrice]").each(function () {
            sum += floatParse($(this).val());
        });
       $("#ctl10_txtTotalPrice").val(sum);
    }

    //列表填写数量和单价后计算当行合计
      function autoComputeRate() {
        $("#<%=gvDetail.ClientID %> [id$=txtBookName]").each(function () {
             
            var unitPrice = $(this).parent('td').parent('tr').find('[id$=txtUnitPrice]').val();
            var tcopies = $(this).parent('td').parent('tr').find('[id$=txtCopies]').val();
          
             //floatParse 解决类型不一致，导致floatParse(1 + costRate)计算结果不正确 
             $(this).parent('td').parent('tr').find('[id$=txtReferenceTotalPrice]').val(accMulLeaveNum(floatParse(unitPrice), tcopies,2)); 
            
            
        });
        autoComputeTotal();
    }
</script>
