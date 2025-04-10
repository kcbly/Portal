<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SealUseApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Seal.WF_SealUseApplyForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc2" %>
<table class="tz-table">
     <tr>
        <td></td>
        <td></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
             <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Seal_SealUseApplyForm" activestatus="(23.填写申请)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" tablename="KMS_Seal_SealUseApplyForm" field="ApplyDeptName" activestatus="(23.填写申请)"
                class="kpms-textbox" runat="server" readonly="readonly" req="1" />
            <input type="hidden" runat="server" id="hiApplyDeptId" field="ApplyDeptId" tablename="KMS_Seal_SealUseApplyForm" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Seal_SealUseApplyForm" Field="ApplyDate" ActiveStatus="(23.填写申请)" req="1"
                class="kpms-textbox-date" runat="server" readonly="readonly" />
        </td>
    </tr>
    <tr>

        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="KMS_Seal_SealUseApplyForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                IsMutiple="true" ResultForControls="{'hiApplyUserId':'id','txtApplyDeptName':'DEPTNAME','hiApplyDeptId':'DEPTID'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="KMS_Seal_SealUseApplyForm" />
        </td>
        <td class="td-l">联系电话</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtContact" TableName="KMS_Seal_SealUseApplyForm" Field="Contact" runat="server"
                ActiveStatus="(23.填写申请)" Width="70%" />
        </td>
    </tr>
    <tr>
        <td class="td-l">印章名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <div style="width: 180px;">
                <zhongsoft:LightObjectSelector runat="server" ID="txtSealName" field="SealName" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Seal_SealUseApplyForm" activestatus="(23.填写申请)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="true" ResultForControls="{'hiSealRegisterId':'id'}" PageUrl="~/KMS/Obsolete/SealSelector.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiSealRegisterId" field="SealRegisterId" tablename="KMS_Seal_SealUseApplyForm" />
            </div>
        </td>

    </tr>
    <tr>
        <td class="td-l">事由及说明</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="ltbReason" TableName="KMS_Seal_SealUseApplyForm" Field="Reason" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
            <%--            <zhongsoft:LightTextBox ID="txtReason" TableName="KMS_Seal_SealUseApplyForm" Field="Reason" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>--%>
    </tr>
    <tr>
        <td class="td-l">章数<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtSealNumber" TableName="KMS_Seal_SealUseApplyForm" Field="SealNumber" runat="server"
                ActiveStatus="(23.填写申请)" Width="70px" regex="^[0-9]\d*$" errmsg="必须是整正数" req="1" CssClass="kpms-textbox-money" EnableTheming="false" />
        </td>
        <td class="td-l">是否项目<span class="req-star">*</span></td>
        <td class="td-r" >
            <asp:RadioButtonList ID="rblIsProject" runat="server" RepeatDirection="Horizontal" req="1" TableName="KMS_Seal_SealUseApplyForm" Field="IsProject"
                Activestatus="(23.填写申请)" />
            <input type="hidden" runat="server" id="hiIsProjectText" field="IsProjectText" tablename="KMS_Seal_SealUseApplyForm" />
        </td>
    </tr>
    <tr id="tr1">
        <td class="td-l" id="tdProjectName">项目名称</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" PageWidth="800" OnClick="txtManager_Click"
                PageHeight="650" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/FM/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                TableName="KMS_Seal_SealUseApplyForm" Field="ProjectName" activestatus="(23.填写申请)"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="KMS_Seal_SealUseApplyForm" field="ProjectId" />
        </td>
    </tr>
    <tr id="tr2">
        <td class="td-l"  id="tdProjectCode">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.填写申请)"
                readonly="readonly" class="kpms-textbox" TableName="KMS_Seal_SealUseApplyForm"
                Field="ProjectCode" />
        </td>
          <td class="td-l"  id="tdManagerUserName">项目经理/执行经理</td>
        <td class="td-r">
             <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.填写申请)" style="width: 100px"
                readonly="readonly" class="kpms-textbox" TableName="KMS_Seal_SealUseApplyForm"
                Field="ManagerUserName" />
            <input runat="server" type="hidden" id="hiManagerUserID" tablename="KMS_Seal_SealUseApplyForm"
                field="ManagerUserID" />
        </td>
    </tr>
    <%--<tr>
        <td class="td-l">用章类型</td>
        <td class="td-r" colspan="6">
            <zhongsoft:LightDropDownList ID="ddlChapterType" TableName="KMS_Seal_SealUseApplyForm" Field="ChapterType" ActiveStatus="(23.填写申请)" OnSelectedIndexChanged="ddlChapterType_SelectedIndexChanged" AutoPostBack="true"
                runat="server" Width="128px" />
            <input type="hidden" runat="server" id="hiChapterTypeText" field="ChapterTypeText" tablename="KMS_Seal_SealUseApplyForm" />
            <input type="hidden" runat="server" id="hiChapterType" field="ChapterType" tablename="KMS_Seal_SealUseApplyForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">用章子类型</td>
        <td class="td-r" colspan="6">
            <zhongsoft:LightDropDownList ID="ddlChapterItemType" TableName="KMS_Seal_SealUseApplyForm" Field="ChapterItemType" ActiveStatus="(23.填写申请)"
                runat="server" Width="100%" />
            <input type="hidden" runat="server" id="hiChapterItemTypeText" field="ChapterItemTypeText" tablename="KMS_Seal_SealUseApplyForm" />
            <input type="hidden" runat="server" id="hiChapterItemType" field="ChapterItemType" tablename="KMS_Seal_SealUseApplyForm" />
        </td>
    </tr>--%>
   <%-- <tr>
        <td class="td-l">盖章电子文件<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" activestatus="(23.填写申请)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
            </zhongsoft:LightFileUploader>
            <uc2:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>--%>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Seal_SealUseApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Seal_SealUseApplyForm" field="SealUseApplyFormId" />
