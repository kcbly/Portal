<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyDesignWorkPlanForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_SurveyDesignWorkPlanForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<%@ Register Src="../../UI/OBS/ProjectSpeUser.ascx" TagName="ProjectSpeUser" TagPrefix="uc2" %>
<%@ Register Src="../../UI/OBS/ProjectMgrUser.ascx" TagName="ProjectMgrUser" TagPrefix="uc3" %>
<%@ Register Src="../../UI/WBS/WBSTreeAndList.ascx" TagName="WBSTreeAndList" TagPrefix="uc4" %>
<table width="100%" class="tz-table">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('ProjectCommon')">项目基本信息&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="ProjectCommon">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td class="td-l">子项目名称<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3" style="white-space: nowrap">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false" ResultAttr="name"
                            SelectPageMode="Dialog" ResultForControls="{'hiOrganizationId':'id','tbProjectCode':'ProjectCode'}"
                            EnableTheming="false" Text="选择项目" OnClick="lbsSelectProject_Click" activestatus="(2.编制计划)"
                            PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" PageWidth="850" ShowJsonRowColName="true"
                            field="ProjectName" tablename="EPMS_ProjectPlanBook" />
                    </td>
                    <td class="td-l" runat="server" id="tdProjectCode">子项目编号
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly"
                            activestatus="(2.编制计划)" maxlength="16" class="kpms-textbox" field="ProjectCode" tablename="EPMS_ProjectPlanBook" />
                        <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" field="OrganizationID" tablename="EPMS_ProjectPlanBook" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">设计阶段
                    </td>
                    <td class="td-m" colspan="5">
                        <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.N)" RepeatDirection="Horizontal" req="1" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('projMemberInfo')">项目组成员&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="projMemberInfo">
        <td colspan="6">
            <table class="tz-table">
                <uc3:ProjectMgrUser ID="ucProjectMgrUser" runat="server" />
                <uc2:ProjectSpeUser ID="ucProjectSpeUser" runat="server" />
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" flag="wbsInfo">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('projWBS')">WBS任务【<span>项目计划</span>】&nbsp;<img
            src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="projWBS">
        <td colspan="6">
            <table class="tz-table" style="width: 100%">
                <tr>
                    <td class="td-l">项目模板名称
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectTemplateName" SourceMode="SelectorPage"
                            IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx"
                            ResultForControls="{'hiProjectTemplateID':'id','hiProjectTemplateName':'name'}"
                            FilterFunction="projTempFilter()" activestatus="(23.?)"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiProjectTemplateID" />
                        <input type="hidden" runat="server" id="hiPreTempID" />
                        <input type="hidden" runat="server" id="hiProjectTemplateName" />
                    </td>
                </tr>
                <uc4:WBSTreeAndList id="ucWBSTreeAndList" runat="server" onwbschanged="ReLoadWBSInfo" />
            </table>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('planProjInfo')">工程设计计划&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="planProjInfo">
        <td colspan="6">
            <%--    <uc4:IntegrateProjPlan ID="ucIntegrateProjPlan" runat="server" /> --%>
        </td>
    </tr>
    <tr>
        <td class="td-l">工程设计计划单</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.编制计划)" OnClick="upLoadFile_Click">
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
<input type="hidden" runat="server" id="hiProjectPlanBookID" tablename="EPMS_ProjectPlanBook" field="ProjectPlanBookID" />
<input type="hidden" runat="server" id="hiFormType" tablename="EPMS_ProjectPlanBook" field="FormType" />
<!-- 业务类型、业务板块-->
<input type="hidden" runat="server" id="hiBusinessTypeId" />
<input type="hidden" runat="server" id="hiBusinessPlateId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'BusinessTypeID': $('#<%=hiBusinessTypeId.ClientID %>').val(), 'BusinessPlateID': $('#<%=hiBusinessPlateId.ClientID %>').val() };
    }
</script>
