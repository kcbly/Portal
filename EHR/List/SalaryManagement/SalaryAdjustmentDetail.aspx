<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalaryAdjustmentDetail.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.SalaryAdjustmentDetail" Title="薪资调整编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">登录号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserCode" Field="UserCode" tablename="EHR_US_SalaryAdjustmentDetail"
                    Activestatus="(23.*)" DoCancel="true" req="1" ResultAttr="UserCode" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserName':'name','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />
                <input type="hidden" id="hiUserId" runat="server" field="UserID" tablename="EHR_US_SalaryAdjustmentDetail" />
            </td>
            <td class="td-l">姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="UserName" Tablename="EHR_US_SalaryAdjustmentDetail" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="DeptName" Tablename="EHR_US_SalaryAdjustmentDetail" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiDeptID" runat="server" field="DeptID" tablename="EHR_US_SalaryAdjustmentDetail" />
            </td>
        </tr>
        <tr>
            <td class="td-l">来源渠道
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbSourceChannel" runat="server" Field="SourceChannel" MaxLength="64" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>

        </tr>
        <tr>
            <td class="td-l">原岗位名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOldPost" runat="server" Field="OldPost" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">岗级
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOldPostGrade" runat="server" Field="OldPostGrade" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">薪级

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOldSalaryGrade" runat="server" Field="OldSalaryGrade" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">现岗位名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNowPost" runat="server" Field="NowPost" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">岗级
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNewPostGrade" runat="server" Field="NewPostGrade" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">薪级

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNewSalaryGrade" runat="server" Field="NewSalaryGrade" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">岗薪工资
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbNewWages" runat="server" Field="NewWages" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">预发奖金
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAdvanceBonus" runat="server" Field="AdvanceBonus" MaxLength="32" Tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-r" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">调整理由和依据
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbReasonsAndBasis" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="ReasonsAndBasis" tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="Memo" tablename="EHR_US_SalaryAdjustmentDetail" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
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
    <input type="hidden" runat="server" id="hiSalaryAdjustmentDetailID" tablename="EHR_US_SalaryAdjustmentDetail" field="SalaryAdjustmentDetailID" />
    <input type="hidden" runat="server" id="hiSalaryAdjustmentID" tablename="EHR_US_SalaryAdjustmentDetail" field="SalaryAdjustmentID" />
    <script type="text/javascript">
        function initCustomerPlugin() {

        }

    </script>
</asp:Content>
