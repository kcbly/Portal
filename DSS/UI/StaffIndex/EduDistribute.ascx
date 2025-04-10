<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EduDistribute.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.StaffIndex.EduDistribute" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="学历分布" />
<zhongsoft:EChart ID="eduChat" runat="server" Width="500px" Height="400px" ItemLabelFormatter="{b}
{c} ({d}%)">
</zhongsoft:EChart>
