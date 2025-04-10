<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractCharge.ascx.cs"
    Inherits="Zhongsoft.Portal.FM.Form.FM.WF_ContractCharge" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-l">
            到款通知单名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtPayRequisitionName" runat="server" class="kpms-textbox"
                Field="PAYREQUISITIONNAME" TableName="FM_CONTRACTCHARGEFORM" activestatus="(23.提供到款通知单)(23.核对分解合同收费明细)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
   <td class="td-l">
                备注说明
            </td>
            <td class="td-m" colspan="3">
               <zhongsoft:LightTextBox ID="tbMemmo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="FM_CONTRACTCHARGEFORM" field="MEMO"
                     activestatus="(23.提供到款通知单)(23.核对分解合同收费明细)"></zhongsoft:LightTextBox> 
            </td>
        </tr>
    <tr>
        <td colspan="4" class="flexible" onclick="openDetail('buyer')">
            到款列表&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%" id="buyer">
                <tr id="Tr1" runat="server" displaystatus="(23.提供到款通知单)">
                    <td class="td-r" align="right" style="text-align: right" colspan="4" displaystatus="(3.提供到款通知单)">
                        <asp:Button runat="server" ID="btnSure" Text="添加" OnClick="btnAddBuyer_Click" />
                        <zhongsoft:LightTextBox runat="server" ID="tbRowNum" Width="30px" Style="text-align: right"
                            regex="\d{1,3}" errmsg="请输入正确的行号！">
                        </zhongsoft:LightTextBox>行
                        <asp:Button runat="server" ID="btnSaveBuyer" Text="保存到款信息" OnClick="btnSaveBuyer_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <zhongsoft:LightPowerGridView ID="dgBuyerList" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" UseDefaultDataSource="true" ShowHeaderWhenEmpty="true" EmptyDataText="无报销记录无到款记录"
                            PageSize="100" PermissionStatus="true" DataKeyNames="RECEIVECORPDETAILID" BindGridViewMethod="BindBuyerListData"
                            OnRowCommand="dgBuyerList_RowCommand" OnRowDataBound="dgBuyerLis_RowDataBound">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="35px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSequence" runat="server" Text='<%#Eval("SEQUENCE") %>'  ></asp:Label>
                                         <input type="hidden" runat="server" id="hiRecordDate" value='<%#Eval("RecordDate") %>' />
                                          <input type="hidden" runat="server" id="hiWriteDate" value='<%#Eval("WriteDate") %>' /> 
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="付款日期">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtPayDate" runat="server" Value='<%# (Eval("RECEIVEDATE")==null||string.IsNullOrEmpty(Eval("RECEIVEDATE").ToString())) ? Eval("RECEIVEDATE") : Convert.ToDateTime(Eval("RECEIVEDATE")).ToString("yyyy-MM-dd") %>'
                                            activestatus="(23.提供到款通知单)" readonly="readonly" class="kpms-textbox-date" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="到款单位" ItemStyle-Width="300px">
                                    <ItemTemplate>
                                        <zhongsoft:LightObjectSelector runat="server" ID="losBuyerInfoName" req="1" clearEmpty="true"
                                            SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true"
                                            activestatus="(23.提供到款通知单)" ResultAttr="name" EnableTheming="false" Writeable="false"
                                            ShowAttrs="name" ResultForControls="{'hiBuyerInfoID':'id'}" PageUrl="~/MM/Obsolete/CustomerSelector.aspx">
                                        </zhongsoft:LightObjectSelector>
                                        <input type="hidden" runat="server" id="hiBuyerInfoID" value='<%#Eval("CUSTOMERID") %>' />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="付款金额<br />（万元）" ItemStyle-Width="110px">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbPaySum" runat="server" CssClass="kpms-textbox-money"
                                            Style="text-align: right; width: 100px" regex="^([1-9]\d{0,8}|[0])(\.\d{1,6})?$"
                                            activestatus="(23.提供到款通知单)" MaxLength="13" errmsg="请输入正确的付款金额，格式：最多保留六位整数，六位小数！"
                                            corID='<%#Eval("RECEIVECORPDETAILID") %>' corName='<%#Eval("CUSTOMERNAME") %>'
                                            req="1">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                 <zhongsoft:LightTemplateField HeaderText="凭证号" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtVoucherNo" runat="server" Value='<%#Eval("VoucherNo") %>'
                                            activestatus="(23.提供到款通知单)" maxlength="125" class="kpms-textbox" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                 <zhongsoft:LightTemplateField ItemStyle-Width="60px"  HeaderText="收款方式<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList runat="server" ID="ddlPayMethod"    activestatus="(23.提供到款通知单)">
                                        </zhongsoft:LightDropDownList>
                                         <input type="hidden" runat="server" id="hiPayMethodId" value='<%#Eval("PayMethodId") %>' />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                  <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtMemo" runat="server" Value='<%#Eval("MEMO") %>'
                                            activestatus="(23.提供到款通知单)" maxlength="125" class="kpms-textbox" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已拆分合计<br />（万元）" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSplitedSum" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="到款描述">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtChargeMemo" runat="server" Value='<%#Eval("DESCRIPTION") %>'
                                            maxlength="512" class="kpms-textbox" activestatus="(23.提供到款通知单)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField> 
                                <zhongsoft:LightTemplateField HeaderText="到款流水号" ItemStyle-Width="50px">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtRceiveCode" runat="server" Value='<%#Eval("RceiveCode") %>'
                                            activestatus="(23.提供到款通知单)" maxlength="125" class="kpms-textbox" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该单位吗？">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr contractandproj="true" style="display: none">
        <td colspan="4" class="flexible" onclick="openDetail('tbCharge')">
            收费拆分列表&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%" id="tbCharge">
                <tr id="Tr2" contractandproj="true" style="display: none" runat="server" displaystatus="(23.核对分解合同收费明细)">
                    <td align="left" colspan="2">
                        <font color="red">
                            <asp:Label runat="server" ID="lbShowSum" Text="请认真填写合同本次收费额，确保合同收费额之和等于付款单位付款额！"></asp:Label></font>
                    </td>
                    <td align="right" colspan="2" nowrap>
                        到款序号
                        <zhongsoft:LightDropDownList runat="server" ID="ddlReceiveNoticeID" Width="70px">
                        </zhongsoft:LightDropDownList>
                        <asp:Button runat="server" ID="btnAddChargeRow" Text="添加合同" OnClick="btnAddChargeRow_Click"
                            OnClientClick="return selectContract();" />
                        <asp:Button runat="server" ID="Button2" Text="保存拆分" OnClick="btnSaveChargeList_Click" />
                    </td>
                </tr>
                <tr contractandproj="true" style="display: none">
                    <td colspan="4">
                        <zhongsoft:LightPowerGridView ID="dgChargeList" runat="server" AutoGenerateColumns="false"
                            UseDefaultDataSource="true" ShowHeaderWhenEmpty="true" EmptyDataText="无拆分记录"
                            AllowPaging="true" PermissionStatus="true" DataKeyNames="CHARGECONTRACTDETAILID"
                            PageSize="100" BindGridViewMethod="BindChargeList" OnRowCommand="dgChargeList_RowCommand"
                            OnRowDataBound="dgChargeList_RowDataBound">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="拆分<br />序号" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="35px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbContactSequence" runat="server" Text='<%#Eval("CCTSEQUENCE") %>'></asp:Label>
                                        <asp:Label ID="lbCONTRACTCODE" runat="server"  Visible="false" Text='<%#Eval("CONTRACTCODE") %>'></asp:Label>
                                          <asp:Label ID="lbCONTRACTNAME" runat="server"  Visible="false" Text='<%#Eval("CONTRACTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField HeaderText="到款<br />序号" DataField="PRESEQUENCE" Width="35"
                                    HtmlEncode="false" ItemStyle-HorizontalAlign="Center">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="合同名称" DataField="CONTRACTNAME" ShowToolTip="true"
                                    Width="350px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="合同额（万元）" DataField="CONTRACTVALUE" ItemStyle-HorizontalAlign="Right">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="ContractID" DataField="ContractID" Visible="false">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="本次收费额<br />（万元）" ItemStyle-Width="110px">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbContractPaySum" runat="server" CssClass="kpms-textbox-money"
                                            Style="text-align: right" regex="^([0-9]{0,6})(\.\d{1,6})?$" errmsg="请输入正确的本次收费金额，格式：最多保留六位整数，六位小数"
                                            contractName='<%#Eval("CONTRACTCODE") %>' contractDeID='<%#Eval("CHARGECONTRACTDETAILID") %>'
                                            corID='<%#Eval("RECEIVECORPDETAILID") %>' req="1" activestatus="(23.核对分解合同收费明细)">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已拆分合计<br />（万元）" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="110px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSplitedSum" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该合同吗？">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr contractandproj="true" style="display: none">
        <td colspan="4" class="flexible" onclick="openDetail('dtProjectCharge')">
            收费拆分到项目列表&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%" id="dtProjectCharge">
                <tr id="Tr3" contractandproj="true" style="display: none" runat="server" displaystatus="(23.核对分解合同收费明细)">
                    <td class="td-r" align="right" style="text-align: right" colspan="4" nowrap>
                        拆分序号
                        <zhongsoft:LightDropDownList runat="server" ID="ddlPayContractID" Width="70px">
                        </zhongsoft:LightDropDownList>
                        <asp:Button runat="server" ID="btnSelectProject" Text="选择项目" OnClientClick="return selectProject(1);"
                            OnClick="btnSelectProject_Click" />
                        <%--     <asp:Button runat="server" ID="btnSelectPGCProject" Text="选择总包项目" OnClientClick="return SelectProject(2);"
                OnClick="btnSelectProject_Click" />--%>
                        <asp:Button runat="server" ID="btnSelectTechProject" Text="选择科技项目" OnClientClick="return selectProject(4);"
                            OnClick="btnSelectProject_Click" Visible="false" />
                        <asp:Button runat="server" ID="SaveProjectList" Text="保存拆分" OnClick="btnSaveProjectList_Click" />
                    </td>
                </tr>
                <tr contractandproj="true" style="display: none">
                    <td colspan="4">
                        <zhongsoft:LightPowerGridView ID="dgProjectChargeList" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" UseDefaultDataSource="true" ShowHeaderWhenEmpty="true" EmptyDataText="无拆分记录"
                            PageSize="100" PermissionStatus="true" DataKeyNames="RECEIVEPROJECTDETAILID"
                            BindGridViewMethod="BindProjectChargeList" OnRowCommand="dgProjectChargeList_RowCommand"
                            OnRowDataBound="dgProjectChargeList_RowDataBound">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="项目<br />序号" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="35px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbProjectSequence" runat="server" Text='<%#Eval("PROJSEQUENCE") %>'></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField HeaderText="拆分<br />序号" DataField="PRESEQUENCE" Width="35"
                                    ItemStyle-HorizontalAlign="Center" HtmlEncode="false">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="项目编号" DataField="PROJECTCODE">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="项目名称" DataField="PROJECTNAME" ShowToolTip="true"
                                    Width="350px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="项目合同额（万元）" DataField="PROJECTCONTRACTVALUE" ShowToolTip="true"
                                     ItemStyle-HorizontalAlign="Right">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="项目已收费额（万元）" DataField="PROJECTCHARGEDVALUE" ShowToolTip="true"
                                     ItemStyle-HorizontalAlign="Right">
                                </zhongsoft:LightBoundField>
                                <%--<zhongsoft:LightTemplateField HeaderText="项目合同额<br />(万元)" ItemStyle-Width="90px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbProjectValue" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>--%>
                                <zhongsoft:LightTemplateField HeaderText="本次付费<br />（万元）" ItemStyle-Width="110px">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbProjectPaySum" runat="server" CssClass="kpms-textbox-money"
                                            Style="text-align: right" regex="^([0-9]{0,6})(\.\d{1,6})?$" errmsg="请输入正确的本次收费金额，格式：最多保留六位整数，六位小数"
                                            contractDeID='<%#Eval("CHARGECONTRACTDETAILID") %>' req="1" activestatus="(23.核对分解合同收费明细)">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已回款未开发票<br />（万元）" ItemStyle-Width="100px"
                                    ItemStyle-HorizontalAlign="Right" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbInvoiceValueSum" runat="server" Text='<%#Eval("HADCHARGENOINVOICE") %>'></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已关联发票金额<br />（万元）" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="100px" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSplitedSum" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="说明" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                                            maxtext="1024" TextMode="MultiLine" Text='<%#Eval("DESCRIPTION") %>' activestatus="(23.核对分解合同收费明细)"></zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已开<br />发票" ItemStyle-Width="50px" Visible="false">
                                    <ItemTemplate>
                                        <asp:RadioButtonList runat="server" ID="radlIsConfirm" RepeatDirection="Vertical"
                                            index='<%#Eval("PROJSEQUENCE") %>' projDetailID='<%#Eval("RECEIVEPROJECTDETAILID") %>'
                                            activestatus="(23.核对分解合同收费明细)">
                                            <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                            <asp:ListItem Value="0">否</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目吗？">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr  style=" display:none;">
        <td colspan="4" class="flexible" onclick="openDetail('dtInvoiceCharge')">
            相关发票&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr style=" display:none;">
        <td colspan="4">
            <table style="width: 100%" id="dtInvoiceCharge">
                <tr id="Tr4" invoice="true"   runat="server" >
                    <td class="td-r" align="right" style="text-align: right" colspan="4" >
                        项目序号
                        <zhongsoft:LightDropDownList runat="server" ID="ddlRelatedProject" Width="70px">
                        </zhongsoft:LightDropDownList>
                        <asp:Button runat="server" ID="btSelectInvoice" Text="添加发票" OnClientClick="return selectInvoice();"
                            OnClick="btnSelectInvoice_Click" />
                        <asp:Button runat="server" ID="btSaveInvoice" Text="保存" OnClick="btnSaveInvoice_Click" />
                    </td>
                </tr>
                <tr >
                    <td colspan="4">
                        <zhongsoft:LightPowerGridView ID="dgInvoiceList" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" UseDefaultDataSource="true" ShowHeaderWhenEmpty="true" EmptyDataText="无拆分记录"
                            PageSize="100" PermissionStatus="true" DataKeyNames="RECEIVEPROJECTDETAILID,INVOICECHARGEID"
                            BindGridViewMethod="BindInoiceList" OnRowCommand="dgInvoiceList_RowCommand" OnRowDataBound="dgInvoiceListt_RowDataBound">
                            <Columns>
                                <zhongsoft:LightBoundField HeaderText="项目序号" DataField="PROJSEQUENCE" SortExpression="PROJSEQUENCE asc"
                                    ItemStyle-Width="35px" ItemStyle-HorizontalAlign="Center">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="发票编号" DataField="SERIALNUM" SortExpression="SERIALNUM asc"
                                    ItemStyle-Width="25%">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="发票额<br />（万元）<span class='req-star'>*</span>"
                                    ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <%-- <asp:Label ID="lbInvoiceMoney" runat="server" Text='<%#Eval("INVOICEMN") %>'></asp:Label>--%>
                                        <zhongsoft:LightTextBox ID="tbInvoiceMoney" runat="server" CssClass="kpms-textbox-money"
                                            shouldControl="next" req="1" Text='<%#Eval("INVOICEMN") %>' Style="text-align: right"
                                            activestatus="(23.核实确认、进入收费台账)" regex="^([0-9]{0,6})(\.\d{1,6})?$" errmsg="请输入发票金额，格式：最多保留六位整数，六位小数">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="已回款<br />（万元）" ItemStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Label ID="lbInvoiceMoneyBack" runat="server" Text='<%#Eval("MONEYAMOUNT") %>'></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="本次付费<br />（万元）" ItemStyle-HorizontalAlign="Right"
                                    ItemStyle-Width="25%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbInvoicePaysum" runat="server" CssClass="kpms-textbox-money"
                                            shouldControl="pre" index='<%#Eval("PROJSEQUENCE") %>' projDetailID='<%#Eval("RECEIVEPROJECTDETAILID") %>'
                                            Style="text-align: right" activestatus="(23.核实确认、进入收费台账)" regex="^([0-9]{0,6})(\.\d{1,6})?$"
                                            errmsg="请输入正确的本次收费金额，格式：最多保留六位整数，六位小数" req="1">
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
                                    ItemStyle-Width="35px">
                                    <ItemTemplate>
                                        <asp:ImageButton runat="server" ID="ibtnDelete" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                            CommandName="DeleteData" CommandArgument='<%#Eval("RECEIVEPROJECTDETAILID")+","+Eval("INVOICECHARGEID") %>'
                                            OnClientClick="return confirm('确定要删除吗？')" Displaystatus="(23.核实确认、进入收费台账)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiFormID" field="CONTRACTCHARGEFORMID" tablename="FM_CONTRACTCHARGEFORM" />
