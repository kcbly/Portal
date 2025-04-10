<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OtherExpenseForm.ascx.cs"
    Inherits="Zhongsoft.Portal.FM.Form.Manage.WF_OtherExpenseForm" %>
<script type="text/javascript" src="<%=WebAppPath %>/UI/Script/dataformat.js"></script>
<table class="tz-table">
    <tr>
        <td class="td-l">报销单号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtExpenseNo" runat="server" class="kpms-textbox-money" style="width: 120px"
                readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="ExpenseNo" Activestatus="(23.填写申请)(3.修改)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" class="kpms-textbox-date" req="1"
                readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="ApplyDate" Activestatus="(23.填写申请)(3.修改)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">经办人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" field="ApplyUserName" req="1"
                tablename="FM_Manage_OtherExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageWidth="750" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(3.修改)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyUserID" runat="server" tablename="FM_Manage_OtherExpenseForm"
                field="ApplyUserID" />
        </td>
        <td class="td-l">部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyDeptName" field="ApplyDeptName" req="1"
                tablename="FM_Manage_OtherExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(3.修改)"
                Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiApplyDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" Filter="{'ShowTree':'1'}"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiApplyDeptID" runat="server" tablename="FM_Manage_OtherExpenseForm"
                field="ApplyDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">原始附件（张）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtBillNum" Width="65" req="1" class="kpms-textbox" activestatus="(23.填写申请)(3.修改)" DataType="UInteger" field="BillNum"
                tablename="FM_Manage_OtherExpenseForm">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">是否计入项目成本<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_OtherExpenseForm" Field="IsProject"
                Activestatus="(23.填写申请)(3.修改)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="FM_Manage_OtherExpenseForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800"  OnClick="txtManager_Click" 
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx" Filter="{'isProjectState':'1'}"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="FM_Manage_OtherExpenseForm" Field="ProjectName" activestatus="(23.填写申请)(3.修改)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="FM_Manage_OtherExpenseForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l" id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)(3.修改)"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_OtherExpenseForm" Field="ProjectCode" />
        </td>
        <td class="td-l" id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)(3.修改)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="FM_Manage_OtherExpenseForm" Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="FM_Manage_OtherExpenseForm" field="ManagerUserID" />
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-l" style="text-align: center">费用明细</td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:Table ID="newtable" runat="server" Width="100%"></asp:Table>
        </td>
    </tr>
    <tr>
        <td class="td-l">总计金额（元）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbExpenseMoney" runat="server" class="kpms-textbox-money" Width="185" req="1" value="0"
                readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="ExpenseMoney" Activestatus="(23.填写申请)(3.修改)">
            </zhongsoft:XHtmlInputText>
            <input runat="server" type="hidden" id="hiOldExpenseMoney" tablename="FM_Manage_OtherExpenseForm" field="OldExpenseMoney" />
        </td>
        <td class="td-l">总计金额（大写）</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtExpenseMoneyUpper" runat="server" class="kpms-textbox" Width="85"
                readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="ExpenseMoneyUpper" Activestatus="(23.填写申请)(3.修改)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                EnableTheming="false" maxtext="512" tablename="FM_Manage_OtherExpenseForm" field="Remark"
                ActiveStatus="(23.填写申请)(3.修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">事由<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"  req="1"
                EnableTheming="false" maxtext="512" tablename="FM_Manage_OtherExpenseForm" field="Reason"
                ActiveStatus="(23.填写申请)(3.修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <table style="width: 100%;">
                <tr>
                    <td class="td-l">是否冲抵借款<span class="req-star">*</span></td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rbtIsBorrow" runat="server" RepeatDirection="Horizontal" req="1" TableName="FM_Manage_OtherExpenseForm" Field="IsBorrow" Activestatus="(23.填写申请)(3.修改)" />
                        <input type="hidden" runat="server" id="hiIsBorrowText" field="IsBorrowText" tablename="FM_Manage_OtherExpenseForm" />
                    </td>
                    <td class="td-l" id="jiekuanTD1">借款单编号</td>
                    <td class="td-r" id="jiekuanTD2">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsBorrowNo" field="BorrowNo"
                            tablename="FM_Manage_OtherExpenseForm" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            PageWidth="750" PageHeight="650" SelectPageMode="Dialog" DoCancel="true" activestatus="(23.填写申请)(3.修改)"
                            Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="BorrowNo" FilterFunction="filterApplyUser()"
                            ResultForControls="{'hiBorrowMoneyFormId':'id','txtBorrowMoney':'BorrowMoney','txtSumBackMoney':'SumBackMoney','txtNoBackMoney':'NoPayMoney'}" PageUrl="~/FM/Obsolete/BorrowMoneySelector.aspx"></zhongsoft:LightObjectSelector>
                        <input type="hidden" id="hiBorrowMoneyFormId" runat="server" tablename="FM_Manage_OtherExpenseForm" field="BorrowMoneyFormId" />
                    </td>
                    <td class="td-l" id="bchkTD1">借款金额（元）</td>
                    <td class="td-r" id="bchkTD2">
                        <zhongsoft:XHtmlInputText ID="txtBorrowMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(3.修改)"
                            readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="BorrowMoney" />
                    </td>
                </tr>
                <tr id="borrwTR">
                    <td class="td-l" id="sbmTD1">累计已还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSumBackMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(3.修改)"
                            readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="SumBackMoney" />
                    </td>
                    <td class="td-l" id="nbmTD1">剩余未还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtNoBackMoney" runat="server" class="kpms-textbox" Activestatus="(23.填写申请)(3.修改)"
                            readonly="readonly" TableName="FM_Manage_OtherExpenseForm" Field="NoBackMoney" />
                    </td>
                    <td class="td-l" id="bmTD1">本次还款（元）</td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="txtBackMoney" class="kpms-textbox" activestatus="(23.填写申请)(3.修改)" errmsg="【 本次还款（元）】请输入数字，可保留2位小数！"
                            regex="^(([1-9]{1}\d*)|([0]{1}))(\.(\d){0,2})?$" field="BackMoney" tablename="FM_Manage_OtherExpenseForm" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" id="hiOtherExpenseFormId" runat="server" tablename="FM_Manage_OtherExpenseForm" field="OtherExpenseFormId" />
