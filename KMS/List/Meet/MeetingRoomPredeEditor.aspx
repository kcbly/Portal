<%@ Page Title="会议室预定编辑页" Language="C#" AutoEventWireup="true" CodeBehind="MeetingRoomPredeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomPredeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="ltbOverMeeting" OnClick="ltbOverMeeting_Click" runat="server" OnClientClick="return saveData();" CssClass="btn-function2" EnableTheming="false">
        <span>
            <img src="../../../Themes/custom/Images/btn/toolbar_pic/btn_f_send.png" alt="结束会议" /><br />结束会议</span>
    </asp:LinkButton>
    <asp:LinkButton ID="ltbCancelMeeting" OnClick="ltbCancelMeeting_Click" runat="server" CssClass="btn-function2" EnableTheming="false">
        <span>
            <img src="../../../Themes/custom/Images/btn/toolbar_pic/btn_f_send.png" alt="取消会议" /><br />取消会议</span>
    </asp:LinkButton>
    <asp:LinkButton ID="ltbChangeMeeting" OnClick="ltbChangeMeeting_Click" OnClientClick="return checkData();" runat="server" CssClass="btn-function2" EnableTheming="false">
        <span>
            <img src="../../../Themes/custom/Images/btn/toolbar_pic/btn_f_save.png" alt="修改" /><br />修改</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">会议名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="txtMeetingName" tablename="KMS_Meet_MeetingRoomApply" field="MeetingName" activestatus="(23.*)" runat="server" MaxLength="64" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">会议时间<span class="req-star">*</span>
            </td>
            <td class="td-m" nowrap="nowrap">
                <!-- 会议时间几个控件不要换行-->
                <zhongsoft:XHtmlInputText type="text" runat="server" activestatus="(23.*)" req="1" onchange="UpdateDateTime('1');"
                    readonly="readonly" class="kpms-textbox-date" ID="txtMeetStartDate" />
                <zhongsoft:LightDropDownList ID="ddlStartHour" activestatus="(23.*)" runat="server" req="1"
                    onchange="UpdateDateTime('1');" Width="45px">
                </zhongsoft:LightDropDownList>
                :
                <zhongsoft:LightTextBox runat="server" ID="tbStartMini" activestatus="(23.*)" Text="00" onblur="UpdateDateTime('1');"
                    Width="20px" MaxLength="2" regex="^\d+$" errmsg="请正确填写分钟">
                </zhongsoft:LightTextBox>
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" activestatus="(23.*)" req="1" onchange="UpdateDateTime('1');"
                    readonly="readonly" class="kpms-textbox-date" ID="txtMeetEndDate" />
                <zhongsoft:LightDropDownList ID="ddlEndHour" activestatus="(23.*)" runat="server" req="1" Width="45px" onchange="UpdateDateTime('1');">
                </zhongsoft:LightDropDownList>
                :
                <zhongsoft:LightTextBox runat="server" ID="tbEndMini" activestatus="(23.*)" Text="00" Width="20px"
                    onblur="UpdateDateTime('1');" MaxLength="2" regex="^\d+$" errmsg="请正确填写分钟">
                </zhongsoft:LightTextBox>
            </td>

            <td class="td-l">参会人数
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox type="text" ID="txtNumOfMeetingPerson" tablename="KMS_Meet_MeetingRoomApply" regex="^[0-9]*[1-9][0-9]*$"
                    errmsg="人数应为正整数！" activestatus="(23.*)"
                    field="NumOfMeetingPerson" class="kpms-textbox-money" runat="server" MaxLength="4" />
            </td>



        </tr>
        <tr>
            <td class="td-l">会议室<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMeetingRoomDescription" tablename="KMS_Meet_MeetingRoomApply"
                    req="1" activestatus="(23.*)" field="ApplyMeetingRoomIDs" Width="40%">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiMeetingRoomDescription" tablename="KMS_Meet_MeetingRoomApply"
                    field="MeetingRoomDescription" />
            </td>
            <td class="td-l">主持人
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="ltbHostUserName" IsMutiple="false" PageHeight="650px"
                    ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultForControls="{ 'hiHostUserID':'id'}" ShowJsonRowColName="true"
                    ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="../../../Sys/OrgUsers/UserSelectorJson.aspx"
                    field="HostUserName"
                    DoCancel="false" tablename="KMS_Meet_MeetingRoomApply"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiHostUserID" runat="server" field="HostUserID"
                    tablename="KMS_Meet_MeetingRoomApply" />
            </td>
        </tr>
        <tr>
            <td class="td-l">申请人<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector ID="lbsApplyUserName" runat="server" activestatus="(23.*)" PageHeight="650px"
                    TableName="KMS_Meet_MeetingRoomApply" Field="ApplyUserName" class="kpms-textbox" IsMutiple="false"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ResultForControls="{'hiApplyManID':'id','tbApplyManCode':'code','tbApplyDeptName':'OrgUnitName','tbApplyDeptId':'OrgUnitId','tbApplyManLinkPhone':'MobilePhone','hiDealDeptID':'OrgUnitId'}" SelectPageMode="Dialog" />
                <input id="tbApplyManCode" style="width: 18px; height: 22px" type="hidden" maxlength="16"
                    size="18" name="tbApplyManCode" tablename="KMS_Meet_MeetingRoomApply" field="ApplyManCode"
                    runat="server" />
                <input id="hiApplyManID" style="width: 18px; height: 22px" type="hidden" maxlength="16"
                    size="18" name="hiApplyManID" tablename="KMS_Meet_MeetingRoomApply" field="ApplyManID"
                    runat="server" />
            </td>
            <td class="td-l">申请人电话
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText type="text" ID="tbApplyManLinkPhone" tablename="KMS_Meet_MeetingRoomApply" activestatus="(23.*)"
                    style="width: 100px;" field="ApplyManLinkPhone" maxlength="16" class="kpms-textbox" readonly="readonly"
                    regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$" errmsg="请输入正确手机号码！" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">申请部门<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText type="text" ID="tbApplyDeptName" readonly="readonly" tablename="KMS_Meet_MeetingRoomApply"
                    req="1" activestatus="(23.*)" field="ApplyDeptName" maxlength="16" class="kpms-textbox"
                    runat="server" />
                <input id="tbApplyDeptId" style="width: 18px; height: 22px" type="hidden" size="17"
                    name="tbApplyDeptId" tablename="KMS_Meet_MeetingRoomApply" field="ApplyDeptId" runat="server" />
            </td>
            <td class="td-l">申请日期<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText type="text" runat="server" tablename="KMS_Meet_MeetingRoomApply" field="ApplyDate"
                    activestatus="(23.*)" req="1" readonly="readonly" class="kpms-textbox-date" ID="txtApplyDate" />
            </td>
        </tr>

        <tr style="display: none">
            <td class="td-l">会议主办部门<span class="req-star">*</span>
            </td>
            <td class="td-r">

                <zhongsoft:LightObjectSelector runat="server" ID="lbsHostDept" PageUrl="~/Sys/OrgUsers/OrgTreeSelector.aspx"
                    ResultForControls="{'hiDealDeptID':'id'}" ResultAttr="att2" ActiveStatus="(23.*)"
                    PageHeight="560" PageWidth="500" field="DealDeptName" tablename="KMS_Meet_MeetingRoomApply"
                    reqmsg="请选择主办部门" SelectPageMode="Dialog"
                    CssClass="kpms-textbox" EnableTheming="false" />
                <input id="hiDealDeptID" style="width: 18px; height: 22px" type="hidden" size="8"
                    name="hiDutyManCode" tablename="KMS_Meet_MeetingRoomApply" field="DealDeptID" runat="server" />
            </td>

            <td class="td-l"></td>
            <td></td>
        </tr>




    </table>
    <%--<input id="hiIsMeetingRoom" type="hidden" name="hiIsMeetingRoom" tablename="KMS_Meet_MeetingRoomApply"
        value="true" field="IsMeetingRoom" runat="server" />--%>
    <input id="hiStartDate" type="hidden" tablename="KMS_Meet_MeetingRoomApply" activestatus="(*.*)"
        field="MeeStartDate" runat="server" />
    <input id="hiEndDate" type="hidden" tablename="KMS_Meet_MeetingRoomApply" activestatus="(*.*)"
        field="MeetEndDate" runat="server" />
    <input id="hiIsAgree" type="hidden" tablename="KMS_Meet_MeetingRoomApply" activestatus="(*.*)"
        field="IsAgree" runat="server" value="是" />
    <input type="hidden" runat="server" id="hiDateFormatStr" value="yyyy-MM-dd HH:mm" />

    <input type="hidden" runat="server" id="hiMeetingRoomApplyId" tablename="KMS_Meet_MeetingRoomApply"
        field="MeetingRoomApplyId" />
    <input type="hidden" runat="server" id="hiStartTime" value="6" />
    <input type="hidden" runat="server" id="hiEndTime" value="22" />
    <%--add guqt 20150709--%>
    <input type="hidden" runat="server" id="hiFlag" tablename="KMS_Meet_MeetingRoomApply" field="Flag" />
    <%--<input id="hdnExt" type="hidden" tablename="KMS_Meet_MeetingRoomApply" field="Ext" runat="server" />--%>
    <input type="hidden" runat="server" id="hdnMeetingState" name="hdnMeetingState" tablename="KMS_Meet_MeetingRoomApply" field="MeetingState" />
    <input type="hidden" runat="server" id="hdnMeetingStateText" name="hdnMeetingStateText" tablename="KMS_Meet_MeetingRoomApply" field="MeetingStateText" />
    <script type="text/javascript">
        parent.returnValue = "Save";
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();

        }
         function checkData() {

            if (!checkReqField() || !CheckDate1()) {
                return false;
            }
            return true;
        }
        function UpdateDateTime(type) {
            if (type = "1") {
                var startdate = document.all("<%=txtMeetStartDate.ClientID%>").value;
                var enddate = document.all("<%=txtMeetEndDate.ClientID%>").value;
                var starthour = document.all("<%=ddlStartHour.ClientID%>").value;
                var endhour = document.all("<%=ddlEndHour.ClientID%>").value;
                var startmini = document.all("<%=tbStartMini.ClientID%>").value;
                var endmini = document.all("<%=tbEndMini.ClientID%>").value;

                if (startmini > 59) {
                    alert("请正确填写分钟");
                    $("#<%=tbStartMini.ClientID%>").val("00");
                    return false;
                }
                if (endmini > 59) {
                    alert("请正确填写分钟");
                    $("#<%=tbEndMini.ClientID%>").val("00");
                    return false;
                }

                var histartdate = document.all("<%=hiStartDate.ClientID%>");
                var hienddate = document.all("<%=hiEndDate.ClientID%>");
                histartdate.value = startdate + " " + starthour + ":" + startmini;
                hienddate.value = enddate + " " + endhour + ":" + endmini;
            }
        }


        //判断会议计划时间
        function CheckDate1(ischeck) {

            var beginDate = $('#<%=txtMeetStartDate.ClientID %>').val();
            var endDate = $('#<%=txtMeetEndDate.ClientID %>').val();
            var beginHour = $('#<%=ddlStartHour.ClientID %>').val();
            var beginMinute = $('#<%=tbStartMini.ClientID %>').val();

            if (ischeck) {
                var day, now, hour, min, year, month, nowTime;
                now = new Date();
                year = now.getFullYear();
                month = now.getMonth() + 1;
                day = now.getDate();
                hour = now.getHours();
                min = now.getMinutes();
                if (month < 10) {
                    month = "0" + month;
                }
                if (day < 10) {
                    day = "0" + day;
                }

                nowTime = year + "-" + month + "-" + day;



                var result = CompareDate(nowTime, beginDate);
                if (result == "-1") {
                    alert('会议开始时间不能小于当前时间！');
                    return false;
                }
                else if (result == "0") {
                    if (parseInt(hour) > parseInt(beginHour)) {
                        alert('会议开始时间不能小于当前时间！');
                        return false;
                    }
                    else if (parseInt(hour) == parseInt(beginHour)) {
                        if (parseInt(min) > parseInt(beginMinute)) {
                            alert('会议开始时间不能小于当前时间！');
                            return false;
                        }
                    }
                }
            }

            var resultPlan = CompareDate(beginDate, endDate);
            if (resultPlan == "-1") {
                alert('会议开始日期不能大于结束日期！');
                return false;
            }
            else if (resultPlan == "0") {

                var endHour = $('#<%=ddlEndHour.ClientID %>').val();
                if (parseInt(beginHour) > parseInt(endHour)) {
                    alert('会议开始日期等于结束日期的时，开始小时不能大于结束小时！');
                    return false;
                }
                else if (parseInt(beginHour) == parseInt(endHour)) {

                    var endMinute = $('#<%=tbEndMini.ClientID %>').val();
                    if (parseInt(beginMinute) > parseInt(endMinute)) {
                        alert('会议开始日期等于结束日期、开始小时等于结束小时的时候，开始分钟不能大于结束分钟');
                        return false;
                    }
                }
            }
            return true;
        }

        function CompareDate(beginDate, endDate) {
            if (beginDate != '' && endDate != '') {
                var begin = beginDate.replace('-', '/');
                var end = endDate.replace('-', '/');
                if (Date.parse(begin) > Date.parse(end)) {
                    return "-1";
                }
                else if (Date.parse(begin) == Date.parse(end)) {
                    return "0";
                }
                else {
                    return "1";
                }
            }
            return false;
        }

        //选择主办部门s
        function ChooseDealDept() {
            var param = new InputParamObject("s");
            var re = getOrgs("re", param, "|");
            if (re != null) {
                $("#<%=hiDealDeptID.ClientID %>").val(re.buildAttrJson("o", "id"));
            }
            return false;
        }

        //选择申请人
        function ChooseApplyUser() {
            var param = new InputParamObject("s");
            var re = getUsersNew("re", param, "");
            if (re != null) {
                $("#<%=tbApplyManCode.ClientID %>").val(re.buildAttrJson("o", "att8"));

                $('#<%=tbApplyDeptName.ClientID %>').val(re.buildAttrJson("o", "att4"));
                $('#<%=tbApplyDeptId.ClientID %>').val(re.buildAttrJson("o", "att3"));
                $('#<%=hiApplyManID.ClientID %>').val(re.buildAttrJson("o", "id"));
                $("#<%=hiDealDeptID.ClientID %>").val(re.buildAttrJson("o", "att3"));
                $("#<%=lbsHostDept.ClientID %>").val(re.buildAttrJson("o", "att4"));
            }
            return false;
        }

        function KPMSCheckSubmit() {
            var isMeetingAdmin = "<%=IsMeetingAdmin %>";
            //不是会议室管理员，则只能预订会议室，即只能选择当前时间之后的时间
            if (isMeetingAdmin == "0") {
                if (CheckDate1(true) == false) {
                    return false;
                }
            }
            //如果是会议室管理员，可以选择任何时间段
            else {
                if (CheckDate1(false) == false) {
                    return false;
                }
            }

            var startTime = $("#<%=hiStartDate.ClientID %>").val();
            var endTime = $("#<%=hiEndDate.ClientID %>").val();
            var meetIds = $("#<%=ddlMeetingRoomDescription.ClientID %>").val();
            var bizId = "<%=BusinessObjectId %>";
            var alertMsg = CheckMeetingRoom(startTime, endTime, meetIds, bizId);

            if (alertMsg != "" && alertMsg != null) {
                alert(alertMsg);
                return false;
            }

            return true;
        }

        //判断会议室是否可用
        function CheckMeetingRoom(startTime, endTime, meetId, bizId) {

            var request = null;
            try {
                request = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (ex) {
                request = null;
            }
            if (request == null) {
                try {
                    request = new XMLHttpRequest();
                }
                catch (ex) {
                    request = null;
                }
            }
            if (request == null) {
                return;
            }
            var url = 'MeetingRoomBookEditor.aspx?con=check&startTime=' + startTime + "&endTime=" + endTime + "&roomID=" + meetId + "&keyID=" + bizId;
            request.open("POST", encodeURI(url), false);

            request.send();
            var responseText = request.responseText;
            return responseText;
        }



    </script>
</asp:Content>
