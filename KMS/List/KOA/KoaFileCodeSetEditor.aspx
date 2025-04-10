<%@ Page Title="公文编码维护编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="KoaFileCodeSetEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.KoaFileCodeSetEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">类型<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlKoaType" TableName="KMS_KOA_KoaFileCodeSet" Field="KoaType" ActiveStatus="(23.*)" AutoPostBack="true" req="1" runat="server" Width="128px" OnSelectedIndexChanged="ddlKoaType_SelectedIndexChanged">
                    <asp:ListItem Text="请选择" Value=""></asp:ListItem>
                    <asp:ListItem Text="收文流程" Value="0"></asp:ListItem>
                    <asp:ListItem Text="发文流程" Value="1"></asp:ListItem>
                </zhongsoft:LightDropDownList>

            </td>
        </tr>
        <tr>
            <td class="td-l">收/发文类型 <span class="req-star">*</span></td>
            <td class="td-r"  colspan="3">
                <zhongsoft:LightDropDownList ID="ddlFileCategory" ActiveStatus="(23.*)" req="1" runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiFileCategoryText" field="FileCategoryText" tablename="KMS_KOA_KoaFileCodeSet" />
                <input type="hidden" runat="server" id="hiFileCategory" field="FileCategory" tablename="KMS_KOA_KoaFileCodeSet" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否补位</td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsCover" field="IsCover" tablename="KMS_KOA_KoaFileCodeSet"
                     RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">补位位数</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="ltbCoverNum" TableName="KMS_KOA_KoaFileCodeSet" Field="CoverNum" ActiveStatus="(23.*)" runat="server" DataType="UInteger" Width="50px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">编码<span class="req-star">*</span></td>
            <td class="td-r"  colspan="3">

                <zhongsoft:LightTextBox ID="txtSetFileCode" TableName="KMS_KOA_KoaFileCodeSet" Field="SetFileCode" ActiveStatus="(23.*)" runat="server" req="1" Width="180px" />
            <%--    <asp:Label ID="lbReceiveText" runat="server"></asp:Label>
                <asp:Label ID="lbSendText" runat="server"></asp:Label>--%>
                 <span class="req-star">发文编号规则：编码〔{年份}〕{流水号}; 收文编号规则：{年份}-编码-{流水号}</span>
                <%--  编码前缀后是否拼接〔年份〕<asp:CheckBox  ID="ckIsAddYear"  TableName="KMS_KOA_KoaFileCodeSet" Field="SetFileCode" ActiveStatus="(23.*)"  runat="server" Checked="true"/>--%>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_KOA_KoaFileCodeSet" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_KOA_KoaFileCodeSet" field="KoaFileCodeSetId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>

