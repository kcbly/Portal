<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishCostDetail.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishCostDetail" %>

<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-m" colspan="3">
            <table style="width: 100%">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>CAD绘图</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvCAD" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvCAD_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="CAD自然张">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCADNum" DataType="PositiveInteger"
                                            Style="width: 50%; text-align: right"
                                            CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="Decimal2"
                                            CssClass="kpms-textbox-money" Style="width: 50%; text-align: right" flag="cadCopyNum"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        CAD绘图合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <%-- <zhongsoft:LightBoundField DataField="SingleCost" HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSingleCost" Text='<%# Eval("SingleCost") %>' flag="singleCost"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="cadSum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbCADSum" flag="totalCad"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%;">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>晒图</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvBluePrint" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvBluePrint_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="晒图自然张">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                                    <HeaderTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbBlueNum" DataType="PositiveInteger"
                                            Style="width: 50%; text-align: right" CssClass="kpms-textbox-money">
                                        </zhongsoft:LightTextBox>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="Decimal2" flag="blueCopyNum"
                                            Style="width: 50%; text-align: right;" CssClass="kpms-textbox-money"
                                            Text='<%# Eval("CopyNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        晒图合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSingleCost" Text='<%# Eval("SingleCost") %>' flag="singleCost"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="blueSum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbBlueSum" flag="totalBlue"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="3">
            <table style="width: 100%">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>彩打</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvColor" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvColor_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="项目">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="成品张数" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 50%; text-align: right" flag="colorCopyNum"
                                            Text='<%# Eval("CopyNumShow") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        彩打合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSingleCost" Text='<%# Eval("SingleCost") %>' flag="singleCost"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="colorSum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbColorSum" flag="totalColor"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%;">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>复印</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvCopy" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvCopy_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="幅面">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderText="底稿张数">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbManuscriptNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 80%; text-align: right;"
                                            Text='<%# Eval("ManuscriptNum") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderText="份数">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 80%; text-align: right" flag="copyCopyNum"
                                            Text='<%# Eval("CopyNumShow") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        复印合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSingleCost" Text='<%# Eval("SingleCost") %>' flag="singleCost"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="copySum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbCopySum" flag="totalCopy"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>装订(装璜)规格</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvBinding" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvBinding_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="SingleCostName" HeaderText="规格">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderText="装订份数">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            CssClass="kpms-textbox-money" Style="width: 50%; text-align: right" flag="bindingCopyNum"
                                            Text='<%# Eval("CopyNumShow") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        装订合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbSingleCost" Text='<%# Eval("SingleCost") %>' flag="singleCost"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="bindingSum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbBindingSum" flag="totalBinding"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
        <td class="td-m" colspan="3" style="vertical-align: top">
            <table style="width: 100%;">
                <tr>
                    <td class="flexible" style="text-align: center">
                        <span>其他项目</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="gvOther" runat="server" UseDefaultDataSource="true"
                            DataKeyNames="PublishCostDetailID" ShowFooter="true" OnRowDataBound="gvOther_RowDataBound">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="项目" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbSingleCostName"
                                            Style="width: 90%;" CssClass="kpms-textbox" Text='<%# Eval("SingleCostName") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField ItemStyle-HorizontalAlign="Right" HeaderText="">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbCopyNum" DataType="PositiveInteger"
                                            Style="width: 80%; text-align: right;" CssClass="kpms-textbox-money" flag="otherCopyNum"
                                            Text='<%# Eval("CopyNumShow") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        其他合计:
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="单价" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbSingleCost" DataType="Decimal2" changeFlag="otherSingleCost"
                                            Style="width: 80%; text-align: right;" CssClass="kpms-textbox-money" flag="singleCost"
                                            Text='<%# Eval("SingleCost") %>'></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="小计" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiPublishCostDetailID" value='<%# Eval("PublishCostDetailID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostID" value='<%# Eval("SingleCostID") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCostName" value='<%# Eval("SingleCostName") %>' />
                                        <input type="hidden" runat="server" id="hiSingleCost" value='<%# Eval("SingleCost") %>' />
                                        <asp:Label runat="server" ID="lbSum" flag="otherSum"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label runat="server" ID="lbOtherSum" flag="totalOther"></asp:Label>
                                    </FooterTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>总计：
        </td>
        <td colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTotalCost" readonly="readonly"
                class="kpms-textbox" activestatus="(23.?)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td>大写：
        </td>
        <td colspan="2">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTotalCostBig" readonly="readonly"
                class="kpms-textbox" activestatus="(23.?)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiAddNum" value="5" />
