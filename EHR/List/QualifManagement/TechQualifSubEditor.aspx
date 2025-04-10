<%@ Page Title="专业技术资格信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TechQualifSubEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.TechQualifSubEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                登录号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUserCode" readonly="readonly" class="kpms-textbox"
                    field="USERCODE" tablename="EHR_TECHQUALIF" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUserName" readonly="readonly" class="kpms-textbox"
                    field="USERNAME" tablename="EHR_TECHQUALIF" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(23.*)" field="ORGUNITNAME" tablename="EHR_TECHQUALIF" style="width: 30%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业技术资格名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTechQualifName" req="1" field="TECHQUALIFNAME"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td> 
          <td class="td-l">
                专业技术资格系列
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechQualifSeries" runat="server" field="TECHQUALIFSERIES"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>          
        </tr>
        <tr>
            <td class="td-l">
                专业技术资格等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechQualifLevel" runat="server" field="TECHQUALIFLEVEL"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" nowrap="nowrap">
                专业技术资格证书编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbQualificationCode" field="QUALIFICATIONCODE"
                    tablename="EHR_TECHQUALIF" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>       
        <tr>
            <td class="td-l">
                取得资格日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtQualifyingTime" class="kpms-textbox-date"
                    field="QUALIFYINGTIME" tablename="EHR_TECHQUALIF" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                最高等级标识
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbIsHighest" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsHighest" runat="server" field="ISHIGHEST" tablename="EHR_TECHQUALIF" />
            </td>
        </tr>      
        <tr>
            <td class="td-l">
                聘任日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAppointStartTime" class="kpms-textbox-comparedate"
                    field="APPOINTSTARTTIME" tablename="EHR_TECHQUALIF" activestatus="(23.*)" readonly="readonly"
                    compare="1" />
            </td>
            <td class="td-l">
                解聘日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAppointEndTime" class="kpms-textbox-comparedate"
                    field="APPOINTENDTIME" tablename="EHR_TECHQUALIF" activestatus="(23.*)" readonly="readonly"
                    compare="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                审批单位
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbApprovalUnit" field="APPROVALUNIT" tablename="EHR_TECHQUALIF"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                批准文件
            </td>
            <td class="td-r" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传文件</span>
                <asp:LinkButton runat="server" ID="btnAttach" OnClientClick="uploadFile()" OnClick="lbtnAttach_Click"
                    DisplayStatus="(3.*)"><span>上传文件</span></asp:LinkButton>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                    ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="1024" tablename="EHR_TECHQUALIF" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="USERID" tablename="EHR_TECHQUALIF" />
    <input type="hidden" runat="server" id="hiTechQualifID" field="TECHQUALIFID" tablename="EHR_TECHQUALIF" /> 
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        } 
        //上传文件
        function uploadFile() {

            var fileSrcId = "<%=BusinessObjectId %>";
            showUploadForm(fileSrcId, "LaborContractEditor");
            return true;
        }
    </script>
</asp:Content>
