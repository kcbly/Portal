<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_CarUseApplyRegForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Car.WF_CarUseApplyRegForm" %>
<%@ Register Src="~/KMS/UI/Controls/UCCarUseApplyRegFormDetail.ascx" TagName="UCCarUseApplyFormDetail" TagPrefix="uc1" %>
<div class="form-content" id="partappCar">
    <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('divPartappCar')">
        <span>
            <img src="../../themes/images/ico_banliyijian.gif" />申请情况</span> <a class="rimg">
                <img src="../../themes/images/lright.png" /></a>
    </div>
    <div class="form-content-b" id="divPartappCar" width="100%">
        <table class="tz-table">
            <tr>
                <td class="td-l">申请人<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="KMS_Car_CarUseApplyForm"
                        ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                        IsMutiple="false" ResultForControls="{'hiApplyUserId':'id','txtApplyDeptName':'DEPTNAME','hiApplyDeptId':'DEPTID','txtContact':'MobilePhone'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="KMS_Car_CarUseApplyForm" />
                </td>
                <td class="td-l">申请部门<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtApplyDeptName" tablename="KMS_Car_CarUseApplyForm" field="ApplyDeptName" activestatus="(23.填写申请)"
                        class="kpms-textbox" runat="server" readonly="readonly" req="1" />
                    <input type="hidden" runat="server" id="hiApplyDeptId" field="ApplyDeptId" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
            <tr>
                <td class="td-l">申请日期<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Car_CarUseApplyForm" Field="ApplyDate" ActiveStatus="(23.填写申请)" req="1"
                        class="kpms-textbox-date" runat="server" readonly="readonly" />
                </td>
                <td class="td-l">需电话通知<span class="req-star">*</span></td>
                <td class="td-r">
                    <asp:RadioButtonList ID="rbtIsNotice" runat="server" RepeatDirection="Horizontal" needcontrol="true" req="1"
                        tablename="KMS_Car_CarUseApplyForm" field="IsNotice" activestatus="(23.填写申请)">
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiIsNoticeText" field="IsNoticeText" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
            <tr>
                <td class="td-l" id="Target">联系方式</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtContact" TableName="KMS_Car_CarUseApplyForm" Field="Contact" runat="server"
                        ActiveStatus="(23.填写申请)" Width="40%" />
                </td>
            </tr>
            <tr>
                <td class="td-l">出车性质<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlDriveOutNature" runat="server" field="DriveOutNature" Style="width: 90px;" req="1"
                        tablename="KMS_Car_CarUseApplyForm" activestatus="(23.填写申请)">
                    </zhongsoft:LightDropDownList>
                    <input type="hidden" runat="server" id="hiDriveOutNatureText" field="DriveOutNatureText" tablename="KMS_Car_CarUseApplyForm" />
                </td>
                <td class="td-l">申请用车类型<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlApplyCarType" runat="server" field="ApplyCarType" Style="width: 90px;" req="1"
                        tablename="KMS_Car_CarUseApplyForm" activestatus="(23.填写申请)">
                    </zhongsoft:LightDropDownList>
                    <input type="hidden" runat="server" id="hiApplyCarTypeText" field="ApplyCarTypeText" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
            <tr>
                <td class="td-l">预计用车时间（起）<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText class="kpms-textbox-wholedate" ID="txtUseCarStartDate" runat="server" tablename="KMS_Car_CarUseApplyForm" field="UseCarStartDate" req="1"
                        readonly="readonly" compare="1" activestatus="(23.填写申请)" />
                </td>
                <td class="td-l">预计用车时间（止）<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText class="kpms-textbox-wholedate" ID="txtUseCarEndDate" runat="server" tablename="KMS_Car_CarUseApplyForm" field="UseCarEndDate" req="1"
                        readonly="readonly" compare="1" activestatus="(23.填写申请)" />
                </td>
            </tr>
            <tr>
                <td class="td-l">用车人数<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtUseCarNumber" TableName="KMS_Car_CarUseApplyForm" Field="UseCarNumber" runat="server"
                        ActiveStatus="(23.填写申请)" Width="70px" regex="^[0-9]\d*$" errmsg="必须是整正数" req="1" CssClass="kpms-textbox-money" EnableTheming="false" />
                </td>
                <td class="td-l">是否项目用车<span class="req-star">*</span></td>
                <td class="td-r">
                    <asp:RadioButtonList ID="rbtIsProjectUse" runat="server" RepeatDirection="Horizontal" needcontrol="true" req="1" disabled="disabled"
                        tablename="KMS_Car_CarUseApplyForm" field="IsProjectUse" activestatus="(23.填写申请)">
                    </asp:RadioButtonList>
                    <input type="hidden" runat="server" id="hiIsProjectUseText" field="IsProjectUseText" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
            <tr id="mark">
                <td class="td-l">项目编号</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtProjectCode" TableName="KMS_Car_CarUseApplyForm" Field="ProjectCode" runat="server"
                        ActiveStatus="(23.填写申请)" Width="70%" />
                </td>
                <td class="td-l" id="Target2">项目名称</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtProjectName" TableName="KMS_Car_CarUseApplyForm" Field="ProjectName" runat="server"
                        ActiveStatus="(23.填写申请)" Width="70%" />
                </td>
            </tr>
            <tr>
                <td class="td-l">目的地<span class="req-star">*</span></td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtDestination" TableName="KMS_Car_CarUseApplyForm" Field="Destination" ActiveStatus="(23.填写申请)"
                        runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" /></td>
            </tr>
            <tr>
                <td class="td-l">运输任务说明<span class="req-star">*</span></td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtJobDescription" TableName="KMS_Car_CarUseApplyForm" Field="JobDescription" ActiveStatus="(23.填写申请)"
                        runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" /></td>
            </tr>
            <tr>
                <td class="td-l">备注</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_CarUseApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                        runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
            </tr>

        </table>
    </div>
