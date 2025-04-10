<%@ Page Title="协会登记" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="AssociationInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssociationInfoEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">协会名称<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtCarNumber" TableName="KMS_Other_AssociationInfo" Field="AssociationName" runat="server" ActiveStatus="(23.*)" req="1" Width="280px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">类别</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAssociationType" TableName="KMS_Other_AssociationInfo" Field="AssociationType" ActiveStatus="(23.*)"
                    runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiAssociationTypeText" field="AssociationTypeText" tablename="KMS_Other_AssociationInfo" />
            </td>
            <td class="td-l">入会日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtJoinDate" TableName="KMS_Other_AssociationInfo" Field="JoinDate" ActiveStatus="(23.*)" class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">开户行</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtBank" TableName="KMS_Other_AssociationInfo" Field="Bank" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">账号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtAccount" TableName="KMS_Other_AssociationInfo" Field="Account" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">户名</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtBankAccountNumber" TableName="KMS_Other_AssociationInfo" Field="BankAccountNumber" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l"></td>
            <td class="td-r">
            </td>
        </tr>
        <tr>
            <td class="td-l">协会描述</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtDescribe" TableName="KMS_Other_AssociationInfo" Field="Describe" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_AssociationInfo" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Other_AssociationInfo" field="AssociationInfoId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
