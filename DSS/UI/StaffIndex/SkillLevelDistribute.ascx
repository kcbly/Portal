<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SkillLevelDistribute.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.StaffIndex.SkillLevelDistribute" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="职称分布" />
<table style="width: 100%">
    <tr>
        <td style="width: 50%">
            <zhongsoft:EChart ID="skillChat" runat="server" Width="550px" Height="400px" ItemLabelFormatter="{b}
{c} ({d}%)">
            </zhongsoft:EChart>
        </td>
        <td style="width: 50%">
            <zhongsoft:EChart ID="skillChat2" runat="server" Width="500px" Height="400px">
            </zhongsoft:EChart>
        </td>
    </tr>
</table>