<input type="hidden" runat="server" id="hiSelectDetails" />
<input type="hidden" runat="server" id="hiSelectProject" />
<input type="hidden" runat="server" id="hiSelectInvoice" />
<input type="hidden" runat="server" id="hiDDLSelectValuePass" />
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
<!---审批状态-->
<input type="hidden" runat="server" id="hiCheckStatus" field="BUSINESSSTATUS" tablename="FM_CONTRACTCHARGEFORM" />
<script type="text/javascript" src="<%=WebAppPath %>/EM/UI/Script/EMGeneralScript.js"></script>
<script type="text/javascript">
    var budgetPara1 = "";
    var budgetPara2 = "";
    var budgetPara3 = "";
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        hideDisplay();
        if ($actName == "核实确认、进入收费台账") {
            checkPayLimitInfoInvoice();
        }
    }

    //获取预算默认值
    function getApplySumInfo() {
        var sumReceive = 0;
        //获取收费总额信息
        $("#<%=dgBuyerList.ClientID %> [id$=tbPaySum]").each(function () {
            var thisReceive = $(this).val();
            sumReceive = accAdd(accMul(floatParse(thisReceive), 10000, 2), sumReceive);
        });
        return sumReceive;
    }

    function showSaveInfo(success, error) {
        if (success) {
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
            }); $('#saveSuccess').dialog('open');
        }
        else {
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
            $('<p>' + error + '</p>').insertAfter($('#saveFailed'));
            $('#saveFailed').dialog('open');
        }
    }

    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {
            if ($actName == "提供到款通知单") {
                if (getCorSplitNum() < 1) {
                    alert("请添加到款单位信息");
                    return false;
                }
            }
            if ($actName == "核对分解合同收费明细") {
                //没有添加合同拆分信息时进行提醒
                if (getContractSplitNum() < 1) {
                    alert("请拆分收费信息！");
                    return false;
                }
                else {
                    //判断收费额是否与拆分的合同额相等
                    var alertMsg = checkCorAndContractIsSame();
                    if (alertMsg != "") {
                        alert(alertMsg + "的付费额与合同的本次收费额不相等");
                        return false;
                    }
                    else {
                       
                    }
                }
            }
            else if ($actName == "核实确认、进入收费台账") {
                return checkHasInvoice();
            }
        }

        return true;
    }

    //获取合同拆分数量
    function getContractSplitNum() {
        return $("#<%=dgChargeList.ClientID %> [id$=tbContractPaySum]").length;
    }

    //获取收款单位数量
    function getCorSplitNum() {
        return $("#<%=dgBuyerList.ClientID %> [id$=tbPaySum]").length;
    }

    //判断到款金额与合同拆分额是否相等
    function checkCorAndContractIsSame() {
        var alertMsg = "";
        $("#<%=dgBuyerList.ClientID %> [id$=tbPaySum]").each(function () {
            var corDetailID = $(this).attr("corID");
            var corDetailName = $(this).attr("corName");
            var receiveMoney = $(this).val();
            //合同拆分列表
            var $contractSplit = $("#<%=dgChargeList.ClientID %> [id$=tbContractPaySum]");
            var sum = 0;
            //查找对应的合同拆分
            for (i = 0; i < $contractSplit.length; i++) {
                var corID = $($contractSplit[i]).attr("corID");
                if (corID == corDetailID) {
                    sum += floatParse($($contractSplit[i]).val());
                }
            }
            if (accSub(sum, receiveMoney) != 0) {
                alertMsg += corDetailName + ",";
            }
        });
        var last = alertMsg.lastIndexOf(',');
        alertMsg = alertMsg.slice(0, last);
        return alertMsg;
    }

    //判断是否合同的收费额是否与项目的收费总额相等
    function checkContractAndProjIsSame() {
        var alertMsg = "";
        $("#<%=dgChargeList.ClientID %> [id$=tbContractPaySum]").each(function () {
            var conDetailID = $(this).attr("contractDeID");
            var contractName = $(this).attr("contractName");
            var splitMoney = $(this).val();
            //项目拆分列表
            var $projSplit = $("#<%=dgProjectChargeList.ClientID %> [id$=tbProjectPaySum]");
            var sum = 0;
            //查找对应的项目拆分额
            for (i = 0; i < $projSplit.length; i++) {
                var conID = $($projSplit[i]).attr("contractDeID");
                if (conID == conDetailID) {
                    sum += floatParse($($projSplit[i]).val());
                }
            }
            if (accSub(sum, splitMoney) != 0) {
                alertMsg += "【" + contractName + "】,";
            }
        });
        var last = alertMsg.lastIndexOf(',');
        alertMsg = alertMsg.slice(0, last);
        return alertMsg;
    }

    //开发票的项目，必须选择发票信息
    function checkHasInvoice() {
        var alertMsg = "";
        var alertNoMsg = "";
        $("#<%=dgProjectChargeList.ClientID %> [id$=radlIsConfirm]").each(function () {
            var index = $(this).attr("index");
            var projDetailID = $(this).attr("projDetailID");
            var splitMoney = $(this).parent('td').parent('tr').find('[id$=tbProjectPaySum]').val();
            var checked = $("#" + $(this).attr("id") + " input:checked").val();

            //如果已开发票，必须有对应的发票信息并且开票金额与收费金额一致
            if (checked == "<%=(int)BoolType.是 %>") {
                //查找发票列表中是否已经存在，且金额是否相等
                var $projSplit = $("#<%=dgInvoiceList.ClientID %> [id$=tbInvoicePaysum]");
                var sum = 0;
                var count = 0;

                //查找对应的项目拆分额
                for (i = 0; i < $projSplit.length; i++) {
                    var projID = $($projSplit[i]).attr("projDetailID");
                    if (projDetailID == projID) {
                        sum += floatParse($($projSplit[i]).val());
                        count++;
                    }
                }

                if (count == 0) {
                    alertNoMsg += index + ",";
                }
                if (accSub(sum, splitMoney) != 0) {
                    alertMsg += index + ",";
                }
            }

        })
        var last = alertNoMsg.lastIndexOf(',');
        alertNoMsg = alertNoMsg.slice(0, last);
        if (alertNoMsg != "") {
            alert("请为项目拆分列表中第" + alertNoMsg + "行添加发票信息");
            return false;
        }
        var lastDH = alertMsg.lastIndexOf(',');
        alertMsg = alertMsg.slice(0, lastDH);
        if (alertMsg != "") {
            alert("项目拆分列表中第" + alertMsg + "行收费信息与开票信息不相等");
            return false;
        }
        return true;
    };

    //addBuyers,    addContractZone,ProjectZone, InvoiceZone
    function hideDisplay() {
        if ($actName == "提供到款通知单") {
            $('[contractAndProj]').hide();
            $('[invoice]').hide();
        }
        else {
            $('[contractAndProj]').show();
            $('[invoice]').show();
        }
        if ($actName == "核对分解合同收费明细") {
            $('[invoice]').hide();
        }
    }

    //选择合同
    function selectContract() {
        var selected = $("#<%=ddlReceiveNoticeID.ClientID %>").val();
        if (selected != "") {
            $('#<%=hiDDLSelectValuePass.ClientID %>').val(selected);
            var param = new InputParamObject("m");
            var reObj = null;
            getDivContract('<%=hiSelectDetails.ClientID %>', param, null, afterSelContract);
            return false;
        }
        else {
            alert("请选择到款信息");
        }
        return false;
    }

    function afterSelContract() {
         <%=this.Page.ClientScript.GetPostBackEventReference(this.btnAddChargeRow, "")%>;
    }

  

    //选择项目信息
    function selectProject(type) {
        var selected = $("#<%=ddlPayContractID.ClientID %>").val();
        if (selected != "") {
            $('#<%=hiDDLSelectValuePass.ClientID %>').val(selected);
            var param = new InputParamObject("m"); 
            var json = { 'IsFormalProject': 1 };
            getFormalDivProjects('<%=hiSelectProject.ClientID %>', param, json, afterSelProject); 
        }
        else {
            alert("请选择合同拆分序号信息");
        }
        return false;
    }

    function afterSelProject() {
         <%=this.Page.ClientScript.GetPostBackEventReference(this.btnSelectProject, "")%>;
    }

    //选择发票   
    function selectInvoice() {
        var selected = $("#<%=ddlRelatedProject.ClientID %>").val();
        if (selected != "") {
            $('#<%=hiDDLSelectValuePass.ClientID %>').val(selected);
            var param = new InputParamObject("m"); 
            var json={IsFromCharge:'1'};
            getDivUsedInvoice('<%=hiSelectInvoice.ClientID %>', param, json, afterSelInvoice);
        }
        else {
            alert("请选择项目");
        }
        return false;
    }

    function afterSelInvoice() {
         <%=this.Page.ClientScript.GetPostBackEventReference(this.btSelectInvoice, "")%>;
    }

    //控制本次付费不能大于发票额
    function checkPayLimitInfoInvoice() {
        $("#<%=dgInvoiceList.ClientID %> [shouldControl]").live("change", function () {
            var tbInvoice = $(this).parent("td").parent("tr").find("[id$=tbInvoiceMoney]");
            var thisPay = $(this).parent("td").parent("tr").find("[id$=tbInvoicePaysum]");
            if (thisPay != null && thisPay != undefined && tbInvoice != null && tbInvoice != undefined) {
                if (accSub(tbInvoice.val(), thisPay.val()) < 0) {
                    alert("本次付费额不能大于发票金额");
                    $(this).val("");
                    $(this).focus();
                }
            }
        });
    }
</script>
