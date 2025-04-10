<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainPersonnelEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainPersonnelEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbUserCode" CssClass="kpms-textbox" field="USERCODE"
                    tablename="EHR_JOINTRAINEE" Width="100px" ReadOnly="true" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" CssClass="kpms-textbox" MaxLength="5"
                    field="USERNAME" tablename="EHR_JOINTRAINEE" Width="100px" ReadOnly="true" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblSex" field="SEX" tablename="EHR_JOINTRAINEE"
                    RepeatDirection="Horizontal" activestatus="(.*)" Enabled="false">
                </asp:RadioButtonList>
            </td>
          
        </tr>
        <tr>
            <td class="td-l">
                培训时所在部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDept" CssClass="kpms-textbox" Width="98%"
                    MaxLength="64" field="DEPTNAME" tablename="EHR_JOINTRAINEE" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训时职务
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDuty" CssClass="kpms-textbox" Width="98%"
                    MaxLength="20" field="DUTY" tablename="EHR_JOINTRAINEE" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                培训时学历
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEducation" CssClass="kpms-textbox" Width="98%"
                    MaxLength="64" field="EDUCATION" tablename="EHR_JOINTRAINEE" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
          <td class="td-l">
                培训课时
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbHours" CssClass="kpms-textbox-money" Width="80px"
                    regex="^(([1-9]\d{0,2})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训课时(整数或小数)" field="TRAININGCLASSHOUR"
                    tablename="EHR_EDUCATIONTRAINPROJECT" activestatus="(23.*)" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
          <td class="td-l">
                个人费用(元)
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCost" CssClass="kpms-textbox-money"
                    EnableTheming="false" Width="80px" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的个人费用(整数或小数)"
                    field="COST" tablename="EHR_JOINTRAINEE" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
          
            <td class="td-l">
                证书编号
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCertificateNo" CssClass="kpms-textbox"
                    EnableTheming="false" MaxLength="64" field="CERTIFICATENO" tablename="EHR_JOINTRAINEE"
                    activestatus="(23.*)" Width="98%">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                成绩
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbScore" CssClass="kpms-textbox-money"
                    Width="80px" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的成绩(整数或小数)"
                    field="SCORE" tablename="EHR_JOINTRAINEE" activestatus="(23.*)" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                培训情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbTraining" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="TRAINING" tablename="EHR_JOINTRAINEE"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiJoinTraineeId" field="JOINTRAINEEID" tablename="EHR_JOINTRAINEE" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
   
    </script>
</asp:Content>
