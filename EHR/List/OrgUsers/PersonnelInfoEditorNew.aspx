<%@ Page Title="员工个人基本信息编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PersonnelInfoEditorNew.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelInfoEditorNew" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Register Src="~/EHR/UI/Controls/QualifInfoList.ascx" TagPrefix="uc1" TagName="QualifInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li class="baseInfo" style="display: none"><a href='#baseInfo' id='abaseInfo'>基本信息</a></li>
            <li class="work" style="display: none"><a href='#work' id='awork'>工作履历</a></li>
            <li class="degree" style="display: none"><a href='#degree' id='adegree'>学历及学位</a></li>
            <li class="qualifications" style="display: none"><a href='#qualifications' id='aqualifications'>资格信息</a></li>
            <li class="titlePositionChange" style="display: none"><a href='#titlePositionChange' id='atitlePositionChange'>职务变动</a></li>
            <li class="contract" style="display: none"><a href='#contract' id='acontract'>劳动合同</a></li>
            <li class="train" style="display: none"><a href='#train' id='atrain'>教育培训</a></li>
            <li class="project" style="display: none"><a href='#project' id='aproject'>项目履历</a></li>
            <li class="positionChange" style="display: none"><a href='#positionChange' id='apositionChange'>岗位变动</a></li>
            <li class="soldier" style="display: none"><a href='#soldier' id='asoldier'>复转军人信息</a></li>
            <li class="languageInfo" style="display: none"><a href='#languageInfo' id='alanguageInfo'>语言、计算机能力</a></li>
            <li class="personnelfile" style="display: none"><a href='#personnelfile' id='apersonnelfile'>人事档案</a></li>
            <li class="familymember" style="display: none"><a href='#familymember' id='afamilymember'>家庭成员</a></li>
        </ul>
        <div id="baseInfo" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                          <tr>
                            <td class="td-l" rowspan="6">照片
                            </td>
                            <td class="td-m" rowspan="6"  >
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
                            <td class="td-l">登录号 <span class="req-star">*</span>
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbUSERCODE" runat="server" ActiveStatus="(23.*)" Field="LOGINID"
                                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" /> 
                            </td> 
                        </tr>
                        <tr>
                            <td class="td-l">姓名 <span class="req-star">*</span>
                            </td>
                            <td class="td-m" >
                                <zhongsoft:LightTextBox ID="tbUserName" runat="server" ActiveStatus="(23.*)" Field="UserName"
                                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">拼音姓名
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbABBRNAME" runat="server" ActiveStatus="(23.*)" Field="ABBRNAME"
                                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" regex="^[a-zA-Z\s]+$"
                                    errmsg="请输入正确的拼音姓名" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">曾用名
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbUSEDNAME" runat="server" ActiveStatus="(23.*)" Field="USEDNAME"
                                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">性别<span class="req-star">*</span>
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex"  Width="105px" tablename="OrganizationUsers"
                                    req="1" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">民族
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlNation" field="Nation"  Width="105px" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table"> 
                         <tr>
                            <td class="td-l">出生日期<span class="req-star">*</span>
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText runat="server" ID="txtBirthday" class="kpms-textbox-date"
                                    field="Birthday" req="1" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                               <td class="td-l">参加工作日期
                            </td>
                            <td class="td-m" >
                                <zhongsoft:XHtmlInputText runat="server" ID="txtWorkingTime" class="kpms-textbox-date"
                                    field="WORKDATE" tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly" />
                            </td>
                            <td class="td-l">进入本单位工作日期
                            </td>
                            <td class="td-m" >
                                <zhongsoft:XHtmlInputText runat="server" ID="txtInUnitTime" class="kpms-textbox-date"
                                    field="INNOWCORPDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td> 
                        </tr>
                        <tr>
                              <td class="td-l">国籍
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="txtNationality" runat="server" ActiveStatus="(23.*)" Width="195px" 
                                    Field="Nationality" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">籍贯 <span class="req-star">*</span>
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbHometown" runat="server" ActiveStatus="(23.*)" Field="Hometown"
                                    CssClass="kpms-textbox" MaxLength="128" TableName="OrganizationUserProfile" req="1" />
                            </td>
                            <td class="td-l">家庭住址
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightTextBox ID="tbFamilyAddress" runat="server" ActiveStatus="(23.*)"
                                    Field="FamilyAddress" MaxLength="128" TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <tr>
                              <td class="td-l">农电工标识
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlNDFlag" Width="205px"  activestatus="(23.*)" field="NDFlag" tablename="OrganizationUserProfile">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">证件类型
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlIDType"  Width="205px"  field="IDType" tablename="OrganizationUserProfile" activestatus="(23.*)">
                                    <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                                    <asp:ListItem Value="身份证" Text="身份证"></asp:ListItem>
                                    <asp:ListItem Value="护照" Text="护照"></asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">证件号码
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbIdentityCardNO" runat="server" ActiveStatus="(23.*)"
                                    Field="IdentityCardNO" CssClass="kpms-textbox" MaxLength="18" TableName="OrganizationUserProfile" />
                            </td>

                        </tr>  
                        <tr>
                            <td class="td-l">所属部门<span class="req-star">*</span>
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox-short"
                                    req="1" field="OrgUnitName" tablename="OrganizationUsers" activestatus="(23.*)" />
                                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                                    tablename="OrganizationUsers" />
                                <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept(1)"
                                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                    <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                            </td>
                            <td class="td-l">挂职部门
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText ID="txtAttachmentDeptName" runat="server" readonly="readonly" class="kpms-textbox-short"
                                    field="AttachmentDeptName" tablename="OrganizationUserProfile" activestatus="(23.*)" />
                                <input type="hidden" runat="server" id="hiAttachmentDeptID" field="AttachmentDeptID"
                                    tablename="OrganizationUserProfile" />
                                <asp:LinkButton runat="server" ID="lkbnAttachmentDeptName" OnClientClick="return ChooseAttachmentDept()"
                                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                                   <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                            </td>
                             <td class="td-l">政治面貌<span class="req-star">*</span>
                            </td>
                            <td class="td-m" colspan="2">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPoliticalLandscape"  Width="205px" field="PoliticalLandscape" tablename="OrganizationUserProfile" activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr> 
                        <tr>
                            <td class="td-l">用工类型
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentType"  Width="205px"  field="EmploymentType"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">用工形式
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm"  Width="205px"  field="EmploymentForm"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                                <td class="td-l">来源渠道
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightTextBox ID="tbSourceChannel" runat="server" ActiveStatus="(23.*)"
                                    Field="SourceChannel" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
                            </td>
                        </tr> 
                       
                        <tr>
                            <td class="td-l">人员状态<span class="req-star">*</span>
                            </td>
                            <td class="td-m" >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlState"  Width="205px"  field="State" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">人员类别<span class="req-star">*</span>
                            </td>
                            <td class="td-m" >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlCategory"  Width="205px"  field="Category" tablename="OrganizationUserProfile"
                                    activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                             <td class="td-l">员工性质
                            </td>
                            <td class="td-m" >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlEmployeeNature"  Width="205px" field="EmployeeNature"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                          <tr>
                            <td class="td-l">文化程度
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText ID="txtEducation" runat="server" readonly="readonly" style=" width:195" class="kpms-textbox" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">健康状况
                            </td>
                            <td class="td-m" > 
                               <zhongsoft:LightTextBox ID="txtBodyHealthy" runat="server" ActiveStatus="(23.*)"
                                    Field="BodyHealthy" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
                            </td>
                              <td class="td-l">婚姻状况
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:LightDropDownList runat="server" ID="ddlMARITALSTATE"   Width="205px" field="MARITALSTATE"
                                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr> 
                        <tr>
                               <td class="td-l">复转军人标识
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText ID="txtSoldierType" runat="server" readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">岗位名称
                            </td>
                            <td class="td-m"  >
                                <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
                            </td>
                             <td class="td-l"  >
                               IPv4地址
                            </td>
                             <td class="td-m"  >
                          <zhongsoft:LightTextBox ID="txtIPv4" runat="server" ActiveStatus="(23.*)" Field="IpAddr" DataType="IPv4"
                                  MaxLength="15"   TableName="OrganizationUserProfile"  
                                    errmsg="请输入正确的IPv4地址" />
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
                            <td class="td-l">常用手机号码
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbMobliePhone" runat="server" ActiveStatus="(23.*)" Field="MobilePhone"
                                    axLength="11" TableName="OrganizationUsers" regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$"
                                    errmsg="请输入正确的手机号码" />
                            </td>
                            <td class="td-l">办公电话
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbPhone" runat="server" ActiveStatus="(23.*)" Field="Phone"
                                    MaxLength="64" TableName="OrganizationUsers" />
                            </td>

                            <td class="td-l">传真号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbFax" runat="server" ActiveStatus="(23.*)" Field="Fax"
                                    MaxLength="64" TableName="OrganizationUserProfile" regex="^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$"
                                    errmsg="请输入正确的传真" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">楼层
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbFloor" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Floor" TableName="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">QQ/微信号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbQQWeiXinCode" runat="server" ActiveStatus="(23.*)" MaxLength="64" Field="QQWeiXinCode" TableName="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">Email
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbEmail" runat="server" ActiveStatus="(23.*)" Field="Email"
                                    MaxLength="64" TableName="OrganizationUsers" regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$"
                                    errmsg="请输入正确的Email" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">房间号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox ID="tbSeatNO" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="SeatNO" TableName="OrganizationUserProfile" />
                            </td>
                            <td class="td-l">办公室所在位置</td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:LightTextBox ID="tbLocation" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Location" TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">备注
                            </td>
                            <td class="td-m" colspan="5">
                                <zhongsoft:LightTextBox ID="tbMemo" runat="server" ActiveStatus="(23.*)" Field="Memo"
                                    TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Maxtext="512"
                                    TableName="OrganizationUserProfile" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
        <div id="degree" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode1" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName1" runat="server" class="kpms-textbox" style="width:160px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept1" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvDegree" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="AcademicDegreeID"
                        OnRowDataBound="gvDegree_RowDataBound">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="入学时间" DataField="ENROLLMENTDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="毕业时间" DataField="GraduateDate" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <zhongsoft:LightBoundField HeaderText="教育类型/学历" DataField="Education"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="教育/培训" DataField="EducationType"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="证书" DataField="CertificateName"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="学制" DataField="SchoolingLength"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="从学单位类别" DataField="UnitCategory"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="毕业院校" DataField="GraduateSchool" ShowToolTip="true"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="是否最高学历" DataField="IsDegree2"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="是否单位送培标识" DataField="IsDWSPAcademic2"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true"></zhongsoft:LightBoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return DegreeItem("<%#DataBinder.Eval(Container.DataItem,"AcademicDegreeID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="qualifications" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel22" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:QualifInfoList runat="server" ID="QualifInfoList" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="contract" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel14" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode3" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName3" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept3" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="LABORCONTRACTID" BindGridViewMethod="DataContractBind">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="合同编号" DataField="CONTRACTCODE"></asp:BoundField>
                            <asp:BoundField HeaderText="合同起始日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="70px"></asp:BoundField>
                            <asp:BoundField HeaderText="到期日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                                ItemStyle-Width="70px"></asp:BoundField>
                            <asp:BoundField HeaderText="签订期限" DataField="SIGNINGTERM" ItemStyle-HorizontalAlign="Right"></asp:BoundField>
                            <zhongsoft:LightBoundField HeaderText="用工形式" DataField="EMPLOYMENTFORM">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="合同归属单位" DataField="CONTRACTBELONGTO">
                            </zhongsoft:LightBoundField>
                            <asp:BoundField HeaderText="合同类型" DataField="CONTRACTTYPE"></asp:BoundField>
                            <asp:BoundField HeaderText="合同状态" DataField="CONTRACTSTATE"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return ContractItem("<%#DataBinder.Eval(Container.DataItem,"LABORCONTRACTID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hoand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="train" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode2" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName2" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept2" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>

                    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvTraining" UseDefaultDataSource="true"
                        runat="server" DataKeyNames="EducationTrainID" BindGridViewMethod="BindData">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="所在部门">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="PostType" HeaderText="职务">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="EducationType" HeaderText="学历">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="TrainForm" HeaderText="培训形式">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="TrainType" HeaderText="培训类别">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="TrainUnits" HeaderText="培训单位">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="TrainContent" HeaderText="培训内容">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="StarDate" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="EndDate" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="CertificationAuthority" HeaderText="发证机构">
                            </zhongsoft:LightBoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                ItemStyle-Width="5%">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return TrainItem("<%#DataBinder.Eval(Container.DataItem,"EducationTrainID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
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
                            <td class="td-l">工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode4" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName4" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept4" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvProjectExperience" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="ProExperienceID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="项目名称" DataField="ProjectName"></asp:BoundField>
                            <asp:BoundField HeaderText="担任角色" DataField="RoleName"></asp:BoundField>
                            <asp:BoundField HeaderText="上任日期" DataField="AppointDate" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="卸任日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="主要任务及工作内容" DataField="WorkContent"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" Visible='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem,"Show").ToString()) %>'
                                        EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return ProjectExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ProExperienceID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="width: 100%; height: 20px; display: none">
                <asp:UpdatePanel ID="UpdatePanel16" UpdateMode="Conditional" runat="server">
                    <ContentTemplate>
                        <zhongsoft:LightPowerGridView runat="server" ID="gvProj" AutoGenerateColumns="false"
                            Width="100%" AllowPaging="true" ShowPageSizeChange="true" DataKeyNames="OrganizationID"
                            UseDefaultDataSource="true" BindGridViewMethod="BindProjGV" PageSize="15" EmptyDataText="没有数据">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-Width="3%">
                                    <ItemTemplate>
                                        <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName"></zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="担任角色" DataField="RoleName"></zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="上任日期" DataField="AppointDate" DataFormatString="{0:yyyy-MM-dd}">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="卸任日期" DataField="LeaveDate" DataFormatString="{0:yyyy-MM-dd}">
                                </zhongsoft:LightBoundField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div id="positionChange" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel21" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode5" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName5" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept5" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPostionChange" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="USERCHANGEID" OnRowDataBound="gvPostionChange_RowDataBound">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:TemplateField HeaderText="原岗位" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lbPositionOrg" runat="server"></asp:Label>
                                    <input type="hidden" id="hiPositionXml" runat="server" value='<%#Eval("OGPOSITIONXML") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="离岗日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:TemplateField HeaderText="现岗位" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lbPositionChange" runat="server"></asp:Label>
                                    <input type="hidden" id="hiChangePositionXml" runat="server" value='<%#Eval("CHANGEPOSITIONXML") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="上岗日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="变动原因" DataField="ChangeReason"></asp:BoundField>
                            <asp:BoundField HeaderText="是否主岗" DataField="IsMainPosition2"></asp:BoundField>
                            <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return PostionChangeItem("<%#DataBinder.Eval(Container.DataItem,"USERCHANGEID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="languageInfo" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode6" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtNam6" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept6" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvLanguage" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="LanguageInfoID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField HeaderText="语种名称" DataField="LanguageName"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="熟练程度" DataField="Proficiency"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="语言水平" DataField="LanguageLevel"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="证书编号" DataField="CertificateNO"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="证书取得日期" DataField="CertificateDate" DataFormatString="{0:yyyy-MM-dd}"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="计算机水平级别" DataField="ComputerLevel"></zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="计算机熟练程度" DataField="ComputerProficiency"></zhongsoft:LightBoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return LanguageItem("<%#DataBinder.Eval(Container.DataItem,"LanguageInfoID") %>","1");'
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
            <asp:UpdatePanel ID="UpdatePanel6" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode7" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName7" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所在部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept7" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvWorkExperience" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="ID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="单位（公司）" DataField="WORKCORP"></asp:BoundField>
                            <asp:BoundField HeaderText="单位性质" DataField="CORPPROPERTY"></asp:BoundField>
                            <asp:BoundField HeaderText="开始时间" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="结束时间" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>

                            <asp:BoundField HeaderText="部门" DataField="WORKDEPT"></asp:BoundField>
                            <asp:BoundField HeaderText="岗位" DataField="POST"></asp:BoundField>
                            <asp:BoundField HeaderText="行业" DataField="Industry"></asp:BoundField>
                            <asp:BoundField HeaderText="证明人" DataField="Witness"></asp:BoundField>
                            <asp:BoundField HeaderText="证明人联系方式" DataField="WitnessInformation"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return WorkExperienceItem("<%#DataBinder.Eval(Container.DataItem,"ID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
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
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode8" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName8" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept8" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPositionChange" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="PARTYGOVRANKID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="担任职务时部门" DataField="RANKDEPTNAME" />
                            <asp:BoundField HeaderText="职务名称" DataField="RANKNAME"></asp:BoundField>
                            <asp:BoundField HeaderText="职务级别" DataField="RANKLEVEL"></asp:BoundField>
                            <asp:BoundField HeaderText="任职日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="免职日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"></asp:BoundField>
                            <asp:BoundField HeaderText="是否现行政<br />职务" DataField="IsNow2" HtmlEncode="false"></asp:BoundField>
                            <asp:BoundField HeaderText="是否最高<br />行政级别" DataField="ISHIGHEST2" HtmlEncode="false"></asp:BoundField>
                            <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return PositionChangeItem("<%#DataBinder.Eval(Container.DataItem,"PARTYGOVRANKID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="soldier" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel12" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">工号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode9" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName9" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept9" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvSoldier" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="SoldierInfoID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <asp:BoundField HeaderText="类别" DataField="SoldierType"></asp:BoundField>
                            <asp:BoundField HeaderText="部队名称" DataField="ARMYNAME"></asp:BoundField>
                            <asp:BoundField HeaderText="军内职级" DataField="SOLDIERLEVEL"></asp:BoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img3"  onclick='return SoldierItem("<%#DataBinder.Eval(Container.DataItem,"SoldierInfoID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="personnelfile" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel7" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode10" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName10" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept10" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvPersonnelFile" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="PersonnelFileID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField HeaderText="档案编号" DataField="FileCode" ItemStyle-Wrap="false">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="人事档案类别" DataField="FileType">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="地点" DataField="Place">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="档案管理单位" DataField="ManagementUnit">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="正本卷数" DataField="OriginalNumber">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="副本卷数" DataField="CopyNumber">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="档案变动原因" DataField="ChangeReason" ShowToolTip="true">
                            </zhongsoft:LightBoundField>
                            <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img3"  onclick='return PersonnelFileItem("<%#DataBinder.Eval(Container.DataItem,"PersonnelFileID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="familymember" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel8" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">登录号
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtCode11" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">姓名
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtName11" runat="server" class="kpms-textbox" style="width: 150px"
                                    readonly="readonly" activestatus="(2.*)" />
                            </td>
                            <td class="td-l">所属部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtDept11" runat="server" class="kpms-textbox" readonly="readonly"
                                    activestatus="(2.*)" />
                            </td>
                        </tr>
                    </table>
                    <zhongsoft:LightPowerGridView ID="gvFamilyMember" runat="server" AutoGenerateColumns="false"
                        UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="FAMILYMEMBERID">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="3%">
                                <ItemTemplate>
                                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField HeaderText="家庭成员姓名" DataField="MemberName" ItemStyle-Wrap="false">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="家庭成员类型" DataField="Relationship">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="工作单位" DataField="WORKCORP">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="联系方式" DataField="Phone">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="ViewFamilyMemberItem" DataParamFields="FAMILYMEMBERID">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" id="hiOpenPage" runat="server" />
    <input type="hidden" id="hiType" runat="server" />
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiEXUserId" field="UserId" tablename="OrganizationUserProfile" />
      <!--没有部门得人员标识为0；正常人员信息标识为1-->
     <input type="hidden" runat="server" id="hiIsIncorp" field="IsIncorp" tablename="OrganizationUserProfile" />
    <!--要显示的页签-->
    <input type="hidden" runat="server" id="hiShow" /> 
    <script type="text/javascript">
        //计算年龄&设置星座
        $("#<%=txtBirthday.ClientID %>").live('blur', function () {
            calculateAge();
        });
        //自动按照名称转出简拼名称
        $('#<%=tbUserName.ClientID %>').live('blur', function () {
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
            if (showList.length == 1 && showList[0] == "practiceCareer")
                $tab1 = $('#templateTabs').tabs({ active: 9 });


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
            if (orgOpenPage == 1 || orgOpenPage == 2 || orgOpenPage == 3 || orgOpenPage == 4
                || orgOpenPage == 6 || orgOpenPage == 7) {
                $('#<%=hiType.ClientID %>').val("1")
            }
            if (pageOpen == false && '<%=ActionType %>' == 'Update') {
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
        function calculateAge() {

        }

        //选择部门
        function ChooseDept(type) {
            var param = new InputParamObject("s");
            var re = getOrgsNew("re", param, null);
            if (re != null) {
                if (type == 1) {
                    $("#<%=hiOrganizationID.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtDept.ClientID %>").val(re.buildAttrJson("o", "name"));
                }
            }
            return false;
        }
      //选择挂职部门
        function ChooseAttachmentDept() {
            var param = new InputParamObject("s");
            var re = getOrgsNew("re", param, null);
            if (re != null) {
                if (type == 1) {
                    $("#<%=hiAttachmentDeptID.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtAttachmentDeptName.ClientID %>").val(re.buildAttrJson("o", "name"));
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
            var url = "<%=WebAppPath %>" + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSourceID + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf + "&Catalogs=" + $formObjId + "&imageType=true";
            var sFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, "", sFeatures);
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
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/TrainManagement/EducationTrainEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //工作履历
        function WorkExperienceItem(bizId, acType) {
            var stringFeatures = "dialogHeight:500px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
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
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/TechQualifEditor.aspx?&actionType=" + acType + "&bizId=<%=BusinessObjectId %>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/TechQualifEditor.aspx?&actionType=" + acType + "&bizId=<%=BusinessObjectId %>";
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
        function PracticeItem(bizId, acType, type) {
            var stringFeatures = "dialogHeight:550px; dialogWidth: 850px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                if (type == 1)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/PracticeEditor.aspx?&actionType=" + acType;
                if (type == 2)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=" + acType;
                if (type == 3)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/ProjectManageEditor.aspx?&actionType=" + acType;
            }
            else {
                if (type == 1)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/PracticeEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
                if (type == 2)
                    url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
                if (type == 3)
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
        //家庭成员
        function ViewFamilyMemberItem(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FamilyMemberEditor.aspx?&actionType=1&bizId=" + bzid;
            showDivDialog(url, "", 800, 400, null);
            return false;
        }
        //人事档案
        function PersonnelFileItem(bizId, acType) {
            var stringFeatures = "dialogHeight:500px; dialogWidth: 900px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelFileEditor.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelFileEditor.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }

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
        //财务档号
        function FinanceNum(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FinanceNum.aspx?&actionType=" + acType + "&pid=<%=BusinessObjectId%>";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FinanceNum.aspx?&actionType=" + acType + "&bizId=" + bizId + "&pid=<%=BusinessObjectId%>";
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
        //专利
        function PatentInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            url = "<%=WebAppPath %>" + "/TSM/List/TSM/PatentTechnologyEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;

            window.showModalDialog(url, null, stringFeatures)
            return false;

        }
    </script>
</asp:Content>
