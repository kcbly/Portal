<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="PersonnelInfoPassForm.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.PersonnelInfoPassForm" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Src="../../../Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li id="libaseInfo"><a href='#baseInfo' id='abaseInfo'>基本信息</a></li>
            <li id="lidegree"><a href='#degree' id='adegree'>学历及学位</a></li>
            <li id="liprize"><a href='#prize' id='aprize'>获奖信息</a></li>
            <li id="limedio"><a href='#medio' id='amedio'>多媒体信息</a></li>
            <li id="liproject"><a href='#project' id='aproject'>项目履历</a></li>
        </ul>
        <div id="baseInfo">
            <asp:Panel runat="server" ID="pnlBase">
                <table width="100%" class="tz-table">
                    <tr>
                        <td class="td-l" rowspan="6">
                            照片
                        </td>
                        <td class="td-r" rowspan="6">
                            <img id="img1" width="150" height="200" src="../../../Sys/FileDocument/FileDownload.aspx?fileId=<%=fieldID %>&flg=1"
                                onerror="javascript:this.src='../../../Themes/Images/nophoto.gif'">
                            <asp:Image ID="imagePhoto" runat="server" Height="150px" Width="150px" Visible="false" />
                        </td>
                        <td class="td-l">
                            工号 <span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbUSERCODE" runat="server" ActiveStatus="(23.N)" Field="USERCODE"
                                status="0" CssClass="kpms-textbox" MaxLength="16" TableName="EHR_OrganizationUsersTemp"
                                req="1" FieldName="工号" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            姓名 <span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ActiveStatus="(23.N)" Field="UserName"
                                status="0" CssClass="kpms-textbox" MaxLength="16" TableName="EHR_OrganizationUsersTemp"
                                req="1" FieldName="姓名" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            拼音姓名<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbABBRNAME" runat="server" ActiveStatus="(23.N)" Field="ABBRNAME"
                                status="0" CssClass="kpms-textbox" MaxLength="20" TableName="EHR_OrganizationUsersTemp"
                                req="1" regex="^[a-zA-Z\s]+$" errmsg="请输入正确的拼音名称" FieldName="拼音姓名" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            曾用名
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbUSEDNAME" runat="server" ActiveStatus="(23.N)" Field="USEDNAME"
                                status="0" CssClass="kpms-textbox" MaxLength="20" TableName="EHR_OrganizationUsersTemp"
                                FieldName="曾用名" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            性别<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbSex" field="Sex" tablename="EHR_OrganizationUsersTemp"
                                status="0" activestatus="(23.N)" FieldName="性别">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            身份证号<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbIdentityCardNO" runat="server" ActiveStatus="(23.N)"
                                Field="IdentityCardNO" status="0" CssClass="kpms-textbox" MaxLength="20" TableName="EHR_OrganizationUserProfileTemp"
                                FieldName="身份证号" req="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            民族<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbNation" field="Nation" tablename="EHR_OrganizationUserProfileTemp"
                                status="0" ActiveStatus="(23.N)" FieldName="民族">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td class="td-l">
                            出生日期<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbBirthday" class="kpms-textbox-date"
                                style="width: 80px" status="0" field="Birthday" req="1" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" fieldname="出生日期" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            院龄
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbInstitutionYears" class="kpms-textbox-money"
                                style="width: 50px" field="InstitutionYears" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" fieldname="院龄" status="0" />
                        </td>
                        <td class="td-l">
                            年龄
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbAge" class="kpms-textbox-money" style="width: 50px"
                                field="Age" tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)"
                                readonly="readonly" fieldname="年龄" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            籍贯 <span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbHometown" runat="server" ActiveStatus="(23.N)" Field="Hometown"
                                status="0" CssClass="kpms-textbox" MaxLength="128" TableName="EHR_OrganizationUserProfileTemp"
                                req="1" FieldName="籍贯" />
                        </td>
                        <td class="td-l">
                            出生地 <span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbBirthplace" runat="server" ActiveStatus="(23.N)" Field="Birthplace"
                                status="0" CssClass="kpms-textbox" MaxLength="128" TableName="EHR_OrganizationUserProfileTemp"
                                FieldName="出生地" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            所属部门
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                                field="OrgUnitName" tablename="EHR_OrganizationUsersTemp" activestatus="(23.?)"
                                fieldname="所属部门" status="0" />
                            <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                                tablename="EHR_OrganizationUsersTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                            <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept()"
                                DisplayStatus="(23.?)" CausesValidation="false" EnableTheming="false">
                        <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                            </asp:LinkButton>
                        </td>
                        <td class="td-l">
                            借调部门
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbSECONDORGDEPTNAME" runat="server" class="kpms-textbox"
                                field="SECONDORGDEPTNAME" tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.?)"
                                fieldname="借调部门" status="0" />
                            <input type="hidden" runat="server" id="hiSECONDORGDEPTID" field="SECONDORGDEPTID"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                            <asp:LinkButton runat="server" ID="lbtnChoosSecondedeDept" OnClientClick="return ChooseDept(2)"
                                DisplayStatus="(23.?)" CausesValidation="false" EnableTheming="false">
                        <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            岗位名称
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" readonly="readonly" class="kpms-textbox"
                                field="PositionNames" tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.?)"
                                fieldname="岗位名称" status="0" />
                        </td>
                        <td class="td-l">
                            个人身份
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbUSERIDENTITY" field="USERIDENTITY"
                                status="0" tablename="EHR_OrganizationUserProfileTemp" ActiveStatus="(23.N)"
                                FieldName="个人身份">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            用工形式
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbEmploymentForm" field="EmploymentForm"
                                tablename="EHR_OrganizationUserProfileTemp" ActiveStatus="(23.N)" FieldName="用工形式"
                                status="0">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td class="td-l">
                            归口
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbCENTRALIZEDMANAGER" field="CENTRALIZEDMANAGER"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" FieldName="归口"
                                status="0">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            从事专业
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbSpecialtyName" runat="server" readonly="readonly"
                                class="kpms-textbox" activestatus="(23.N)" field="SPECIALTY" tablename="EHR_OrganizationUserProfileTemp"
                                fieldname="从事专业" status="0" />
                        </td>
                        <td class="td-l">
                            工人等级
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbSKILLLEVEL" runat="server" readonly="readonly" class="kpms-textbox"
                                field="SKILLLEVEL" tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)"
                                FieldName="工人等级" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            党派名称<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbPoliticalLandscape" runat="server" readonly="readonly"
                                class="kpms-textbox" field="PoliticalLandscape" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.?)" FieldName="党派名称" status="0" req="1" />
                        </td>
                        <td class="td-l">
                            文化程度<span class="req-star">*</span>
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbEducation" runat="server" readonly="readonly" class="kpms-textbox"
                                field="Education" tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.?)"
                                FieldName="文化程度" status="0" req="1" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            婚姻状况
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbMARITALSTATE" field="MARITALSTATE"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" FieldName="婚姻状况"
                                status="0">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td class="td-l">
                            星座
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbConstellation" field="Constellation"
                                tablename="EHR_OrganizationUserProfileTemp" status="0" ActiveStatus="(23.N)"
                                FieldName="星座">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            连续工龄起始日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbContinuousYearsSartDate" class="kpms-textbox"
                                style="width: 70px" field="ContinuousYearsSartDate" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" FieldName="连续工龄起始日期" status="0" />
                        </td>
                        <td class="td-l">
                            连续工龄
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbContinuousYears" class="kpms-textbox-money"
                                style="width: 50px" field="ContinuousYears" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" FieldName="连续工龄" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            专业工龄起始日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbSpecialtyYearsStartDate" class="kpms-textbox"
                                style="width: 70px" field="SpecialtyYearsStartDate" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" FieldName="专业工龄起始日期" status="0" />
                        </td>
                        <td class="td-l">
                            专业工龄
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbSpecialtyYears" class="kpms-textbox-money"
                                style="width: 50px" field="SpecialtyYears" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" FieldName="专业工龄" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            党政职务
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbRANKNAME" runat="server" ActiveStatus="(23.?)" Field="RANKNAME"
                                status="0" CssClass="kpms-textbox" MaxLength="32" TableName="EHR_OrganizationUserProfileTemp"
                                FieldName="党政职务" />
                        </td>
                        <td class="td-l">
                            技术职称
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText ID="tbTitle" runat="server" activestatus="(23.N)" field="SKILLTITLE"
                                tablename="EHR_OrganizationUserProfileTemp" readonly="readonly" class="kpms-textbox"
                                fieldname="技术职称" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            参加工作日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbWORKDATE" class="kpms-textbox-date"
                                style="width: 80px" field="WORKDATE" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" status="0" readonly="readonly" fieldname="参加工作日期" />
                        </td>
                        <td class="td-l">
                            进院日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbINNOWCORPDATE" class="kpms-textbox-date"
                                style="width: 80px" field="INNOWCORPDATE" tablename="EHR_OrganizationUserProfileTemp"
                                status="0" activestatus="(23.N)" readonly="readonly" fieldname="进院日期" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            进入本系统日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbINNOWGROUPDATE" class="kpms-textbox-date"
                                status="0" style="width: 80px" field="INNOWGROUPDATE" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" fieldname="进入本系统日期" />
                        </td>
                        <td class="td-l">
                            转正日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbREGULARDATE" class="kpms-textbox-date"
                                status="0" style="width: 80px" field="REGULARDATE" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" fieldname="转正日期" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            起薪日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbSALARYSTARTDATE" class="kpms-textbox-date"
                                status="0" style="width: 80px" field="SALARYSTARTDATE" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" fieldname="起薪日期" />
                        </td>
                        <td class="td-l">
                            停薪日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbSALARYENDDATE" class="kpms-textbox-date"
                                style="width: 80px" field="SALARYENDDATE" tablename="EHR_OrganizationUserProfileTemp"
                                status="0" activestatus="(23.N)" readonly="readonly" fieldname="停薪日期" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            人员状态
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbState" field="State" tablename="EHR_OrganizationUserProfileTemp"
                                ActiveStatus="(23.N)" FieldName="人员状态" status="0">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td class="td-l">
                            人员类别
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="tbCategory" field="Category" tablename="EHR_OrganizationUserProfileTemp"
                                ActiveStatus="(23.N)" FieldName="人员类别" status="0">
                            </zhongsoft:LightDropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            复转军人类别
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbSoldierType" field="SoldierType" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" readonly="readonly" class="kpms-textbox" FieldName="复转军人类别"
                                status="0" />
                        </td>
                        <td class="td-l">
                            减员日期
                        </td>
                        <td class="td-r">
                            <zhongsoft:XHtmlInputText runat="server" ID="tbAttritionDate" field="AttritionDate"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" readonly="readonly"
                                class="kpms-textbox-date" FieldName="减员日期" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            保险手册号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbInsuranceCode" runat="server" field="InsuranceCode"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" MaxLength="32"
                                FieldName="保险手册号" status="0"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            失业保险号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbUnemploymentCode" runat="server" field="UnemploymentCode"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" MaxLength="32"
                                FieldName="失业保险号" status="0"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            企业年金号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbAnnuity" runat="server" field="Annuity" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" MaxLength="32" FieldName="企业年金号" status="0"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            公积金号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbProvidentFundCode" runat="server" field="ProvidentFundCode"
                                tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.N)" MaxLength="32"
                                FieldName="公积金号" status="0"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            医疗保险号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbMedicalCode" runat="server" field="MedicalCode" tablename="EHR_OrganizationUserProfileTemp"
                                activestatus="(23.N)" MaxLength="32" FieldName="医疗保险号" status="0"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="kpms-rollist-hand" colspan="4">
                            <img id="img2" src="../../../Themes/Images/btn_title.gif" />
                            联系方式
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            办公电话
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbPhone" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="Phone" status="0" CssClass="kpms-textbox" MaxLength="64" TableName="EHR_OrganizationUsersTemp"
                                FieldName="办公电话" />
                        </td>
                        <td class="td-l">
                            Email
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbEmail" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="Email" CssClass="kpms-textbox" status="0" MaxLength="64" TableName="EHR_OrganizationUsersTemp"
                                regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$" errmsg="请输入正确的Email"
                                FieldName="Email" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            手机号码
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbMobilePhone" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="MobilePhone" status="0" CssClass="kpms-textbox" MaxLength="64" TableName="EHR_OrganizationUsersTemp"
                                regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$" errmsg="请输入正确的手机号码" FieldName="手机号码" />
                        </td>
                        <td class="td-l">
                            房间号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbSeatNO" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="SeatNO" CssClass="kpms-textbox" MaxLength="20" TableName="EHR_OrganizationUserProfileTemp"
                                FieldName="房间号" status="0" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            家庭电话
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbFamilyPhone" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="FamilyPhone" status="0" CssClass="kpms-textbox" MaxLength="64" TableName="EHR_OrganizationUserProfileTemp"
                                regex="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                                errmsg="请输入正确的家庭电话" FieldName="家庭电话" />
                        </td>
                        <td class="td-l">
                            家庭邮编
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbPOST" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="POST" status="0" CssClass="kpms-textbox" MaxLength="6" TableName="EHR_OrganizationUserProfileTemp"
                                regex="^[0-9]*$" errmsg="请输入正确的邮编" FieldName="邮编" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            家庭住址
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbFamilyAddress" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="FamilyAddress" status="0" CssClass="kpms-textbox" MaxLength="128" TableName="EHR_OrganizationUserProfileTemp"
                                FieldName="家庭住址" />
                        </td>
                        <td class="td-l">
                            传真
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox ID="tbFax" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="Fax" CssClass="kpms-textbox" status="0" MaxLength="64" TableName="EHR_OrganizationUserProfileTemp"
                                regex="^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$" errmsg="请输入正确的传真" FieldName="传真" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            备注
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox ID="tbMemo" runat="server" ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)"
                                Field="Memo" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false"
                                status="0" Maxtext="512" TableName="EHR_OrganizationUserProfileTemp" FieldName="备注" />
                        </td>
                    </tr>
                </table>
                <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="USERINFOPASSID"
                    tablename="EHR_OrganizationUsersTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="UserId" tablename="EHR_OrganizationUsersTemp"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EHR_OrganizationUsersTemp"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                <input type="hidden" runat="server" id="hiLoginId" field="LoginId" tablename="EHR_OrganizationUsersTemp"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                <input type="hidden" runat="server" id="hiEXPPersonelInfoPassMainID" field="USERINFOPASSID"
                    tablename="EHR_OrganizationUserProfileTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                <input type="hidden" runat="server" id="hiEXPersonnelInfoID" field="UserId" tablename="EHR_OrganizationUserProfileTemp"
                    activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
            </asp:Panel>
        </div>
        <div id="degree">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="kpms-table" width="100%">
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
                                     <span>新增学历学位信息</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvDegree" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="ACADEMICDEGREETEMPID"
                        OnRowCommand="gvDegree_RowCommand" OnRowDataBound="gvDegree_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="学历" DataField="Education"></asp:BoundField>
                            <asp:BoundField HeaderText="学位" DataField="AcademicDegree"></asp:BoundField>
                            <asp:BoundField HeaderText="专业" DataField="MAJORSPECIALTY"></asp:BoundField>
                            <asp:BoundField HeaderText="学历性质" DataField="EducationType"></asp:BoundField>
                            <asp:BoundField HeaderText="学制" DataField="SCHOOLINGLENGTH"></asp:BoundField>
                            <asp:BoundField HeaderText="入学日期" DataField="ENROLLMENTDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="毕业日期" DataField="GRADUATEDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="毕业学校" DataField="GraduateSchool"></asp:BoundField>
                            <asp:BoundField HeaderText="最高文化程度标识" DataField="IsHighest2"></asp:BoundField>
                            <asp:BoundField HeaderText="备注" DataField="MEMO"></asp:BoundField>
                            <asp:TemplateField HeaderText="变更类型">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblDegreeType"></asp:Label>
                                    <input type="hidden" runat="server" id="hiDId" value='<%#Eval("ACADEMICDEGREETEMPID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return DegreeItem("<%#Eval("ACADEMICDEGREETEMPID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return DegreeItem("<%#Eval("ACADEMICDEGREETEMPID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("ACADEMICDEGREETEMPID") %>'
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
        <div id="prize">
            <asp:UpdatePanel ID="UpdatePanel7" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="kpms-table" width="100%">
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
                                     <span>新增获奖信息</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPrizeInfo" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PRIZEINFOTEMPID"
                        OnRowCommand="gvPrizeInfo_RowCommand" OnRowDataBound="gvPrizeInfo_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="获奖名称" DataField="PrizeName"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖项目名称" DataField="PROJECTNAME"></asp:BoundField>
                            <asp:BoundField HeaderText="担任角色" DataField="ROLENAME"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖级别" DataField="PrizeLevel"></asp:BoundField>
                            <asp:BoundField HeaderText="授奖单位" DataField="AWARDCORP"></asp:BoundField>
                            <asp:BoundField HeaderText="获奖日期" DataField="PRIZEDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="变更类型">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblPrizeType"></asp:Label>
                                    <input type="hidden" runat="server" id="hiPrizeId" value='<%#Eval("PRIZEINFOTEMPID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PrizeInfoItem("<%#Eval("PRIZEINFOTEMPID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return PrizeInfoItem("<%#Eval("PRIZEINFOTEMPID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("PRIZEINFOTEMPID") %>'
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
        <div id="medio">
            <asp:UpdatePanel ID="UpdatePanel9" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="kpms-table" width="100%">
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
                                     <span>新增多媒体信息</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvMultimediaInfo" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="MULTIMEDIATEMPID"
                        OnRowCommand="gvMultimediaInfo_RowCommand" OnRowDataBound="gvMultimediaInfo_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="文件名称" HeaderStyle-Width="35%">
                                <ItemTemplate>
                                    <uc1:AttachmentView ID="AttachmentView1" FileSourceID='<%#Eval("MULTIMEDIAID")==DBNull.Value?Eval("MULTIMEDIATEMPID"):Eval("MULTIMEDIAID") %>'
                                        runat="server" ShowDelete="false" RepeatColumns="1" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="文件类型" DataField="FileType" HeaderStyle-Width="10%"></asp:BoundField>
                            <asp:BoundField HeaderText="注册单位" DataField="REGCORP" HeaderStyle-Width="25%"></asp:BoundField>
                            <asp:TemplateField HeaderText="变更类型">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblMedioType"></asp:Label>
                                    <input type="hidden" runat="server" id="hiMedioId" value='<%#Eval("MULTIMEDIATEMPID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return MultimediaInfoItem("<%#Eval("MULTIMEDIATEMPID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return MultimediaInfoItem("<%#Eval("MULTIMEDIATEMPID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("MULTIMEDIATEMPID") %>'
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
        <div id="project">
            <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="kpms-table" width="100%">
                        <tr>
                            <td class="td-l">
                                工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode9" runat="server" class="kpms-textbox" style="width: 50px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName9" runat="server" class="kpms-textbox" style="width: 60px"
                                    readonly="readonly" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept9" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" style="text-align: right" colspan="6">
                                <span id="Span3" runat="server" displaystatus="(2.*)" class="req-star">请先保存再新增项目履历</span>
                                <asp:LinkButton runat="server" ID="btnAddProjectExperience" class="kpms-btn" OnClick="btnAddProjectExperience_Click"
                                    OnClientClick="return ProjectExperienceItem('','2')" displaystatus="(3.*)">
                                     <span>新增项目履历</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvProjectExperience" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PROEXPERIENCETEMPID"
                        OnRowCommand="gvProjectExperience_RowCommand" OnRowDataBound="gvProject_RowDataBound">
                        <Columns>
                            <asp:BoundField HeaderText="项目名称" DataField="PROJECTNAME"></asp:BoundField>
                            <asp:BoundField HeaderText="担任角色" DataField="RoleName"></asp:BoundField>
                            <asp:BoundField HeaderText="上任日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="卸任日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                            </asp:BoundField>
                            <asp:BoundField HeaderText="主要任务及工作内容" DataField="WORKCONTENT"></asp:BoundField>
                            <asp:TemplateField HeaderText="变更类型">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblProjectType"></asp:Label>
                                    <input type="hidden" runat="server" id="hiPId" value='<%#Eval("PROEXPERIENCETEMPID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ProjectExperienceItem("<%#Eval("PROEXPERIENCETEMPID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ProjectExperienceItem("<%#Eval("PROEXPERIENCETEMPID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("PROEXPERIENCETEMPID") %>'
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
        <%--地址/主要字段名/表名--%>
        <!--人员基本信息和扩展信息-->
        <input type="hidden" runat="server" id="hiBaseUrl" value="/EHR/Form/OrgUsers/PersonnelInfoPassForm.aspx" />
        <input type="hidden" runat="server" id="hiBaseName" value="基本信息" />
        <input type="hidden" runat="server" id="hiExtendName" value="扩展信息" />
        <input type="hidden" runat="server" id="hiPOriIdName" value="UserId" />
        <input type="hidden" runat="server" id="hiEOriIdName" value="UserId" />
        <!--学历学位-->
        <input type="hidden" runat="server" id="hiDegreeName" value="学历学位" />
        <input type="hidden" runat="server" id="hiDegreeUrl" value="/EHR/Form/OrgUsers/AcademicDegreeEditor.aspx" />
        <input type="hidden" runat="server" id="hiDegreeFCode" value="Education" />
        <input type="hidden" runat="server" id="hiDegreeFName" value="文化程度" />
        <!--获奖信息-->
        <input type="hidden" runat="server" id="hiPrizeName" value="获奖信息" />
        <input type="hidden" runat="server" id="hiPrizeUrl" value="/EHR/Form/OrgUsers/PrizeInfoEditor.aspx" />
        <input type="hidden" runat="server" id="hiPrizeFCode" value="PrizeName" />
        <input type="hidden" runat="server" id="hiPrizeFName" value="获奖名称" />
        <!--多媒体信息-->
        <input type="hidden" runat="server" id="hiMediaName" value="多媒体信息" />
        <input type="hidden" runat="server" id="hiMediaUrl" value="/EHR/Form/OrgUsers/MultimediaInfoEditor.aspx" />
        <input type="hidden" runat="server" id="hiMediaFCode" value="FileType" />
        <input type="hidden" runat="server" id="hiMediaFName" value="文件类型" />
        <!--项目履历-->
        <input type="hidden" runat="server" id="hiProjectName" value="项目履历" />
        <input type="hidden" runat="server" id="hiProjectUrl" value="/EHR/Form/OrgUsers/ProjectExperienceEditor.aspx" />
        <input type="hidden" runat="server" id="hiProjectFCode" value="ProjectName" />
        <input type="hidden" runat="server" id="hiProjectFName" value="项目名称" />
    </div>
    <div id="div111" style="max-width: 800px; overflow: scroll; height: auto; overflow: auto">
    </div>
    <script type="text/javascript">
        $(function () {
            SetBackGround();

            var $tab1 = $('#templateTabs').tabs();

            checkMaxLength();
            checkRegex();

            $('#<%=tbUserName.ClientID %>').live('blur', function () {
                query();
            })
        })
        function initCustomerPlugin() {

            
        }

        //选择部门
        function ChooseDept() {
            var param = new InputParamObject("s");
            var re = getEHROrg("re", param, "");
            if (re != null) {
                $("#<%=hiOrganizationID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=tbDept.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }

        //两端去空格函数  
        String.prototype.trim = function () { return this.replace(/(^\s*)|(\s*$)/g, ""); }
        //名字转拼音首字母
        function query() {
            var str = $('#<%=tbUserName.ClientID %>').val().trim();
            if (str == "") return;
            var arrRslt = HanZi_PinYin.get(str);
            $('#<%=tbABBRNAME.ClientID %>').val(arrRslt);
        }
    </script>
    <script type="text/javascript">
        var pid = $("#<%=hiPersonnelInfoID.ClientID %>").val(); //人员id
        var mainId = $("#<%=hiPersonelInfoPassMainID.ClientID %>").val(); //流程主表id
        var stepName = "<%=StepName %>"; //当前步骤
        var con = encodeURI("&stepName=" + stepName + "&pid=" + pid + "&mainId=" + mainId);

        //学历学位
        function DegreeItem(bizId, acType) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";

            if (acType == "2") {
                url = "/Portal/EHR/Form/OrgUsers/AcademicDegreeEditor.aspx?&actionType=" + acType + con;
            }
            else {
                url = "/Portal/EHR/Form/OrgUsers/AcademicDegreeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + con;
            }
            //window.open(url);
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
                url = "/Portal/EHR/Form/OrgUsers/ProjectExperienceEditor.aspx?&actionType=" + acType + con;
            }
            else {
                url = "/Portal/EHR/Form/OrgUsers/ProjectExperienceEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + con;
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
                url = "/Portal/EHR/Form/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + acType + con;
            }
            else {
                url = "/Portal/EHR/Form/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + con;
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
                url = "/Portal/EHR/Form/OrgUsers/MultimediaInfoEditor.aspx?&actionType=" + acType + con;
            }
            else {
                url = "/Portal/EHR/Form/OrgUsers/MultimediaInfoEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + con;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        
    </script>
</asp:Content>
