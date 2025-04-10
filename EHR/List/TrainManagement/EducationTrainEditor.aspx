<%@ Page Title="教育培训录入" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="EducationTrainEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.EducationTrainEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" activestatus="(2.*)"
                    DoCancel="true" ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode" ResultForControls="{'hiUserID':'id','tbDeptName':'OrgUnitName',
                     'hiDeptID':'OrgUnitId','tbEducationType':'EducationType','tbPostType':'RANKNAME'}" req="1"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" TableName="EHR_EducationTrain" Field="UserName"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiEducationTrainID" runat="server" tablename="EHR_EducationTrain" field="EducationTrainID" />
                <input type="hidden" id="hiUserID" runat="server" tablename="EHR_EducationTrain" field="UserID" />
            </td>
            <td class="td-l">所在部门</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.*)" TableName="EHR_EducationTrain" Field="DeptName" />
                <input type="hidden" id="hiDeptID" name="hiDeptID" runat="server" tablename="EHR_EducationTrain" field="DeptID" />
            </td>
            <td class="td-l">职务</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPostType" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.*)" TableName="EHR_EducationTrain" Field="PostType" />
            </td>
        </tr>
        <tr>
            <td class="td-l">学历</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbEducationType" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.*)" TableName="EHR_EducationTrain" Field="EducationType" />
            </td>
            <td class="td-l">培训形式</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm" TableName="EHR_EducationTrain" Field="TrainForm"
                        activestatus="(23.*)">
                    </zhongsoft:LightDropDownList> 
            </td>
            <td class="td-l">培训类别</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" TableName="EHR_EducationTrain" Field="TrainType"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">培训单位</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbTrainUnits" runat="server" MaxText="32" TableName="EHR_EducationTrain" Field="TrainUnits" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">培训内容</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbTrainContent" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" MaxText="512" TableName="EHR_EducationTrain" Field="TrainContent" ActiveStatus="(23.*)" />
            </td>             
        </tr>
        <tr>
            <td class="td-l">参培学时</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbJoinHour" runat="server" TableName="EHR_EducationTrain" Field="JoinHour" ActiveStatus="(23.*)" 
                    Style="width: 70px; text-align: right" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的参培学时(正整数或2位小数)"/>
            </td>
            <td class="td-l">培训费用（元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTrainingCosts" runat="server" TableName="EHR_EducationTrain" Field="TrainingCosts" ActiveStatus="(23.*)" 
                    Style="width: 70px; text-align: right" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训费用（元）(正整数或2位小数)"/>
            </td>
            <td class="td-l">学时</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTrainHour" runat="server" TableName="EHR_EducationTrain" Field="TrainHour" ActiveStatus="(23.*)"
                    Style="width: 70px; text-align: right" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的学时(正整数或2位小数)"/>
            </td>
        </tr>       
        <tr>
            <td class="td-l">开始日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStarDate" runat="server" readonly="readonly" compare="1" TableName="EHR_EducationTrain" Field="StarDate" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">结束日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEndDate" runat="server" readonly="readonly" compare="1" TableName="EHR_EducationTrain" Field="EndDate" ActiveStatus="(23.*)" />
            </td>
        </tr>
         <tr>
            <td class="td-l">培训项目名称</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbTrainProjectName" runat="server" MaxText="32" TableName="EHR_EducationTrain" Field="TrainProjectName" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">证书编号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCertificateNumber" runat="server" MaxText="32" TableName="EHR_EducationTrain" Field="CertificateNumber" ActiveStatus="(23.*)" />
            </td>
            </tr>
        <tr>
            <td class="td-l">发证机构</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbCertificationAuthority" runat="server" TableName="EHR_EducationTrain" Field="CertificationAuthority" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">培训机构类别</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainInstiType" TableName="EHR_EducationTrain" Field="TrainInstiType"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>           
        </tr>
    </table>
      <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
