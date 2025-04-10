<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TranPlanExcuteStatisticEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TranPlanExcuteStatisticEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style type="text/css">
        td
        {
            white-space: nowrap;
        }
    </style>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbYear" CssClass="kpms-textbox" req="1"
                    ReadOnly="true" MaxLength="4" field="YEAR" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(2.*)" Width="80px">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                期数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPeriod" CssClass="kpms-textbox" regex="^\d{1,3}$"
                    errmsg="请输入正确期数(1-3位整数)" req="1" field="PERIOD" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                计划开始时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanStDate" runat="server" readonly="readonly" field="PLANSTDATE"
                    class="kpms-textbox-comparedate" compare="1" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(2.*)" />
            </td>
            <td class="td-l">
                计划结束时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" readonly="readonly"
                    field="PLANENDDATE" class="kpms-textbox-comparedate" compare="1" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(2.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainProName" CssClass="kpms-textbox"
                    Width="99%" req="1" MaxLength="64" field="TRAINPROJECTNAME" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否重点培训项目<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlIsKeyProject" req="1" activestatus="(2.*)"
                    field="ISKEYPROJECT" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" CssClass="kpms-textbox"
                    req="1" field="ISKEYPROJECT" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                上会结果
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMeetingResult" CssClass="kpms-textbox-money"
                    Width="80px" field="MEETINGRESULT" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训对象<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainObject" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINOBJECT"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)" Width="99%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训形式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm" req="1" activestatus="(2.*)"
                    field="TRAININGFORM" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox2" CssClass="kpms-textbox"
                    req="1" field="TRAININGFORM" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训方式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlTrainWay" req="1" activestatus="(2.*)"
                    field="TRAININGWAY" tablename="EHR_YEARINSTTRAINPLANENTITY" Width="90px">
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox3" CssClass="kpms-textbox"
                    req="1" field="TRAININGWAY" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlTrainClass" req="1" activestatus="(2.*)"
                    field="TRAININGCLASS" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox4" CssClass="kpms-textbox"
                    req="1" field="TRAININGCLASS" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%--<zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" req="1" activestatus="(2.*)"
                    field="TRAININGTYPE" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                  <zhongsoft:LightTextBox runat="server" ID="LightTextBox5" CssClass="kpms-textbox"
                    req="1" field="TRAININGTYPE" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                师资来源
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbSourceOfTeachers" CssClass="kpms-textbox"
                    MaxLength="64" field="SOURCEOFTEACHERS" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="98%" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" style="white-space: normal; line-height: 1.5">
                网络或视听培训的课件来源
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCourseWareSource" CssClass="kpms-textbox"
                    MaxLength="64" field="COURSEWARESOURCE" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="98%" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训课时<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainClassHour" CssClass="kpms-textbox"
                    Width="80px" req="1" regex="^(([1-9]\d{0,2})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训课时(整数或小数)"
                    field="TRAININGCLASSHOUR" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训人数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbNumberOfTrain" CssClass="kpms-textbox"
                    errmsg="请输入正确的培训人数(1-4位整数)" regex="^\d{1,4}$" field="NUMBEROFTRAINING" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(2.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                考核方式
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAssessment" CssClass="kpms-textbox"
                    MaxLength="64" field="ASSESSMENT" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                费用估算(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCostEstimating" CssClass="kpms-textbox-money"
                    Width="80px" req="1" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的费用估算(整数或小数)"
                    field="COSTESTIMATING" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                承办人<span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 50px">
                <zhongsoft:LightObjectSelector runat="server" ID="selUnderTaker" field="UNDERTAKERNAME"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)" DoCancel="true"
                    req="1" ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUnderTakerId':'id','hiUnderTakerCode':'UserCode'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUnderTakerId" runat="server" field="UNDERTAKERID" tablename="EHR_YEARINSTTRAINPLANENTITY" />
                <input type="hidden" id="hiUnderTakerCode" runat="server" field="UNDERTAKERCODE"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" />
            </td>
            <td class="td-l">
                承办部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%--<zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" req="1" activestatus="(2.*)"
                    field="UNDERDEPTID" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                 <zhongsoft:LightTextBox runat="server" ID="LightTextBox6" CssClass="kpms-textbox"
                    req="1" field="UNDERDEPTNAME" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
               <%-- <input type="hidden" id="hiUnderDeptCode" runat="server" field="UNDERDEPTCODE" tablename="EHR_YEARINSTTRAINPLANENTITY" />
                <input type="hidden" id="hiUnderDeptName" runat="server" field="UNDERDEPTNAME" tablename="EHR_YEARINSTTRAINPLANENTITY" />--%>
            </td>
            <td class="td-l">
                负责人
            </td>
            <td class="td-r" style="width: 50px">
                <zhongsoft:LightObjectSelector runat="server" ID="selLeader" field="LEADERNAME" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(2.*)" DoCancel="true" ResultAttr="name" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiLeaderId':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiLeaderId" runat="server" field="LEADERID" tablename="EHR_YEARINSTTRAINPLANENTITY" />
            </td>
            <td class="td-l">
                调整内容<span class="req-star">*</span>
            </td>
            <td class="td-r">
               <%-- <zhongsoft:LightDropDownList runat="server" ID="ddlAdjustContent" req="1" activestatus="(2.*)"
                    field="ADJUSTCONTENT" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>--%>
                 <zhongsoft:LightTextBox runat="server" ID="LightTextBox7" CssClass="kpms-textbox"
                    req="1" field="ADJUSTCONTENT" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                调整理由
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbAdjustReason" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="ADJUSTREASON"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" Width="99%" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="99%" activestatus="(2.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                实际开始时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtActStDate" runat="server" readonly="readonly" field="ACTSTDATE"
                    class="kpms-textbox-comparedate" compare="2" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                实际结束时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtActEndDate" runat="server" readonly="readonly" field="ACTENDDATE"
                    class="kpms-textbox-comparedate" compare="2" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                实际参培人数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbActJoinNums" CssClass="kpms-textbox"
                    errmsg="请输入正确的实际参培人数(1-4位整数)" regex="^\d{1,4}$" field="ACTJOINNUMS" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                实际培训课时<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbActTrainHours" CssClass="kpms-textbox"
                    Width="80px" req="1" regex="^(([1-9]\d{0,2})|0)(\.\d{1,2})?$" errmsg="请输入正确的实际培训课时(整数或小数)"
                    field="ACTTRAINHOURS" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiYearInstTrainPlanEntityId" field="YEARINSTTRAINPLANENTITYID"
        tablename="EHR_YEARINSTTRAINPLANENTITY" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }


        function checkDate() {
            var startdate = $("#<%=txtActStDate.ClientID %>").val();
            var enddate = $("#<%=txtActEndDate.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("实际开始时间应早于实际结束时间！");
                return false;
            }
            else
                return true;
        }


        function checkForm() {
            if (checkDate())
                return true;
            else
                return false;
        }
    
    </script>
</asp:Content>
