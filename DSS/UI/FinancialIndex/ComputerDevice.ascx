<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ComputerDevice.ascx.cs"
    Inherits="Zhongsoft.Portal.DSS.UI.FinancialIndex.ComputerDevice" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="资产分布-计算机设备" />
<zhongsoft:EChart ID="computerChat" runat="server" Width="550px" Height="400px" ClientClickFunction="showComputerInfo"
    ItemLabelFormatter="{b}
{c} ({d}%)">
</zhongsoft:EChart>
<script type="text/javascript">
    function showComputerInfo(pa1, pa2, pa3) {
//        var url = buildQueryUrl("AMS/List/AssetEntityList.aspx", { "actionType": 1, "AssestType": escape("计算机"), "AssestClassName": escape(pa2) });
//        showDivDialog(url, null, 1000, 550, null);
        return false;
    }  
</script>
