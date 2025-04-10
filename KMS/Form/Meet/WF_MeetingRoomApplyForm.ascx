<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MeetingRoomApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.KMS.Form.Meet.WF_MeetingRoomApplyForm" %>
<table id="Table1" class="tz-table" style="width: 100%">
     <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
             <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Meet_MeetingRoomApply" activestatus="(23.填写申请)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">会议名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbMeetingName" Field="MeetingName" tablename="KMS_Meet_MeetingRoomApply"
                Width="98%" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" req="1" MaxLength="128" />
        </td>  
        <td class="td-l">参会人数
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbMeetingNum" Field="NumOfMeetingPerson" tableName="KMS_Meet_MeetingRoomApply"
                Style="text-align: left;" EnableTheming="false" activestatus="(23.填写申请)"
                CssClass="kpms-textbox-money" regex="^[0-9]*[1-9][0-9]*$" errmsg="参会人数应为正整数"
                runat="server" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap="nowrap">会议计划时间<span class="req-star">*</span>
        </td>
        <td class="td-m" nowrap="nowrap">
            <input type="hidden" runat="server" id="hiMeeStartDate" field="MeeStartDate" tablename="KMS_Meet_MeetingRoomApply" />
            <zhongsoft:XHtmlInputText ID="txtMeeStartDate" runat="server" ReadOnly="true" class="kpms-textbox-date" activestatus="(23.填写申请)" />
            <zhongsoft:LightTextBox ID="ltbStartDateHour" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" req="1" DataType="Integer" Width="30px" />
            <zhongsoft:LightDropDownList ID="ddlStartDateMinute" runat="server" Style="width: 60px;" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
            至
            <input type="hidden" runat="server" id="hiMeetEndDate" field="MeetEndDate" tablename="KMS_Meet_MeetingRoomApply" />
            <zhongsoft:XHtmlInputText ID="txtMeetEndDate" runat="server" ReadOnly="true" class="kpms-textbox-date" activestatus="(23.填写申请)" />
            <zhongsoft:LightTextBox ID="ltbEndDateHour" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" req="1" DataType="Integer" Width="30px" />
            <zhongsoft:LightDropDownList ID="ddlEndDateMinute" runat="server" Style="width: 60px;" activestatus="(23.填写申请)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" nowrap="nowrap">拟申请会议室<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="ltbMeetingRoomDescription" IsMutiple="false" PageHeight="650px"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写申请)(23.院办主任审核)(23.接收)" SourceMode="SelectorPage"
                ResultForControls="{ 'hiMeetingRoomID':'id'}" ShowJsonRowColName="true" BeforeSelect="checkForm()"
                ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="~/KMS/Obsolete/MeetingRoomSelector.aspx" FilterFunction="meetTime()"
                req="1" field="MeetingRoomDescription"
                DoCancel="false" tablename="KMS_Meet_MeetingRoomApply" OnClick="ltbMeetingRoomDescription_Click"></zhongsoft:LightObjectSelector>


            <input type="hidden" runat="server" id="hiMeetingRoomID" tablename="KMS_Meet_MeetingRoomApply"
                field="ApplyMeetingRoomIDs" />

        </td>
        <td class="td-l">主持人
        </td>
        <td class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="txtHostUserName" IsMutiple="false" PageHeight="650px"
                ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.填写申请)" SourceMode="SelectorPage"
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
            <zhongsoft:LightTextBox ID="txtApplyUserName" field="ApplyUserName" Width="100px"
                tablename="KMS_Meet_MeetingRoomApply" activestatus="(23.填写申请)"
                CssClass="kpms-textbox" runat="server" EnableTheming="false" MaxLength="16" req="1">
            </zhongsoft:LightTextBox>
            <input type="hidden" id="hiApplyManID" runat="server" field="ApplyManID" tablename="KMS_Meet_MeetingRoomApply" />
            <input type="hidden" runat="server" id="hiApplyManCode" field="ApplyManCode" tablename="KMS_Meet_MeetingRoomApply" />
        </td>
        <td class="td-l">申请人电话<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="txtApplyManLinkPhone" TableName="KMS_Meet_MeetingRoomApply"
                req="1" Width="100px" Field="ApplyManLinkPhone" activestatus="(23.填写申请)"
                CssClass="kpms-textbox" runat="server" EnableTheming="false" MaxLength="16">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">申请时间
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date"
                field="ApplyDate" tablename="KMS_Meet_MeetingRoomApply" activestatus="(23.填写申请)" />


        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText type="text" ID="txtApplyDeptName" runat="server" readonly="readonly"
                class="kpms-textbox" field="ApplyDeptName" tablename="KMS_Meet_MeetingRoomApply" activestatus="(23.填写申请)" />
            <input type="hidden" id="hiApplyDeptID" runat="server" field="ApplyDeptId" tablename="KMS_Meet_MeetingRoomApply" />
        </td>
        <td class="td-m" colspan="4">
            <asp:LinkButton runat="server" ID="LinkViewText" OnClientClick="OpenYDZT()" ForeColor="Blue" EnableTheming="false"
                Font-Size="Large">
                 查看会议室预订状态 </asp:LinkButton>
        </td>

    </tr>
   <%-- <tr class="tdIsAgree">
        <td class="td-l">是否同意<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <asp:RadioButtonList ID="rdIsAgree" runat="server" RepeatDirection="Horizontal" TableName="KMS_Meet_MeetingRoomApply" Field="IsAgree" activestatus="(23.部门主任审核)(23.院办主任审核)"></asp:RadioButtonList>
        </td>
    </tr>--%>
    <tr>
        <td class="td-l">备注 </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Meet_MeetingRoomApply" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiMeetingRoomApplyId" tablename="KMS_Meet_MeetingRoomApply"
    field="MeetingRoomApplyId" />
