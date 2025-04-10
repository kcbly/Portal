<%@ Page Language="C#" Title="部门培训计划" AutoEventWireup="true" CodeBehind="DeptTrainReqDeclareEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.DeptTrainReqDeclareEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">计划月份<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" req="1" ActiveStatus="(23.*)" tablename="EHR_DeptTrainReqDeclareDT" field="TrainMonth">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">培训班名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbTRAINPROJECTNAME" runat="server" req="1" MaxText="64" TableName="EHR_DeptTrainReqDeclareDT" Field="TRAINPROJECTNAME" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">培训形式<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTRAININGFORM" req="1" TableName="EHR_DeptTrainReqDeclareDT" Field="TRAININGFORM"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">培训类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTRAININGTYPE" req="1" TableName="EHR_DeptTrainReqDeclareDT" Field="TRAININGTYPE"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">培训对象</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTRAINOBJECT" runat="server" MaxText="64" TableName="EHR_DeptTrainReqDeclareDT" Field="TRAINOBJECT" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">计划培训总人数（人）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTraingPeoples" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_DeptTrainReqDeclareDT" Field="TraingPeoples" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">计划培训期次（次）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNUMBEROFTRAINING" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_DeptTrainReqDeclareDT" Field="NUMBEROFTRAINING" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">每期天数（天）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOneTraingDays" CssClass="kpms-textbox-money" DataType="Integer" runat="server"
                    EnableTheming="false" TableName="EHR_DeptTrainReqDeclareDT" Field="OneTraingDays" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">计划总费用（元）</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbCOSTESTIMATING" CssClass="kpms-textbox-money" DataType="Money" runat="server"
                    EnableTheming="false" TableName="EHR_DeptTrainReqDeclareDT" Field="COSTESTIMATING" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbMEMO" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" MaxText="512" TableName="EHR_DeptTrainReqDeclareDT" Field="MEMO" ActiveStatus="(23.*)" />
            </td>
        </tr>
                <tr>
            <td class="td-l">相关附件
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                    DisplayStatus="(3.*)">
                    <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                    <span>上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <uc1:attachmentview id="AttachmentView1" runat="server" repeatcolumns="1" showdelete="true"
                    showdeletebyself="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiDEPTTRAINREQDECLAREDTID" runat="server" tablename="EHR_DeptTrainReqDeclareDT" field="DEPTTRAINREQDECLAREDTID" />
    <input type="hidden" id="hiDEPTTRAINREQDECLAREFORMID" runat="server" tablename="EHR_DeptTrainReqDeclareDT" field="DEPTTRAINREQDECLAREFORMID" />
    <input type="hidden" id="hiYEAR" runat="server" tablename="EHR_DeptTrainReqDeclareDT" field="YEAR" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