<input type="hidden" id="hiFlag" runat="server" tablename="FM_Manage_OtherExpenseForm" field="Flag" />
<input type="hidden" id="hiIsAccounting" runat="server" tablename="FM_Manage_OtherExpenseForm" field="IsAccounting" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#tr1").hide();
        $("#tr2").hide();
        SetIsShow();
        $("#ctl10_lbsBorrowNo_btn").hide();
        $("#<%=txtBorrowMoney.ClientID %>").hide();
        $("#<%=txtBackMoney.ClientID %>").hide();
        $("#borrwTR").hide();
        $("#jiekuanTD1").hide();
        $("#bchkTD1").hide();
        $("#jiekuanTD2").hide();
        $("#bchkTD2").hide();
        SetIsBorrowShow();
        convertToCHNMoney("<%=tbExpenseMoney.ClientID %>", "<%=txtExpenseMoneyUpper.ClientID %>");
        //会计办理：act_8952
        if ($actCurrId == "act_8952") {
            $("#<%=newtable.ClientID%> input").each(function (i, v) {
                //0:未锁定，1：已锁定
                if ($(v).next("span").html() == "0" || $(v).next("span").html()=="" ||$(v).next("span").html()==null) {
                    $(v).attr("style", "BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red");
                }
                else if ($(v).next("span").html() == "1") {
                    $(v).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black');
                }
            });
            //保存原总计金额
            if ($("#<%=hiOldExpenseMoney.ClientID%>").val() == "") {
                var sumValue = 0;
                $("#<%=newtable.ClientID%> input").each(function () {
                    sumValue += floatParse($(this).val());
                });
                $("#<%=hiOldExpenseMoney.ClientID%>").val(sumValue)
            }
        }
        //修改：act_25022
        if ($actCurrId == "act_25022") {
            $("#<%=newtable.ClientID%> input").each(function (i, v) {
                //0:未锁定，1：已锁定
                if ($(v).next("span").html() == "0" || $(v).next("span").html() == "" ||$(v).next("span").html() == null) {
                    $(v).removeAttr("readonly")
                    $(v).attr("onblur", 'autoComputeTotalMoney()')
                    $(v).attr("style", "color:red");
                }

            });
        }
        ///流程走过会计办理环节后,未锁定的费用显示红色; 修改：act_25022
        if (<%=getKuaiJiBanLi()%>> 0 && $actCurrId != "act_25022") {

             $("#<%=newtable.ClientID%> input").each(function (i, v) {
                //0:未锁定，1：已锁定
                if ($(v).next("span").html() == "0" || $(v).next("span").html()=="" ||$(v).next("span").html()==null) {
                    $(v).attr("style", "BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red");
                }
                else if ($(v).next("span").html() == "1") {
                    $(v).attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black');
                }
            });

        }
    }

    $("#<%=rblIsProject.ClientID%>").live("change", function () {
        SetIsShow();
    });

    function SetIsShow() {
        var value = $('#<%=rblIsProject.ClientID %>').find("input:checked").val();
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#<%=txtProjectCode.ClientID%>").attr("req", "1");
            $("#<%=txtManagerUserName.ClientID%>").attr("req", "1");
            $("#tdProjectName").html("项目名称<span class='req-star'>*</span >");
            $("#tdProjectCode").html("项目编号<span class='req-star'>*</span >");
            $("#tdManagerUserName").html("项目经理/执行经理<span class='req-star'>*</span >");
            $("#tr1").show();
            $("#tr2").show();
        }
        else {
            $("#<%=txtProjectName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectCode.ClientID%>").removeAttr("req");
            $("#<%=txtManagerUserName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectName.ClientID%>").val("");
            $("#<%=hiOrganizationID.ClientID%>").val("");
            $("#<%=txtProjectCode.ClientID%>").val("");
            $("#<%=hiManagerUserID.ClientID%>").val("");
            $("#<%=txtManagerUserName.ClientID%>").val("");
            $("#tr1").hide();
            $("#tr2").hide();
        }
    }

    $("#<%=rbtIsBorrow.ClientID%>").live("change", function () {
        SetIsBorrowShow();
    });

    function SetIsBorrowShow() {
        var isBorrow = $("#<%=rbtIsBorrow.ClientID %>").find("input[type='radio']:checked").val();
        if (isBorrow == "0") {
            //借款信息            
            $("#<%=lbsBorrowNo.ClientID %>").hide();
            $("#ctl10_lbsBorrowNo_btn").hide();
            $("#<%=txtBorrowMoney.ClientID %>").hide();
            $("#<%=txtBackMoney.ClientID %>").hide();
            $("#<%=txtSumBackMoney.ClientID %>").removeAttr("req");
            $("#<%=txtNoBackMoney.ClientID %>").removeAttr("req");
            $("#<%=txtBackMoney.ClientID %>").removeAttr("req");
            $("#borrwTR").hide();
            $("#jiekuanTD1").hide();
            $("#bchkTD1").hide();
            $("#jiekuanTD2").hide();
            $("#bchkTD2").hide();
        } else {
            $("#<%=lbsBorrowNo.ClientID %>").show();
            $("#ctl10_lbsBorrowNo_btn").show();
            $("#<%=txtBorrowMoney.ClientID %>").show();
            $("#<%=txtBackMoney.ClientID %>").show();
            $("#<%=txtSumBackMoney.ClientID %>").attr("req", "1");
            $("#<%=txtNoBackMoney.ClientID %>").attr("req", "1");
            $("#<%=txtBackMoney.ClientID %>").attr("req", "1");
            $("#sbmTD1").html("累计已还款（元）<span class='req-star'>*</span >");
            $("#nbmTD1").html("剩余未还款（元）<span class='req-star'>*</span >");
            $("#bmTD1").html("本次还款（元）<span class='req-star'>*</span >");
            $("#borrwTR").show();
            $("#jiekuanTD1").show();
            $("#bchkTD1").show();
            $("#jiekuanTD2").show();
            $("#bchkTD2").show();
        }
    }

    function autoComputeTotalMoney() {
        var sumValue = 0;
        $("#<%=newtable.ClientID%> input").each(function () {
            sumValue += floatParse($(this).val());
        });
        $("#<%=tbExpenseMoney.ClientID%>").val(sumValue);
        convertToCHNMoney("<%=tbExpenseMoney.ClientID %>", "<%=txtExpenseMoneyUpper.ClientID %>");

    }
    function filterApplyUser() {
        var ApplyUserID = $('#<%=hiApplyUserID.ClientID %>').val();
        return "{'ApplyUserID':'" + ApplyUserID + "'}";
    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            if ($formAction == 0) {
                var sumValue = 0;
                $("#<%=newtable.ClientID%> input").each(function () {
                    sumValue += floatParse($(this).val());
                });
                if (sumValue == 0) {
                    alert("- 费用明细中必须填写一个类别的金额！");
                    return false;
                }
                var isBorrow = $("#<%=rbtIsBorrow.ClientID %>").find("input[type='radio']:checked").val();
                if (isBorrow == "1") {
                    var backmoney = $('#<%=txtBackMoney.ClientID %>').val();
                    var nobackmoney = $('#<%=txtNoBackMoney.ClientID %>').val();
                    if (backmoney != "" && nobackmoney != "") {
                        if (floatParse(backmoney) > floatParse(nobackmoney)) {
                            alert("-【 本次还款（元）】不能大于【 剩余未还款（元）】！");
                            return false;
                        }
                    }
                }

            }
            saveCostType();
            return true;
        }
    }

    function saveCostType() {
        var bizId = $("#<%=hiOtherExpenseFormId.ClientID%>").val();
        var param = { asyfunc: "saveCostType", businessId: bizId }
        var data = "";
        $("#<%=newtable.ClientID%> input").each(function (i, v) {
            data += this.id + "!" + this.name + "!" + $(v).val() + "!" + $(v).next("span").html() + "|";
        });
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
    //设置锁定状态
    function lock(e) {
        if (e.innerText == "锁定" && ($(e).prev("span").html() == "0" || $(e).prev("span").html() == null ||$(e).prev("span").html()=="")) {
            e.innerText = "取消锁定"
            $(e).prev("span").html("1")//已锁定
            $(e).prev().prev("input").attr("style", 'BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:black');
        }
        else if (e.innerText == "取消锁定" && $(e).prev("span").html() == "1") {
            e.innerText = "锁定"
            $(e).prev("span").html("0")//未锁定
            $(e).prev().prev("input").attr("style", "BORDER-TOP:medium none;BORDER-RIGHT:medium none;BACKGROUND:#ffffff;BORDER-BOTTOM:medium none;BORDER-LEFT:medium none;color:red");
        }

        var param = { asyfunc: "updateIsLock" }
        var data = $(e).prev("span").attr("id") + "|" + $(e).prev("span").html();
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
