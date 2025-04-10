<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OutwardDataForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_OutwardDataForm" %>

<%@ Register Src="../../UI/FileList.ascx" TagName="FileList" TagPrefix="uc4" %>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initProjectGrid) == 'function') {
            initProjectGrid();
        }
    }

    function checkForm() {
        //        if ($formAction == 0) {//0 表示发送
        //            //必须选定一个主项目
        //            if ($actName == "填写向外提供资料单" || parseBool("<%=IsCreateUser %>")) {
        //                var json = { "bizid": "<%=BusinessObjectId %>" };
        //                var count = formCallback("MajorProjectNum", json);
        //                if (count > 0) {
        //                    return true;
        //                } else {
        //                    alert("请添加项目并指定一个主项目");
        //                    return false;
        //                }
        //            }
        //        }
        return true;
    }
</script>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(2.填写向外提供资料单)"
                TableName="EPMS_OutwardDataForm" field="ProjectName" OnClick="lbsSelectProject_Click" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(2.填写向外提供资料单)" maxlength="16" class="kpms-textbox" TableName="EPMS_OutwardDataForm"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_OutwardDataForm"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            资料名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbFileName" req="1" MaxLength="256" TableName="EPMS_OutwardDataForm"
                field="FileName" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            资料编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFileCode" req="1" MaxLength="64" TableName="EPMS_OutwardDataForm"
                field="FileCode" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出科室<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutDeptName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiPutDeptID':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                tablename="EPMS_OutwardDataForm" field="PutDeptName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutDeptID" tablename="EPMS_OutwardDataForm"
                field="PutDeptID" />
        </td>
        <td class="td-l">
            提出专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPutSpecialty" tablename="EPMS_OutwardDataForm"
                field="PutSpecialtyID" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"
                OnSelectedIndexChanged="ddlPutSpecialty_SelectedIndexChanged" AutoPostBack="true" req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiPutSpecialtyName" tablename="EPMS_OutwardDataForm"
                field="PutSpecialtyName" />
            <input type="hidden" runat="server" id="hiPutSpecialtyCode" tablename="EPMS_OutwardDataForm"
                field="PutSpecialtyCode" />
        </td>
        <td class="td-l" style="display: none">
            提出人<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                SelectPageMode="Dialog" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                ShowAttrs="name,UserCode" ResultForControls="{'hiApproveUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                tablename="EPMS_OutwardDataForm" field="PutUserName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPutUserID" tablename="EPMS_OutwardDataForm"
                field="PutUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            接收单位<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsReceiveUnit" IsMutiple="false"
                                           ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                                           EnableTheming="false" Text="选择接收单位" PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                                           ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_OutwardDataForm"
                                           req="1" field="ReceiveUnit" activestatus="(23.填写向外提供资料单)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiCustomerID" name="hiReceiveUnitID" runat="server" field="ReceiveUnitID"
                   tablename="EPMS_OutwardDataForm" />
        </td>
        <td class="td-l">
            接收人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbReceivePerson" MaxLength="256" TableName="EPMS_OutwardDataForm" req="1"
                field="ReceivePerson" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" style="display: none">
            提出日期<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:XHtmlInputText ID="txtPutDate" runat="server" type="text" class="kpms-textbox-date"
                                      req="1" tablename="EPMS_OutwardDataForm" field="PutDate" readonly="readonly"
                                      activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)" />
        </td>
        <td class="td-l">
            发送日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSendDate" runat="server" type="text" class="kpms-textbox-date" req="1"
                                      tablename="EPMS_OutwardDataForm" field="SendDate" readonly="readonly" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)" />
        </td>
        <td class="td-m" colspan="4"></td>
    </tr>
    <tr>
        <td class="td-l">
            资料内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbFileContent" TextMode="MultiLine" 
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="1024" tablename="EPMS_OutwardDataForm"
                field="FileContent" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>    
    <tr style="display: none">
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" MaxLength="1024"
                CssClass="kpms-textarea" EnableTheming="false" tablename="EPMS_OutwardDataForm"
                field="Memo" activestatus="(23.填写向外提供资料单)(23.重新填写向外提供资料单)(23.审核修改)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">向外提供资料
        </td>
        <td colspan="5" class="td-m">
            <uc4:FileList ID="fileList" runat="server" FileType="向外提供资料" DownAllFile="true" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiOutwardDataFormID" tablename="EPMS_OutwardDataForm"
    field="OutwardDataFormID" /><%--
<input type="hidden" runat="server" id="hiOrganizationID" />--%>

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        initFileList();
    }

    function checkForm() {
        if ($formAction == "2" && $actName == "填写向外提供资料单") {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            if (orgId == '' || orgId == undefined) {
                alert('请先选择项目！');
                return false;
            }
        }
        return true;
    }
</script>