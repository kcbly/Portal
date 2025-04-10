<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TitleInfo.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.TitleInfo" %>
<table class="tz-table" width="100%" bordercolor="#ff0000">
    <tr id="tr1" style="border-bottom: #c5dbec 1px solid">
        <td style="font-weight: bold; height: 28px;">
            <img src="<%=WebAppPath%>/themes/images/rightnavlink.png" />
            <asp:Label ID="lbName" runat="server" />
        </td>
        <td>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbInfo" runat="server" />
        </td>
    </tr>
</table>
