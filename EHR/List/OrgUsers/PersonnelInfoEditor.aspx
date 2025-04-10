<%@ Page Title="员工个人基本信息编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditorNew.Master"
    AutoEventWireup="true" CodeBehind="PersonnelInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelInfoEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li class="baseInfo" style="display: none"><a href='#baseInfo' id='abaseInfo' onclick="return selectTab(0,false)">
                基本信息</a></li>
            <li class="work" style="display: none"><a href='#work' id='awork' onclick="return selectTab(1,false)">
                工作履历</a></li>
            <li class="degree" style="display: none"><a href='#degree' id='adegree' onclick="return selectTab(2,false)">
                学历及学位</a></li>
           <%-- <li class="skillLevel" style="display: none"><a href='#skillLevel' id='askillLevel'
                onclick="return selectTab(3,false)">技术职称</a></li>--%>
            <li class="titlePositionChange" style="display: none"><a href='#titlePositionChange'
                id='atitlePositionChange' onclick="return selectTab(4,false)">职务</a></li>
            <li class="contract" style="display: none"><a href='#contract' id='aContract' onclick="return selectTab(5,false)">
                劳动合同</a></li>
            <li class="positionChange" style="display: none"><a href='#positionChange' id='apositionChange'
                onclick="return selectTab(6,false)">岗位变动</a></li>
            <li class="soldier" style="display: none"><a href='#soldier' id='asoldier' onclick="return selectTab(7,false)">
                复转军人信息</a></li>
            <li class="train" style="display: none"><a href='#train' id='atrain' onclick="return selectTab(8,false)">
                教育培训</a></li>
            <li class="practiceCareer" style="display: none"><a href='#practiceCareer' id='aPracticeCareer'
                onclick="return selectTab(9,false)">资格信息</a></li>
            <li class="medio" style="display: none"><a href='#medio' id='amedio' onclick="return selectTab(10,false)">
                多媒体信息</a></li>
            <li class="file" style="display: none"><a href='#file' id='afile' onclick="return selectTab(11,false)">
                档案信息</a></li>
            <li class="specialist" style="display: none"><a href='#specialist' id='aspecialist'
                onclick="return selectTab(12,false)">专家人才</a></li>
            <li class="project" style="display: none"><a href='#project' id='aproject' onclick="return selectTab(13,false)">
                项目履历</a></li>
            <li class="scholarship" style="display: none"><a href='#scholarship' id='ascholarship'
                onclick="return selectTab(14,false)">学术团体</a></li>
            <li class="prize" style="display: none"><a href='#prize' id='aprize' onclick="return selectTab(15,false)">
                获奖信息</a></li>
            <%--<li class="language" style="display: none"><a href='#language' id='alanguage' onclick="return selectTab(12,false)">
                语言能力</a></li>
                <li class="family" style="display: none"><a href='#family' id='afamily' onclick="return selectTab(17,false)">
                家庭成员</a></li>>
                <li class="politicalAffiliation" style="display: none"><a href='#politicalAffiliation'
                id='apoliticalAffiliation' onclick="return selectTab(18,false)">党派名称</a></li>--%>
        </ul>
        <div id="baseInfo" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l" rowspan="6">
                                照片
                            </td>
                            <td class="td-m" rowspan="6" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <img id="img1" width="150" height="200" src="../../../Sys/FileDocument/FileDownload.aspx?fileId=<%=FieldID %>&flg=1"
                                                onerror="javascript:this.src='../../../Themes/Images/nophoto.gif'">
                                            <asp:Image ID="imagePhoto" runat="server" Height="150px" Width="150px" Visible="false" />
                                            <uc3:UpLoadFile ID="uploadPhoto" runat="server" Visible="false" />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnuploadPhoto" runat="server" DisplayStatus="(3.*)" OnClick="btnuploadPhoto_Click"
                                                CssClass="kpms-btn"><img src="../../../Themes/Images/btn_upload.gif" /><span>上传照片</span></asp:LinkButton>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="btnupdeletePhoto" runat="server" CssClass="kpms-btn" DisplayStatus="(3.*)"
                                                OnClick="btnupdeletePhoto_Click" OnClientClick="return confirm('确定要删除照片吗？')"><img src="../../../Themes/Images/btn_delete.gif" /><span>删除照片</span></asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="lbtnFresh" CssClass="kpms-btn" EnableTheming="false"
                                                OnClick="lbtnFresh_Click" Visible="false"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="td-l">
                                工号 <span class="req-star" state="1">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbUSERCODE" runat="server" ActiveStatus="(23.*)" Field="LOGINID"
                                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
                             
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                姓名 <span class="req-star" state="1">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbUserName" runat="server" ActiveStatus="(23.*)" Field="UserName"
                                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                拼音姓名
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbABBRNAME" runat="server" ActiveStatus="(23.*)" Field="ABBRNAME"
                                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" regex="^[a-zA-Z\s]+$"
                                    errmsg="请输入正确的拼音姓名" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                曾用名
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbUSEDNAME" runat="server" ActiveStatus="(23.*)" Field="USEDNAME"
                                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                性别<span class="req-star" state="1">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex" tablename="OrganizationUsers"
                                    req="1" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                身份证号<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbIdentityCardNO" runat="server" ActiveStatus="(23.*)"
                                    Field="IdentityCardNO" CssClass="kpms-textbox" MaxLength="18" TableName="OrganizationUserProfile"
                                    req="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                民族<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlNation" field="Nation" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                出生日期<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtBirthday" class="kpms-textbox-date"
                                    field="Birthday" req="1" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                星座
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList ID="ddlConstellation" runat="server" field="Constellation"
                                    tablename=" OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                年龄
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtYears" class="kpms-textbox-money"
                                    style="width: 70px" field="Age" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                籍贯 <span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbHometown" runat="server" ActiveStatus="(23.*)" Field="Hometown"
                                    CssClass="kpms-textbox" MaxLength="128" TableName="OrganizationUserProfile" req="1" />
                            </td>
                            <td class="td-l">
                                归口
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlCENTRALIZEDMANAGER" field="CENTRALIZEDMANAGER"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                个人身份
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlUSERIDENTITY" field="USERIDENTITY"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                现身份起始日期
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtIDENTITYSTARTDATE" field="IDENTITYSTARTDATE"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly"
                                    class="kpms-textbox-date" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                人员状态<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlState" field="State" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                人员类别<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlCategory" field="Category" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                用工形式
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" field="EmploymentForm"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                正式工/外聘工 <span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <asp:RadioButtonList ID="radFORMALEXTERNAL" runat="server" RepeatDirection="Horizontal"
                                    ActiveStatus="(23.*)" Field="FORMALEXTERNAL" TableName="OrganizationUserProfile"
                                    req="1">
                                    <asp:ListItem Text="正式工" Value="正式工"></asp:ListItem>
                                    <asp:ListItem Text="外聘工" Value="外聘工"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                减员日期
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtAttritionDate" field="AttritionDate"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly"
                                    class="kpms-textbox-date" />
                            </td>
                            <td class="td-l">
                                身故日期
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="tbDeadDate" field="DeadDate" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" readonly="readonly" class="kpms-textbox-date" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                复转军人类别
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSoldierType" field="SoldierType"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly"
                                    class="kpms-textbox" style="width: 70px" />
                            </td>
                            <td class="td-l">
                                保险手册号
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbInsuranceCode" runat="server" field="InsuranceCode"
                                    tablename="OrganizationUserProfile" activestatus="(23.N)" MaxLength="32"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                企业年金号
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbAnnuity" runat="server" field="Annuity" tablename="OrganizationUserProfile"
                                    activestatus="(23.N)" MaxLength="32"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                失业保险号
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbUnemploymentCode" runat="server" field="UnemploymentCode"
                                    tablename="OrganizationUserProfile" activestatus="(23.N)" MaxLength="32"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                公积金号
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbProvidentFundCode" runat="server" field="ProvidentFundCode"
                                    tablename="OrganizationUserProfile" activestatus="(23.N)" MaxLength="32"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                医疗保险号
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbMedicalCode" runat="server" field="MedicalCode" tablename="OrganizationUserProfile"
                                    activestatus="(23.N)" MaxLength="32"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                计算机代码
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbComputerCode" runat="server" field="COMPUTERCODE" EnableTheming="false"
                                    Width="100px" tablename="OrganizationUserProfile" activestatus="(23.*)" MaxLength="20"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                开户行
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbBankAccount" runat="server" field="BANKACCOUNT" EnableTheming="false"
                                    Width="200px" tablename="OrganizationUserProfile" activestatus="(23.*)" MaxLength="30"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                薪资银行卡号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbBankCardNumber" runat="server" field="BANKCARDNUMBER"
                                    EnableTheming="false" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    MaxLength="20"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td class="kpms-rollist-hand" colspan="6">
                                <img id="img6" src="../../../Themes/Images/btn_title.gif" />
                                现状
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                所属部门<span class="req-star" state="1">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox-short"
                                    req="1" field="OrgUnitName" tablename="OrganizationUsers" activestatus="(23.*)" />
                                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                                    tablename="OrganizationUsers" />
                                <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept(1)"
                                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                        <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                            </td>
                            <td class="td-l">
                                借调部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtSecondedOrganizationName" runat="server" class="kpms-textbox-short"
                                    field="SECONDORGDEPTNAME" tablename="OrganizationUserProfile" activestatus="(23.*)" />
                                <input type="hidden" runat="server" id="hiSecondedOrganizationId" field="SECONDORGDEPTID"
                                    tablename="OrganizationUserProfile" />
                                <asp:LinkButton runat="server" ID="lbtnChoosSecondedeDept" OnClientClick="return ChooseDept(2)"
                                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                        <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                            </td>
                            <td class="td-l">
                                岗位名称
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" field="PositionNames" tablename="OrganizationUserProfile"
                                    readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                技术职称
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtTitle" runat="server" activestatus="(23.*)" field="SKILLTITLE"
                                    tablename="OrganizationUserProfile" readonly="readonly" class="kpms-textbox" />
                            </td>
                            <td class="td-l">
                                评定日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtAssessmentDate" runat="server" activestatus="(23.*)"
                                    field="SKILLDESERVEDATE" tablename="OrganizationUserProfile" readonly="readonly"
                                    class="kpms-textbox-date" />
                            </td>
                            <td class="td-l">
                                聘任日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtAppointStartTime" runat="server" activestatus="(23.*)"
                                    field="SKILLAPPOINTDATE" tablename="OrganizationUserProfile" readonly="readonly"
                                    class="kpms-textbox" style="width: 70px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                工人等级
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtWorkLevel" runat="server" readonly="readonly" class="kpms-textbox"
                                    field="SKILLLEVEL" tablename="OrganizationUserProfile" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                定级日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtLEVELDATE" runat="server" activestatus="(23.*)"
                                    field="LEVELDATE" tablename="OrganizationUserProfile" readonly="readonly" class="kpms-textbox-date" />
                            </td>
                            <td class="td-l">
                                解聘日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtSKILLLEAVEDATE" runat="server" activestatus="(23.*)"
                                    field="SKILLLEAVEDATE" tablename="OrganizationUserProfile" readonly="readonly"
                                    class="kpms-textbox" style="width: 70px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                职务
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="tbRANKNAME" runat="server" activestatus="(23.*)" field="RANKNAME"
                                    tablename="OrganizationUserProfile" readonly="readonly" class="kpms-textbox" />
                            </td>
                            <td class="td-l">
                                行政级别
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtRANKLEVEL" runat="server" activestatus="(23.*)"
                                    field="RANKLEVEL" tablename="OrganizationUserProfile" readonly="readonly" class="kpms-textbox" />
                            </td>
                            <td class="td-l">
                                政治面貌
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList ID="ddlPoliticalStatus" runat="server" activestatus="(23.*)"
                                    field="PoliticalLandscape" tablename="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <%-- <tr>
                            <td class="td-l">
                                党派名称
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtPoliticalAffiliation" runat="server" 
                                    class="kpms-textbox" 
                                    field="PoliticalLandscape" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                参加党派日期
                            </td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:XHtmlInputText ID="txtAttendDate" runat="server" activestatus="(23.*)"
                                    readonly="readonly" class="kpms-textbox" style="width: 70px" />
                            </td>
                        </tr>--%>
                        <tr>
                            <td class="td-l">
                                参加工作日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtWorkingTime" class="kpms-textbox-date"
                                    field="WORKDATE" tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly" />
                            </td>
                            <td class="td-l">
                                进入本系统日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtINNOWGROUPDATE" class="kpms-textbox-date"
                                    field="INNOWGROUPDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                            <td class="td-l">
                                进院日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtInUnitTime" class="kpms-textbox-date"
                                    field="INNOWCORPDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                转正日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtREGULARDATE" class="kpms-textbox-comparedate"
                                    field="REGULARDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" compare="1" />
                            </td>
                            <td class="td-l">
                                起薪日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSALARYSTARTDATE" class="kpms-textbox-comparedate"
                                    field="SALARYSTARTDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" compare="1" />
                            </td>
                            <td class="td-l">
                                停薪日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSALARYENDDATE" class="kpms-textbox-comparedate"
                                    field="SALARYENDDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" compare="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                院龄
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtInstitutionYears" class="kpms-textbox"
                                    field="InstitutionYears" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                            <td class="td-l">
                                连续工龄起始日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtContinuousYearsSartDate" class="kpms-textbox"
                                    field="ContinuousYearsSartDate" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                            <td class="td-l">
                                连续工龄
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtContinuousYears" class="kpms-textbox"
                                    field="ContinuousYears" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                从事专业
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtSpecialty" runat="server" readonly="readonly" class="kpms-textbox"
                                    activestatus="(23.*)" field="SPECIALTY" tablename="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">
                                专业工龄起始日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyYearsStartDate" class="kpms-textbox"
                                    field="SpecialtyYearsStartDate" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                            <td class="td-l">
                                专业工龄
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecialtyYears" class="kpms-textbox"
                                    field="SpecialtyYears" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                文化程度
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtEducation" runat="server" readonly="readonly" class="kpms-textbox"
                                    field="Education" tablename="OrganizationUserProfile" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                学历性质
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtEducationType" runat="server" readonly="readonly"
                                    class="kpms-textbox" field="EducationType" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                毕业日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtGraduateDate" class="kpms-textbox"
                                    style="width: 70px" field="GraduateDate" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                学制
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtSchoolingLength" runat="server" readonly="readonly"
                                    class="kpms-textbox" field="SchoolingLength" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                毕业专业
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtMAJORSPECIALTY" runat="server" readonly="readonly"
                                    class="kpms-textbox" field="MAJORSPECIALTY" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                毕业学校
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtGraduateSchool" runat="server" readonly="readonly"
                                    class="kpms-textbox" field="GraduateSchool" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                婚姻状况
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlMARITALSTATE" field="MARITALSTATE"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td class="kpms-rollist-hand" colspan="6">
                                <img id="img2" src="../../../Themes/Images/btn_title.gif" />
                                联系方式
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                办公电话
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbPhone" runat="server" ActiveStatus="(23.*)" Field="Phone"
                                    MaxLength="64" TableName="OrganizationUsers" />
                            </td>
                            <td class="td-l">
                                手机号码
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbMobliePhone" runat="server" ActiveStatus="(23.*)" Field="MobilePhone"
                                    axLength="64" TableName="OrganizationUsers" regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$"
                                    errmsg="请输入正确的手机号码" />
                            </td>
                            <td class="td-l">
                                家庭电话
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbFamilyPhone" runat="server" ActiveStatus="(23.*)" Field="FamilyPhone"
                                    MaxLength="64" TableName="OrganizationUserProfile" regex="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                                    errmsg="请输入正确的家庭电话" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                家庭邮编
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbPostalCode" runat="server" ActiveStatus="(23.*)" Field="POST"
                                    MaxLength="6" TableName="OrganizationUserProfile" regex="^[0-9]*$" errmsg="请输入正确的邮编" />
                            </td>
                            <td class="td-l">
                                家庭住址
                            </td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:LightTextBox ID="tbFamilyAddress" runat="server" ActiveStatus="(23.*)"
                                    Field="FamilyAddress" MaxLength="128" TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                传真
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbFax" runat="server" ActiveStatus="(23.*)" Field="Fax"
                                    MaxLength="64" TableName="OrganizationUserProfile" regex="^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$"
                                    errmsg="请输入正确的传真" />
                            </td>
                            <td class="td-l">
                                Email
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbEmail" runat="server" ActiveStatus="(23.*)" Field="Email"
                                    MaxLength="64" TableName="OrganizationUsers" regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$"
                                    errmsg="请输入正确的Email" />
                            </td>
                            <td class="td-l">
                                房间号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbSeatNO" runat="server" ActiveStatus="(23.*)" Field="SeatNO"
                                    MaxLength="20" TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                位置
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbLocation" runat="server" ActiveStatus="(23.*)" Field="Location"
                                    MaxLength="10" TableName="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">
                                楼层
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbFloor" runat="server" ActiveStatus="(23.*)" Field="Floor"
                                    MaxLength="5" TableName="OrganizationUsersProfile" />
                            </td>
                            <td class="td-l">
                                房间
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbRoom" runat="server" ActiveStatus="(23.*)" Field="Room"
                                    MaxLength="10" TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                备注
                            </td>
                            <td class="td-m" colspan="5">
                                <zhongsoft:LightTextBox ID="tbMemo" runat="server" ActiveStatus="(23.*)" Field="Memo"
                                    TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Maxtext="512"
                                    TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUsers" />
                    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="OrganizationUsers" value="1" />
                    <input type="hidden" runat="server" id="hiEXUserId" field="UserId" tablename="OrganizationUserProfile" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="degree" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode1" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName1" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept1" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span1" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增学历学位信息</span>
                                <asp:LinkButton runat="server" ID="btnAddDegree" class="kpms-btn" OnClick="btnAddDegree_Click"
                                    OnClientClick="return DegreeItem('','2')" displaystatus="(3.*)">
                                     <span>新增学历学位信息</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvDegree" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="AcademicDegreeID"
                        OnRowCommand="gvDegree_RowCommand" OnRowDataBound="gvDegree_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="学历" DataField="Education"></asp:BoundField>
                            <asp:BoundField HeaderText="学位" DataField="AcademicDegree"></asp:BoundField>
                            <asp:BoundField HeaderText="专业" DataField="MAJORSPECIALTY"></asp:BoundField>
                            <asp:BoundField HeaderText="学历性质" DataField="EducationType"></asp:BoundField>
                            <asp:BoundField HeaderText="入学日期" DataField="ENROLLMENTDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="毕业日期" DataField="GraduateDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="院校名称" DataField="GraduateSchool"></asp:BoundField>
                            <asp:BoundField HeaderText="最高学历标识" DataField="IsHighest2"></asp:BoundField>
                            <asp:BoundField HeaderText="留学标识" DataField="IsAbroad2"></asp:BoundField>
                            <asp:BoundField HeaderText="公费标识" DataField="IsPublicExpense2"></asp:BoundField>
                            <asp:BoundField HeaderText="留学国别" DataField="AbroadCountry"></asp:BoundField>
                            <asp:BoundField HeaderText="回国时间" DataField="BackDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return DegreeItem("<%#DataBinder.Eval(Container.DataItem,"AcademicDegreeID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return DegreeItem("<%#DataBinder.Eval(Container.DataItem,"AcademicDegreeID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"AcademicDegreeID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="titlePositionChange" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel15" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode13" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName13" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept13" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-m" style="text-align: right">
                                <span id="Span14" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增职务</span>
                                <asp:LinkButton runat="server" ID="btnPositionChange" class="kpms-btn" OnClick="btnPositionChange_Click"
                                    OnClientClick="return PositionChangeItem('','2')" displaystatus="(3.*)">
                                     <span>新增职务</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvPositionChange" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PARTYGOVRANKID"
                                    OnRowCommand="gvPositionChange_RowCommand" OnRowDataBound="gvPositionChange_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="担任职务时部门" DataField="RANKDEPTNAME" />
                                        <asp:BoundField HeaderText="职务名称" DataField="RANKNAME"></asp:BoundField>
                                        <asp:BoundField HeaderText="职务级别" DataField="RANKLEVEL"></asp:BoundField>
                                        <asp:BoundField HeaderText="任职日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="免职日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="是否现行政<br />职务" DataField="IsNow2" HtmlEncode="false">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="是否最高<br />行政级别" DataField="ISHIGHEST2" HtmlEncode="false">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PositionChangeItem("<%#DataBinder.Eval(Container.DataItem,"PARTYGOVRANKID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PositionChangeItem("<%#DataBinder.Eval(Container.DataItem,"PARTYGOVRANKID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PARTYGOVRANKID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="train" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode2" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName2" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept2" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvTraining" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" OnRowCommand="gvTraining_RowCommand"
                        OnRowDataBound="gvTraining_RowDataBound" BindGridViewMethod="DataTrainingBind"
                        RowStyle-Wrap="true">
                        <Columns>
                            <asp:BoundField HeaderText="培训时所在部门" DataField="DEPTNAME" ItemStyle-Width="5%"></asp:BoundField>
                            <asp:BoundField HeaderText="培训时职务" DataField="DUTY" ItemStyle-Width="5%"></asp:BoundField>
                            <asp:BoundField HeaderText="培训时学历" DataField="EDUCATION" ItemStyle-Width="5%"></asp:BoundField>
                            <asp:BoundField HeaderText="培训形式" DataField="TRAININGFORM" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="培训类别" DataField="TRAININGCLASS" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="培训内容" DataField="TRAINCONTENT" ItemStyle-Width="10%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="培训单位" DataField="TRAINCOMPANY" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="参培学时" DataField="TRAININGCLASSHOUR1" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="培训费用（元）" DataField="COST" ItemStyle-Width="5%"></asp:BoundField>
                            <asp:BoundField HeaderText="学时" DataField="TRAININGCLASSHOUR2" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="开始日期" DataField="TRAINSTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="10%"></asp:BoundField>
                            <asp:BoundField HeaderText="结束日期" DataField="TRAINENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="10%"></asp:BoundField>
                            <asp:BoundField HeaderText="培训项目名称" DataField="TRAINPROJECTNAME" ItemStyle-Width="10%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="证书编号" DataField="CERTIFICATENO" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="发证机构" DataField="TRAININGLEVEL" ItemStyle-Width="10%">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="培训机构类别" DataField="TRAININSTITYPE" ItemStyle-Width="5%">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return TrainItem("<%#DataBinder.Eval(Container.DataItem,"EDUCATIONTRAINPROJECTID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="work" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode3" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName3" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept3" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span2" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增工作履历</span>
                                <asp:LinkButton runat="server" ID="btnAddWorkExperience" class="kpms-btn" OnClick="btnAddWorkExperience_Click"
                                    OnClientClick="return WorkExperienceItem('','2')" displaystatus="(3.*)">
                                     <span>新增工作履历</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvWorkExperience" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="ID"
                        OnRowCommand="gvWorkExperience_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="起始日期" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="终止日期" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="所在单位" DataField="WORKCORP"></asp:BoundField>
                            <asp:BoundField HeaderText="部门" DataField="WORKDEPT"></asp:BoundField>
                            <asp:BoundField HeaderText="室组" DataField="WORKSUBDEPT"></asp:BoundField>
                            <asp:BoundField HeaderText="专业" DataField="Specialty"></asp:BoundField>
                            <asp:BoundField HeaderText="参加工作标识" DataField="ParticipateWork"></asp:BoundField>
                            <asp:BoundField HeaderText="连续工龄标识" DataField="ContinuousYears"></asp:BoundField>
                            <asp:BoundField HeaderText="专业工龄标识" DataField="SpecialtyYears"></asp:BoundField>
                            <asp:BoundField HeaderText="进院标识" DataField="InCorp"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return WorkExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return WorkExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="project" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode4" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName4" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept4" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span3" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增项目履历</span>
                                <asp:LinkButton runat="server" ID="btnAddProjectExperience" class="kpms-btn" OnClick="btnAddProjectExperience_Click"
                                    OnClientClick="return ProjectExperienceItem('','2')" displaystatus="(3.*)">
                                     <span>新增项目履历</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvProjectExperience" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="ProExperienceID"
                        OnRowCommand="gvProjectExperience_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="项目名称" DataField="ProjectName"></asp:BoundField>
                            <asp:BoundField HeaderText="担任角色" DataField="RoleName"></asp:BoundField>
                            <asp:BoundField HeaderText="上任日期" DataField="AppointDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="卸任日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="主要任务及工作内容" DataField="WorkContent"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" Visible='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"Show").ToString()) %>'
                                        EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ProjectExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ProExperienceID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" Visible='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"Show").ToString()) %>'
                                        EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ProjectExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ProExperienceID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ProExperienceID") %>'
                                        Visible='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"Show").ToString()) %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <%--<div id="family" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode5" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName5" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept5" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span4" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增家庭成员</span>
                                <asp:LinkButton runat="server" ID="btnAddFamilyMember" class="kpms-btn" OnClick="btnAddFamilyMember_Click"
                                    OnClientClick="return FamilyMemberItem('','2')" displaystatus="(3.*)">
                                     <span>新增家庭成员</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvFamilyMember" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="FamilyMemberID"
                        OnRowCommand="gvFamilyMember_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="成员姓名" DataField="FamilyMemberName"></asp:BoundField>
                            <asp:BoundField HeaderText="与本人关系" DataField="Relationship"></asp:BoundField>
                            <asp:BoundField HeaderText="性别" DataField="Sex"></asp:BoundField>
                            <asp:BoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="民族" DataField="Nation"></asp:BoundField>
                            <asp:BoundField HeaderText="文化程度" DataField="CulturalLevel"></asp:BoundField>
                            <asp:BoundField HeaderText="党派名称" DataField="PoliticalAffiliation"></asp:BoundField>
                            <asp:BoundField HeaderText="职务" DataField="Position"></asp:BoundField>
                            <asp:BoundField HeaderText="联系电话" DataField="TelPhone" ItemStyle-Wrap="false"></asp:BoundField>
                            <asp:BoundField HeaderText="状态" DataField="State"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server">
                        <img alt="编辑" id="Img1"  onclick='return FamilyMemberItem("<%#DataBinder.Eval(Container.DataItem,"FamilyMemberID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData">
                        <img alt="编辑" id="Img1"  onclick='return FamilyMemberItem("<%#DataBinder.Eval(Container.DataItem,"FamilyMemberID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"FamilyMemberID") %>'>
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>--%>
        <div id="prize" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel7" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode6" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName6" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept6" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span5" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增获奖信息</span>
                                <asp:LinkButton runat="server" ID="btnAddPrizeInfo" class="kpms-btn" OnClick="btnAddPrizeInfo_Click"
                                    OnClientClick="return PrizeInfoItem('','2')" displaystatus="(3.*)">
                                     <span>新增获奖信息</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPrizeInfo" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PrizeInfoID"
                        OnRowCommand="gvPrizeInfo_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="获奖名称" DataField="PrizeName"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖项目名称" DataField="ProjectName"></asp:BoundField>
                            <asp:BoundField HeaderText="担任角色" DataField="ROLENAME"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖级别" DataField="PrizeLevel"></asp:BoundField>
                            <asp:BoundField HeaderText="授奖单位" DataField="AWARDCORP"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖日期" DataField="PRIZEDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PrizeInfoItem("<%#DataBinder.Eval(Container.DataItem,"PrizeInfoID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PrizeInfoItem("<%#DataBinder.Eval(Container.DataItem,"PrizeInfoID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PrizeInfoID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="file" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel8" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode7" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName7" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept7" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span6" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增档案信息</span>
                                <asp:LinkButton runat="server" ID="btnAddFileInfo" class="kpms-btn" OnClick="btnAddFileInfo_Click"
                                    OnClientClick="return FileInfoItem('','2')" displaystatus="(3.*)">
                                     <span>新增档案信息</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvFileInfo" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="FileInfoID"
                        OnRowCommand="gvFileInfo_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="档案类别" DataField="FileType"></asp:BoundField>
                            <asp:BoundField HeaderText="转入日期" DataField="InDate" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:BoundField HeaderText="档案来处" DataField="FromPlace"></asp:BoundField>
                            <asp:BoundField HeaderText="转出日期" DataField="OutDate" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                            <asp:BoundField HeaderText="档案去处" DataField="ToPlace"></asp:BoundField>
                            <asp:BoundField HeaderText="管理单位" DataField="MANAGECORP"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return FileInfoItem("<%#DataBinder.Eval(Container.DataItem,"FileInfoID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return FileInfoItem("<%#DataBinder.Eval(Container.DataItem,"FileInfoID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"FileInfoID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="medio" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel9" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode8" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName8" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept8" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span7" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增多媒体信息</span>
                                <asp:LinkButton runat="server" ID="btnAddMultimediaInfo" class="kpms-btn" OnClick="btnAddMultimediaInfo_Click"
                                    OnClientClick="return MultimediaInfoItem('','2')" displaystatus="(3.*)">
                                     <span>新增多媒体信息</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvMultimediaInfo" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="MultimediaID"
                        OnRowCommand="gvMultimediaInfo_RowCommand" OnRowDataBound="gvMultimediaInfo_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="文件名称" HeaderStyle-Width="35%">
                                <ItemTemplate>
                                    <uc1:AttachmentView ID="AttachmentView1" FileSourceID='<%#Eval("MultimediaID") %>'
                                        runat="server" ShowDelete="false" RepeatColumns="1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="文件类型" DataField="FileType" HeaderStyle-Width="10%"></asp:BoundField>
                            <asp:BoundField HeaderText="注册单位" DataField="REGCORP" HeaderStyle-Width="25%"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return MultimediaInfoItem("<%#DataBinder.Eval(Container.DataItem,"MultimediaID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return MultimediaInfoItem("<%#DataBinder.Eval(Container.DataItem,"MultimediaID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"MultimediaID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="language" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel11" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode10" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName10" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept10" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span9" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增语言能力</span>
                                <asp:LinkButton runat="server" ID="btnAddLanguage" class="kpms-btn" OnClick="btnAddLanguage_Click"
                                    OnClientClick="return LanguageItem('','2')" displaystatus="(3.*)">
                                     <span>新增语言能力</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvLanguage" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="LanguageInfoID"
                        OnRowCommand="gvLanguage_RowCommand">
                        <Columns>
                            <asp:BoundField HeaderText="语种名称" DataField="LanguageName"></asp:BoundField>
                            <asp:BoundField HeaderText="熟练程度" DataField="Proficiency"></asp:BoundField>
                            <asp:BoundField HeaderText="语言水平" DataField="LanguageLevel"></asp:BoundField>
                            <asp:BoundField HeaderText="认证机构" DataField="Agency"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return LanguageItem("<%#DataBinder.Eval(Container.DataItem,"LanguageInfoID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return LanguageItem("<%#DataBinder.Eval(Container.DataItem,"LanguageInfoID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"LanguageInfoID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <%--<div id="politicalAffiliation" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel13" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode11" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName11" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept11" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" colspan="6" style="text-align: right">
                                <span id="Span11" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增党派名称</span>
                                <asp:LinkButton runat="server" ID="btnPoliticalAffiliation" class="kpms-btn" OnClick="btnPoliticalAffiliation_Click"
                                    OnClientClick="return PoliticalAffiliation('','2')" displaystatus="(3.*)">
                                     <span>新增党派名称</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPoliticalAffiliation" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PoliticalAffiliationID"
                        OnRowCommand="gvPoliticalAffiliation_RowCommand" OnRowDataBound="gvPoliticalAffiliation_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="党派名称" DataField="PoliticalAffiliation"></asp:BoundField>
                            <asp:BoundField HeaderText="参加日期" DataField="AttendDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="转正日期" DataField="RotationDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="是否现<br />党派名称" DataField="IsNow" HtmlEncode="false">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="开除日期" DataField="FireDate" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server">
                        <img alt="编辑" id="Img1"  onclick='return PoliticalAffiliation("<%#DataBinder.Eval(Container.DataItem,"PoliticalAffiliationID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData">
                        <img alt="编辑" id="Img1"  onclick='return PoliticalAffiliation("<%#DataBinder.Eval(Container.DataItem,"PoliticalAffiliationID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"PoliticalAffiliationID") %>'>
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>--%>
        <div id="contract" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel14" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode12" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName12" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept12" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td class="td-m" colspan="6">
                                <span id="Span12" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增劳动合同</span>
                                <asp:LinkButton runat="server" ID="btnContract" class="kpms-btn" OnClick="btnContract_Click"
                                    OnClientClick="return ContractItem('','2')" displaystatus="(3.*)">
                                     <span>新增劳动合同</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="LABORCONTRACTID"
                        OnRowCommand="gvContract_RowCommand" BindGridViewMethod="DataContractBind">
                        <Columns>
                            <asp:BoundField HeaderText="合同编号" DataField="CONTRACTCODE"></asp:BoundField>
                            <%--<asp:BoundField HeaderText="签订日期" DataField="SigningTime" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>--%>
                            <asp:BoundField HeaderText="合同起始日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="70px"></asp:BoundField>
                            <asp:BoundField HeaderText="到期日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="70px"></asp:BoundField>
                            <asp:BoundField HeaderText="签订期限" DataField="SIGNINGTERM" ItemStyle-HorizontalAlign="Right">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="合同类型" DataField="CONTRACTTYPE"></asp:BoundField>
                            <asp:BoundField HeaderText="合同状态" DataField="CONTRACTSTATE"></asp:BoundField>
                            <%--<asp:BoundField HeaderText="岗位名称" DataField="Position"></asp:BoundField>--%>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ContractItem("<%#DataBinder.Eval(Container.DataItem,"LABORCONTRACTID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hoand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ContractItem("<%#DataBinder.Eval(Container.DataItem,"LABORCONTRACTID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"LABORCONTRACTID") %>'
                                        EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="practiceCareer" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel17" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode14" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName14" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept14" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <%--                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                专业技术资格
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvTechQualif" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="TechQualifID"
                                    OnRowCommand="gvTechQualif_RowCommand" OnRowDataBound="gvTechQualif_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="专业技术资格名称" DataField="TechQualifName"></asp:BoundField>
                                        <asp:BoundField HeaderText="专业技术资格系列" DataField="TechQualifSeries"></asp:BoundField>
                                        <asp:BoundField HeaderText="专业技术资格等级" DataField="TechQualifLevel"></asp:BoundField>
                                        <asp:BoundField HeaderText="取得资格日期" DataField="QualifyingTime" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField HeaderText="专业技术资格证书编号" DataField="QualificationCode" />
                                        <asp:BoundField HeaderText="最高等级标识" DataField="IsHighest2" />
                                        <asp:BoundField HeaderText="聘任日期" DataField="AppointStartTime" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="解聘日期" DataField="AppointEndTime" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="是否现聘任职称" DataField="IsHireFlag2" />
                                        <asp:BoundField HeaderText="审批单位" DataField="ApprovalUnit" />
                                        <asp:BoundField HeaderText="备注" DataField="Remark" />
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server">
                                                    <img alt="编辑" id="Img1"  onclick='return TechQualifItem("<%#DataBinder.Eval(Container.DataItem,"TechQualifID") %>","1");'
                                                        border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>--%>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                执业注册资质
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvPractice" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PRACTICEQUALIFID"
                                     BindGridViewMethod="DataPracticeBind" OnRowDataBound="gvPractice_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="资格证书名称" DataField="QUAFLIFICATIONNAME"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书级别" DataField="QUAFLIFICATIONLEVEL"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书专业" DataField="QUAFLIFICATIONPROFESSION"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书编号" DataField="QUAFLIFICATIONCODE"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书取得日期" DataField="QUAFLIFICATIONGETDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="注册发证日期" DataField="EFFECTIVESTARTTIME" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="注册证书编号" DataField="REGISTEREDQUALIFCODE"></asp:BoundField>
                                        <asp:BoundField HeaderText="注册有效期至" DataField="EFFECTIVEENDTIME" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH" ItemStyle-HorizontalAlign="Right">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="执业印章号" DataField="REGISTRATIONCODE"></asp:BoundField>
                                        <asp:BoundField HeaderText="注册专业1" DataField="MAINPROFESSION"></asp:BoundField>
                                        <asp:BoundField HeaderText="注册专业2" DataField="SECONDPROFESSION"></asp:BoundField>
                                        <asp:BoundField HeaderText="注册单位" DataField="ISSUEUNIT"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return PracticeItem("<%#DataBinder.Eval(Container.DataItem,"PRACTICEQUALIFID") %>","1",1);'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                特殊岗位资格
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvListSpecialtyPosition" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PRACTICEQUALIFID"
                                     BindGridViewMethod="DataSpecialtyPositionBind">
                                    <Columns>
                                        <asp:BoundField HeaderText="资格证书名称" DataField="QUAFLIFICATIONNAME"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书级别" DataField="QUAFLIFICATIONLEVEL"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书专业" DataField="QUAFLIFICATIONPROFESSION"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书编号" DataField="QUAFLIFICATIONCODE"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书取得日期" DataField="QUAFLIFICATIONGETDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="资格有效期至" DataField="EFFECTIVEENDTIME" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH" ItemStyle-HorizontalAlign="Right">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return PracticeItem("<%#DataBinder.Eval(Container.DataItem,"PRACTICEQUALIFID") %>","1",2);'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                项目经理证书
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvListProjectManager" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PRACTICEQUALIFID"
                                     BindGridViewMethod="DataProjectManagerBind">
                                    <Columns>
                                        <asp:BoundField HeaderText="证书名称" DataField="QUAFLIFICATIONNAME"></asp:BoundField>
                                        <asp:BoundField HeaderText="证书编号" DataField="QUAFLIFICATIONCODE"></asp:BoundField>
                                        <asp:BoundField HeaderText="取得日期" DataField="QUAFLIFICATIONGETDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="有效期至" DataField="EFFECTIVEENDTIME" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH" ItemStyle-HorizontalAlign="Right">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="颁发单位" DataField="ISSUEUNIT"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return PracticeItem("<%#DataBinder.Eval(Container.DataItem,"PRACTICEQUALIFID") %>","1",3);'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                内培训讲师
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvInstructor" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="INSTRUCTORID"
                                     BindGridViewMethod="DataInstructorBind">
                                    <Columns>
                                        <asp:BoundField HeaderText="姓名" DataField="NAME" ItemStyle-Wrap="false">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="工号" DataField="USERCODE" ItemStyle-Wrap="false"
                                            Visible="false"></asp:BoundField>
                                        <asp:BoundField HeaderText="性别" DataField="SEX"></asp:BoundField>
                                        <asp:BoundField HeaderText="研究方向" DataField="RESEARCHAREA"></asp:BoundField>
                                        <asp:BoundField HeaderText="主要课程" DataField="MAINCLASS"></asp:BoundField>
                                        <asp:BoundField HeaderText="其它课程" DataField="OTHERCLASS"></asp:BoundField>
                                        <asp:BoundField HeaderText="为我院提供过的培训课程" DataField="TRAINEDCLASS"></asp:BoundField>
                                        <asp:BoundField HeaderText="讲授日期" DataField="TEACHINGTIME" DataFormatString="{0:yyyy-MM-dd}"
                                            ItemStyle-Width="70px"></asp:BoundField>
                                        <asp:BoundField HeaderText="培训对象" DataField="TRAINOBJECT"></asp:BoundField>
                                        <asp:BoundField HeaderText="培训人数" DataField="NUMBEROFTRAINING" ItemStyle-HorizontalAlign="Right">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return InstructorItem("<%#DataBinder.Eval(Container.DataItem,"INSTRUCTORID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                专业上岗资格
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvSpecialtyList" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserCapacityID"
                                    OnRowCommand="gvSpecialtyList_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="CapacityTypeName" HeaderText="资格名称" />
                                        <asp:BoundField DataField="SpecialtyName" HeaderText="专业" />
                                        <asp:BoundField DataField="OrgUnitName" HeaderText="部门" />
                                        <asp:BoundField DataField="EffectiveDate" HeaderText="起始日期" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="ExpireDate" HeaderText="终止日期" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="ProjectTypeName" HeaderText="工程类型" />
                                        <asp:BoundField DataField="IsTemp" HeaderText="资格性质" />
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                                    <img alt="查看" id="Img1"  onclick='return SpeicaltyItem("<%#Eval("UserCapacityID") %>","1");'
                                                        border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l" style="text-align: center; font-weight: bold">
                                其他上岗资格
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="td-l">
                                <zhongsoft:LightPowerGridView ID="gvOtherList" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserCapacityID"
                                    OnRowCommand="gvOtherList_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="CapacityTypeName" HeaderText="资格名称" />
                                        <asp:BoundField DataField="EffectiveDate" HeaderText="起始日期" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="ExpireDate" HeaderText="终止日期" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                                    <img alt="查看" id="Img1"  onclick='return OtherItem("<%#Eval("UserCapacityID") %>","1");'
                                                        border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr style="display: none" class="td-m">
                            <td colspan="6">
                                职业资格
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvCareer" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="CareerQualifID"
                                    OnRowCommand="gvCareer_RowCommand" OnRowDataBound="gvCareer_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="姓名" DataField="PersonnelName" ItemStyle-Wrap="false"
                                            Visible="false"></asp:BoundField>
                                        <asp:BoundField HeaderText="工号" DataField="PersonnelCode" ItemStyle-Wrap="false"
                                            Visible="false"></asp:BoundField>
                                        <asp:BoundField HeaderText="所属部门" DataField="OrganizationName" Visible="false"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书名称" DataField="CareerQualifName"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格证书编号" DataField="CareerQualifCode"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格级别" DataField="QualifLevel"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格专业1" DataField="MainProfession"></asp:BoundField>
                                        <asp:BoundField HeaderText="资格专业2" DataField="AuxiliaryProfession"></asp:BoundField>
                                        <asp:BoundField HeaderText="签发日期" DataField="EffectiveStartTime" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="有效期至" DataField="EffectiveEndTime" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="证书颁发单位" DataField="IssueUnit"></asp:BoundField>
                                        <asp:BoundField HeaderText="取证方式" DataField="AccessPath"></asp:BoundField>
                                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return CareerItem("<%#DataBinder.Eval(Container.DataItem,"CareerQualifID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="6" class="td-m">
                                技术上岗资格
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvPostList" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserCapacityID"
                                    OnRowCommand="gvPostList_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="姓名" DataField="UserName" ItemStyle-Wrap="false" Visible="false" />
                                        <asp:BoundField HeaderText="工号" DataField="LoginId" ItemStyle-Wrap="false" Visible="false" />
                                        <asp:BoundField HeaderText="性别" DataField="Sex" />
                                        <asp:BoundField HeaderText="资格名称" DataField="CapacityTypeName" />
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                                    <img alt="查看" id="Img1"  onclick='return PostItem("<%#Eval("UserCapacityID") %>","1");'
                                                        border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="6" class="td-m">
                                压力管道资格
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvPressureList" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserCapacityID"
                                    OnRowCommand="gvPressureList_RowCommand">
                                    <Columns>
                                        <asp:BoundField DataField="UserName" HeaderText="姓名" ItemStyle-Wrap="false" Visible="false" />
                                        <asp:BoundField DataField="LoginId" HeaderText="工号" ItemStyle-Wrap="false" Visible="false" />
                                        <asp:BoundField DataField="EffectiveDate" HeaderText="取证日期" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="ExpireDate" HeaderText="有效期至" DataFormatString="{0:yyyy-MM-dd}" />
                                        <asp:BoundField DataField="CapacityTypeName" HeaderText="资格名称" />
                                        <asp:BoundField DataField="GradeAndClassRange" HeaderText="级别和品种范围" />
                                        <asp:BoundField DataField="CardCode" HeaderText="证书编号" />
                                        <asp:BoundField DataField="CardUnit" HeaderText="发证单位" />
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                                                    <img alt="查看" id="Img1"  onclick='return PressureItem("<%#Eval("UserCapacityID") %>","1");'
                                                        border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="skillLevel" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel18" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode16" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName16" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept16" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span19" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增技术职称</span>
                                <asp:LinkButton runat="server" ID="btnSkillLevel" class="kpms-btn" OnClick="btnSkillLevel_Click"
                                    OnClientClick="return SkillLevelItem('','2')" displaystatus="(3.*)">
                                     <span>新增技术职称</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvSkillLevel" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="SkillLevelID"
                                    OnRowCommand="gvSkillLevel_RowCommand" OnRowDataBound="gvSkillLevel_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="技术职称" DataField="SKILLTITLE"></asp:BoundField>
                                        <asp:BoundField HeaderText="评定日期" DataField="DESERVEDATE" DataFormatString="{0:yyyy-MM-dd}"
                                            ItemStyle-Width="70px"></asp:BoundField>
                                        <asp:BoundField HeaderText="技术等级" DataField="SKILLLEVEL"></asp:BoundField>
                                        <asp:BoundField HeaderText="定级日期" DataField="LEVELDATE" DataFormatString="{0:yyyy-MM-dd}"
                                            ItemStyle-Width="70px"></asp:BoundField>
                                        <asp:BoundField HeaderText="聘任日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                            ItemStyle-Width="70px"></asp:BoundField>
                                        <asp:BoundField HeaderText="聘任文号" DataField="APPOINTDOC"></asp:BoundField>
                                        <asp:BoundField HeaderText="解聘日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"
                                            ItemStyle-Width="70px"></asp:BoundField>
                                        <asp:BoundField HeaderText="解聘文号" DataField="LEAVEDOC"></asp:BoundField>
                                        <asp:BoundField HeaderText="是否最高<br />技术等级" DataField="IsHighest2" HtmlEncode="false">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="是否现<br />技术等级" DataField="IsNow2" HtmlEncode="false">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return SkillLevelItem("<%#DataBinder.Eval(Container.DataItem,"SkillLevelID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return SkillLevelItem("<%#DataBinder.Eval(Container.DataItem,"SkillLevelID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"SkillLevelID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="specialist" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel19" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode17" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName17" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept17" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span20" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增专家人才</span>
                                <asp:LinkButton runat="server" ID="btnSpecialist" class="kpms-btn" OnClick="btnSpecialist_Click"
                                    OnClientClick="return SpecialistItem('','2')" displaystatus="(3.*)">
                                     <span>新增专家人才</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvSpecialist" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="SpecialistID"
                                    OnRowCommand="gvSpecialist_RowCommand" OnRowDataBound="gvSpecialist_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="专家称号名称" DataField="SpecialistName"></asp:BoundField>
                                        <asp:BoundField HeaderText="专家称号批准日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="专家称号终止日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return SpecialistItem("<%#DataBinder.Eval(Container.DataItem,"SpecialistID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return SpecialistItem("<%#DataBinder.Eval(Container.DataItem,"SpecialistID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"SpecialistID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="scholarship" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel20" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode18" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName18" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept18" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span21" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增学术团体</span>
                                <asp:LinkButton runat="server" ID="btnScholarship" class="kpms-btn" OnClick="btnScholarship_Click"
                                    OnClientClick="return ScholarshipItem('','2')" displaystatus="(3.*)">
                                     <span>新增学术团体</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvScholarship" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="ScholarshipID"
                                    OnRowCommand="gvScholarship_RowCommand" OnRowDataBound="gvScholarship_RowDataBound">
                                    <Columns>
                                        <asp:BoundField HeaderText="社团名称" DataField="ScholarshipName"></asp:BoundField>
                                        <asp:BoundField HeaderText="主管单位名称" DataField="ManageCorp"></asp:BoundField>
                                        <asp:BoundField HeaderText="职务" DataField="Rank"></asp:BoundField>
                                        <asp:BoundField HeaderText="参加日期" DataField="AppointDate" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="退出日期" DataField="LeaveDate" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ScholarshipItem("<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ScholarshipItem("<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="soldier" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel12" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode19" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName19" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept19" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" colspan="6" style="text-align: right">
                                <span id="Span17" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增复转军人信息</span>
                                <asp:LinkButton runat="server" ID="btnSoldier" class="kpms-btn" OnClick="btnSoldier_Click"
                                    OnClientClick="return SoldierItem('','2')" displaystatus="(3.*)">
                                     <span>新增复转军人信息</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvSoldier" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="SoldierInfoID"
                                    OnRowCommand="gvSoldier_RowCommand">
                                    <Columns>
                                        <asp:BoundField HeaderText="类别" DataField="SoldierType"></asp:BoundField>
                                        <%--<asp:BoundField HeaderText="行政区划" DataField="SdministrativeArea"></asp:BoundField>
                                        <asp:BoundField HeaderText="退役证号" DataField="RetiredNo"></asp:BoundField>
                                        <asp:BoundField HeaderText="入伍日期" DataField="EnlistDate" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="退役日期" DataField="RetiredDate" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>--%>
                                        <asp:BoundField HeaderText="部队名称" DataField="ARMYNAME"></asp:BoundField>
                                        <%--<asp:BoundField HeaderText="原部别" DataField="OrgLevel"></asp:BoundField>--%>
                                        <%--<asp:BoundField HeaderText="军内职级" DataField="PositionName"></asp:BoundField>
                                        <asp:BoundField HeaderText="原职务（技术）等级" DataField="PositionLevel"></asp:BoundField>--%>
                                        <asp:BoundField HeaderText="军内职级" DataField="SOLDIERLEVEL"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img3"  onclick='return SoldierItem("<%#DataBinder.Eval(Container.DataItem,"SoldierInfoID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img4"  onclick='return SoldierItem("<%#DataBinder.Eval(Container.DataItem,"SoldierInfoID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"SoldierInfoID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img5"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="positionChange" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel21" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode20" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName20" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept20" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" colspan="6" style="text-align: right">
                                <span id="Span22" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增岗位变动</span>
                                <asp:LinkButton runat="server" ID="btnAddPositionChange" class="kpms-btn" OnClick="btnAddPositionChange_Click"
                                    OnClientClick="return PostionChangeItem('','2')" displaystatus="(3.*)">
                                     <span>新增岗位变动</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <zhongsoft:LightPowerGridView ID="gvPostionChange" runat="server" AutoGenerateColumns="false"
                                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="USERCHANGEID"
                                    OnRowCommand="gvPostionChange_RowCommand" OnRowDataBound="gvPostionChange_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="原岗位" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lbPositionOrg" runat="server"></asp:Label>
                                                <input type="hidden" id="hiPositionXml" runat="server" value='<%#Eval("OGPOSITIONXML") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="离岗日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="现岗位" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lbPositionChange" runat="server"></asp:Label>
                                                <input type="hidden" id="hiChangePositionXml" runat="server" value='<%#Eval("CHANGEPOSITIONXML") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField HeaderText="上岗日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}">
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="变动原因" DataField="ChangeReason"></asp:BoundField>
                                        <asp:BoundField HeaderText="是否主岗" DataField="IsMainPosition2"></asp:BoundField>
                                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PostionChangeItem("<%#DataBinder.Eval(Container.DataItem,"USERCHANGEID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PostionChangeItem("<%#DataBinder.Eval(Container.DataItem,"USERCHANGEID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"USERCHANGEID") %>'
                                                    EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" id="hiOpenPage" runat="server" />
    <input type="hidden" id="hiType" runat="server" />
    <!--要显示的页签-->
    <input type="hidden" runat="server" id="hiShow" />
    <script type="text/javascript">
        //计算年龄&设置星座
        $("#<%=txtBirthday.ClientID %>").live('blur',function (){
            calculateAge();
            SetConstellation();
        });
        //自动按照名称转出简拼名称
        $('#<%=tbUserName.ClientID %>').live('blur', function() {
            queryPinYin();
        });

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //#region 设置显示页签
            var show = $("#<%=hiShow.ClientID %>").val();
            var showList = show.split(',');
            for (var i = 0; i < showList.length; i++) {
                if (showList[i] != "") {
                    $("." + showList[i]).attr("style", "display:block");
                }
            }
            //#endregion

            var $tab1 = $('#templateTabs').tabs();
            if(showList.length ==1 && showList[0] == "practiceCareer")
                $tab1 =  $('#templateTabs').tabs({ active:9 });
            

            initPageControl();
        }
        
        function initPageControl() {
            calculateAge();
            //人员进入、返聘人员信息控制  “工号”“姓名”“性别”“所属部门”必填，其他的都是非必填
            var EmploymentForm = '<%=EmploymentForm %>';
            var IsInCompany = '<%=IsInCompany %>';
            if ((EmploymentForm == "院外返聘" && "<%=ActionType %>" == "Create")
                || $("#<%=ddlEmploymentForm.ClientID %>").val() == "院外返聘"
                || IsInCompany == "0") {
                $('span[class=req-star]').hide();
                $('[state=1]').show();
                if (EmploymentForm == "院外返聘") {
                    $('#<%=ddlEmploymentForm.ClientID%> option[value="院外返聘"]').attr('selected', 'true')
                    $('#<%=ddlEmploymentForm.ClientID%>').attr('disabled', 'disabled');
                }
            }
        }

        function selectTab(pageIndex, pageOpen) {
            var orgOpenPage = $('#<%=hiOpenPage.ClientID %>').val(); //在该页签之前打开的页签
            $('#<%=hiOpenPage.ClientID %>').val(pageIndex);

            //1-工作履历；2-学历学位；3-技术职称；4-党政职务；6-岗位变动；7-复转军人信息；与基础信息相关的页签发生变化会发页面以更新人员基本信息页面
            if (orgOpenPage == 1 || orgOpenPage == 2|| orgOpenPage==3 || orgOpenPage == 4
            || orgOpenPage==6|| orgOpenPage==7) {
                $('#<%=hiType.ClientID %>').val("1")
            }
            if (pageOpen == false && '<%=ActionType %>'=='Update') {
                if (pageIndex == 0) {
                    if ($('#<%=hiType.ClientID %>').val() == "1") {
                        $('#<%=hiType.ClientID %>').val("0");
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnFresh,"") %>;
                    }
                }
                return;
            }
        }

        //计算年龄
        function calculateAge()
	    {
	        var age='';
            var dateText = $('#<%=txtBirthday.ClientID %>').val();
            if(dateText=='')
            {
                age='';
            }
            else
            {
    		    var birthday=new Date(dateText.replace(/-/g, "\/")); 
		        var d=new Date(); 
		        age = d.getFullYear()-birthday.getFullYear()-((d.getMonth()<birthday.getMonth()||d.getMonth()==birthday.getMonth() && d.getDate()<birthday.getDate())?1:0);
            }
            $('#<%=txtYears.ClientID %>').val(age);
	    }
        //设置星座
        function SetConstellation()
        {
            var constellation = "";
            var dateText = $('#<%=txtBirthday.ClientID %>').val();
            if(dateText=='')
            {
              constellation = "";
            }
            else
            {
              var birthday=new Date(dateText.replace(/-/g, "\/"));
              var month = birthday.getMonth()+1;
              var date = birthday.getDate();
              if (month == 1 && date >=20 || month == 2 && date <=18) {constellation = "水瓶座";} 
              if (month == 2 && date >=19 || month == 3 && date <=20) {constellation = "双鱼座";}  
              if (month == 3 && date >=21 || month == 4 && date <=19) {constellation = "白羊座";} 
              if (month == 4 && date >=20 || month == 5 && date <=20) {constellation = "金牛座";} 
              if (month == 5 && date >=21 || month == 6 && date <=21) {constellation = "双子座";} 
              if (month == 6 && date >=22 || month == 7 && date <=22) {constellation = "巨蟹座";} 
              if (month == 7 && date >=23 || month == 8 && date <=22) {constellation = "狮子座";} 
              if (month == 8 && date >=23 || month == 9 && date <=22) {constellation = "室女座";} 
              if (month == 9 && date >=23 || month == 10 && date <=22) {constellation = "天秤座";} 
              if (month == 10 && date >=23 || month == 11 && date <=21) {constellation = "天蝎座";} 
              if (month == 11 && date >=22 || month == 12 && date <=21) {constellation = "人马座";} 
              if (month == 12 && date >=22 || month == 1 && date <=19) {constellation = "摩羯座";} 
            }
            $("#<%=ddlConstellation.ClientID %> option[value='"+ constellation  +"']").attr('selected', 'true');
        }
	    
        //选择部门
        function ChooseDept(type) {
            var param = new InputParamObject("s");
            var re = getOrgsNew("re", param, null);
            if (re != null) {
                if(type==1)
                {
                    $("#<%=hiOrganizationID.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtDept.ClientID %>").val(re.buildAttrJson("o", "name"));
                }
                if(type==2)
                {
                    $("#<%=hiSecondedOrganizationId.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtSecondedOrganizationName.ClientID %>").val(re.buildAttrJson("o", "name"));
                }
            }
            return false;
        }
        //上传照片
        function UpLoadFile(fileSourceID) {
            var imageUrl = $("#<%=imagePhoto.ClientID %>").attr("src");
            if ("" != imageUrl && null != imageUrl) {

                alert('请删除现有照片');
                return false;
            }
            var fileSrcFlag = "Multimedia";
            var buildSelf = "False";
            var $formObjId = fileSourceID;
            var url = "<%=WebAppPath %>"+"/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSourceID + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf + "&Catalogs=" + $formObjId + "&imageType=true";
            var sFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, "", sFeatures);
        }

        //两端去空格函数  
        String.prototype.trim = function() { return this.replace(/(^\s*)|(\s*$)/g, ""); }
        //名字转拼音首字母
        function queryPinYin() {
            var str = $('#<%=tbUserName.ClientID %>').val().trim();
            if (str == "") return;
            var arrRslt = HanZi_PinYin.get(str);
            $('#<%=tbABBRNAME.ClientID %>').val(arrRslt);
        }
    </script>
    <script type="text/javascript">
    
    </script>
    <script type="text/javascript">
        //学历学位
        function DegreeItem(bizId, acType) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/AcademicDegreeEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/AcademicDegreeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //教育培训
        function TrainItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 1000px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainProjectEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainProjectEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //工作履历
        function WorkExperienceItem(bizId, acType) {
            var stringFeatures = "dialogHeight:400px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkExperienceEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkExperienceEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //项目履历
        function ProjectExperienceItem(bizId, acType) {
            var stringFeatures = "dialogHeight:400px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ProExperienceEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ProExperienceEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //家庭成员
        function FamilyMemberItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FamilyMemberEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FamilyMemberEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //获奖
        function PrizeInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:400px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //档案
        function FileInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FileInfoEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FileInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }

        //多媒体
        function MultimediaInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:580px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/MultimediaInfoEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/MultimediaInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //出国（境）记录
        function ImmigrationItem(bizId, acType) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 780px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ImmigrationInfoEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>" + "&pName=" + encodeURI($('#<%=tbUserName.ClientID %>').val());
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ImmigrationInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>" + "&pName=" + encodeURI($('#<%=tbUserName.ClientID %>').val());
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //语言能力
        function LanguageItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/LanguageInfoEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/LanguageInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //党派名称
        function PoliticalAffiliation(bizId, acType) {
            var stringFeatures = "dialogHeight:380px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PoliticalAffiliationEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PoliticalAffiliationEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //劳动合同
        function ContractItem(bizId, acType) {
            var stringFeatures = "dialogHeight:480px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/LaborContractManagement/LaborContractEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/LaborContractManagement/LaborContractEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //职称变动
        function TitleChangeItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TitleChangeEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TitleChangeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //党政职务
        function PositionChangeItem(bizId, acType) {
            var stringFeatures = "dialogHeight:500px; dialogWidth: 750px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PartyGOVEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PartyGOVEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {

                return false;
            }
            return true;
        }
        //专业技术资格信息
        function TechQualifItem(bizId, acType) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 850px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TechQualifEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TechQualifEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //职业信息
        function CareerItem(bizId, acType) {
            var stringFeatures = "dialogHeight:350px; dialogWidth: 850px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/CareerQualifEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/CareerQualifEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //执业信息
        function PracticeItem(bizId, acType,type) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 850px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                if(type == 1)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/PracticeEditor.aspx?&actionType=" + acType;
                if(type ==2)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=" + acType;
                if(type == 3)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/ProjectManageEditor.aspx?&actionType=" + acType;
            }
            else {
                if(type ==1)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/PracticeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
                 if(type ==2)
                     url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
                 if(type == 3)
                     url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/ProjectManageEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }   
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //内培训讲师
        function InstructorItem(bizId, acType) {
            var stringFeatures = "dialogHeight:500px; dialogWidth: 750px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/TrainInstructorEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/TrainInstructorEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //上岗资格
        function PostItem(id, actionType) {
            var stringFeatures = "dialogHeight:480px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";

            url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TechQualifyPostEditor.aspx?&actionType=1&bizId=" + id;
            var ret = window.showModalDialog(url, null, stringFeatures)

            return false;

        }
        //专业上岗资格
        function SpeicaltyItem(id, actionType) {
            var stringFeatures = "dialogHeight:480px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var urlStr = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/UserCapacityEditor.aspx?";
            urlStr += "bizId=" + id + "&actionType=1";
            window.showModalDialog(urlStr, null, stringFeatures);
            return false;
        }
        //其他上岗资格
        function OtherItem(id, actionType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 900px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var urlStr = "<%=WebAppPath %>/EHR/List/OrgUsers/TechQualifyPostEditor.aspx?actionType=1&bizId=" + id;
            var temp = window.showModalDialog(urlStr, null, stringFeatures);
            return true;
        }
        //压力管道资格
        function PressureItem(id, actionType) {
            var stringFeatures = "dialogHeight:480px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/TechQualifyPressureEditor.aspx?&actionType=" + actionType + "&bizId=" + id;

            var ret = window.showModalDialog(url, null, stringFeatures)

            return false;
        }
        
    </script>
    <script type="text/javascript">
        //复转军人信息
        function SoldierItem(bizId, acType) {
            var stringFeatures = "dialogHeight:500px; dialogWidth: 900px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SoldierEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SoldierEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //其它资格信息
        function OtherQualificationsItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/OtherQualificationsEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/OtherQualificationsEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //技能等级
        function SkillLevelItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //专家人才
        function SpecialistItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SpecialistEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SpecialistEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //学术团体
        function ScholarshipItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ScholarshipEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ScholarshipEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //岗位变动
        function PostionChangeItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PositionChangeEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PositionChangeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
