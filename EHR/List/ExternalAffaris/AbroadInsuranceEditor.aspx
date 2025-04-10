<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="AbroadInsuranceEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.AbroadInsuranceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" Field="USERNAME" tablename="EHR_ABROADINSURANCE"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tbUserName':'UserName',
                      'hiDeptId':'DEPTID','tbDeptName':'DEPTNAME','hiSubDeptId':'OrgUnitId','tbSubDeptName':'OrgUnitName','tbSex':'Sex'
                      ,'tbNation':'NATION','tbIdCard':'IDENTITYCARDNO','tbBirthday':'BIRTHDAY','tbHomeTown':'HOMETOWN','tbPosition':'RANKNAME','tbTechnicalPost':'SKILLTITLE'}"
                    OnClick="lbtnChooseUser_Click" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_ABROADINSURANCE" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_ABROADINSURANCE" />
                <input type="hidden" id="hiSubDeptId" runat="server" field="SUBDEPTID" tablename="EHR_ABROADINSURANCE" />
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="USERCODE" Tablename="EHR_ABROADINSURANCE" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSex" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="SEX" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                民族
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbNation" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="NATION" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                身份证号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbIdCard" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="IDCARD" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出生日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbBirthday" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="BIRTHDAY" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                出生地
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbHomeTown" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="HOMETOWN" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="DEPTNAME" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSubDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                    Field="SUBDEPTNAME" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                职务
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPosition" runat="server" readonly="readonly" class="kpms-textbox"
                    Field="POSITION" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                职称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbTechnicalPost" runat="server" readonly="readonly"
                    class="kpms-textbox" Field="TECHNICALPOST" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出访国家
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbVisitNation" runat="server" CssClass="kpms-textbox"
                    Field="VISITNATION" Tablename="EHR_ABROADINSURANCE" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l" nowrap>
                保险有效开始日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtInsuranceStartDate" runat="server" readonly="readonly"
                    req="1" class="kpms-textbox-date" Field="INSURANCESTARTDATE" Tablename="EHR_ABROADINSURANCE"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap>
                上一次购买截止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtInsurancePerDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" Field="INSURANCEPERDATE" Tablename="EHR_ABROADINSURANCE"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l" nowrap>
                保险有效截止日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtInsuranceEndDate" runat="server" readonly="readonly"
                    req="1" class="kpms-textbox-date" Field="INSURANCEENDDATE" Tablename="EHR_ABROADINSURANCE"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否到期
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblIsDated" runat="server" RepeatDirection="Horizontal" Activestatus="(23.*)"
                    Enabled="false" EnableTheming="false" Field="ISDATE" Tablename="EHR_ABROADINSURANCE">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="1024" Tablename="EHR_ABROADINSURANCE" field="REMARK"
                    ActiveStatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiAbroadInsuranceId" runat="server" field="ABROADINSURANCEID"
        tableneme="EHR_ABROADINSURANCE" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
