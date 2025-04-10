<%@ Page Title="印章登记编辑页" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="SealRegisterEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Seal.SealRegisterEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td colspan="4" class="td-l" style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large">印章登记
            </td>
        </tr>
        <tr>
            <td class="td-l">印章名称<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtSealName" TableName="KMS_Seal_SealRegister" Field="SealName" runat="server" ActiveStatus="(23.*)" req="1" Width="120px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">印章类别<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSealType" TableName="KMS_Seal_SealRegister" Field="SealType" ActiveStatus="(23.*)" req="1"
                    runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiSealTypeText" field="SealTypeText" tablename="KMS_Seal_SealRegister" />
            </td>

            <td class="td-l">开始使用日期<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtStartUseDate" TableName="KMS_Seal_SealRegister" Field="StartUseDate" ActiveStatus="(23.*)" req="1"
                    class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">责任部门<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtResponsibleDeptName" field="ResponsibleDeptName" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Seal_SealRegister" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name" Filter="{OrganizationLevel:'2'}"
                    IsMutiple="false" ResultForControls="{'hiResponsibleDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiResponsibleDeptId" field="ResponsibleDeptId" tablename="KMS_Seal_SealRegister" />
            </td>

            <td class="td-l">责任人<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtResponsiblePerson" field="ResponsiblePerson" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Seal_SealRegister" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode"
                    IsMutiple="false" ResultForControls="{'hiResponsiblePersonId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"  req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiResponsiblePersonId" field="ResponsiblePersonId" tablename="KMS_Seal_SealRegister" />
            </td>
        </tr>
        <tr>
            <td class="td-l">使用范围</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtUseScope" TableName="KMS_Seal_SealRegister" Field="UseScope" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">印章换新记录</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtSealNewRecords" TableName="KMS_Seal_SealRegister" Field="SealNewRecords" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Seal_SealRegister" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">是否公文使用</td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbtIsDocument" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                    tablename="KMS_Seal_SealRegister" field="IsDocument" activestatus="(23.*)">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiIsDocumentText" field="IsDocumentText" tablename="KMS_Seal_SealRegister" />
            </td>
            <td class="td-l" id="Target">公文盖章密码</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtSealPassword" TableName="KMS_Seal_SealRegister" Field="SealPassword" ActiveStatus="(23.*)" runat="server" type="password" Width="120px" />
            </td>
        </tr>
        <tr>
            <td class="td-r" colspan="4">
                <p style="color: red">请务必在点击保存之后上传印章印签图片！</p>
            </td>
        </tr>
        <tr>
            <td class="td-l" rowspan="3">印章印签</td>
            <td class="td-r" colspan="3">
                <asp:FileUpload ID="imgUpload" runat="server" ActiveStatus="(23.*)"/>
                <asp:Button ID="btImgUpload" runat="server" OnClientClick="return GetContents();" Text="上传" ActiveStatus="(23.*)"/>
                <input id="hiImgMes" runat="server" type="hidden" tablename="KMS_Seal_SealRegister" field="ImgName" />
            </td>
        </tr>
        <tr class="tdImg">
            <td class="td-r" colspan="4">
                <zhongsoft:LightTextBox ID="tbImgMes" runat="server" TableName="KMS_Seal_SealRegister" Field="ImgName" ActiveStatus="(1.*)" readonly="true" />
            </td>
        </tr>

    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Seal_SealRegister" field="SealRegisterId" />
    <input type="hidden" runat="server" id="hiSealStatusText" name="hiSealStatusText" tablename="KMS_Seal_SealRegister" field="SealStatusText" />
    <input type="hidden" runat="server" id="hiSealStatus" name="hiSealStatus" tablename="KMS_Seal_SealRegister" field="SealStatus" />
    <asp:Button ID="btnUpLoadImg" runat="server" Visible="false" OnClick="btnUpLoadImg_Click" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    function GetContents() {
        if (!checkReqField()) {
            return false;
        }
        <%=Page.ClientScript.GetPostBackEventReference(this.btnUpLoadImg,"") %>;
        return false;
    }
      
    </script>
</asp:Content>
