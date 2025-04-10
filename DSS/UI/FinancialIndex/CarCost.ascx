<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarCost.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.FinancialIndex.CarCost" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="车辆成本构成" />
<zhongsoft:EChart ID="carChat" runat="server" Width="550px" Height="400px" ItemLabelFormatter="{b}
{c} ({d}%)">
</zhongsoft:EChart>
