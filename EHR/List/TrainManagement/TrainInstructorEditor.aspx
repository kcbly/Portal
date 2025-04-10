<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainInstructorEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainInstructorEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style type="text/css">
        td
        {
            white-space: nowrap;
        }
    </style>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                讲师类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlInstructorType" req="1" activestatus="(23.*)"
                    field="INSTRUCTORTYPE" tablename="EHR_TRAININSTRUCTORENTITY" AutoPostBack="true" Width="100px"
                    OnSelectedIndexChanged="SelectedChanged">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" CssClass="kpms-textbox" req="1"
                    MaxLength="5" field="NAME" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)"
                    Width="100px">
                </zhongsoft:LightTextBox>
                <zhongsoft:LightObjectSelector runat="server" ID="selUser" activestatus="(23.*)"
                    Visible="false" DoCancel="true" field="NAME" tablename="EHR_TRAININSTRUCTORENTITY"
                    ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    Width="100px" OnClick="btnUnderTakerSelector_Click" ResultForControls="{'hiUserID':'id','hiUserCode':'UserCode','hiUserName':'UserName','hiSex':'Sex','tbDept':'OrgUnitName','hiDeptID':'OrgUnitId','tbMobilePhone':'MobilePhone','tbPhone':'Phone','tbEmail':'Email'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserID" field="USERID" tablename="EHR_TRAININSTRUCTORENTITY" />
                <input type="hidden" runat="server" id="hiUserCode" field="USERCODE" tablename="EHR_TRAININSTRUCTORENTITY" />
            </td>
            <td class="td-l">
                性别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblSex" req="1" field="SEX" tablename="EHR_TRAININSTRUCTORENTITY"
                    RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiSex"/>
            </td>
            <td class="td-l">
                讲授时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTeachingTime" runat="server" readonly="readonly"
                    field="TEACHINGTIME" class="kpms-textbox-date" tablename="EHR_TRAININSTRUCTORENTITY"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                研究方向
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbResearchArea" CssClass="kpms-textbox"
                    MaxLength="50" field="RESEARCHAREA" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                主要课程<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMainClass" CssClass="kpms-textbox" EnableTheming="false"
                    MaxLength="100" field="MAINCLASS" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)"
                    Width="98%">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                其他课程
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbOtherClass" CssClass="kpms-textbox"
                    MaxLength="100" field="OTHERCLASS" tablename="EHR_TRAININSTRUCTORENTITY" Width="98%"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" style="white-space: normal; line-height: 1.5">
                为我院提供过的培训课程
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbTraindeClass" CssClass="kpms-textbox"
                    MaxLength="100" field="TRAINEDCLASS" tablename="EHR_TRAININSTRUCTORENTITY" Width="98%"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训对象
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainClassHour" CssClass="kpms-textbox"
                    MaxLength="128" field="TRAINOBJECT" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训人数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbNumberOfTrain" CssClass="kpms-textbox"
                    errmsg="请输入正确的培训人数(1-4位整数)" regex="^\d{1,4}$" field="NUMBEROFTRAINING" tablename="EHR_TRAININSTRUCTORENTITY"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工作单位
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCompany" CssClass="kpms-textbox" Width="98%"
                    MaxLength="64" field="COMPANY" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                所在部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDept" CssClass="kpms-textbox" Width="98%"
                    MaxLength="64" field="DEPT" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiDeptID" field="DEPTID" tablename="EHR_TRAININSTRUCTORENTITY" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                手机
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMobilePhone" CssClass="kpms-textbox"
                    MaxLength="11" field="MOBILEPHONE" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)"
                    Width="80px" regex="^[1][0-9]{10}$" errmsg="请输入正确的手机号码">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                电话
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhone" CssClass="kpms-textbox" MaxLength="13"
                    field="PHONE" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)" Width="100px"
                    regex="^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$" errmsg="请输入正确的座机号码">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                传真
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFax" CssClass="kpms-textbox" MaxLength="15"
                    field="FAX" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)" Width="100px"
                    regex="^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$" errmsg="请输入正确的传真号">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                邮箱
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEmail" CssClass="kpms-textbox" MaxLength="30"
                    field="EMAIL" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)" Width="150px"
                    regex="^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$" errmsg="请输入正确的邮箱">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                网址
            </td>
            <td class="td-r" colspan="7">
                <zhongsoft:LightTextBox runat="server" ID="tbWebsite" CssClass="kpms-textbox" MaxLength="120"
                    field="WEBSITE" tablename="EHR_TRAININSTRUCTORENTITY" activestatus="(23.*)" Width="99%"
                    regex="[a-zA-z]+://[^\s]*" errmsg="请输入正确的网址">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训经历
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbIntroduction" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="INTRODUCTION"
                    tablename="EHR_TRAININSTRUCTORENTITY" Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
          <tr>
            <td class="td-l">
                培训效果满意度记录
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="LightTextBox1" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="TRAINSATISFACTIONRECORD" tablename="EHR_TRAININSTRUCTORENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_TRAININSTRUCTORENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiInstructorId" field="INSTRUCTORID" tablename="EHR_TRAININSTRUCTORENTITY" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
   
    </script>
</asp:Content>
