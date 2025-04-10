<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectApproveForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ProjectApproveForm" %>
<%@ Register Src="~/EPMS/UI/Project/PhaseProjectCommon.ascx" TagName="PhaseProject" TagPrefix="uc1" %>
<table class="tz-table" style="width: 100%">
    <uc1:PhaseProject ID="PhaseProjectCommon" runat="server" />
</table>
<input id="hiOrganizationID" type="hidden" tablename="EPMS_ProjectEntity" field="OrganizationID" runat="server" /> 
<input id="hiRoleName" runat="server" type="hidden" value="'分管总工','专业总工','分管所领导','设总','项目跟踪岗'" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>