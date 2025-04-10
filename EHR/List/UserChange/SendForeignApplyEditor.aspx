<%@ Page Language="C#" Title="外派状态编辑" AutoEventWireup="true" CodeBehind="SendForeignApplyEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.SendForeignApplyEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">外派状态<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
               <zhongsoft:LightDropDownList runat="server" ID="ddlSendState" activitystatus="(3.*)" tablename="EHR_UB_SendForeignApply" field="SendState" req="1">

               </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiSendForeignApplyID" tablename="EHR_UB_SendForeignApply" field="SendForeignApplyID" />

    <script type="text/javascript">
        function initCustomerPlugin() {

        }
        
    </script>
</asp:Content>
 