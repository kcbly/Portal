<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DemandInfoForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_DemandInfoForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
             <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiProjectID':'id','tbProjectCode':'ProjectCode',
                 'txtProjectLeaderName':'ManagerUserName','hiProjectLeaderID':'ManagerUserID','hiPhaseID':'ParamPhaseID'}" EnableTheming="false" PageWidth="900px"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"  OnClick="tbProjectName_Click"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="ProjectName" ActiveStatus="(23.填写需求资料提供单)" /> 
            <input type="hidden" id="hiProjectID" name="hiProjectID" runat="server" tablename="EPMS_DemandInfo" field="ProjectID" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly" TableName="EPMS_DemandInfo" Field="ProjectCode" ActiveStatus="(23.填写需求资料提供单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段<span class="req-star">*</span></td>
        <td class="td-m"  colspan="5">
            <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.填写需求资料提供单)" RepeatDirection="Horizontal" req="1" />
            <input type="hidden" id="hiPhaseID" name="hiPhaseID" runat="server" tablename="EPMS_DemandInfo" field="PhaseID" />
            <input type="hidden" id="hiPhaseName" name="hiPhaseID" runat="server" tablename="EPMS_DemandInfo" field="PhaseName" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提资名称</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbDataName" runat="server" TableName="EPMS_DemandInfo" Field="DataName" ActiveStatus="(23.填写需求资料提供单)" />
        </td>
        <td class="td-l">提资编号</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDataCode" runat="server" TableName="EPMS_DemandInfo" Field="DataCode" ActiveStatus="(23.填写需求资料提供单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提资具体要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRequire" runat="server" MaxLength="1024" CssClass="kpms-textarea" TextMode="MultiLine"
                TableName="EPMS_DemandInfo" Field="Require" ActiveStatus="(23.填写需求资料提供单)" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提资时间要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTimeRequire" runat="server" MaxLength="1024" CssClass="kpms-textarea" TextMode="MultiLine"
                TableName="EPMS_DemandInfo" Field="TimeRequire" ActiveStatus="(23.填写需求资料提供单)" EnableTheming="false" />
        </td>
    </tr>
    <tr>
    <tr>
        <td class="td-l">需资专业<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" req="1" TableName="EPMS_DemandInfo" Field="SpecialtyID" ActiveStatus="(23.填写需求资料提供单)(23.需资专业意见)" />
            <input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyID" runat="server" tablename="EPMS_DemandInfo" field="SpecialtyCode" />
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyID" runat="server" tablename="EPMS_DemandInfo" field="SpecialtyName" />
        </td>
        <td class="td-l">勘设人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbSurveyorName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiSurveyorID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="SurveyorName" ActiveStatus="(23.填写需求资料提供单)(23.需资专业意见)" />
            <input type="hidden" id="hiSurveyorID" name="hiSurveyorID" runat="server" tablename="EPMS_DemandInfo" field="SurveyorID" />
        </td>
        <td class="td-l">校核人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbCheckerName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiCheckerID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="CheckerName" ActiveStatus="(23.填写需求资料提供单)(23.需资专业意见)" />
            <input type="hidden" id="hiCheckerID" name="hiCheckerID" runat="server" tablename="EPMS_DemandInfo" field="CheckerID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">审查人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbReviewerName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiReviewerID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="ReviewerName" ActiveStatus="(23.填写需求资料提供单)(23.需资专业意见)" />
            <input type="hidden" id="hiReviewerID" name="hiReviewerID" runat="server" tablename="EPMS_DemandInfo" field="ReviewerID" />
        </td>       
        <td class="td-l">生产技术部<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProductorName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiProductorID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="ProductorName" ActiveStatus="(23.填写需求资料提供单)(23.需资专业意见)" />
            <input type="hidden" id="hiProductorID" name="hiProductorID" runat="server" tablename="EPMS_DemandInfo" field="ProductorID" />
        </td>
       <td class="td-l">设总(项目负责人)</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtProjectLeaderName" runat="server" readonly="readonly" 
                TableName="EPMS_DemandInfo" Field="ProjectLeaderName" ActiveStatus="(23.填写需求资料提供单)" />
            <input type="hidden" id="hiProjectLeaderID" name="hiProjectLeaderID" runat="server" tablename="EPMS_DemandInfo" field="ProjectLeaderID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">提资专业意见</td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbAdvice" runat="server" MaxLength="1024" CssClass="kpms-textarea" TextMode="MultiLine"  EnableTheming="false"  TableName="EPMS_DemandInfo" Field="Advice" ActiveStatus="(23.填写需求资料提供单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">接收人<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbReceiverName" req="1" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiReceiverID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="ReceiverName" ActiveStatus="(23.填写需求资料提供单)" />
            <input type="hidden" id="hiReceiverID" name="hiReceiverID" runat="server" tablename="EPMS_DemandInfo" field="ReceiverID" />
        </td>
        <td class="td-l">接收日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtReceiveDate" req="1" runat="server" readonly="readonly"
                TableName="EPMS_DemandInfo" Field="ReceiveDate" ActiveStatus="(23.签收)" />
        </td>          
    </tr>
    <tr>
        <td class="td-l">提资专业<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTakeSpecialty" runat="server" req="1" TableName="EPMS_DemandInfhiPhaseIDo" Field="TakeSpecialtyID" ActiveStatus="(23.填写需求资料提供单)(23.提资专业意见)" />
            <input type="hidden" id="hiTakeSpecialtyCode" name="hiTakeSpecialtyCode" runat="server" tablename="EPMS_DemandInfo" field="TakeSpecialtyCode" />
            <input type="hidden" id="hiTakeSpecialtyName" name="hiTakeSpecialtyName" runat="server" tablename="EPMS_DemandInfo" field="TakeSpecialtyName" />
        </td>
        <td class="td-l">专业负责人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbSpecialtyChargeName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiSpecialtyChargeID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" TableName="EPMS_DemandInfo" Field="ProductorName" ActiveStatus="(23.填写需求资料提供单)(23.提资专业意见)" />
            <input type="hidden" id="hiSpecialtyChargeID" name="hiSpecialtyChargeID" runat="server" tablename="EPMS_DemandInfo" field="SpecialtyChargeID" />
        </td>
        <td class="td-l">明确日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtClearDate" runat="server" readonly="readonly" TableName="EPMS_DemandInfo" Field="ClearDate" ActiveStatus="(23.填写需求资料提供单)" />
        </td>      
    </tr>
    <tr>
        <td class="td-l">附件</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.填写需求资料提供单)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="6">
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="3" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiDemandInfoID" name="hiDemandInfoID" runat="server" tablename="EPMS_DemandInfo" field="DemandInfoID" />
 <script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>
