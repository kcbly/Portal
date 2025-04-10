<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TargetValueList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.TargetValueList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <div style="min-width: 1000px; _width: 1000px;" class="tz-toolbar">
        <table class="kpms-seniorsearchtable">
            <tr>
                <td>
                    <span class="filter-block"><span class="filter-block-lb">年份</span><span>
                        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" />
                    </span></span>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="btn-query" ID="btnSave" OnClick="btnSave_Click"
                        OnClientClick="return checkSave()">
                        <span>
                            <img alt="保存" title="保存" src="<%=WebAppPath %>/Themes/Images/btn_tb_save.gif" />
                            保存</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <zhongsoft:LightPowerGridView AllowPaging="false" ID="gvList" AutoGenerateColumns="false"
        runat="server" OnRowDataBound="gvList_RowDataBound" ShowFooter="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="部门">
                <ItemTemplate>
                    <asp:Label ID="lbStaTypeName" runat="server" Text='<%# Eval("StaTypeName")%>' />
                </ItemTemplate>
                <FooterTemplate>
                    合计
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="新签合同（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbNewContract" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbNewContractSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="营业收入（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbOperatingIncome" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbOperatingIncomeSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="内部利润（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbInternalProfit" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbInternalProfitSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同收费（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbContractCharge" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbContractChargeSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="应收账款余额（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbReceivableAccount" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbReceivableAccountSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目总产值（万元）" ItemStyle-HorizontalAlign="Right"
                FooterStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <zhongsoft:LightTextBox ID="tbProjectAllValue" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" Regex="^([1-9]\d{0,7}|[0])(\.\d{1,6})?$" errmsg="请输入正数，最多8位整数，6位小数"></zhongsoft:LightTextBox>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label runat="server" ID="lbProjectAllValueSum"></asp:Label>
                </FooterTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="saveSuccess" style="display: none" class="ui-state-highlight ui-corner-all">
        <p>
            <span class="ui-icon ui-icon-info" style="float: left;"></span>保存成功!</p>
    </div>
    <div class="ui-widget">
        <div id="saveFailed" style="display: none" class="ui-state-error ui-corner-all">
            <p>
                <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
                保存失败!
            </p>
        </div>
    </div>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //保存提示脚步加载
            $('#saveSuccess').dialog({
                autoOpen: false,
                resizable: false,
                minHeight: '50',
                hide: 'blind',
                closeText: '',
                open: function (event, ui) {
                    setTimeout(function () {
                        if ($('#saveSuccess').dialog("isOpen")) {
                            $('#saveSuccess').dialog('close');
                        }
                    }, 2000);
                }
            });
            $('#saveFailed').dialog({
                autoOpen: false,
                minHeight: '50',
                hide: 'blind',
                resizable: false,
                modal: true,
                closeText: '',
                open: function (event, ui) {
                    setTimeout(function () {
                        if ($('#saveFailed').dialog("isOpen")) {
                            $('#saveFailed').dialog('close');
                        }
                    }, 2000);
                }
            });
            if (typeof $actionResult != "undefined") {
                if ($actionResult.r != -999) {
                    if ($actionResult.ErrCode == 0) $('#saveSuccess').dialog('open');
                    else {
                        $('<p>' + $actionResult.Msg + '</p>').appendTo($('#saveFailed'));
                        $('#saveFailed').dialog('open');
                    }
                    $actionResult.r = -999;
                }
            }

            //绑定自动计算
            $("#<%=gvList.ClientID %> [id$=tbNewContract]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "NewContract"); });
            $("#<%=gvList.ClientID %> [id$=tbOperatingIncome]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "OperatingIncome"); });
            $("#<%=gvList.ClientID %> [id$=tbInternalProfit]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "InternalProfit"); });
            $("#<%=gvList.ClientID %> [id$=tbContractCharge]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "ContractCharge"); });
            $("#<%=gvList.ClientID %> [id$=tbReceivableAccount]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "ReceivableAccount"); });
            $("#<%=gvList.ClientID %> [id$=tbProjectAllValue]").live("change", function () { autoCompleteValue("<%=gvList.ClientID %>", "ProjectAllValue"); });

            //加载合计信息
            autoCompleteValue("<%=gvList.ClientID %>", "NewContract");
            autoCompleteValue("<%=gvList.ClientID %>", "OperatingIncome");
            autoCompleteValue("<%=gvList.ClientID %>", "InternalProfit");
            autoCompleteValue("<%=gvList.ClientID %>", "ContractCharge");
            autoCompleteValue("<%=gvList.ClientID %>", "ReceivableAccount");
            autoCompleteValue("<%=gvList.ClientID %>", "ProjectAllValue");
        }

        //保存之前确认选择年份
        function checkSave() {
            if ($("#<%=ddlYear.ClientID %>").val() == "") {
                alert("请选择年份！");
                return false;
            }
            return true;
        }

        //自动计算合计值
        function autoCompleteValue(gvDetail, flag) {
            var $array = $("#" + gvDetail).find("[id$=tb" + flag + "]");
            var sumValue = 0;
            for (i = 0; i < $array.length; i++) {
                var thisValue = $($array[i]).val();
                thisValue = floatParse(thisValue);
                thisValue = accMulLeaveNum(thisValue, 10000, 2);
                sumValue = accAddFloat6(thisValue, sumValue);
            }
            var lbSum = $("#" + gvDetail).find("[id$=lb" + flag + "Sum]");
            lbSum.text(accDivLeaveNum(sumValue, 10000, 6));
        }
    </script>
</asp:Content>
