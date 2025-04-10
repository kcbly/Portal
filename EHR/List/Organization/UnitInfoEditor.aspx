<%@ Page Title="企业信息" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="UnitInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.UnitInfoEditor" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"   TagPrefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div style="padding: 5px 0px 8px 10px;">
        <table class="tz-table">
            <tr id="trEdit" runat="server">
                <td colspan="6" align="right">
                    <asp:LinkButton runat="server" ID="btnEdit" class="kpms-btn" OnClick="btnEdit_Click"  AccessLevel="3" 
                        displaystatus="(1.*)">
                     <img alt ="" src="../../../Themes/Images/btn_editor.gif"/><span>编辑</span></asp:LinkButton>
                    <asp:LinkButton runat="server" class="kpms-btn" ID="btnSave" OnClientClick="return checkForm();"
                        OnClick="btnSave_Click" displaystatus="(23.*)">
                     <img alt ="" src="../../../Themes/Images/btn_save.gif"/><span>保存</span></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="kpms-rollist-hand" colspan="6">
                    <img id="imgProduct" src="../../../Themes/Images/btn_title.gif" />
                    基本信息
                </td>
            </tr>
            <tr>
                <td class="td-l">单位编号
                </td>
                <td class="td-r">
                    <input type="hidden" runat="server" id="hiCORPORATIONENTITYID" field="CORPORATIONENTITYID" tablename="EHR_CORPORATIONENTITY" />
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPCODE" CssClass="kpms-textbox" MaxLength="20"
                        field="CORPCODE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">社会保险登记号
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbSOCIALSECURITYNO" CssClass="kpms-textbox"
                        MaxLength="20" field="SOCIALSECURITYNO" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">单位名称<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPNAME" CssClass="kpms-textbox" MaxLength="64"
                        field="CORPNAME" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">单位英文名称
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbENGLISHNAME" CssClass="kpms-textbox"
                        MaxLength="64" field="ENGLISHNAME" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="^[a-zA-Z0-9\s]+$" errmsg="请输入正确英文名称"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">是否法人单位标识
                </td>
                <td class="td-r">
                    <asp:RadioButtonList runat="server" ID="rbtnISLEGALCORP" field="ISLEGALCORP" tablename="EHR_CORPORATIONENTITY"
                        activestatus="(23.*)" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1">是</asp:ListItem>
                        <asp:ListItem Value="0">否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="td-l">单位简称
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbABBRNAME" CssClass="kpms-textbox"
                        MaxLength="64" field="ABBRNAME" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">组织机构代码
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbORGANIZATIONCODE" CssClass="kpms-textbox"
                        MaxLength="20" field="ORGANIZATIONCODE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">法人单位代码
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbLEGALCORPCODE" CssClass="kpms-textbox"
                        MaxLength="20" field="LEGALCORPCODE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">单位类别
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="ddlCORPTYPE" field="CORPTYPE" tablename="EHR_CORPORATIONENTITY"
                        activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">单位性质
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="ddlCORPPROPERTY" field="CORPPROPERTY" tablename="EHR_CORPORATIONENTITY"
                        activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">成立日期
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText runat="server" ID="txtSETUPDATE" class="kpms-textbox-date"
                        field="SETUPDATE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" readonly="readonly" />
                </td>
                <td class="td-l">法人代表
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbLEGALREPRESENT" CssClass="kpms-textbox"
                        MaxLength="64" field="LEGALREPRESENT" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">隶属关系
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbSUBRELATION" CssClass="kpms-textbox"
                        MaxLength="128" field="SUBRELATION" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">撤销日期
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText runat="server" ID="txtUNDODATE" class="kpms-textbox-date"
                        field="UNDODATE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" readonly="readonly" />
                </td>
                <td class="td-l">批准文件
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbAPPROVEDOC" CssClass="kpms-textbox"
                        MaxLength="128" field="APPROVEDOC" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">经济成分
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbECONOMICELEMENTS" CssClass="kpms-textbox"
                        MaxLength="128" field="ECONOMICELEMENTS" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">与主管单位资产纽带关系
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbASSETBONDS" CssClass="kpms-textbox"
                        MaxLength="128" field="ASSETBONDS" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">各出资人及出资比例
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbINVESTMENT" CssClass="kpms-textbox"
                        MaxLength="128" field="INVESTMENT" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">国民经济行业分组
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbINDUSTRYGROUPING" CssClass="kpms-textbox"
                        MaxLength="128" field="INDUSTRYGROUPING" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">企业登记注册类型
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlCORPREGTYPE" runat="server" field="CORPREGTYPE"
                        tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">企业规模
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPSCALE" CssClass="kpms-textbox"
                        MaxLength="128" field="CORPSCALE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">主营业务
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbMainBusiness" CssClass="kpms-textbox"
                        MaxLength="128" field="MainBusiness" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">企业上市情况
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlListed" runat="server" field="Listed" tablename="EHR_CORPORATIONENTITY"
                        activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">控制（控股）情况
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbHoldings" CssClass="kpms-textbox" MaxLength="128"
                        field="Holdings" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">注册资本金
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCapital" CssClass="kpms-textbox" MaxLength="128"
                        field="Capital" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">劳动计划来源
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbLaborSource" CssClass="kpms-textbox"
                        MaxLength="128" field="LaborSource" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">工资结算方式
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbSalarySettlement" CssClass="kpms-textbox"
                        MaxLength="128" field="SalarySettlement" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">领导班子职数
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbLeaderPostNumber" CssClass="kpms-textbox-money"
                        EnableTheming="false" MaxLength="5" regex="^\d*$" errmsg="领导班子职数只能填写非负整数" field="LeaderPostNumber"
                        tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">人员编制数
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbStaffNumber" CssClass="kpms-textbox-money"
                        EnableTheming="false" MaxLength="5" regex="^\d*$" errmsg="人员编制数只能填写非负整数" field="StaffNumber"
                        tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">定员人数
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbFixedNumber" CssClass="kpms-textbox-money"
                        EnableTheming="false" MaxLength="5" regex="^\d*$" errmsg="定员人数只能填写非负整数" field="FixedNumber"
                        tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">财务汇总方式
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbFinancialMode" CssClass="kpms-textbox"
                        MaxLength="128" field="FinancialMode" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">单位层级
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPLEVEL" CssClass="kpms-textbox" MaxLength="20"
                        field="CORPLEVEL" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">纳入国网劳动计划管理日期
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText runat="server" ID="txtInCountryNetDate" class="kpms-textbox-date"
                        field="InCountryNetDate" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="td-l">上一级法人单位代码
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbUPPERLEGALCORPCODE" CssClass="kpms-textbox"
                        MaxLength="20" field="UPPERLEGALCORPCODE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">集团公司法人单位代码
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbGROUPLEAGLCORPCODE" CssClass="kpms-textbox"
                        MaxLength="20" field="GROUPLEAGLCORPCODE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">所属行业类别
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlBELONGINDUSTRYTYPE" runat="server" field="BELONGINDUSTRYTYPE"
                        tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="kpms-rollist-hand" colspan="6">
                    <img id="img1" src="../../../Themes/Images/btn_title.gif" />
                    联系方式
                </td>
            </tr>
            <tr>
                <td class="td-l">所在地行政区划
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="ddlLocation" runat="server" field="Location" tablename="EHR_CORPORATIONENTITY"
                        activestatus="(23.*)">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">行政区划代码
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtLocationCode" runat="server" class="kpms-textbox"
                        readonly="readonly" field="LocationCode" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)">
                    </zhongsoft:XHtmlInputText>
                </td>
                <td class="td-l">单位通讯地址
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbAddress" CssClass="kpms-textbox" MaxLength="128"
                        field="Address" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">单位邮政编码
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbPostalCode" CssClass="kpms-textbox"
                        MaxLength="6" field="PostalCode" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" regex="^[0-9]*$"
                        errmsg="请输入正确的邮政编码"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">单位总机
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPOPERATOR" CssClass="kpms-textbox"
                        MaxLength="64" field="CORPOPERATOR" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                        errmsg="请输入正确的总机号码"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">单位网站
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPWEBSITE" CssClass="kpms-textbox"
                        MaxLength="64" field="CORPWEBSITE" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">单位传真
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbCORPFAX" CssClass="kpms-textbox" MaxLength="64"
                        field="CORPFAX" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)" regex="^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$"
                        errmsg="请输入正确传真号"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">联系人姓名
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbContactName" CssClass="kpms-textbox"
                        MaxLength="20" field="ContactName" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">联系人电话
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbContactPhone" CssClass="kpms-textbox"
                        MaxLength="64" field="ContactPhone" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                        errmsg="请输入正确电话号码"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">联系人手机
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbContactMobile" CssClass="kpms-textbox"
                        MaxLength="64" field="ContactMobile" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$" errmsg="请输入正确手机号码"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">联系人传真
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbContactFax" CssClass="kpms-textbox"
                        MaxLength="64" field="ContactFax" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$" errmsg="请输入正确传真号"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">联系人电子邮箱
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbContactEmail" CssClass="kpms-textbox"
                        MaxLength="64" field="ContactEmail" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$" errmsg="请输入正确的邮箱"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">联系人系统内电话
                </td>
                <td class="td-m" colspan="5">
                    <zhongsoft:LightTextBox runat="server" ID="tbSystemPhone" CssClass="kpms-textbox"
                        MaxLength="64" Width="34%" field="SystemPhone" tablename="EHR_CORPORATIONENTITY" activestatus="(23.*)"
                        regex="^[0-9]*$" errmsg="请输入正确电话号码"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">备注
                </td>
                <td class="td-m" colspan="5">
                    <zhongsoft:LightTextBox ID="tbMEMO" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" maxtext="512" tablename="EHR_CORPORATIONENTITY" field="MEMO" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-rollist-hand" colspan="6">
                    <img id="img2" src="../../../Themes/Images/btn_title.gif" />
                    附件
                </td>
            </tr>
            <tr>
                <td class="td-m" colspan="6">
                    <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                        DisplayStatus="(3.*)">
                    <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                    <span>上传附件</span>
                    </zhongsoft:LightFileUploader>
                </td>
            </tr>
            <tr>
                <td class="td-m" colspan="6">
                    <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                        ShowDeleteBySelf="true" />
                </td>
            </tr>
        </table>
    </div>
     <!--人力资源部负责维护企业信息-->
     <input type="hidden" id="hiEditDeptCode" runat="server" value="w201708090000002" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        $('#<%=ddlLocation.ClientID %>').live('change', function () {
            $('#<%=txtLocationCode.ClientID %>').val($("#<%=ddlLocation.ClientID %>").val());
        })
        function checkForm()
        {
            if (!checkReqField()) {
                return false;
            }
            return true;
        } 
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
