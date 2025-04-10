<%@ Page Title="培训实施登记" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="DeptMonthTrainRegEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.DeptMonthTrainRegEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">组织部门<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbDeptName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiDeptId':'id'}" EnableTheming="false"
                    Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" TableName="EHR_DeptMonthTrainReg" Field="DeptName" />
                <input type="hidden" id="hiDeptId" name="hiDeptId" runat="server" tablename="EHR_DeptMonthTrainReg" field="DeptId" />
            </td>

            <td class="td-l">是否计划内培训<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlIsPlanTrain" runat="server" TableName="EHR_DeptMonthTrainReg" Field="IsPlanTrain" ActiveStatus="(23.*)" req="1"></zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">培训名称<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbTrainName" runat="server" MaxText="100" TableName="EHR_DeptMonthTrainReg" Field="TrainName" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">培训日期(起)<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtTrainDate" runat="server" readonly="readonly" TableName="EHR_DeptMonthTrainReg" Field="TrainDate" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">培训日期(止)<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtTrainEndDate" runat="server" readonly="readonly" TableName="EHR_DeptMonthTrainReg" Field="TrainEndDate" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">培训地点<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbTrainPlace" runat="server" MaxText="100" TableName="EHR_DeptMonthTrainReg" Field="TrainPlace" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">参训人员<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbJoinUserName" req="1" IsMutiple="true"
                    SelectPageMode="Dialog" ResultForControls="{'hiJoinUserID':'id'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"  AfterSelect="changeJoinPerson()"
                    ResultAttr="name" activestatus="(23.*)" TableName="EHR_DeptMonthTrainReg" Field="JoinUserName" />
                <input type="hidden" id="hiJoinUserID" name="hiJoinUserID" runat="server" tablename="EHR_DeptMonthTrainReg" field="JoinUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">参训人数（人）<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPeopleNum" runat="server" TableName="EHR_DeptMonthTrainReg" Field="PeopleNum" ActiveStatus="(23.*)" EnableTheming="false" CssClass="kpms-textbox-money" DataType="Integer" req="1" />
            </td>
            <td class="td-l">培训费用（元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="txtTrainingFee" CssClass="kpms-textbox-money" DataType="Money"
                    field="TrainingFee" tablename="EHR_DeptMonthTrainReg" activestatus="(23.*)" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">培训内容</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbTrainContent" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" MaxText="512" TableName="EHR_DeptMonthTrainReg" Field="TrainContent" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" MaxText="512" TableName="EHR_DeptMonthTrainReg" Field="Memo" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="kpms-rollist-hand" colspan="6">
                <img id="img2" src="../../../Themes/Images/btn_title.gif" />
                附件
            </td>
        </tr>
        <tr runat="server" displaystatus="(3.*)">
            <td class="td-m" colspan="6">
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click">
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
    <input type="hidden" id="hiDeptMonthTrainRegID" runat="server" tablename="EHR_DeptMonthTrainReg" field="DeptMonthTrainRegID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }


        function changeJoinPerson() {
            var userIds = $("#<%=hiJoinUserID.ClientID %>").val();
            if (userIds.length > 0) {
                var strUser = userIds.split(',');
                $("#<%=tbPeopleNum.ClientID %>").val(strUser.length);
            }
            else {
                $("#<%=tbPeopleNum.ClientID %>").val('');
            }
        }
    </script>
</asp:Content>
