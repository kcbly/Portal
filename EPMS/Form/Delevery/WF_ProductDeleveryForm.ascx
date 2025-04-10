<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductDeleveryForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Delevery.WF_ProductDeleveryForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            资料交付单编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProductDeliverCode" runat="server" field="ProductDeliverCode"
                readonly="readonly" tablename="EPMS_PublishDeliver" activestatus="(23.提交产品)"
                class="kpms-textbox" />
        </td>
        <td colspan="4" class="td-m">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            客户名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCustomerName" field="CustomerName" tablename="EPMS_PublishDeliver"
                activestatus="(23.提交产品)" MaxLength="64" req="1" />
            <%--<zhongsoft:LightObjectSelector runat="server" ID="losCustomerName" field="CustomerName"
                tablename="EPMS_PublishDeliver" activestatus="(23.提交产品)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                Writeable="false" ShowAttrs="name" ResultForControls="{'hiCustomerID':'id'}"
                PageUrl="~/MM/Obsolete/CustomerSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" tablename="EPMS_PublishDeliver"
                field="CustomerID" />--%>
        </td>
        <td class="td-l">
            接收人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbReceiveManName" field="ReceiveManName"
                tablename="EPMS_PublishDeliver" activestatus="(23.提交产品)(3.接收递送)" MaxLength="16" />
            <%--  <zhongsoft:LightObjectSelector runat="server" ID="txtReceiveManName" field="ReceiveManName"
                tablename="EPMS_PublishDeliver" activestatus="(23.提交产品)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" OnClientClick="return selContact()"
                Writeable="true" ShowAttrs="name" ResultForControls="{'hiReceiveManID':'id'}" />
            <input type="hidden" id="hiReceiveManID" name="hiReceiveManID" runat="server" tablename="EPMS_PublishDeliver"
                field="ReceiveManID" />
            <input type="hidden" id="hiReceiveManTel" name="hiReceiveManTel" runat="server" tablename="EPMS_PublishDeliver"
                field="ReceiveManTel" />
            <input type="hidden" id="hiReceiveManDept" name="hiReceiveManDept" runat="server"
                tablename="EPMS_PublishDeliver" field="ReceiveManDept" />--%>
        </td>
        <td colspan="2" class="td-m">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            经办人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtHandingManName" runat="server" field="HandingManName"
                readonly="readonly" tablename="EPMS_PublishDeliver" activestatus="(23.提交产品)"
                class="kpms-textbox" />
            <input type="hidden" id="hiHandingManID" name="hiHandingManID" runat="server" tablename="EPMS_PublishDeliver"
                field="HandingManID" />
            <input type="hidden" id="hiHandingDeptID" name="hiHandingDeptID" runat="server" tablename="EPMS_PublishDeliver"
                field="HandingDeptID" />
            <input type="hidden" id="hiHandingDeptName" name="hiHandingDeptName" runat="server"
                tablename="EPMS_PublishDeliver" field="HandingDeptName" />
        </td>
        <td class="td-l">
            出版交付日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDeliverDate" runat="server"
                readonly="readonly" TableName="EPMS_PublishDeliver" Field="DeliverDate" ActiveStatus="(23.提交产品)" />
        </td>
        <td class="td-l">
            交付客户日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDeliverCustomerDate" runat="server"
                readonly="readonly" TableName="EPMS_PublishDeliver" Field="DeliverCustomerDate"
                ActiveStatus="(23.提交产品)(3.接收递送)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EPMS_PublishDeliver"
                Field="Memo" ActiveStatus="(23.提交产品)(3.接收递送)" EnableTheming="false" CssClass="kpms-textarea"
                TextMode="MultiLine" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="Table1">
    <tr id="Tr1" runat="server" displaystatus="(3.提交产品)">
        <td class="flexible" onclick="openDetail('proList')">
            <span id="projInfo1">待交付成品清单</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="proList">
    <tr id="Tr3" runat="server" displaystatus="(3.提交产品)">
        <td>
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
                <zhongsoft:LightTextBox ID="tbProject" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false" />
            </span></span><span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span>
                <span>
                    <zhongsoft:LightTextBox ID="tbRoll" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                        EnableTheming="false" />
                </span></span>
            <asp:LinkButton runat="server" ID="btnSearch" OnClick="btnSearch_Click"><span>查找</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click"><span>重置</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnAdd" Visible="false" OnClientClick="return addProduct()"
                OnClick="btnAdd_Click"><span>批量添加</span></asp:LinkButton>
        </td>
    </tr>
    <tr id="Tr2" runat="server" displaystatus="(3.提交产品)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvConsignList" runat="server" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="WBSID"
                OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="UserControl.BindConsignGrid">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" Visible="false"
                        OnClientClick="checkConsignGridView">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
                    <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" />
                    <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" />
                    <zhongsoft:LightTemplateField HeaderText="套">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiDetailID" value='<%#Eval("WBSID") %>' />
                            <input type="hidden" runat="server" id="hiPublishConsignID" value='<%#Eval("PublishConsignID") %>' />
                            <input type="hidden" runat="server" id="hiPublishConsignWBSID" value='<%#Eval("PublishConsignWBSID") %>' />
                            <zhongsoft:LightTextBox ID="tbCoverCount" runat="server" EnableTheming="false" regex="^[0-9]\d*$"
                                errmsg="请填写正整数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="张">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDrawingCount" runat="server" EnableTheming="false"
                                regex="^[0-9]\d*$" errmsg="请填写正整数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="本">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPageCount" runat="server" EnableTheming="false" regex="^[0-9]\d*$"
                                errmsg="请填写正整数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMemo" runat="server" EnableTheming="false" CssClass="kpms-textbox"
                                maxtext="1024" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="公斤数">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbWeight" runat="server" EnableTheming="false" regex="^[1-9]\d*|0$"
                                errmsg="请输入非负数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="AddData" HeaderText="添加" CausesValidation="false"
                        ImageUrl="../../../Themes/Images/btn_add.gif" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="Table2">
    <tr id="Tr4" runat="server" displaystatus="(13.*)">
        <td class="flexible" onclick="openDetail('proDelevery')">
            <span id="Span1">产品交付列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="proDelevery">
    <tr id="Tr6" runat="server" displaystatus="(3.提交产品)">
        <td class="td-m" colspan="6" style="text-align: right;">
            您已添加&nbsp;<asp:Label ID="lbNum" runat="server" Text="0" ForeColor="Red" Font-Bold="true"
                Font-Size="Large"></asp:Label>&nbsp;卷册
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="return cancelProduct();"
                OnClick="btnCancel_Click"><span>批量撤销</span></asp:LinkButton>
        </td>
    </tr>
    <tr id="Tr5" runat="server" displaystatus="(13.*)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvDeliverList" runat="server" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="DeliverProductID"
                OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="UserControl.BindDeliverGrid">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkDeliverGridView"
                        Visible="false">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" />
                    <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" />
                    <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" />
                    <zhongsoft:LightBoundField HeaderText="套" DataField="CoverCount" Width="30px" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField HeaderText="张" DataField="DrawingCount" Width="30px" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField HeaderText="本" DataField="PageCount" Width="30px" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" />
                    <zhongsoft:LightBoundField HeaderText="公斤数" DataField="Weight" Width="30px" ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="撤销" CausesValidation="false"
                        DeleteText="确认撤销该记录吗？" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPublishDeliverID" name="hiPublishDeliverID" runat="server"
    tablename="EPMS_PublishDeliver" field="PublishDeliverID" />
<input type="hidden" id="hiConsignID" runat="server" />
<input type="hidden" id="hiDeliverID" runat="server" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function checkConsignGridView(array) {
        $("#<%=hiConsignID.ClientID %>").val(array);
    }

    function checkDeliverGridView(array) {
        $("#<%=hiDeliverID.ClientID %>").val(array);
    }

    function addProduct() {
        if ($("#<%=hiConsignID.ClientID %>").val() == "") {
            alert("请选择交付成品！");
            return false;
        }
        return true;
    }

    function cancelProduct() {
        if ($("#<%=hiDeliverID.ClientID %>").val() == "") {
            alert("请选择撤销成品！");
            return false;
        }
        return confirm("确认撤销选中项？");
    }

    //批量打印
    function beforePrint() {
        var a = $("#<%=hiPublishDeliverID.ClientID %>").val();
        window.open("<%=WebAppPath %>" + "/EPMS/List/Delevery/ProductDeleveryPrint.aspx?bizId=" + a);
        return false;
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && $actName == "提交产品") {
                var grid = $('#<%=gvDeliverList.ClientID %>')[0];
                if (grid.rows.length < 3) {
                    alert("请先选定交付卷册！")
                    return false;
                }
            }
        }
        return true;
    }
</script>
