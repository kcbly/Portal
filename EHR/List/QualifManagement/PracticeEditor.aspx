<%@ Page Title="执业注册资质管理编辑界面"  Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PracticeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.PracticeEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" activestatus="(2.*)"
                    field="PERSONNELNAME" tablename="EHR_PRACTICEQUALIF" DoCancel="true" Width="100px" SelectPageMode="Dialog"
                    req="1" OnClick="btnChooseUser_Click" ResultAttr="name" EnableTheming="false"
                    Writeable="true" ShowAttrs="name,UserCode" ShowJsonRowColName="true" ResultForControls="{'hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PERSONNELINFOID"
                    tablename="EHR_PRACTICEQUALIF" />
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly"
                    class="kpms-textbox"  field="PERSONNELCODE" tablename="EHR_PRACTICEQUALIF"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资格证书名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlQuaflificationName" runat="server" field="QUAFLIFICATIONNAME"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                资格证书编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbQuaflificationCode" field="QUAFLIFICATIONCODE"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资格证书级别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationLevel" field="QUAFLIFICATIONLEVEL"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                资格证书取得日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtQuaflificationGetDate" class="kpms-textbox-date"
                    field="QUAFLIFICATIONGETDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资格证书专业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationProfession" field="QUAFLIFICATIONPROFESSION"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>    
            <td colspan="2"></td>
        </tr>
        <tr>
            <td colspan="4" class="td-l" style="height: 10px">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                注册证书编号
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbRegisteredQualifCode" field="REGISTEREDQUALIFCODE"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                注册发证日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveStartTime" class="kpms-textbox-comparedate"
                    field="EFFECTIVESTARTTIME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly" compare="1" />
            </td>
        </tr>
        <tr>
             <td class="td-l">
                注册专业1
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMainProfession" field="MAINPROFESSION"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                注册有效期至</td>
            <td class="td-r">
               <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveEndTime" class="kpms-textbox-comparedate"
                    field="EFFECTIVEENDTIME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly" compare="1" /></td>
          
        </tr>
        <tr>
            <td class="td-l">注册专业2
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSecondProfession" field="SECONDPROFESSION"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">有效期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveMonth" class="kpms-textbox-money"
                    field="EFFECTIVEMONTH" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly"
                    style="width: 30px" />
                月</td>
        </tr>
        <tr>
            <td class="td-l">
                执业印章号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRegistrationCode" field="REGISTRATIONCODE"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>         
            <td class="td-l">
                注册单位
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlISSUEUNIT" field="ISSUEUNIT" tablename="EHR_PRACTICEQUALIF"
                    MaxLength="32" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
         <tr>
            <td colspan="4" class="td-l" style="height: 10px">
            </td>
        </tr>
        <tr>
            <td class="td-l">
                一次性奖励日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRewardDate" class="kpms-textbox-date"
                    field="REWARDDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                一次性奖励金额（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRewardMoney" field="REWARDMONEY" tablename="EHR_PRACTICEQUALIF"
                    regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正数、两位小数" MaxLength="15"
                    CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                月奖励开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtManthWardDate" class="kpms-textbox-date"
                    field="MANTHWARDDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                月奖励金额（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManthWardMoney" field="MANTHWARDMONEY"
                    tablename="EHR_PRACTICEQUALIF" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="请输入正数、两位小数" MaxLength="15" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSex" readonly="readonly" class="kpms-textbox"
                    style="width: 50px" field="SEX" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                年龄
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAge" readonly="readonly" class="kpms-textbox"
                    field="AGE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" style="width: 50px">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                身份证号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtIdentityCardNO" field="IDENTITYCARDNO"
                    tablename="EHR_PRACTICEQUALIF" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                人员状态
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="txtState" readonly="readonly" class="kpms-textbox"
                    field="STATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" readonly="readonly" class="kpms-textbox"
                    field="DEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
                <input type="hidden" id="hiDeptID" runat="server" field="DEPTID" tablename="EHR_PRACTICEQUALIF" />
            </td>
            <td class="td-l">
                科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSubDeptName" readonly="readonly"
                    class="kpms-textbox" field="SUBDEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
                <input type="hidden" id="hiSubDeptID" runat="server" field="SUBDEPTID" tablename="EHR_PRACTICEQUALIF" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRecark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="1024" tablename="EHR_PRACTICEQUALIF" field="RECARK"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                证书扫描件
            </td>
            <td class="td-m" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传证书扫描件</span>
                <asp:LinkButton ID="btnAttach" runat="server" OnClick="lbtnAttach_Click" OnClientClick="upLoadFile()"
                    DisplayStatus="(3.*)"><span>上传证书</span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                    ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input id="hiPracticeQualifID" type="hidden" runat="server" field="PRACTICEQUALIFID"   tablename="EHR_PRACTICEQUALIF" />
    <input id="hiTypeFlag" type="hidden" runat="server" field="TYPEFLAG" tablename="EHR_PRACTICEQUALIF" value="1" />
    <input id="hiUserXml" type="hidden" runat="server" />
    <script type="text/javascript"> 
        $('#<%=txtEffectiveEndTime.ClientID %>').live('blur', function () {
            var start = $('#<%=txtEffectiveStartTime.ClientID %>').val();
            if (start == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var end = $('#<%=txtEffectiveEndTime.ClientID %>').val();
            if (end == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var arrStart = start.split("-");
            var arrEnd = end.split("-");
            var aDate = new Date(arrStart[0], arrStart[1], arrStart[2]);
            var endDate = new Date(arrEnd[0], arrEnd[1], arrEnd[2]);
            var months = (endDate.getFullYear() - aDate.getFullYear()) * 12 + (endDate.getMonth() - aDate.getMonth());
            $('#<%=txtEffectiveMonth.ClientID %>').val(months);
        })

        $('#<%=txtEffectiveStartTime.ClientID %>').live('blur', function () {
            var start = $('#<%=txtEffectiveStartTime.ClientID %>').val();
            if (start == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var end = $('#<%=txtEffectiveEndTime.ClientID %>').val();
            if (end == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var arrStart = start.split("-");
            var arrEnd = end.split("-");
            var aDate = new Date(arrStart[0], arrStart[1], arrStart[2]);
            var endDate = new Date(arrEnd[0], arrEnd[1], arrEnd[2]);
            var months = (endDate.getFullYear() - aDate.getFullYear()) * 12 + (endDate.getMonth() - aDate.getMonth());
            $('#<%=txtEffectiveMonth.ClientID %>').val(months);
        })

        //选择人员
        function ChooseUser() {
            var param = new InputParamObject("s");
            var re = getUsers("<%=hiUserXml.ClientID %>", param, "");
            if (re != null) {
                $("#<%=hiPersonnelInfoID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtPersonnelName.ClientID %>").val(re.buildAttrJson("o", "name"));
                $("#<%=txtPersonnelCode.ClientID %>").val(re.buildAttrJson("o", "att2"));
                return true;
            }
            return false;
        }

        //上传附件
        function upLoadFile() {

            var fileSrcId = "<%=BusinessObjectId %>";
            showUploadForm(fileSrcId, "Module");
            return true;
        }
        //资格证书编号,供用户手工填写，查重
        $('#<%=tbQuaflificationCode.ClientID %>').live('blur', function () { 
            $.post("PracticeEditor.aspx", { asyfunc: "CheckSaveData", code: $("#<%=tbQuaflificationCode.ClientID%>").val() }, 
                function (data) {
                    if (intParse(data)>0) {
                        alert("资格证书编号重复！");
                        return false;
                    } else {
                        return true;
                    }
             });
        }) 
    </script>
</asp:Content>
