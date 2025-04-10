<%@ Page Language="C#" AutoEventWireup="true" Title="复转军人信息" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SoldierEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SoldierEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
              <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)"  field="UserName" tablename="EHR_SoldierInfo" />   
            </td>
            <td class="td-l">
                登录号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_SoldierInfo" activestatus="(23.*)" />
            </td> 
        </tr>
        <tr>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_SoldierInfo" activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                复转军人标识
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbRecoveryOrDemobilized" runat="server" activestatus="(23.N)" Text="是"
                    Checked="true" />
                <input type="hidden" id="hiRecoveryOrDemobilized" runat="server" field="ISSOLDIER"
                    tablename="EHR_SoldierInfo" value="True" />
            </td>
            <td class="td-l">
                类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="radSoldierType" runat="server" RepeatDirection="Horizontal"
                    field="SoldierType" tablename="EHR_SoldierInfo" activestatus="(23.*)" req="1">
                    <asp:ListItem Value="转业">转业</asp:ListItem>
                    <asp:ListItem Value="退伍">退伍</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr> 
        <tr>
            <td class="td-l">
                部队名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbOrgUnit" field="ARMYNAME" tablename="EHR_SoldierInfo"
                    class="kpms-textbox" MaxLength="64" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td> 
            <td class="td-l">
                军内职级<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPositionName" field="SOLDIERLEVEL" tablename="EHR_SoldierInfo"
                    MaxLength="32" class="kpms-textbox" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr> 
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" Maxtext="256" tablename="EHR_SoldierInfo" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="USERID"
        tablename="EHR_SoldierInfo" />
    <input type="hidden" runat="server" id="hiSoldierInfoID" field="SoldierInfoID" tablename="EHR_SoldierInfo" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>