<input id="hiXml" runat="server" type="hidden" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        SetIsShow();
        //if ($actName == "部门负责人审批") {
        //    //需要自动发送的步骤，调用以下方法即可
        //    setAutoSend();
        //}
    }
    function checkForm() {
        //var grid = $("#ctl10_Attachment_dlAttachment")[0];
        //if (grid == "" || grid == undefined || grid.rows.length <= 0) {
        //    alert("请上传相关盖章电子文件！");
        //    return false;
        //} else {
        //    return true;
        //}
        return true;
    }
    $("#<%=rblIsProject.ClientID%>").live("change", function () {
        SetIsShow();
    });
    function SetIsShow() {
        var value = $('#<%=rblIsProject.ClientID %>').find("input:checked").val();
        if (value == "1") {
            $("#<%=txtProjectName.ClientID%>").attr("req", "1");
            $("#<%=txtProjectCode.ClientID%>").attr("req", "1");
            $("#<%=txtManagerUserName.ClientID%>").attr("req", "1");
            $("#tdProjectName").html("项目名称<span class='req-star'>*</span >");
            $("#tdProjectCode").html("项目编号<span class='req-star'>*</span >");
            $("#tdManagerUserName").html("项目经理/执行经理<span class='req-star'>*</span >");
            $("#tr1").show();
            $("#tr2").show();
        }
        else {
            $("#<%=txtProjectName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectCode.ClientID%>").removeAttr("req");
            $("#<%=txtManagerUserName.ClientID%>").removeAttr("req");
            $("#<%=txtProjectName.ClientID%>").val("");
            $("#<%=hiOrganizationID.ClientID%>").val("");
            $("#<%=txtProjectCode.ClientID%>").val("");
            $("#<%=hiManagerUserID.ClientID%>").val("");
            $("#<%=txtManagerUserName.ClientID%>").val("");
            $("#tr1").hide();
            $("#tr2").hide();
        }
    }
    function selectExamTemplate() {
        var param = new InputParamObject("m");
        var json = { '': '' };
        //先清空再传值
        $("#<%=hiXml.ClientID %>").val("");
        //选择会议纪要传阅数据
        getMeetResolutions("<%=hiXml.ClientID %>", param, json, affterFormsSelect);
        return false;
    }

    function getMeetResolutions(reid, param, filter, callback) {
        return buildDivSelector(reid, param, filter, buildQueryUrl("KMS/Obsolete/SealSelector.aspx", null), 850, 550, callback);
    }

    //批量选择CallBack方法
    function affterFormsSelect() {
        <%=Page.ClientScript.GetPostBackEventReference(this.txtSealName,"")%>;
    }
</script>

