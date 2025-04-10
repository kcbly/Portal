<%@ Page Title="批量录入专业技术资格信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"   AutoEventWireup="true" CodeBehind="TechQualifBatchEditor.aspx.cs"  Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.TechQualifBatchEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                专业技术资格名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTechQualifName" req="1" field="TECHQUALIFNAME"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                专业技术资格系列
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechQualifSeries" runat="server" field="TECHQUALIFSERIES"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业技术资格等级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTechQualifLevel" runat="server" field="TECHQUALIFNAME"
                    tablename="EHR_TECHQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                取得资格日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtQualifyingTime" class="kpms-textbox-date"
                    field="QUALIFYINGTIME" tablename="EHR_TECHQUALIF" activestatus="(23.*)" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                最高等级标识
            </td>
            <td class="td-r">
                <asp:CheckBox runat="server" ID="cbIsHighest" Text="是" field="ISHIGHEST" tablename="EHR_TECHQUALIF"
                    activestatus="(23.*)" />
            </td>      
            <td class="td-l">
                审批单位
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbApprovalUnit" field="APPROVALUNIT" tablename="EHR_TECHQUALIF"
                    MaxLength="128" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                选择成员
            </td>
            <td class="td-r" colspan="2">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" activestatus="(23.*)"
                    Width="100%" IsMutiple="true" EnableTheming="false" ShowJsonRowColName="true"
                    ShowAttrs="name,UserCode" ResultForControls="{'hiUserIds':'id','hiUserCodes':'UserCode','hiDeptIds':'OrgUnitId','hiDeptCodes':'OrgUnitCode','hiDeptNames':'OrgUnitName'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserIds" />
                <input type="hidden" runat="server" id="hiUserCodes" />
                <input type="hidden" runat="server" id="hiDeptIds" />
                <input type="hidden" runat="server" id="hiDeptCodes" />
                <input type="hidden" runat="server" id="hiDeptNames" />
            </td>
            <td>
                <asp:LinkButton runat="server" ID="lbnBatchNew" OnClick="lbnBatchNew_Click" >
                <span>批量新增人员</span>
                </asp:LinkButton>
            </td> 
        </tr>  
    </table>
    <input type="hidden" id="hiUserXml" runat="server" />    
</asp:Content>
