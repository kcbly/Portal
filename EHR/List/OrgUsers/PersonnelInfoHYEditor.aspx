<%@ Page Title="员工个人基本信息编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="PersonnelInfoHYEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelInfoHYEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l">登录号 <span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbUSERCODE" runat="server" ActiveStatus="(23.?)" Field="LOGINID"
                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
            </td>

            <td class="td-l">姓名 <span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbUserName" runat="server" ActiveStatus="(23.?)" Field="UserName"
                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
            </td>
            <td class="td-l">曾用名
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbUSEDNAME" runat="server" ActiveStatus="(23.?)" Field="USEDNAME"
                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" />
            </td>

        </tr>
        <tr>
            <td class="td-l">拼音姓名
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbABBRNAME" runat="server" ActiveStatus="(23.?)" Field="ABBRNAME"
                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" regex="^[a-zA-Z\s]+$"
                    errmsg="请输入正确的拼音姓名" />
            </td>
            <td class="td-l">性别
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex" Width="105px" tablename="OrganizationUsers"
                    activestatus="(23.?)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">籍贯
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbHometown" runat="server" ActiveStatus="(23.?)" Field="Hometown"
                    CssClass="kpms-textbox" MaxLength="128" TableName="OrganizationUserProfile" />
            </td>

        </tr>
        <tr>
            <td class="td-l">民族
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlNation" field="Nation" Width="105px" tablename="OrganizationUserProfile"
                    activestatus="(23.?)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">出生日期
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtBirthday" CssClass="kpms-textbox"
                    activestatus="(23.?)" />
                <input type="hidden" id="hdnBirthday" tablename="OrganizationUserProfile" field="Birthday" runat="server" />
            </td>
            <td class="td-l">证件号码
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbIdentityCardNO" runat="server" ActiveStatus="(23.?)"
                    Field="IdentityCardNO" CssClass="kpms-textbox" MaxLength="18" TableName="OrganizationUserProfile" />
            </td>

        </tr>
        <tr>
            <%--            <td class="td-l">年龄
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbAge" runat="server" ActiveStatus="(23.?)" Field="Age"
                    CssClass="kpms-textbox" MaxLength="128" TableName="OrganizationUserProfile" />
            </td>--%>
            <td class="td-l">用工性质
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbEmploymentForm" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="EmploymentForm" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">工作时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtWORKDATE" CssClass="kpms-textbox"
                 activestatus="(23.?)" />
                <input type="hidden" id="hdnWORKDATE" tablename="OrganizationUserProfile" field="WORKDATE" runat="server" />
            </td>
            <td class="td-l">人员状态
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlState" Width="205px" field="State" tablename="OrganizationUserProfile"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>

            <td class="td-l">社会工作时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtWorkTime" CssClass="kpms-textbox"
                    activestatus="(23.?)" />
                <input type="hidden" id="hdnWorkTime" tablename="OrganizationUserProfile" field="WorkTime" runat="server" />
            </td>
            <td class="td-l">所在部门
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector ID="losOrgUnitName" runat="server" ActiveStatus="(23,*)" ResultForControls="{'hdnOrganizationID':'id'}" SourceMode="SelectorPage" ShowJsonRowColName="true" PageWidth="750" SelectPageMode="Dialog" DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" IsMutiple="false" />
                <input type="hidden" id="hdnOrganizationID" tablename="OrganizationUsers" field="OrganizationID" runat="server" />
                <input type="hidden" id="hdnDEPTID" runat="server" />
            </td>
            <td class="td-l">科室
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector ID="losOrgInternal" runat="server" ActiveStatus="(23,*)" ResultForControls="{'hdnOrgInternal':'id'}" SourceMode="SelectorPage" ShowJsonRowColName="true" PageWidth="750" SelectPageMode="Dialog" DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" IsMutiple="false" Filter="{'OrganizationLevel':'3'}" AfterSelect="setOrgId()" />
                <input type="hidden" id="hdnOrgInternal" runat="server" />
            </td>

        </tr>
        <tr>

            <td class="td-l">兼职部门
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector ID="losAttachmentDeptName" TableName="OrganizationUserProfile" Field="AttachmentDeptName" runat="server" ActiveStatus="(23,*)" ResultForControls="{'hdnOrgInternalId':'id'}" SourceMode="SelectorPage" ShowJsonRowColName="true" PageWidth="750" SelectPageMode="Dialog" DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" IsMutiple="false" />
                <input type="hidden" id="hdnAttachmentDeptID" tablename="OrganizationUserProfile" field="AttachmentDeptID" runat="server" />
            </td>
            <td class="td-l">现任职务
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbUserRank" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="UserRank" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">职称
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbPostName" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="PostName" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>

            <td class="td-l">入党时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtJoinPartyDate" CssClass="kpms-textbox"
                    field="JoinPartyDate" tablename="OrganizationUserProfile" activestatus="(23.?)" />
            </td>
            <td class="td-l">毕业学校
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbSchoolName" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="SchoolName" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">专业
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbFirstMajor" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="FirstMajor" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>

        </tr>
        <tr>
            <td class="td-l">全日制学历
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbMBAEducation" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="MBAEducation" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">全日制学位
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbMBADegree" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="MBADegree" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">最高学历毕业学校
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbHighSchoolName" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="HighSchoolName" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>


        </tr>
        <tr>
            <td class="td-l">最高学历专业
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbHighMajor" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="HighMajor" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">在职学历学位
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbOnJobEducation" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="OnJobEducation" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">毕业时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtGraduateDate" CssClass="kpms-textbox"
                    field="GraduateDate" tablename="OrganizationUserProfile" activestatus="(23.?)" />
            </td>
        </tr>
        <tr>

            <td class="td-l">注册证
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbRegisterCertificate" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="RegisterCertificate" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>

            <td class="td-l">其他
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbMemo" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="MEMO" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">正职时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtBecomePositionDate" CssClass="kpms-textbox"
                    field="BecomePositionDate" tablename="OrganizationUserProfile" activestatus="(23.?)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">职务级别
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbProfessionRank" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="ProfessionRank" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">现职时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtNowPositionDate" CssClass="kpms-textbox"
                    field="NowPositionDate" tablename="OrganizationUserProfile" activestatus="(23.?)" />
            </td>
            <td class="td-l">主职任职时间
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="txtMainPositionDate" CssClass="kpms-textbox"
                    field="MainPositionDate" tablename="OrganizationUserProfile" activestatus="(23.?)" />
            </td>
        </tr>
        <tr>
            <%--            <td class="td-l">任职年限
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbWorkAge" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="WorkAge" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>--%>
            <%--            <td class="td-l">年龄段
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="ltbAgeGroup" runat="server" ActiveStatus="(23.?)" Width="195px"
                    Field="AgeGroup" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>--%>
            <td class="td-l">内网电脑ip地址
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="txtIPv4" runat="server" ActiveStatus="(23.*)" Field="IpAddr" DataType="IPv4"
                    MaxLength="15" Width="295" TableName="OrganizationUserProfile"
                    errmsg="请输入正确的IPv4地址" />
            </td>

        </tr>
        <%--<tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" ActiveStatus="(23.?)" Field="Memo"
                    TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Maxtext="512"
                    TableName="OrganizationUserProfile" />
            </td>
        </tr>--%>
    </table>

    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiEXUserId" field="UserId" tablename="OrganizationUserProfile" />
    <input type="hidden" runat="server" id="hiIsIncorp" field="isIncorp" value="1" tablename="OrganizationUserProfile" />
    <script type="text/javascript">
        //计算年龄&设置星座
        $("#<%=txtBirthday.ClientID %>").live('blur', function () {
            calculateAge();
            //SetConstellation();
        });
        //自动按照名称转出简拼名称
        $('#<%=tbUserName.ClientID %>').live('blur', function () {
            queryPinYin();
        });

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

        }
        //两端去空格函数  
        String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }
        //名字转拼音首字母
        function queryPinYin() {
            var str = $('#<%=tbUserName.ClientID %>').val().trim();
            if (str == "") return;
            var arrRslt = HanZi_PinYin.get(str);
            $('#<%=tbABBRNAME.ClientID %>').val(arrRslt);
        }
       <%-- function conditionDept() {
            var obj = $('#<%=hdnDEPTID.ClientID %>').val().trim();
            alert(obj);
            if (obj != "") {
                return "{'OrganizationLevel':'3','ParentID':'" + obj + "'}";
            }
            else {
                return "{'OrganizationLevel':'3'}";
            }
        }--%>

        function setOrgId() {
            var obj = $('#<%=hdnOrgInternal.ClientID %>').val();
            if (obj.length > 0) {
                $('#<%=hdnOrganizationID.ClientID %>').val(obj);
            }
        }

    </script>
</asp:Content>
