<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KOAMainSendSelector.aspx.cs" 
    MasterPageFile="~/UI/Master/ObjectSelector.Master" Inherits="Zhongsoft.Portal.KMS.Obsolete.KOAMainSendSelector" %>


<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server"> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td nowrap>
                
                名称
                <asp:TextBox ID="tbNameInfo" runat="server" Width="100px"></asp:TextBox>
              </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <asp:LinkButton runat="server" ID="btnList" Style="display: none" OnClick="btnSearch_Click"></asp:LinkButton>
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="UsersList" AllowPaging="true"
        PageSize="15" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="UsersList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick">
        <Columns> 
            <asp:BoundField DataField="PARAMDETAILNAME" HeaderText="名称" HeaderStyle-Width="30%"></asp:BoundField> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function initCustomerPlugin() {
            $("#<%=this.tbNameInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user4Code'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbNameInfo.ClientID %>").attr("value", ui.item.value.substring(0, ui.item.value.indexOf('[')));
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });
        }
    
    </script>
</asp:Content>
