<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaborContractBatchEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.LaborContractBatchEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="批量新建合同" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同起始日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" field="STARTDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)"
                    req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                合同终止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
                    compare="1" field="ENDDATE" tablename="EHR_LABORCONTRACT" activestatus="(23.*)"
                    onblur="getTerm();">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                签订期限(月)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSigningTerm" class="kpms-textbox" EnableTheming="false"
                    field="SIGNINGTERM" tablename="EHR_LABORCONTRACT" activestatus="(23.*)" regex="^([1-9]\d{0,3}|[0])$"
                    errmsg="请输入正整数,最多3位整数" MaxLength="3" Width="130px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                用工形式
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" field="EMPLOYMENTFORM"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                合同类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" field="CONTRACTTYPE"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                合同状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" field="CONTRACTSTATE"
                    tablename="EHR_LABORCONTRACT" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同归属单位
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbContractBelongTo" class="kpms-textbox"
                    EnableTheming="false" field="CONTRACTBELONGTO" tablename="EHR_LABORCONTRACT"
                    activestatus="(23.*)" Width="93%" Text="陕西省电力设计研究院">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                变动原因
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbChnageReason" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="CHANGEREASON"
                    Width="93%" tablename="EHR_LABORCONTRACT">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="MEMO"
                    Width="93%" tablename="EHR_LABORCONTRACT">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                选择成员
            </td>
            <td class="td-r" colspan="4">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" activestatus="(23.*)"
                    Width="100%" IsMutiple="true" EnableTheming="false" ShowJsonRowColName="true"
                    ShowAttrs="name,UserCode" ResultForControls="{'hiUserIds':'id','hiUserCodes':'UserCode','hiDeptIds':'OrgUnitId','hiDeptCodes':'OrgUnitCode','hiDeptNames':'OrgUnitName'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserIds" />
                <input type="hidden" runat="server" id="hiUserCodes" />
                <input type="hidden" runat="server" id="hiDeptIds" />
                <input type="hidden" runat="server" id="hiDeptCodes" />
                <input type="hidden" runat="server" id="hiDeptNames" />
            </td>
            <td>
                <asp:LinkButton runat="server" ID="lbnBatchNew" OnClick="lbnBatchNew_Click" OnClientClick="return batchNew();">
                <span>批量新增劳动合同</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiLaborContractId" field="LABORCONTRACTID"
        tablename="EHR_LABORCONTRACT" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function getTerm(type) {
            var startDate = $("#<%=txtStartDate.ClientID %>").val();
            var endDate = $("#<%=txtEndDate.ClientID %>").val();
            if (startDate != "" && endDate != "")
                $("#<%=tbSigningTerm.ClientID %>").val(calculateTerm(startDate, endDate, '-'))

        }

        function calculateTerm(stDate, endDate, sign) {
            if (stDate != "" && endDate != "") {
                var begin = stDate.split(sign);
                var end = endDate.split(sign);

                var bMonth = parseInt(begin[0], 10) * 12 + parseInt(begin[1], 10);
                var eMonth = parseInt(end[0], 10) * 12 + parseInt(end[1], 10);

                var totalMonth = Math.abs(eMonth - bMonth);
                return totalMonth;
            }
            else
                return "";
        }

        function batchNew() {
            var userName = $("#<%=tbUserName.ClientID %>").val();
            if (userName != "")
                return confirm("确定批量新建合同？");
            else {
                alert("请先选择员工，再点批量新建合同按钮！");
                return false;
            }
        }

    </script>
</asp:Content>
