<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCTripExpenseDetail.ascx.cs" Inherits="Zhongsoft.Portal.FM.UI.Controls.UCTripExpenseDetail" %>

<table class="tz-table" style="width: 100%;">
    <tr>
        <td colspan="4" style="text-align: center; font-size: medium; padding: 10px 0px;">费用明细<span class="req-star" runat="server" displaystatus="(2.*)">（请先保存，再添加费用明细）</span></td>
    </tr>
    <tr runat="server" displaystatus="(3.填写申请)(3.修改)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="30px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2" Text="1"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkIsTrue()" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                DataKeyNames="DetailId" PowerPageCount="0" PowerPageIndex="0" PermissionStatus="true" EmptyDataText="没有费用明细"
                RecordsCount="0" UseDefaultDataSource="true" ShowFooter="true" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出发日期<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" ID="txtStartDate" runat="server" onblur="autoComputeDay()" req="1" field="StartDate" activestatus="(23.填写申请)(23.修改)(3.财务专职记账)" Text='<%#Eval("StartDate","{0:yyyy-MM-dd}") %>'
                                    CssClass="kpms-textbox-date" EnableTheming="false" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出发地<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtStartAddr" req="1" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="StartAddr"
                                    Text='<%#Eval("StartAddr") %>' Width="100px" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到达日期<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" ID="txtGetToDate" runat="server" req="1" field="GetToDate" activestatus="(23.填写申请)(23.修改)(3.财务专职记账)" Text='<%#Eval("GetToDate","{0:yyyy-MM-dd}") %>'
                                    CssClass="kpms-textbox-date" EnableTheming="false" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="目的地<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtGetToAddr" req="1" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="GetToAddr"
                                    Text='<%#Eval("GetToAddr") %>' Width="100px" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="交通工具" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightDropDownList ID="ddlJiaoTongTool" runat="server" CssClass="kpms-ddlsearch" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)"
                                    field="JiaoTongTool" EnableTheming="false" />
                                <input type="hidden" runat="server" id="hiJiaoTongToolText" field="JiaoTongToolText" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="票面金额" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <span>
                                <!--以下标签顺序：文本框-隐藏域-a标签-->
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtPiaoMianCost" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="PiaoMianCost"
                                    regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" Text='<%#Eval("PiaoMianCost") %>' onblur="autoComputeTotalMoney()"  Width="50px" />
                                <input type="hidden" runat="server" id="hiPiaoMianCostIsLock" field="PiaoMianCostIsLock" value='<%#Eval("PiaoMianCostIsLock") %>' />
                                <a style='color: blue' onclick='lock(this,"PiaoMianCostIsLock")' class='<%#Eval("DetailId")%>'><%#(Eval("PiaoMianCostIsLock").ToString()=="0"||Eval("PiaoMianCostIsLock")==DBNull.Value)?"锁定":"取消" %></a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="伙食补助" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtHuoShiCost" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="HuoShiCost"
                                    regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" Text='<%#Eval("HuoShiCost") %>' onblur="autoComputeTotalMoney()" Width="50px" />
                                <input type="hidden" runat="server" id="hiHuoShiCostIsLock" field="HuoShiCostIsLock" value='<%#Eval("HuoShiCostIsLock") %>' />
                                <a style='color: blue' onclick='lock(this,"HuoShiCostIsLock")' class='<%#Eval("DetailId")%>'><%#(Eval("HuoShiCostIsLock").ToString()=="0" ||Eval("HuoShiCostIsLock")==DBNull.Value)?"锁定":"取消" %></a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="艰苦地区补助" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtJianKuDiQuCost" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="JianKuDiQuCost"
                                    regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" Text='<%#Eval("JianKuDiQuCost") %>' onblur="autoComputeTotalMoney()" Width="50px" />
                                <input type="hidden" runat="server" id="hiJianKuDiQuCostIsLock" field="JianKuDiQuCostIsLock" value='<%#Eval("JianKuDiQuCostIsLock") %>' />
                                <a style='color: blue' onclick='lock(this,"JianKuDiQuCostIsLock")' class='<%#Eval("DetailId")%>'><%#(Eval("JianKuDiQuCostIsLock").ToString()=="0" ||Eval("JianKuDiQuCostIsLock")==DBNull.Value) ? "锁定":"取消"%></a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="公杂费补助" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtGongZhaFeiCost" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="GongZhaFeiCost"
                                    regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" Text='<%#Eval("GongZhaFeiCost") %>' onblur="autoComputeTotalMoney()" Width="50px" />
                                <input type="hidden" runat="server" id="hiGongZhaFeiCostIsLock" field="GongZhaFeiCostIsLock" value='<%#Eval("GongZhaFeiCostIsLock") %>' />
                                <a style='color: blue' onclick='lock(this,"GongZhaFeiCostIsLock")' class='<%#Eval("DetailId")%>'><%#(Eval("GongZhaFeiCostIsLock").ToString()=="0"||Eval("GongZhaFeiCostIsLock")==DBNull.Value)?"锁定":"取消" %></a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="住宿费" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="txtZhuSuCost" ActiveStatus="(23.填写申请)(23.修改)(3.财务专职记账)" Field="ZhuSuCost"
                                    regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" Text='<%#Eval("ZhuSuCost") %>' onblur="autoComputeTotalMoney()" Width="50px" />
                                <input type="hidden" runat="server" id="hiZhuSuCostIsLock" field="ZhuSuCostIsLock" value='<%#Eval("ZhuSuCostIsLock") %>' />
                                <a style='color: blue;width:20px;' onclick='lock(this,"ZhuSuCostIsLock")' class='<%#Eval("DetailId")%>'><%#(Eval("ZhuSuCostIsLock").ToString()=="0" || Eval("ZhuSuCostIsLock")==DBNull.Value)?"锁定":"取消" %></a>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightButtonField HeaderText="删除" Visible="false" CommandName="DeleteData" ItemStyle-Width="20px">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();


    }

    function hideLockBtn() {
        //不是会计办理环节需隐藏控制锁定的按钮
        $("#<%=gvList.ClientID %> [id$=txtPiaoMianCost]").each(function () {
            $(this).next().next("a").hide();
        });
        $("#<%=gvList.ClientID %> [id$=txtHuoShiCost]").each(function () {
            $(this).next().next("a").hide();
        });
        $("#<%=gvList.ClientID %> [id$=txtJianKuDiQuCost]").each(function () {
            $(this).next().next("a").hide();
        });
        $("#<%=gvList.ClientID %> [id$=txtGongZhaFeiCost]").each(function () {
            $(this).next().next("a").hide();
        });
        $("#<%=gvList.ClientID %> [id$=txtZhuSuCost]").each(function () {
            $(this).next().next("a").hide();
        });
    }

    function IsCanEdit() {
        //修改环节，已锁定的费用，不能编辑，未锁定的可编辑
        $("#<%=gvList.ClientID %> [id$=txtPiaoMianCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtHuoShiCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtJianKuDiQuCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtGongZhaFeiCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtZhuSuCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
    }

    ///走过会计办理的未锁定的费用显示为红色
    function SetColor() {

         $("#<%=gvList.ClientID %> [id$=txtPiaoMianCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtHuoShiCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtJianKuDiQuCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtGongZhaFeiCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });
        $("#<%=gvList.ClientID %> [id$=txtZhuSuCost]").each(function () {
            if ($(this).next("input").val() == "0" || $(this).next("input").val() == "") {

                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
            }
            else if ($(this).next("input").val() == "1") {
                $(this).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
            }
        });

    }

    //点击确定时，验证是否输入数字
    function checkIsTrue() {

        var showNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (showNum == "") {
            alert("请输入显示的行数");
            return false;
        }
        return true;
    }
    function autoComputeDay() {
        var startDate = "";
        var startArr = new Array();
        $("#<%=gvList.ClientID %> [id$=txtStartDate]").each(function () {
            startDate = $(this).val();
            startArr.push(startDate);
        });
        var maxN = startArr[0];
        var minN = startArr[0];
        for (var i = 1; i < startArr.length; i++) {
            var cur = startArr[i];
            cur > maxN ? maxN = cur : null;
            cur < minN ? minN = cur : null;
        }
        var computeDay = maxN + "%%" + minN;
        ComputeDay(computeDay)
    }

    //设置锁定状态
    function lock(e, t) {
        if (e.innerText == "锁定" && ($(e).prev("input").val() == "0" || $(e).prev("input").val() == "")) {
            e.innerText = "取消"
            $(e).prev("input").val("1")//已锁定
            $(e).prev("input").prev("input").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black;width:50px');
        }
        else if (e.innerText == "取消" && $(e).prev("input").val() == "1") {
            e.innerText = "锁定"
            $(e).prev("input").val("0")//未锁定
            $(e).prev("input").prev("input").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red;width:50px');
        }
        var param = { asyfunc: "updateIsLockByTrip" }
             //表名|字段名|id|锁定状态值|where字段名
        var data = "FM_Manage_TripExpenseDetailForm" + "|" + t + "|" + $(e).attr("class") + "|" + $(e).prev("input").val()+"|"+"DetailId";
        param.data = data;
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>/FM/Handler/DetailHandler.ashx',
            data: param,
            async: false,
            cache: false,
            success: function (res) {

            },
            error: function (err) {

            }
        });

    }
</script>
