<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AgeDistribute.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.StaffIndex.AgeDistribute" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="年龄分布" />
<zhongsoft:EChart ID="ageChat" runat="server" Width="550px" Height="400px" ItemLabelFormatter="{b}
{c} ({d}%)">
</zhongsoft:EChart>
