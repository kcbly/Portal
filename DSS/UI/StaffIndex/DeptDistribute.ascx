<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeptDistribute.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.StaffIndex.DeptDistribute" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="部门分布" />
<zhongsoft:EChart ID="deptChat" runat="server" Width="100%" TitleXAlign="Left"
    TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top" LegendXAlign="Center"
    CategoryAxisRotate="30" LegendYAlign="Top" LegendOrient="Horizontal" Height="400px">
</zhongsoft:EChart>
