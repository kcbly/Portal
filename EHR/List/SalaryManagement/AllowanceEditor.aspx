<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowanceEditor.aspx.cs" Title="补贴内容编辑" 
Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.AllowanceListEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                补贴内容<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAllowanceContent" req="1" field="ALLOWANCECONTENT" tablename="EHR_ALLOWANCELIST"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
             <td class="td-l">
                补贴金额<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAllowanceAmount" class="kpms-textbox" field="ALLOWANCEAMOUNT"
                    tablename="EHR_ALLOWANCELIST" activestatus="(23.*)" req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                是否扣税
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlTax" field="ISNEEDTAX" tablename="EHR_ALLOWANCELIST"
                    activestatus="(23.*)">
                    <asp:ListItem Value="是">是</asp:ListItem>
                    <asp:ListItem Value="否" Selected="True">否</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        
    </table>
    <input type="hidden" runat="server" id="hiAllowanceListId" field="ALLOWANCELISTID"
        tablename="EHR_ALLOWANCELIST" />
    <input type="hidden" runat="server" id="hiFormalWorkAllowanceId" field="FORMALWORKALLOWANCEID"
        tablename="EHR_ALLOWANCELIST" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>
</asp:Content>