<!--公司领导deptId-->
<input type="hidden" runat="server" id="hiLeaderDept" value="3e31ba53-3591-4737-8aec-b4dbc8956a93" />
<%--主办部门--%>
<input id="hiDealDeptID" type="hidden" name="hiDealDeptID" tablename="KMS_Meet_MeetingRoomApply"
    field="DealDeptID" runat="server" />
<input id="hiDealDeptName" type="hidden" name="hiDealDeptName" tablename="KMS_Meet_MeetingRoomApply"
    field="DealDeptName" runat="server" />
<%--办公厅ID--%>
<input id="hiBanGongID" type="hidden" value="17ca55ad-e719-4925-864a-6b7ad6d81c68"
    runat="server" />
<%--办公厅ID--%>
<input id="hiMeetingLeader" type="hidden" value="办公厅会议管理负责人" runat="server" />
<!--会议室类型-->
<input type="hidden" runat="server" id="hiMeetingRoomType" value="公共会议室" />
<input type="hidden" runat="server" id="hiZYMeetingRoomType" value="专用会议室" />
<input type="hidden" runat="server" id="hiDateFormatStr" value="yyyy-MM-dd HH:mm" />
<input type="hidden" runat="server" id="hdnMeetingState" name="hdnMeetingState" tablename="KMS_Meet_MeetingRoomApply" field="MeetingState" />
<input type="hidden" runat="server" id="hdnMeetingStateText" name="hdnMeetingStateText" tablename="KMS_Meet_MeetingRoomApply" field="MeetingStateText" />
<script type="text/javascript">

    function initCustomerPlugin() {
        checkMaxLength();
        checkRegex();

        <%--if ($actName != "填写申请") {
            $(".tdIsAgree").show();
            $("#<%=rdIsAgree.ClientID%>").attr("req", "1");

        } else {
            $(".tdIsAgree").hide();
            $("#<%=rdIsAgree.ClientID%>").removeAttr("req");
        }--%>
    }

    function checkForm() {
        <%--if ("<%=this.ActionType %>" == "Update" || ("<%=this.ActionType %>" == "Create")) {
            //会议开始时间应早于会议结束时间
            var end = $('#<%=txtMeetEndDate.ClientID %>').val();
            var start = $('#<%=txtMeeStartDate.ClientID %>').val();
            if (start > end) {
                alert("-会议计划开始时间应早于会议计划结束时间！");
                return false;
            }
        }--%>
        if ($actCurrId == "MeetingRoomApply_wp1_act1" || $actCurrId == "MeetingRoomApply_wp1_act3") {
            var txtMeeStartDate = $('#<%=txtMeeStartDate.ClientID %>').val();
            var ltbStartDateHour = $('#<%=ltbStartDateHour.ClientID %>').val();
            var ddlStartDateMinute = $('#<%=ddlStartDateMinute.ClientID %>').val();
            var txtMeetEndDate = $('#<%=txtMeetEndDate.ClientID %>').val();
            var ltbEndDateHour = $('#<%=ltbEndDateHour.ClientID %>').val();
            var ddlEndDateMinute = $('#<%=ddlEndDateMinute.ClientID %>').val();
            if (txtMeeStartDate.length == 0 ||
                ltbStartDateHour.length == 0 ||
                ddlStartDateMinute.length == 0 ||
                txtMeetEndDate.length == 0 ||
                ltbEndDateHour.length == 0 ||
                ddlEndDateMinute.length == 0) {
                alert("会议计划时间必填");
                return false;
            }
        }

        return true;
    }

    //选择人员
    function chooseUser(isSingle, type) {
        selType = type;
        //只可选择一人
        if (isSingle == "s") {
            var param = new InputParamObject("s");
            var josn = { 'OrganizationId': "<%= KPMSUser.OrganizationId %>" };
            getDivUsersNew("", param, josn, getSelcterRe);

        }
        return false;
    }

    function meetTime() {

        return { startTime: $('#<%=txtMeeStartDate.ClientID %>').val(), endTime: $('#<%=txtMeetEndDate.ClientID %>').val() };

    }

    function getSelcterRe(re) {
        if (re != null) {

            //选择会议承办人
            $('#<%=hiHostUserID.ClientID %>').val(re.buildAttrJson("o", "id"));
            $('#<%=txtHostUserName.ClientID %>').val(re.buildAttrJson("o", "name"));
            return true;
        }
    }

    function OpenYDZT() {
        window.open("<%=WebAppPath%>/KMS/List/Meet/MeetingRoomOrderStateList.aspx")
    }

</script>
