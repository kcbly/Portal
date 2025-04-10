<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinanceNum.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FinanceNum" 
 MasterPageFile="~/UI/Master/ObjectEditor.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="white-space:nowrap">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_FinanceNumInfo" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
             <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" field="UserName" tablename="EHR_FinanceNumInfo"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','tbUserName':'UserName','txtDept':'OrgUnitName'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_FinanceNumInfo" activestatus="(23.*)" style="width: 80%" />
            </td>
            <td class="td-l" style="white-space:nowrap">
                财务档号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                  <zhongsoft:LightTextBox ID="tbFinanceNum" runat="server" req="1"
                    class="kpms-textbox" field="FinanceNum" tablename="EHR_FinanceNumInfo" activestatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_FinanceNumInfo" />
    <input type="hidden" runat="server" id="hiFinanceNuminfoID" field="FinanceNuminfoID" tablename="EHR_FinanceNumInfo" />
    <script>

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
