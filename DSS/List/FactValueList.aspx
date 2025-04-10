<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FactValueList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.FactValueList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register TagPrefix="uc1" TagName="FactValueInfo" Src="../UI/FactValueInfo.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <div style="min-width: 1000px; _width: 1000px;" class="tz-toolbar">
        <table class="kpms-seniorsearchtable">
            <tr>
                <td>
                    <span class="filter-block"><span class="filter-block-lb">年份</span><span>
                        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" />
                    </span></span><span class="filter-block"><span class="filter-block-lb">月份</span><span>
                        <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" />
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
            <tr id="trFinancial" runat="server" style="display: none">
                <td>
                    <span class="filter-block"><span class="filter-block-lb">本部净流量</span><span>
                        <zhongsoft:LightTextBox ID="tbMinius" runat="server" ReadOnly="true" CssClass="kpms-textbox-money"
                            EnableTheming="false" />
                    </span></span>
                </td>
                <td>
                    <span class="filter-block"><span class="filter-block-lb">资产负债率（%）</span><span>
                        <zhongsoft:LightTextBox ID="tbAssetsDebtRate" runat="server" regex="^([1-9]\d{0,8}|[0])(\.\d{1,2})?$"
                            errmsg="请输入非负数，最多8位整数，2位小数" CssClass="kpms-textbox-money" EnableTheming="false" />
                    </span></span>
                </td>
            </tr>
        </table>
    </div>
    <uc1:FactValueInfo ID="FactValueInfo1" runat="server" />
    <uc1:FactValueInfo ID="FactValueInfo2" runat="server" />
    <uc1:FactValueInfo ID="FactValueInfo3" runat="server" />
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
            if("<%=FactValueType %>"=="4"){            
                $("#<%=trFinancial.ClientID %>").show();
            }
            else{
                $("#<%=trFinancial.ClientID %>").hide();
            }

            //自动计算合计值
            if (typeof (initFactValuePlugin<%=FactValueInfo1.ClientID %>) == 'function') {
                initFactValuePlugin<%=FactValueInfo1.ClientID %>();
            }
            if (typeof (initFactValuePlugin<%=FactValueInfo2.ClientID %>) == 'function') {
                initFactValuePlugin<%=FactValueInfo2.ClientID %>();
            }
            if (typeof (initFactValuePlugin<%=FactValueInfo3.ClientID %>) == 'function') {
                initFactValuePlugin<%=FactValueInfo3.ClientID %>();
            }

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
        }

        //保存之前确认选择年份
        function checkSave() {
            if ($("#<%=ddlYear.ClientID %>").val() == "") {
                alert("请选择年份！");
                return false;
            }
            if ($("#<%=ddlMonth.ClientID %>").val() == "") {
                alert("请选择月份！");
                return false;
            }
            return true;
        }

        //自动计算合计值
        function autoCompleteValue(gvDetail) {
            var $array = $("#" + gvDetail).find("[id$=tbValue]");
            var sumValue = 0;
            for (i = 0; i < $array.length; i++) {
                var thisValue = $($array[i]).val();
                thisValue = floatParse(thisValue);
                thisValue = accMulLeaveNum(thisValue, 10000, 2);
                sumValue = accAddFloat6(thisValue, sumValue);
            }
            var lbSum = $("#" + gvDetail).find("[id$=lbSum]");
            lbSum.text(accDivLeaveNum(sumValue, 10000, 6));
            
            //自动计算差额=流出-流入      
            if("<%=FactValueType %>"=="4"){            
                var lbSum1 = $("#" +"<%=FactValueInfo1.ClientID %>"+ "_gvList").find("[id$=lbSum]").text();            
                lbSum1 = floatParse(lbSum1);
                lbSum1 = accMulLeaveNum(lbSum1, 10000, 2);
                var lbSum2 = $("#" +"<%=FactValueInfo2.ClientID %>"+ "_gvList").find("[id$=lbSum]").text();          
                lbSum2 = floatParse(lbSum2);
                lbSum2 = accMulLeaveNum(lbSum2, 10000, 2);
                lbSum2=accAddFloat6(lbSum1, -lbSum2);
                $("#<%=tbMinius.ClientID %>").val(accDivLeaveNum(lbSum2, 10000, 6));
            }
        }
    </script>
</asp:Content>
