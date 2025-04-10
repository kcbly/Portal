<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearInstituteTrainPlanEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.YearInstituteTrainPlanEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="公司年度培训计划" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbYear" CssClass="kpms-textbox" req="1"
                    ReadOnly="true" MaxLength="4" field="YEAR" tablename="EHR_YEARINSTTRAINPLANDT"
                    activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">月份<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" field="TrainMonth" tablename="EHR_YEARINSTTRAINPLANDT"
                    activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">培训班名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainProName" CssClass="kpms-textbox" req="1" MaxLength="64" field="TRAINPROJECTNAME" tablename="EHR_YEARINSTTRAINPLANDT" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">培训对象<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbTrainObject" CssClass="kpms-textbox"
                    EnableTheming="false" MaxLength="20" field="TRAINOBJECT"
                    tablename="EHR_YEARINSTTRAINPLANDT" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">培训形式<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm" req="1" activestatus="(23.*)"
                    field="TRAININGFORM" tablename="EHR_YEARINSTTRAINPLANDT">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">培训类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" req="1" activestatus="(23.*)"
                    field="TRAININGTYPE" tablename="EHR_YEARINSTTRAINPLANDT">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">计划培训总人数（人）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTraingPeoples" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_YEARINSTTRAINPLANDT" Field="TraingPeoples" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">计划培训期次（次）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNUMBEROFTRAINING" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_YEARINSTTRAINPLANDT" Field="NUMBEROFTRAINING" ActiveStatus="(23.*)" />
            </td>

        </tr>
        <tr>
            <td class="td-l">每期天数（天）
            </td>
            <td class="td-">
                <zhongsoft:LightTextBox ID="tbOneTraingDays" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_YEARINSTTRAINPLANDT" Field="OneTraingDays" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">计划总费用（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCostEstimating" CssClass="kpms-textbox-money" DataType="Money"
                    EnableTheming="false" field="COSTESTIMATING" tablename="EHR_YEARINSTTRAINPLANDT" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">需求部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbReqDeptName" runat="server" readonly="readonly" TableName="EHR_YEARINSTTRAINPLANDT" Field="ReqDeptName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiReqDeptID" name="hiReqDeptID" runat="server" tablename="EHR_YEARINSTTRAINPLANDT" field="ReqDeptID" />
            </td>
            <td class="td-l">组织部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" req="1" activestatus="(23.*)"
                    field="UNDERDEPTID" tablename="EHR_YEARINSTTRAINPLANDT">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiUnderDeptCode" runat="server" field="UNDERDEPTCODE" tablename="EHR_YEARINSTTRAINPLANDT" />
                <input type="hidden" id="hiUnderDeptName" runat="server" field="UNDERDEPTNAME" tablename="EHR_YEARINSTTRAINPLANDT" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_YEARINSTTRAINPLANDT"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiType" field="TYPE" value="计划内" tablename="EHR_YEARINSTTRAINPLANDT" />
    <input type="hidden" runat="server" id="hiYearInstTrainPlanDtId" field="YEARINSTTRAINPLANDTID"
        tablename="EHR_YEARINSTTRAINPLANDT" />
    <input type="hidden" runat="server" id="hiFormId" field="YEARINSTTRAINPLANFORMID"
        tablename="EHR_YEARINSTTRAINPLANDT" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>