</div>
<div class="form-content" id="partOpinion">
    <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('historyOpinion')">
        <span>
            <img src="../../themes/images/ico_banliyijian.gif" />派车计划</span> <a class="rimg">
                <img src="../../themes/images/lright.png" /></a>
    </div>
    <div class="form-content-b" id="historyOpinion" width="100%">
        <table class="tz-table" style="display: none">
            <tr>
                <td class="td-l">实际用车情况<span class="req-star">*</span></td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightDropDownList ID="ddlUseInfo" runat="server" field="UseInfo" Width="170"
                        tablename="KMS_Car_CarUseApplyForm" activestatus="(23.填写申请)">
                    </zhongsoft:LightDropDownList>
                    <input type="hidden" runat="server" id="hiUseInfo" field="UseInfoText" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
        </table>
        <table class="tz-table" runat="server" id="PartUseCar1">
            <tr class="tag">
                <td class="td-l">车牌号<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtCarNumber" Writeable="false" OnClick="txtCarNumber_Click"
                        SelectPageMode="Dialog" activestatus="(23.填写申请)" Field="CarNumber" FilterFunction="checkSelectFilter()" req="1"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                        ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                        IsMutiple="false" ResultForControls="{'hiCarInfoId':'id','txtSendCarTypeText':'CarTypeText','hiSendCarType':'CarType','txtCarBrand':'CarBrand','hdnDriverName':'DriverName','txtDriverName':'DriverName','hiDriverId':'DriverInfoId','txtDriverPhone':'Phone','txtLicenseLevel':'LicenseLevel'}" PageUrl="~/KMS/Obsolete/CarSelector.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiCarInfoId" field="CarInfoId" tablename="KMS_Car_CarUseApplyForm" />
                </td>
                <td class="td-l">拟派车类型</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtSendCarTypeText" TableName="KMS_Car_CarUseApplyForm" Field="SendCarTypeText" runat="server"
                        ActiveStatus="(23.填写申请)" Width="40%" />
                    <%--  <zhongsoft:LightDropDownList ID="ddlSendCarType" runat="server" field="SendCarType" Style="width: 90px;" req="1"
                        tablename="KMS_Car_CarUseApplyForm" activestatus="(23.制定派车计划)">
                    </zhongsoft:LightDropDownList>--%>
                    <input type="hidden" runat="server" id="hiSendCarType" field="SendCarType" tablename="KMS_Car_CarUseApplyForm" />
                </td>
            </tr>
            <tr>
                <td class="td-l">车辆品牌</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtCarBrand" TableName="KMS_Car_CarUseApplyForm" Field="CarBrand" runat="server"
                        ActiveStatus="(23.填写申请)" Width="40%" />
                </td>
            </tr>
            <tr class="tag">
                <td class="td-l">司机姓名<span class="req-star">*</span></td>
                <td class="td-r" style="width: 345px;">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtDriverName" Writeable="false" FilterFunction="checkSelectFilter()" req="1" PageHeight="650px" 
                        SelectPageMode="Dialog" activestatus="(23.填写申请)"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                        ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                        IsMutiple="false" ResultForControls="{'hiDriverId':'id','txtDriverPhone':'Phone','txtLicenseLevel':'LicenseLevelText','hdnDriverName':'name'}" PageUrl="~/KMS/Obsolete/DriverSelector.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hdnDriverName" field="DriverName" tablename="KMS_Car_CarUseApplyForm" />
                    <input type="hidden" runat="server" id="hiDriverId" field="DriverId" tablename="KMS_Car_CarUseApplyForm" />
                </td>
                <td class="td-l">司机联系电话</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtDriverPhone" TableName="KMS_Car_CarUseApplyForm" Field="DriverPhone" ActiveStatus="(23.填写申请)" runat="server" Width="180px" />
                </td>
            </tr>
            <tr>
                <td class="td-l">驾驶证类型</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtLicenseLevel" TableName="KMS_Car_CarUseApplyForm" Field="LicenseLevel" runat="server"
                        ActiveStatus="(23.填写申请)" Width="40%" />
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="form-content" id="partUseCar">
    <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('divPartUseCar')">
        <span>
            <img src="../../themes/images/ico_banliyijian.gif" />用车情况</span> <a class="rimg">
                <img src="../../themes/images/lright.png" /></a>
    </div>
    <div class="form-content-b" id="divPartUseCar" width="100%">
        <table class="tz-table" runat="server" id="PartUseCar2">
            <tr>
                <td class="td-l">出发地<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtStartAddr" TableName="KMS_Car_CarUseApplyForm" Field="StartAddr" req="1" ActiveStatus="(23.填写申请)" runat="server" Width="180px" />
                </td>
                <td class="td-l">目的地<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtEndAddr" TableName="KMS_Car_CarUseApplyForm" Field="EndAddr" req="1" ActiveStatus="(23.填写申请)" runat="server" Width="180px" />
                </td>

            </tr>
            <tr>
                <td class="td-l">用车实际开始时间<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText class="kpms-textbox-wholedate" ID="txtFactStartDate" runat="server" tablename="KMS_Car_CarUseApplyForm" field="FactStartDate" req="1"
                        readonly="readonly" compare="2" activestatus="(23.填写申请)" />
                </td>
                <td class="td-l">用车实际结束时间<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText class="kpms-textbox-wholedate" ID="txtFactEndDate" runat="server" tablename="KMS_Car_CarUseApplyForm" field="FactEndDate" req="1"
                        readonly="readonly" compare="2" activestatus="(23.填写申请)" />
                </td>

            </tr>
            <tr>

                <td class="td-l">用车起始公里数 </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtFactStartKm" TableName="KMS_Car_CarUseApplyForm" Field="FactStartKm" DataType="Decimal2" ActiveStatus="(23.填写申请)" runat="server" Width="180px" onblur="autoComputeFactOdograph()" />
                </td>
                <td class="td-l">用车终止公里数</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtFactEndKm" TableName="KMS_Car_CarUseApplyForm" Field="FactEndKm" DataType="Decimal2" ActiveStatus="(23.填写申请)" runat="server" Width="180px" onblur="autoComputeFactOdograph()" />
                </td>
            </tr>
            <tr>
                <td class="td-l">总人数<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtSumPeopleNum" Field="SumPeopleNum" activestatus="(23.填写申请)" style="width: 100px;"
                        class="kpms-textbox" runat="server" readonly="readonly" TableName="KMS_Car_CarUseApplyForm" />
                </td>
                <td class="td-l">实际里程<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="txtFactOdograph" TableName="KMS_Car_CarUseApplyForm" Field="FactOdograph" req="1" DataType="Decimal2" ActiveStatus="(23.填写申请)" runat="server" Width="180px" onblur="autoComputeTotalMoney()" />
                </td>

            </tr>
            <tr>
                <td class="td-l">计费标准（元/公里）<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtCollectFeesKm" Field="CollectFeesKm" activestatus="(23.填写申请)" style="width: 100px;"
                        class="kpms-textbox" runat="server" readonly="readonly" TableName="KMS_Car_CarUseApplyForm" />

                </td>
                <td class="td-l">收费金额<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtFactCost" Field="FactCost" activestatus="(23.填写申请)" style="width: 100px;"
                        class="kpms-textbox" runat="server" readonly="readonly" TableName="KMS_Car_CarUseApplyForm" />
                </td>

            </tr>
            <tr>
                <td colspan="4" class="td-l">
                    <uc1:UCCarUseApplyFormDetail ID="UCCarUseApplyFormDetail" runat="server" />
                </td>
            </tr>

        </table>
    </div>
