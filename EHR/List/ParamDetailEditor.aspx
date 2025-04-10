<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamDetailEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ParamDetailEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">父级参数名称</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText  runat="server" ID="tbParamDetailParentName"  readonly="readonly"  class="kpms-textbox"  field="ParamDetailParentName" tablename="EHR_ParamDetail" activestatus="(23.*)"></zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">参数明细名<span class="req-star">*</span></td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParamNameID" field="ParamNameID" tablename="EHR_ParamDetail" />
                <input type="hidden" runat="server" id="hiParamDetailID" field="ParamDetailID" tablename="EHR_ParamDetail" />
                <zhongsoft:LightTextBox runat="server" ID="tbParamDetailName" CssClass="kpms-textbox" MaxLength="20" req="1" field="ParamDetailName" tablename="EHR_ParamDetail" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">参数明细值<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbParamDetailValue" CssClass="kpms-textbox" MaxLength="20" req="1" field="ParamDetailValue" tablename="EHR_ParamDetail" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px" MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数" tablename="EHR_ParamDetail" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="EHR_ParamDetail" field="Flag" />
</asp:Content>
