<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectCommon.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectCommon" %>
<tr runat="server" id="trTitle" visible="false">
    <td colspan="6" class="td-m flexible">
        项目信息
    </td>
</tr>
<tr runat="server" id="trBaseInfo">
    <td class="td-l">
        项目名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3" style="white-space: nowrap">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
            SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectPhaseCode':'ProjectCode'}"
            EnableTheming="false" Text="选择项目" AfterSelect="afterSelect()" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ShowJsonRowColName="true" FilterFunction="projFilter()" ResultAttr="name"
            activestatus="(23.步骤)" />
        <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
    </td>
    <td class="td-l" runat="server" id="tdProjectCode">
        项目编号
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
            activestatus="(23.步骤)" maxlength="16" class="kpms-textbox" />
        <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" />
        <input type="hidden" id="hiProjectCode" name="hiProjectCode" runat="server" />
        <input type="hidden" id="hiProjectName" name="hiProjectName" runat="server" />
    </td>
</tr>
<tr runat="server" id="trExtendInfo">
    <td class="td-l">
        项目规模
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="tbProjectScale" runat="server" readonly="readonly"
            maxlength="128" class="kpms-textbox" activestatus="(23.步骤)" />
    </td>
    <td class="td-l">
        项目类别
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="tbProjectType" runat="server" readonly="readonly" maxlength="16"
            class="kpms-textbox" activestatus="(23.步骤)" />
    </td>
    <td class="td-l">
        设计阶段
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
            class="kpms-textbox" activestatus="(23.步骤)" />
    </td>
</tr>
<tr>
    <td class="td-l">
        项目级别
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectLevel" activestatus="(23.?)"/>
    </td>
    <td class="td-l">
        是否紧急
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtIsUrgentProject" activestatus="(23.?)"/>
    </td>
    <td class="td-l">
        是否创优
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtIsExcellentProj" activestatus="(23.?)"/>
    </td>
</tr>
<tr id="trProjectUser" runat="server">
    <td class="td-l">
        项目通讯录
    </td>
    <td class="td-m" colspan="5">
        <asp:LinkButton ID="lkbProjectUser" runat="server" EnableTheming="false" CssClass="aStyle"
            OnClientClick="return openProjectUser()" activestatus="(13.*)" displaystatus="(13.*)">通讯录</asp:LinkButton>
    </td>
</tr>
<script>
    function afterSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

    function projFilter() {
        return "<%=Filter %>";
    }

    function openProjectUser() {
        var orgID = $("#<%=hiOrganizationId.ClientID %>").val();
        var url = buildQueryUrl("/EPMS/List/OBS/ProjectTeamMemberList.aspx", { IsPortal: true, MenuId: '241155B8-33F5-4D56-8A94-B5D6C2337320', OrganizationID: orgID });
        //showDivDialog(url, null, 1200, 600, null);
        window.open(url);
        return false;
    }
</script>