</div>

<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_CarUseApplyForm" field="CarUseApplyFormId" />
<input type="hidden" runat="server" id="hiApplyRole" tablename="KMS_Car_CarUseApplyForm" field="ApplyRole" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        $("#mark").hide();
        SetAttr();
        SetAttr2();
        autoComputeRate();
    }

    //需电话通知选择 "是" 时,联系方式必填
    $("#<%=rbtIsNotice.ClientID%>").live("change", function () {

        SetAttr();
    });

    function SetAttr() {
        var value = $('#<%=rbtIsNotice.ClientID %>').find("input:checked").val();
        $("#<%=txtContact.ClientID%>").removeAttr("req");
        $("#Target").html("联系方式");
        if (value == "1") {
            $("#<%=txtContact.ClientID%>").attr("req", "1");
            $("#Target").html("联系方式" + "<span class='req-star'>*</span >");
        }
    }
    SetAttr2();

    //是否项目用车"是" 时,项目名称必填
    $("#<%=rbtIsProjectUse.ClientID%>").live("change", function () {
        $("#<%=txtProjectName.ClientID%>").val("")
        SetAttr2();
    });

    function SetAttr2() {
        var value = $('#<%=rbtIsProjectUse.ClientID %>').find("input:checked").val();
        $("#<%=txtProjectName.ClientID%>").removeAttr("req");
        $("#mark").hide();
        $("#Target2").html("项目名称")
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#mark").show();
            $("#Target2").html("项目名称" + "<span class='req-star'>*</span >");
        }
    }


    function checkForm() {
        //比较预计用车时间
        var startTime = $("#<%=txtUseCarStartDate.ClientID%>").val();
        var endTime = $("#<%=txtUseCarEndDate.ClientID%>").val();
        if (startTime != '' && endTime != '') {
            var begin = startTime.replace('-', '/');
            var end = endTime.replace('-', '/');
            if (Date.parse(begin) > Date.parse(end)) {
                alert("预计用车时间（止）不能小于预计用车时间（起）！");
                return false;
            }
            else {
                return true;
            }
        }
        return true;

    }

    //当前为不同类型时更改必填
    function accessOfSelectType(type) {

        var selectVale = $("#<%=ddlUseInfo.ClientID %> option:selected").val();
        if (type == 0) {
            selectVale = $("#<%=hiUseInfo.ClientID %>").val();
        }
        if (selectVale == "1" || selectVale == "用车") {
            $("#ctl10_PartUseCar1").show();
            $("#ctl10_PartUseCar2").show();
            $("#<%=txtCarNumber.ClientID%>").attr("req", "1");
            $("#<%=txtDriverName.ClientID%>").attr("req", "1");
        } else {
            $("#ctl10_PartUseCar1").hide();
            $("#ctl10_PartUseCar2").hide();
            $("#<%=txtCarNumber.ClientID%>").removeAttr("req");
            $("#<%=txtDriverName.ClientID%>").removeAttr("req");
        }

    }

    //选择车辆或者司机过滤
    function checkSelectFilter() {
        var buzId = '<%=BusinessObjectId%>';
        return "{IsBusyId:'" + buzId + "','DeptId':'" + $("#<%=hiApplyDeptId.ClientID%>").val() + "'}";
    }
    function autoComputeFactOdograph() {
        var factStartKm = $("#<%=txtFactStartKm.ClientID%>").val();
        var factEndKm = $("#<%=txtFactEndKm.ClientID%>").val();
        if (factStartKm != "" && factEndKm != "")
            $("#<%=txtFactOdograph.ClientID%>").val(accSub(factEndKm, factStartKm));
        autoComputeTotalMoney();
        autoComputeRateShareKM();
        autoComputeRate();

    }
    function autoComputeTotalMoney() {
        var factOdograph = $("#<%=txtFactOdograph.ClientID%>").val();
        var price = $("#<%=txtCollectFeesKm.ClientID%>").val();
        $("#<%=txtFactCost.ClientID%>").val(accMulLeaveNum(floatParse(factOdograph), floatParse(price), 2));
        autoComputeRate();//计算列表值
    }
    SetDefaultUserCar();
    //处理用车申请默认值
    function SetDefaultUserCar() {
        $("#<%=rbtIsProjectUse.ClientID %>").find("input[type='radio']").each(function () {
            $(this).attr("disabled","disabled");
        });
        if ("<%=ActionType %>" == "Create") {
            $("#<%=rbtIsProjectUse.ClientID %>").find("input[type='radio']").each(function () {
                if ($(this).val() == "0") {
                    $(this).attr("checked", "checked");
                }

            });
        }
    }
</script>
