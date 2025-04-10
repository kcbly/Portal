<%@ Page Title="驾驶员信息编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="DriverInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.DriverInfoEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtUserName" TableName="KMS_Car_DriverInfo" Field="UserName" runat="server" ActiveStatus="(23.*)" req="1" Width="120px" />
            </td>
            <td class="td-l">性别<span class="req-star">*</span></td>
            <td class="td-r">
                <asp:RadioButtonList ID="rbtGender" runat="server" RepeatDirection="Horizontal" needcontrol="true" req="1"
                    tablename="KMS_Car_DriverInfo" field="Gender" activestatus="(23.*)">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiGenderText" field="GenderText" tablename="KMS_Car_DriverInfo" />
            </td>

        </tr>
        <tr>
            <td class="td-l">所属部门 </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="DeptName"     PageHeight="650px"   
                    SelectPageMode="Dialog" tablename="KMS_Car_DriverInfo" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiDeptId" field="DeptId" tablename="KMS_Car_DriverInfo" />
            </td>
            <td class="td-l">联系电话</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtPhone" TableName="KMS_Car_DriverInfo" Field="Phone" ActiveStatus="(23.*)" runat="server" Width="120px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">驾照等级</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlLicenseLevel" TableName="KMS_Car_DriverInfo" Field="LicenseLevel" ActiveStatus="(23.*)"
                    runat="server" Width="90px" />
                <input type="hidden" runat="server" id="hiLicenseLevelText" field="LicenseLevelText" tablename="KMS_Car_DriverInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_DriverInfo" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_DriverInfo" field="DriverInfoId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
