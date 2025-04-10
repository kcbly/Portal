<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAssetPurchaseFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCAssetPurchaseFormDetail" %>
<table class="tz-table">
    <tr>
        <td colspan="4" style="text-align: center; font-size: medium">物资明细</td>
    </tr>
    <tr id="trSure" runat="server">
        <td colspan="4" style="text-align: right">金额单位：元    新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvDetail" AllowPaging="true" UseDefaultDataSource="true" AutoGenerateColumns="false" Width="100%" 
                runat="server" OnRowCommand="gvDetail_RowCommand" ShowExportWord="true" DownLoadFileName="物资明细" EmptyDataText="暂无物资明细" ShowPageSizeChange="false"
                DataKeyNames="DetailId" PageSize="1000" BindGridViewMethod="UserControl.BindDetailData" HideFieldOnExport="编辑,查看,删除" ShowFooter="true" OnRowDataBound="gvDetail_RowDataBound" PermissionStatus="true">

                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="名称<span class='req-star'>*</span>" HeaderStyle-Width="250px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="ltbAssetName" Field="AssetName" runat="server" EnableTheming="false" ActiveStatus="(23.填写申请)" req="1" Text='<%#Eval("AssetName") %>' MaxLength="50">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="数量<span class='req-star'>*</span>" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbAssetCnt" req="1" ActiveStatus="(23.填写申请)"  onblur="computeAllValue()" regex="^[1-9]\d*$" MaxLength="6" errmsg="请输入正整数"  Style="text-align: right;" Field="AssetCnt" Text='<%#Eval("AssetCnt") %>'></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="规格">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="ltbAssetModels" ActiveStatus="(23.填写申请)" Field="AssetModels" title='<%#Eval("AssetModels") %>' Text='<%#Eval("AssetModels") %>' MaxLength="50"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="拟定单价" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText runat="server" ID="tbDraftPrice" ActiveStatus="(23.填写申请)"  onblur="computeAllValue()" class="kpms-textbox-money"  Field="DraftPrice" Value='<%#Eval("DraftPrice") %>' MaxLength="15" Regex="^[0-9]+(.[0-9]{1,2})?$" ErrMsg="请填写正整数或带2位小数的正数!"></zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="审定单价" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="tbAuthorizePrice" runat="server" Field="AuthorizePrice"  onblur="computeAllValue()" class="kpms-textbox-money" Value='<%#Eval("AuthorizePrice") %>' ActiveStatus="(23.财务资产处审核)" MaxLength="15" Regex="^[0-9]+(.[0-9]{1,2})?$" ErrMsg="请填写正整数或2位小数的正数!"></zhongsoft:XHtmlInputText>
                       </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="小计" HeaderStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="xmlSubtotal" runat="server" Field="Subtotal" readonly="readonly" class="kpms-textbox-money" Value='<%#Eval("Subtotal") %>'></zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script>
    
    //计算小计当审定单价为空时，小计=拟定单价*数量，保留2位小数；当审定单价不为空时，小计=审定单价*数量，保留2位小数；

    function computeAllValue() {
        $("#<%=gvDetail.ClientID %> [id$=tbDraftPrice]").each(function () {
        var tbDraftPrice = $(this).parent('td').parent('tr').find('[id$=tbDraftPrice]');//拟定单价
        var tbAuthorizePrice = $(this).parent('td').parent('tr').find('[id$=tbAuthorizePrice]');//审定单价
        var tbBuyNum = $(this).parent('td').parent('tr').find('[id$=tbAssetCnt]');//数量
        var draftPrice = tbDraftPrice.val();
        var authorizePrice = tbAuthorizePrice.val();
        var buyNum = tbBuyNum.val();

        if (authorizePrice == "") {
            var sum = accMulLeaveNum(parseFloat(draftPrice), parseInt(buyNum), 2);
            if (isNaN(sum)) {
                sum = 0;
            }
            $(this).parent('td').parent('tr').find('[id$=xmlSubtotal]').val(sum);
        } else {
            var sum = accMulLeaveNum(parseFloat(authorizePrice), parseInt(buyNum), 2);
            if (isNaN(sum)) {
                sum = 0;
            }
            $(this).parent('td').parent('tr').find('[id$=xmlSubtotal]').val(sum);
            }
        });
    }
    function checkform() {
        var tbAuthorize="0";
        $("#<%=gvDetail.ClientID %> [id$=tbDraftPrice]").each(function () {
            var tbAuthorizePrice = $(this).parent('td').parent('tr').find('[id$=tbAuthorizePrice]');//审定单价
            if (tbAuthorizePrice.val()=="") {
                tbAuthorize ="1";
            }
        })
        if ($("#<%=gvDetail.ClientID%>")[0].rows[1].cells[0].innerText == "暂无物资明细") {
            alert('-请至少添加一条暂无物资明细！');
            return false;
        } else if ($actName == "财务资产处审核" && tbAuthorize =="1") {
            alert('审定单价必填！');
            return false;
        } else {
            return true;
        }
    }
</script>
