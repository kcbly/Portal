<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="项目经理证书管理编辑界面"
    AutoEventWireup="true" CodeBehind="ProjectManageEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.ProjectManageEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbPersonnelCode" readonly="readonly"
                    class="kpms-textbox" field="PERSONNELCODE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbPersonnelName" Field="PERSONNELNAME"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name"
                    EnableTheming="false" ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiPersonnelInfoId':'id','tbPersonnelCode':'UserCode'
                    ,'tbPersonnelName':'UserName','hiDeptId':'DEPTID','tbDeptName':'DEPTNAME','hiSubDeptId':'OrgUnitId','tbSubDeptName':'OrgUnitName','tbSex':'Sex'
                    ,'tbIdentityCardNO':'IDENTITYCARDNO'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    OnClick="lbtnChooseUser_Click" />
                <input type="hidden" id="hiPersonnelInfoId" runat="server" field="PERSONNELINFOID"
                    tablename="EHR_PRACTICEQUALIF" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_PRACTICEQUALIF" />
                <input type="hidden" id="hiSubDeptId" runat="server" field="SUBDEPTID" tablename="EHR_PRACTICEQUALIF" />
            </td>
            <%-- <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelName" class="kpms-textbox"
                    tablename="EHR_PRACTICEQUALIF" style="width: 100px" activestatus="(23.*)" req="1"
                    readonly="readonly" field="PERSONNELNAME" />
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PERSONNELINFOID"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiPersonnelCode" field="PERSONNELCODE" tablename="EHR_PRACTICEQUALIF"
                    activestatus="(23.*)" />
                <asp:ImageButton ID="lbtnChooseUser" runat="server" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择人员" CausesValidation="False" displaystatus="(23.*)" OnClientClick="return chooseUser();" />
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">
                证书名称
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlQuaflificationName" runat="server" field="QUAFLIFICATIONNAME"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                取得日期
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
                证书编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbQuaflificationCode" field="QUAFLIFICATIONCODE"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                有效期至
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveEndTime" class="kpms-textbox-date"
                    field="EFFECTIVEENDTIME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                证书级别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationLevel" field="QUAFLIFICATIONLEVEL"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                距有效期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveMonth" class="kpms-textbox-money"
                    field="EFFECTIVEMONTH" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly"
                    style="width: 30px">
                </zhongsoft:XHtmlInputText>
                月
            </td>
        </tr>
        <tr>
            <td class="td-l">
                颁发单位
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlIssueUnit" field="ISSUEUNIT" tablename="EHR_PRACTICEQUALIF"
                    MaxLength="32" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSex" readonly="readonly" class="kpms-textbox"
                    style="width: 50px" field="SEX" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                身份证号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbIdentityCardNO" field="IDENTITYCARDNO"
                    tablename="EHR_PRACTICEQUALIF" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" readonly="readonly" class="kpms-textbox"
                    field="DEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSubDeptName" readonly="readonly" class="kpms-textbox"
                    field="SUBDEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <%--<td class="td-l">
                人员状态
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtState" readonly="readonly" class="kpms-textbox"
                    field="STATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>--%>
            <td class="td-l">
                办理更新日期
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUpdateDate" class="kpms-textbox-date"
                    field="UPDATEDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly" />
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
            <td class="td-r" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传文件</span>
                <asp:LinkButton runat="server" ID="btnAttach" OnClientClick="uploadFile()" OnClick="lbtnAttach_Click"
                    DisplayStatus="(3.*)"><span>上传文件</span></asp:LinkButton>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                    ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input id="hiPracticeQualifID" type="hidden" runat="server" field="PRACTICEQUALIFID"
        tablename="EHR_PRACTICEQUALIF" />
    <input id="hiTypeFlag" type="hidden" runat="server" field="TYPEFLAG" tablename="EHR_PRACTICEQUALIF"
        value="3" />
    <script type="text/javascript">

        //验证正则表达式
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        $('#<%=txtEffectiveEndTime.ClientID %>').live('blur', function () {
            var aDate = new Date();
            var end = $('#<%=txtEffectiveEndTime.ClientID %>').val();
            if (end == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var endDate = new Date(end.replace(/-/g, "/"));
            var months = (endDate.getFullYear() - aDate.getFullYear()) * 12 + (endDate.getMonth() - aDate.getMonth());
            $('#<%=txtEffectiveMonth.ClientID %>').val(months);
        })

        //上传文件
        function uploadFile() {
            var fileSrcId = "<%=BusinessObjectId %>";
            showUploadForm(fileSrcId, "ProjectManageEditor");
            return true;
        }
    </script>
</asp:Content>
