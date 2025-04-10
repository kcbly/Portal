<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_PersonnelInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.C_PersonnelInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/CustomerUpLoadFile.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l" rowspan="6">照片
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
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbUSERCODE" runat="server" ActiveStatus="(2.*)" Field="USERCODE"
                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
                <input type="hidden" id="hiLOGINID" runat="server" field="LOGINID" tablename="OrganizationUsers" />
            </td>
        </tr>
        <tr>
            <td class="td-l">姓名 <span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbUserName" runat="server" ActiveStatus="(23.*)" Field="UserName"
                    CssClass="kpms-textbox" MaxLength="16" TableName="OrganizationUsers" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">拼音姓名
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbABBRNAME" runat="server" ActiveStatus="(23.*)" Field="ABBRNAME"
                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" regex="^[a-zA-Z\s]+$"
                    errmsg="请输入正确的拼音姓名" />
            </td>
        </tr>
        <tr>
            <td class="td-l">曾用名
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbUSEDNAME" runat="server" ActiveStatus="(23.*)" Field="USEDNAME"
                    CssClass="kpms-textbox" MaxLength="20" TableName="OrganizationUsers" />
            </td>
        </tr>
        <tr>
            <td class="td-l">性别<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSex" field="Sex" tablename="OrganizationUsers"
                    req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">民族
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlNation" field="Nation" tablename="OrganizationUserProfile"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">籍贯
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbHometown" runat="server" ActiveStatus="(23.*)" Field="Hometown"
                    CssClass="kpms-textbox" MaxLength="128" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">出生日期
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBirthday" class="kpms-textbox-date"
                    field="Birthday" tablename="OrganizationUserProfile" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
            <%--            <td class="td-l">家庭住址
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbFamilyAddress" runat="server" ActiveStatus="(23.*)"
                    Field="FamilyAddress" MaxLength="128" TableName="OrganizationUserProfile" />
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">证件类型
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlIDType" field="IDType" tablename="OrganizationUserProfile" activestatus="(23.*)">
                    <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                    <asp:ListItem Value="身份证" Text="身份证"></asp:ListItem>
                    <asp:ListItem Value="护照" Text="护照"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">证件号码
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbIdentityCardNO" runat="server" ActiveStatus="(23.*)"
                    Field="IdentityCardNO" CssClass="kpms-textbox" MaxLength="18" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">职称
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbSkillTitle" runat="server" ActiveStatus="(23.*)" CssClass="kpms-textbox" TableName="EHR_SKILLLEVEL" Field="SkillTitle" />
            </td>
            <td class="td-l">职称证号
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbSkillCode" runat="server" ActiveStatus="(23.*)" CssClass="kpms-textbox" TableName="EHR_SKILLLEVEL" Field="SkillCode" />
            </td>
        </tr>
        <tr>
            <%--<td class="td-l">文化程度
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText ID="txtEducation" runat="server" readonly="readonly" class="kpms-textbox"
                    field="Education" tablename="OrganizationUserProfile" activestatus="(23.*)" />
            </td>--%>
            <td class="td-l">婚姻状况
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMARITALSTATE" field="MARITALSTATE" Width="120"
                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="ltbSort" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Sort" TableName="OrganizationUsers" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">政治面貌<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPoliticalLandscape" field="PoliticalLandscape" tablename="OrganizationUserProfile" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox-short"
                    req="1" field="OrgUnitName" tablename="OrganizationUsers" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                    tablename="OrganizationUsers" />
                <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept(1)"
                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                    <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <%--            <td class="td-l">挂职部门
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText ID="txtAttachmentDeptName" runat="server" readonly="readonly" class="kpms-textbox-short"
                    field="AttachmentDeptName" tablename="OrganizationUserProfile" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiAttachmentDeptID" field="AttachmentDeptID"
                    tablename="OrganizationUserProfile" />
                <asp:LinkButton runat="server" ID="lkbnAttachmentDeptName" OnClientClick="return ChooseDept(2)"
                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                    <img alt="选择部门" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">参加工作日期
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWorkingTime" class="kpms-textbox-date"
                    field="WORKDATE" tablename="OrganizationUserProfile" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">进入本单位工作日期
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtInUnitTime" class="kpms-textbox-date"
                    field="INNOWCORPDATE" tablename="OrganizationUserProfile" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
        </tr>
        <%--<tr>
            <td class="td-l">用工类型
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentType" field="EmploymentType"
                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">用工形式
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" field="EmploymentForm"
                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">来源渠道
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightTextBox ID="tbSourceChannel" runat="server" ActiveStatus="(23.*)"
                    Field="SourceChannel" MaxLength="64" CssClass="kpms-textbox" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">员工性质
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEmployeeNature" field="EmployeeNature"
                    tablename="OrganizationUserProfile" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">复转军人标识
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText ID="txtSoldier" runat="server" readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
            </td>
            <td class="td-l">农电工标识
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlNDFlag" activestatus="(23.*)" field="NDFlag" tablename="OrganizationUserProfile">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>--%>
        <tr>
            <td class="td-l">人员状态<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlState" field="State" tablename="OrganizationUserProfile"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">人员类别
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCategory" field="Category" tablename="OrganizationUserProfile"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>

        </tr>
        <tr>
            <td class="td-l">是否统计考勤<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="4">

                <zhongsoft:LightDropDownList runat="server" ID="ddlIsAttendance" field="IsAttendance" tablename="OrganizationUserProfile"
                    activestatus="(23.*)" req="1" Width="120">
                </zhongsoft:LightDropDownList>
            </td>

        </tr>

        <%--<tr>
            <td class="td-l">岗位名称
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
            </td>
        </tr>--%>
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
                <zhongsoft:LightTextBox ID="tbWorkPhone1" runat="server" ActiveStatus="(23.*)" Field="WorkPhone1"
                    axLength="11" TableName="OrganizationUserProfile" regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$"
                    errmsg="请输入正确的手机号码" />
            </td>
            <td class="td-l">办公电话
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOfficePhone" runat="server" ActiveStatus="(23.*)" Field="OfficePhone" DataType="Telphone"
                    MaxLength="64" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">Email
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEmail" runat="server" ActiveStatus="(23.*)" Field="EmailAdd"
                    MaxLength="64" TableName="OrganizationUserProfile" regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$"
                    errmsg="请输入正确的Email" />
            </td>
        </tr>
        <tr>
            <td class="td-l">传真号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFax" runat="server" ActiveStatus="(23.*)" MaxLength="64" Field="Fax" TableName="OrganizationUserProfile" DataType="Telphone" />
            </td>
            <td class="td-l">QQ/微信号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbQQWeChat" runat="server" ActiveStatus="(23.*)" MaxLength="64" Field="QQWeiXinCode" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">办公室所在位置</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbLocation" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Location" TableName="OrganizationUserProfile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">楼层
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFloor" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Floor" TableName="OrganizationUserProfile" />
            </td>
            <td class="td-l">房间号
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbRoom" runat="server" ActiveStatus="(23.*)" MaxLength="128" Field="Room" TableName="OrganizationUserProfile" Width="180px" />
            </td>

        </tr>
        <tr>
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

    <input type="hidden" runat="server" id="hdnPwd" field="Pwd" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="OrganizationUsers" />
    <input type="hidden" runat="server" id="hiEXUserId" field="UserId" tablename="OrganizationUserProfile" />
    <input type="hidden" runat="server" id="hiIsIncorp" field="isIncorp" value="1" tablename="OrganizationUserProfile" />
    <input type="hidden" runat="server" id="hiSkillLevelID" field="SkillLevelID" tablename="EHR_SKILLLEVEL" />
    <input type="hidden" runat="server" id="hiSkillUserId" field="UserId" tablename="EHR_SKILLLEVEL" />
    <input type="hidden" runat="server" id="hiIsNow" field="IsNow" value="1" tablename="EHR_SKILLLEVEL" />
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

            initPageControl();
        }

        function initPageControl() {
            calculateAge();
            //人员进入、返聘人员信息控制  “工号”“姓名”“性别”“所属部门”必填，其他的都是非必填
            var EmploymentForm = '<%=EmploymentForm %>';
            var IsInCompany = '<%=IsInCompany %>';
            <%--if ((EmploymentForm == "院外返聘" && "<%=ActionType %>" == "Create")
                || $("#<%=ddlEmploymentForm.ClientID %>").val() == "院外返聘"
                || IsInCompany == "0") {
                $('span[class=req-star]').hide();
                $('[state=1]').show();
                if (EmploymentForm == "院外返聘") {
                    $('#<%=ddlEmploymentForm.ClientID%> option[value="院外返聘"]').attr('selected', 'true')
                    $('#<%=ddlEmploymentForm.ClientID%>').attr('disabled', 'disabled');
                }
            }--%>
        }

        //计算年龄
        function calculateAge() {

        }


        //选择部门
        function ChooseDept(type) {
            var param = new InputParamObject("s");
            if (type == 2) {
                param = new InputParamObject("m");
            }
            var re = getOrgsNew("re", param, null);
            if (re != null) {
                if (type == 1) {
                    $("#<%=hiOrganizationID.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtDept.ClientID %>").val(re.buildAttrJson("o", "name"));
                } else if (type == 2) {
<%--                    $("#<%=hiAttachmentDeptID.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=txtAttachmentDeptName.ClientID %>").val(re.buildAttrJson("o", "name"));--%>
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
</asp:Content>
