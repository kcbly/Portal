<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StaffCertifiedRewardApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.IC.WF_StaffCertifiedRewardApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">申请人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" TableName="EHR_IC_StaffCertifiedRewardApplyForm" Field="ApplyUserName" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly"></zhongsoft:XHtmlInputText>
            <input id="hiApplyUserId" runat="server" field="ApplyUserId" tablename="EHR_IC_StaffCertifiedRewardApplyForm" type="hidden" />
        </td>
        <td class="td-l">申请日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="EHR_IC_StaffCertifiedRewardApplyForm" Field="ApplyDate" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly"></zhongsoft:XHtmlInputText>
        </td>

    </tr>
    <tr>
        <td class="td-l">部门</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" TableName="EHR_IC_StaffCertifiedRewardApplyForm" Field="ApplyDeptName" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly"></zhongsoft:XHtmlInputText>
            <input id="hiApplyDeptId" runat="server" field="ApplyDeptId" tablename="EHR_IC_StaffCertifiedRewardApplyForm" type="hidden" />
        </td>
        <td class="td-l">内设机构</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtInternalOrganization" TableName="EHR_IC_StaffCertifiedRewardApplyForm" Field="InternalOrganization" runat="server" ActiveStatus="(23.发起申请)" class="kpms-textbox" readonly="readonly"></zhongsoft:XHtmlInputText>
            <input id="hiInternalOrganizationId" runat="server" field="InternalOrganizationId" tablename="EHR_IC_StaffCertifiedRewardApplyForm" type="hidden" />
        </td>
    </tr>
    <tr>
        <td class="td-l">岗位</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtPost" EnableTheming="false"
                activestatus="(23.发起申请)" field="Post" tablename="EHR_IC_StaffCertifiedRewardApplyForm">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">申请注册资质证书<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlApplyRegisterCertificate" TableName="EHR_IC_StaffCertifiedRewardApplyForm" Field="ApplyRegisterCertificate" ActiveStatus="(23.发起申请)" runat="server" Width="128px" req="1"/>
            <input type="hidden" runat="server" id="hiApplyRegisterCertificateText" field="ApplyRegisterCertificateText" tablename="EHR_IC_StaffCertifiedRewardApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">证书名称<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtCertificateName" EnableTheming="false" req="1"
                activestatus="(23.发起申请)" field="CertificateName" tablename="EHR_IC_StaffCertifiedRewardApplyForm">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">证书发证机构<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtCertificationAuthority" EnableTheming="false" req="1"
                activestatus="(23.发起申请)" field="CertificationAuthority" tablename="EHR_IC_StaffCertifiedRewardApplyForm">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="txtRemark" CssClass="kpms-textarea" EnableTheming="false"
                activestatus="(23.发起申请)" field="Remark" tablename="EHR_IC_StaffCertifiedRewardApplyForm"
                TextMode="MultiLine">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="4">
            <div>
                <p>&nbsp;&nbsp;&nbsp;本人申请将证书注册在公司，承诺不得将证书交由除公司外的任何单位注册，否直将由此造成的后果由本人承担。</p>
            </div>
            <div style="clear: both"></div>
            <div style="float: right">
                <span>申请人签名：<img src="" runat="server"
                    id="EImageCurrentShow" />
                </span>
                <span>&nbsp;&nbsp;</span>
                <span style="padding-right: 10px">日期：<label ID="dateTime"></label></span>
            </div>
            <input type="hidden" runat="server" id="hiLoginId" field="LoginId" tablename="EHR_IC_StaffCertifiedRewardApplyForm" />
        </td>
    </tr>

</table>
<input type="hidden" id="hiKeyId" runat="server" field="StaffCertifiedRewardApplyFormId" tablename="EHR_IC_StaffCertifiedRewardApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        //获取签名
        signImageExe();
        $("#dateTime").html($('#<%=txtApplyDate.ClientID%>').val());
    }
    function signImageExe() {
       
        var isLoginID =  $("#<%=hiLoginId.ClientID%>").val();
        if (isLoginID == "") {

            isLoginID ="<%=KPMSUser.LoginId %>";
        }
        $.ajax({
            type: "Post",
            url: $appCtx.appPath + "/Sys/Handler/ESignHandler.ashx?userSign=" + isLoginID +"&signexe=sign&ticket=<%=Server.UrlEncode(Zhongsoft.Portal.Sys.Handler.ESignHandler.CreateTicket(Context.User.Identity)) %>",
            async: false,
            success: function (msg) {

                $('#<%=EImageCurrentShow.ClientID %>').attr("src", $appCtx.appPath + "/Sys/Handler/ESignHandler.ashx?userSign=" + isLoginID +"&signexe=sign&ticket=<%=Server.UrlEncode(Zhongsoft.Portal.Sys.Handler.ESignHandler.CreateTicket(Context.User.Identity)) %>")

            }
        })

    }

</script>