<script type="text/javascript">
    function computeSum() {
        $('[flag="cadCopyNum"]').each(function () {
            computeSingleSum(this, "cad");
            computeCadTotal(this);
            $(this).bind('blur', function () {
                computeSingleSum(this, "cad");
                computeCadTotal(this);
                computeTotalCost();
            });
        });
        $('[flag="blueCopyNum"]').each(function () {
            computeSingleSum(this, "blue");
            computeBlueTotal(this);
            $(this).bind('blur', function () {
                computeSingleSum(this, "blue");
                computeBlueTotal(this);
                computeTotalCost();
            });
        });

        $('[flag="colorCopyNum"]').each(function () {
            computeSingleSum(this, "color");
            computeColorTotal(this);
            $(this).bind('blur', function () {
                computeSingleSum(this, "color");
                computeColorTotal(this);
                computeTotalCost();
            });
        });

        $('[flag="copyCopyNum"]').each(function () {
            computeSingleSum(this, "copy");
            computeCopyTotal(this);
            $(this).bind('blur', function () {
                computeSingleSum(this, "copy");
                computeCopyTotal(this);
            });
        });

        $('[flag="bindingCopyNum"]').each(function () {
            computeSingleSum(this, "binding");
            computeBindingTotal(this);
            $(this).bind('blur', function () {
                computeSingleSum(this, "binding");
                computeBindingTotal(this);
                computeTotalCost();
            });
        });

        $('[flag="otherCopyNum"]').each(function () {
            computeOtherSum(this, "singleCost");
            computeOtherTotal(this);
            $(this).bind('blur', function () {
                computeOtherSum(this, "singleCost");
                computeOtherTotal(this);
                computeTotalCost();
            });
        });

        $('[changeflag="otherSingleCost"]').each(function () {
            computeOtherSum(this, "otherCopyNum");
            computeOtherTotal(this);
            $(this).bind('blur', function () {
                computeOtherSum(this, "otherCopyNum");
                computeOtherTotal(this);
                computeTotalCost();
            });
        });
        computeTotalCost();

    }

    //计算各单项和
    function computeSingleSum(obj, sumType) {
        var copyNum = $(obj).val();
        var singleCost = $(obj).parent().parent().find('[flag="singleCost"]')[0].innerText;
        if (copyNum != "" && singleCost != "" && !isNaN(copyNum) && !isNaN(singleCost)) {
            var cadSum = parseFloat(copyNum) * parseFloat(singleCost);
            $(obj).parent().parent().find('[flag="' + sumType + 'Sum"]')[0].innerText = cadSum.toFixed(2);
        }
        else {
            $(obj).parent().parent().find('[flag="' + sumType + 'Sum"]')[0].innerText = 0;
        }
    }

    //计算CAD总计
    function computeCadTotal(obj) {
        var totalCad = 0;
        $('[flag="cadSum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalCad = (parseFloat(totalCad) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalCad"]')[0].innerText = totalCad;
    }

    //计算晒图总计
    function computeBlueTotal(obj) {
        var totalBlue = 0;
        $('[flag="blueSum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalBlue = (parseFloat(totalBlue) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalBlue"]')[0].innerText = totalBlue;
    }

    //计算彩打合计
    function computeColorTotal(obj) {
        var totalColor = 0;
        $('[flag="colorSum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalColor = (parseFloat(totalColor) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalColor"]')[0].innerText = totalColor;
    }

    //计算复印合计
    function computeCopyTotal(obj) {
        var totalCopy = 0;
        $('[flag="copySum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalCopy = (parseFloat(totalCopy) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalCopy"]')[0].innerText = totalCopy;
    }

    //计算装订合计
    function computeBindingTotal(obj) {
        var totalBinding = 0;
        $('[flag="bindingSum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalBinding = (parseFloat(totalBinding) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalBinding"]')[0].innerText = totalBinding;
    }

    //计算其他合计
    function computeOtherTotal(obj) {
        var totalOther = 0;
        $('[flag="otherSum"]').each(function () {
            var singleSum = $(this)[0].innerHTML;
            if (singleSum != "" && !isNaN(singleSum)) {
                totalOther = (parseFloat(totalOther) + parseFloat(singleSum)).toFixed(2);
            }
        });
        $(obj).parent().parent().parent().find('[flag="totalOther"]')[0].innerText = totalOther;
    }

    //计算其他项目单项小计
    function computeOtherSum(obj, otherVar) {
        var var1 = $(obj).val();
        var var2 = $(obj).parent().parent().find('[flag="' + otherVar + '"]').val();
        if (var1 != "" && var2 != "" && !isNaN(var1) && !isNaN(var2)) {
            var sum = parseFloat(var1) * parseFloat(var2);
            $(obj).parent().parent().find('[flag="otherSum"]')[0].innerText = sum.toFixed(2);
        }
        else {
            $(obj).parent().parent().find('[flag="otherSum"]')[0].innerText = 0;
        }
    }

    //计算所有费用合计
    function computeTotalCost() {
        var cadTotal = $("#<%=gvCAD.ClientID %>").find('[flag="totalCad"]')[0].innerText;
        var blueTotal = $("#<%=gvBluePrint.ClientID %>").find('[flag="totalBlue"]')[0].innerText;
        var colorTotal = $("#<%=gvColor.ClientID %>").find('[flag="totalColor"]')[0].innerText;
        var copyTotal = $("#<%=gvCopy.ClientID %>").find('[flag="totalCopy"]')[0].innerText;
        var bindingTotal = $("#<%=gvBinding.ClientID %>").find('[flag="totalBinding"]')[0].innerText;
        var otherTotal = $("#<%=gvOther.ClientID %>").find('[flag="totalOther"]')[0].innerText;
        var total = 0;
        if (!isNaN(cadTotal)) {
            total += parseFloat(cadTotal);
        }
        if (!isNaN(blueTotal)) {
            total += parseFloat(blueTotal);
        }
        if (!isNaN(colorTotal)) {
            total += parseFloat(colorTotal);
        }
        if (!isNaN(copyTotal)) {
            total += parseFloat(copyTotal);
        }
        if (!isNaN(bindingTotal)) {
            total += parseFloat(bindingTotal);
        }
        if (!isNaN(otherTotal)) {
            total += parseFloat(otherTotal);
        }
        $("#<%=txtTotalCost.ClientID %>").val(total.toFixed(2));
        convertToCHNMoney("<%=txtTotalCost.ClientID %>", "<%=txtTotalCostBig.ClientID %>");
    }
</script>
