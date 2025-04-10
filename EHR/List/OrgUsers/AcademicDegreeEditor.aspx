<%@ Page Title="学历学位" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="AcademicDegreeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.AcademicDegreeEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">

                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly" class="kpms-textbox" req="1"
                    field="UserCode" tablename="EHR_AcademicDegree" activestatus="(23.*)" />
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="UserName" tablename="EHR_AcademicDegree" />
            </td>
        </tr>
<%--        <tr>
            <td class="td-l">部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_AcademicDegree" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>--%>
        <tr>
            <td class="td-l">入学时间
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtENROLLMENTDATE"
                    class="kpms-textbox-comparedate" field="ENROLLMENTDATE" tablename="EHR_AcademicDegree"
                    activestatus="(23.*)" compare="1"/>
            </td>
            <td class="td-l">毕业时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtGRADUATEDATE"
                    class="kpms-textbox-comparedate" field="GRADUATEDATE" tablename="EHR_AcademicDegree"
                    activestatus="(23.*)" compare="1" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">教育类型/学历<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEducation" field="Education" tablename="EHR_AcademicDegree"
                    req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">教育/培训<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlEducationType" runat="server" field="EducationType"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">证书
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCertificateName" runat="server" field="CertificateName"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" >
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">学制（课程持续时间）（年）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSchoolingLength" field="SchoolingLength"
                    tablename="EHR_AcademicDegree" MaxLength="4" class="kpms-textbox-money"
                    activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>            
        </tr>
        <tr>
            <td class="td-l">从学单位类别<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnitCategory" field="UnitCategory"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">毕业院校<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbGraduateSchool" field="GraduateSchool"
                    tablename="EHR_AcademicDegree" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"
                    req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">学院（系）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbColleges" field="Colleges"
                    tablename="EHR_AcademicDegree" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">专业名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMAJORSPECIALTY" field="MAJORSPECIALTY"
                    tablename="EHR_AcademicDegree" MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否最高学历标识<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsDegree" runat="server" field="IsDegree"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">是否就业学历标识<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsWorkDegree" runat="server" field="IsWorkDegree"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">学位名称
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAcademicDegree" runat="server" field="AcademicDegree"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <%--<zhongsoft:LightTextBox runat="server" ID="tbAcademicDegree" field="AcademicDegree"
                    tablename="EHR_AcademicDegree" MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>--%>
            </td>
            <td class="td-l">是否最高学位标识
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsMaxAcademic" runat="server" field="IsMaxAcademic"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
         <tr>
            <td class="td-l">是否初始学位标识<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsFirstAcademic" runat="server" field="IsFirstAcademic"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">是否单位送培标识<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsDWSPAcademic" runat="server" field="IsDWSPAcademic"
                    tablename="EHR_AcademicDegree" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="EHR_AcademicDegree"
                    Maxtext="256" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.*)"
                    TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
<%--        <tr>
            <td class="td-l" rowspan="3">相关附件</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.*)" displaystatus="(3.*)" OnClick="upLoadFile_Click">
<span><img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>--%>
<%--        <tr>
            <td class="td-r" colspan="3">
                <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
            </td>
        </tr>--%>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_AcademicDegree" />
    <input type="hidden" runat="server" id="hiAcademicDegreeID" field="AcademicDegreeID"
        tablename="EHR_AcademicDegree" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
