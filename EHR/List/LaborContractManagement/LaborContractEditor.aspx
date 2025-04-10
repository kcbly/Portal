<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaborContractEditor.aspx.cs"
    Title="劳动合同明细页面" Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.LaborContractEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">登录号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbUserCode" class="kpms-textbox" field="USERCODE"
                    tablename="EHR_LABORCONTRACT" activestatus="(2.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" field="USERNAME" tablename="EHR_LABORCONTRACT"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false" SelectPageMode="Dialog"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tbUserName':'UserName'
                    ,'hiDeptId':'OrgUnitId','hiDeptCode':'OrgUnitCode','tbDeptName':'OrgUnitName'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_LABORCONTRACT" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_LABORCONTRACT" />
                <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_LABORCONTRACT" />
            </td>
            <td class="td-l">所属部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" class="kpms-textbox" field="DEPTNAME"
                    tablename="EHR_LABORCONTRACT" activestatus="(2.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" class="kpms-textbox"
                    field="CONTRACTCODE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)" req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">合同签订日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" field="STARTDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)" readonly="readonly" req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">有效截止日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" field="ENDDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)"
                    onblur="getTerm(0);" readonly="readonly" req="1">
                </zhongsoft:XHtmlInputText>
            </td>

        </tr>
        <tr>
            <td class="td-l">合同期限类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractTermType" field="ContractTermType"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">合同类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" field="CONTRACTTYPE"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">合同变动类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractChangeType" field="ContractChangeType"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同归属单位
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbContractBelongTo" class="kpms-textbox"
                    EnableTheming="false" field="CONTRACTBELONGTO" tablename="EHR_LABORCONTRACT"
                    activestatus="(23.*)" Text="浙江华云电力工程设计咨询有限公司">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">试用开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTrialStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="2" field="TRIALSTARTDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">试用终止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTrialEndDate" runat="server" class="kpms-textbox-comparedate"
                    compare="2" field="TRIALENDDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)"
                    onblur="getTerm(1);" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">试用期限(月)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTrialTerm" class="kpms-textbox" MaxLength="3"
                    EnableTheming="false" field="TRIALTERM" tablename="EHR_LABORCONTRACT" activestatus="(23.*)"
                    regex="^([1-9]\d{0,3}|[0])$" errmsg="请输入正整数,最多3位整数" Style="width: 70px; text-align: right">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">试用期满评价
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTRIALACHIEVEMENT" field="TRIALACHIEVEMENT"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">试用到期提醒
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTrialEndRemind" runat="server" readonly="readonly" field="TrialEndRemind"
                    class="kpms-textbox-date" tablename="EHR_COURSEFEEAPPLYFORM" activestatus="(23.*)" />
            </td>
            <td class="td-l">合同到期提醒
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSigningTerm" runat="server" readonly="readonly" field="SigningTerm"
                    class="kpms-textbox-date" tablename="EHR_COURSEFEEAPPLYFORM" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">合同状态<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" field="CONTRACTSTATE"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-m" colspan="4">

            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="7">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="MEMO"
                    Width="99%" tablename="EHR_LABORCONTRACT">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">附件
            </td>
            <td class="td-r" colspan="5">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传文件</span>
                <asp:LinkButton runat="server" ID="btnAttach" OnClientClick="uploadFile()" OnClick="lbtnAttach_Click"
                    displaystatus="(3.*)"><span>上传文件</span></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-r">
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatDirection="Horizontal"
                    ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr>
            <td colspan="7"></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiLaborContractId" field="LABORCONTRACTID"
        tablename="EHR_LABORCONTRACT" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //上传文件
        function uploadFile() {

            var fileSrcId = "<%=BusinessObjectId %>";
            showUploadForm(fileSrcId, "LaborContractEditor");
            return true;
        }

        function getTerm(type) {
            var startDate = "";
            var endDate = "";
            if (type == 0) {
                
            }
            if (type == 1) {
                startDate = $("#<%=txtTrialStartDate.ClientID %>").val();
                endDate = $("#<%=txtTrialEndDate.ClientID %>").val();
                $("#<%=tbTrialTerm.ClientID %>").val(calculateTerm(startDate, endDate, '-'));
            }
        }

        function calculateTerm(stDate, endDate, sign) {
            if (stDate != "" && endDate != "") {
                var begin = stDate.split(sign);
                var end = endDate.split(sign);

                var bMonth = parseInt(begin[0], 10) * 12 + parseInt(begin[1], 10);
                var eMonth = parseInt(end[0], 10) * 12 + parseInt(end[1], 10);

                var totalMonth = Math.abs(eMonth - bMonth);
                return totalMonth;
            } else
                return "";
        }

    </script>
</asp:Content>
