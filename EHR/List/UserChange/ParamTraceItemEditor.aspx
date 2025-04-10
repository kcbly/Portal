<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="流动人员办理事项参数维护" CodeBehind="ParamTraceItemEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ParamTraceItemEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                办理事项内容<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbITEMCONTENT" runat="server" field="ITEMCONTENT" tablename="EHR_PARAMTRACEITEM"
                    activestatus="(23.*)" MaxLength="32" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                适用变动原因<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCHANGEREASON" runat="server" field="CHANGEREASON" tablename="EHR_PARAMTRACEITEM"
                    activestatus="(23.*)" MaxLength="8" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                管理部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtMGRDEPTNAME" runat="server" class="kpms-textbox"
                    readonly="readonly" field="MGRDEPTNAME" tablename="EHR_PARAMTRACEITEM" activestatus="(23.*)"
                    req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiMGRDEPTID" runat="server" field="MGRDEPTID" tablename="EHR_PARAMTRACEITEM" />
                <input type="hidden" id="hiMGRDEPTCODE" runat="server" field="MGRDEPTCODE" tablename="EHR_PARAMTRACEITEM" />
                <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return selDept()"
                    DisplayStatus="(23.*)" CausesValidation="false">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSORT" runat="server" field="SORT" tablename="EHR_PARAMTRACEITEM"
                    activestatus="(23.*)" MaxLength="2" regex="^\d+$" errmsg="请最多输入两位整数！" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox ID="cbFLAG" runat="server" field="FLAG" tablename="EHR_PARAMTRACEITEM"
                    activestatus="(23.*)" Text="启用" Checked="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiTRACEITEMID" runat="server" field="TRACEITEMID" tablename="EHR_PARAMTRACEITEM" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
        }

        function selDept() {
            var param = new InputParamObject("s");
            var filter = "{OrganizationLevel:'2'}";
            var re = getOrgsNew("re", param, filter);
            if (re != null) {
                $("#<%=hiMGRDEPTID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtMGRDEPTNAME.ClientID %>").val(re.buildAttrJson("o", "name"));
                $("#<%=hiMGRDEPTCODE.ClientID %>").val(re.buildAttrJson("o", "ORGUNITCODE")); 
            }
            return false;
        }
    </script>
</asp:Content>
