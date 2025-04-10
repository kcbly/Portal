<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProExperienceEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ProExperienceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="UserName" tablename="EHR_ProExperience" />
            </td>
            <td class="td-l">工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_ProExperience"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_ProExperience" activestatus="(23.*)"
                    style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" field="ProjectName"
                    tablename="EHR_ProExperience" req="1" MaxLength="128" class="kpms-textbox"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" field="ProjectCode"
                    tablename="EHR_ProExperience" MaxLength="20" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                项目规模
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectScale" field="ProjectScale" tablename="EHR_ProExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
         <tr>
            <td class="td-l">
                完成情况
            </td>
            <td class="td-r">
                 <zhongsoft:LightTextBox runat="server" ID="tblFinisheValuate" field="FINISHVALUATE" tablename="EHR_ProExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
           <td class="td-l">
                担任角色
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRoleName" field="RoleName" tablename="EHR_ProExperience"
                    MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                上任日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtAppointDate"
                    class="kpms-textbox-comparedate" req="1" field="AppointDate" tablename="EHR_ProExperience"
                    activestatus="(23.*)" compare="1"/>
            </td>
            <td class="td-l">
                卸任日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtLEAVEDATE"
                    class="kpms-textbox-comparedate" req="1" field="LEAVEDATE" tablename="EHR_ProExperience"
                    activestatus="(23.*)" compare="1"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主要任务及工作内容
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbWorkContent" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="EHR_ProExperience"
                    field="WorkContent" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_ProExperience" />
    <input type="hidden" runat="server" id="hiPROEXPERIENCEID" field="PROEXPERIENCEID"
        tablename="EHR_ProExperience" /> 
</asp:Content>
