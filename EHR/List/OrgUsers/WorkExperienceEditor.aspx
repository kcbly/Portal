<%@ Page Title="工作履历" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="WorkExperienceEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.WorkExperienceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserCode" tablename="EHR_WorkExperience" activestatus="(23.*)" />
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="UserName" tablename="EHR_WorkExperience" />
            </td>
        </tr>
        <tr>
            <td class="td-l">所在部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_WorkExperience" activestatus="(23.*)" />
            </td>
            <td class="td-l">单位性质
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCORPPROPERTY" field="CORPPROPERTY" tablename="EHR_WorkExperience"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">单位（公司）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWORKCORP" field="WORKCORP" tablename="EHR_WorkExperience"
                    req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">行业
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbIndustry" field="Industry" tablename="EHR_WorkExperience"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">开始时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtStartDate" class="kpms-textbox-comparedate" field="STARTDATE" tablename="EHR_WorkExperience" activestatus="(23.*)"
                    compare="1" />
            </td>
            <td class="td-l">结束时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
                    field="ENDDATE" tablename="EHR_WorkExperience" activestatus="(23.*)" compare="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">工作部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWORKDEPT" field="WORKDEPT" tablename="EHR_WorkExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">科室
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWORKSUBDEPT" field="WORKSUBDEPT" tablename="EHR_WorkExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">岗位名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPOST" field="POST" tablename="EHR_WorkExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">职务
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRANKNAME" field="RANKNAME" tablename="EHR_WorkExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">证明人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbWitness" field="Witness" tablename="EHR_WorkExperience"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">证明人联系方式
            </td>
            <td class="td-r">
                 <zhongsoft:LightTextBox runat="server" ID="tbWitnessInformation" field="WitnessInformation" tablename="EHR_WorkExperience"
                    MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否缴纳社保
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbISINSURANCE" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiISINSURANCE" runat="server" field="ISINSURANCE" tablename="EHR_WorkExperience" />
            </td>
           <%-- <td class="td-l">参加工作标识
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbParticipateWork" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiISPARTICIPANTWORK" runat="server" field="ISPARTICIPANTWORK"
                    tablename="EHR_WorkExperience" />
            </td>--%>
             <td class="td-l">进公司标识
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cInCorp" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsInCorp" runat="server" field="IsInCorp" tablename="EHR_WorkExperience" />
            </td>
        </tr>
      <%--  <tr>
            <td class="td-l">专业工龄标识
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbSpecialtyYears" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsSpecialtyYears" runat="server" field="IsSpecialtyYears"
                    tablename="EHR_WorkExperience" />
            </td>
           
        </tr>--%>
        <tr>
            <td class="td-l">最新工作履历标识
            </td>
            <td class="td-r" colspan="3" >
                <asp:CheckBox ID="cbIsNew" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsNew" runat="server" field="IsNew" tablename="EHR_WorkExperience" />
            </td>
           <%-- <td class="td-l">连续工龄标识
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbContinuousYears" runat="server" Text="是" activestatus="(23.*)" />
                <input type="hidden" id="hiIsContinuousYears" runat="server" field="IsContinuousYears"
                    tablename="EHR_WorkExperience" />
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="EHR_WorkExperience" field="Memo"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_WorkExperience" />
    <input type="hidden" runat="server" id="hiWorkExperienceID" field="WorkExperienceID"
        tablename="EHR_WorkExperience" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>
