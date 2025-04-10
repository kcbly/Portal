<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearInstituteTrainEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.YearInstituteTrainEditor" 
MasterPageFile="~/UI/Master/ObjectEditor.Master"%>

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
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(23.*)"
                field="YEAR" tablename="EHR_YEARINSTTRAINPLANENTITY">
            </zhongsoft:LightDropDownList>
        </td>
            <td class="td-l">
                期数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPeriod" CssClass="kpms-textbox" regex="^\d{1,3}$"
                    errmsg="请输入正确期数(1-3位整数)" req="1" field="PERIOD" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
          <%--  <td class="td-l" style="display:none">
                计划开始时间<span class="req-star">*</span>
            </td>
            <td class="td-r" style="display:none">
                <zhongsoft:XHtmlInputText ID="txtPlanStDate" runat="server" readonly="readonly" field="PLANSTDATE"
                    class="kpms-textbox-comparedate" compare="1" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(23.*)" />
            </td>
            <td class="td-l" style="display:none">
                计划结束时间<span class="req-star">*</span>
            </td>
            <td class="td-r" style="display:none">
                <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" readonly="readonly"
                    field="PLANENDDATE" class="kpms-textbox-comparedate" compare="1" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    req="1" activestatus="(23.*)" />
            </td>--%>

             <td class="td-l">
                计划类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPlanType" req="1" activestatus="(23.*)"
                    field="Type" tablename="EHR_YEARINSTTRAINPLANENTITY" 
                    onselectedindexchanged="ddlPlanType_SelectedIndexChanged">
                    <asp:ListItem Text="计划内">计划内</asp:ListItem>
                    <asp:ListItem Text="计划外">计划外</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainProName" CssClass="kpms-textbox"
                    Width="99%" req="1" MaxLength="64" field="TRAINPROJECTNAME" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
           <%-- <td class="td-l">
                是否重点培训项目<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlIsKeyProject" req="1" activestatus="(23.*)"
                    field="ISKEYPROJECT" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">
                培训对象<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainObject" CssClass="kpms-textbox"
                    EnableTheming="false" MaxLength="20" field="TRAINOBJECT"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)" Width="99%">
                </zhongsoft:LightTextBox>
            </td>

             <td class="td-l">
                分类<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCategory" req="1" activestatus="(23.*)"
                    field="CATEGORY" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>
            </td>
            
        </tr>
        <tr>
            <td class="td-l">
                培训内容
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainContent" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINCONTENT"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)" Width="99%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <%-- <td class="td-l">
                培训形式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm" req="1" activestatus="(23.*)"
                    field="TRAININGFORM" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                培训方式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainWay" req="1" activestatus="(23.*)"
                    field="TRAININGWAY" tablename="EHR_YEARINSTTRAINPLANENTITY" Width="90px">
                </zhongsoft:LightDropDownList>
            </td>--%>
            <td class="td-l">
                培训类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainClass" req="1" activestatus="(23.*)"
                    field="TRAININGCLASS" tablename="EHR_YEARINSTTRAINPLANENTITY" >
                </zhongsoft:LightDropDownList>
            </td>
             <td class="td-l">
                培训级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainingLevel" req="1" activestatus="(23.*)"
                    field="TRAININGLEVEL" tablename="EHR_YEARINSTTRAINPLANENTITY" Width="90px">
                </zhongsoft:LightDropDownList>
            </td>
            <%--<td class="td-l">
                培训类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" req="1" activestatus="(23.*)"
                    field="TRAININGTYPE" tablename="EHR_YEARINSTTRAINPLANENTITY">
                </zhongsoft:LightDropDownList>
            </td>--%>
            <td class="td-l">
                师资来源
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSourceOfTeachers" CssClass="kpms-textbox"
                    MaxLength="64" field="SOURCEOFTEACHERS" tablename="EHR_YEARINSTTRAINPLANENTITY" Width="98%"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <%-- <tr>
           
            <td class="td-l" style="white-space: normal; line-height: 1.5">
                网络或视听培训的课件来源
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCourseWareSource" CssClass="kpms-textbox"
                    MaxLength="64" field="COURSEWARESOURCE" tablename="EHR_YEARINSTTRAINPLANENTITY" Width="98%"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>--%>
        <tr>
            <td class="td-l">
                培训课时<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainClassHour" CssClass="kpms-textbox"
                    Width="80px" req="1" regex="^(([1-9]\d{0,2})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训课时(整数或小数)"
                    field="TRAININGCLASSHOUR" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训人数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbNumberOfTrain" CssClass="kpms-textbox"
                    errmsg="请输入正确的培训人数(1-4位整数)" regex="^\d{1,4}$" field="NUMBEROFTRAINING" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                考核方式
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbAssessment" CssClass="kpms-textbox"
                    Width="98%" MaxLength="64" field="ASSESSMENT" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                费用估算(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCostEstimating" CssClass="kpms-textbox-money"
                    Width="80px" req="1" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的费用估算(整数或小数)"
                    field="COSTESTIMATING" tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                申请人<span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 50px">
                <zhongsoft:LightObjectSelector runat="server" ID="selUnderTaker" field="UNDERTAKERNAME"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" activestatus="(23.*)" DoCancel="true" req="1"
                    ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUnderTakerId':'id','hiUnderTakerCode':'UserCode','ddlUnderDept':'OrgUnitId','hiUnderDeptName':'OrgUnitName','hiUnderDeptCode':'OrgUnitCode'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUnderTakerId" runat="server" field="UNDERTAKERID" tablename="EHR_YEARINSTTRAINPLANENTITY" />
                <input type="hidden" id="hiUnderTakerCode" runat="server" field="UNDERTAKERCODE"
                    tablename="EHR_YEARINSTTRAINPLANENTITY" />
            </td>
            <td class="td-l">
                计划申请部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" req="1" activestatus="(23.*)"
                    field="UNDERDEPTID" tablename="EHR_YEARINSTTRAINPLANENTITY" AutoPostBack="true" OnSelectedIndexChanged="ddlUnderDeptIndexChange">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiUnderDeptCode" runat="server" field="UNDERDEPTCODE" tablename="EHR_YEARINSTTRAINPLANENTITY" />
                <input type="hidden" id="hiUnderDeptName" runat="server" field="UNDERDEPTNAME" tablename="EHR_YEARINSTTRAINPLANENTITY" />
            </td>
        </tr>
         <tr>
            <td class="td-l">
                调整内容
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbAdjustContent" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="ADJUSTCONTENT" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
         <tr>
            <td class="td-l">
                调整理由
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbAdjustReason" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="ADJUSTREASON" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_YEARINSTTRAINPLANENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiYearInstTrainPlanDtId" field="YEARINSTTRAINPLANENTITYID"
        tablename="EHR_YEARINSTTRAINPLANENTITY" />
    <input type="hidden" runat="server" id="hiflag" field="flag" value="1"
        tablename="EHR_YEARINSTTRAINPLANENTITY" />
<%--    <input type="hidden" runat="server" id="hiFormId" field="YEARINSTTRAINPLANFORMID"
        tablename="EHR_YEARINSTTRAINPLANENTITY" />--%>
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
