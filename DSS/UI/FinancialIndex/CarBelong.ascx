<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarBelong.ascx.cs" Inherits="Zhongsoft.Portal.DSS.UI.FinancialIndex.CarBelong" %>
<%@ Register TagPrefix="uc1" TagName="TitleInfo" Src="../TitleInfo.ascx" %>
<uc1:TitleInfo ID="TitleInfo1" runat="server" TitleName="车辆产权分布" />
<zhongsoft:EChart ID="carChat" runat="server" Width="500px" Height="400px" ClientClickFunction="showCarBelongInfo"
    ItemLabelFormatter="{b}
{c} ({d}%)">
</zhongsoft:EChart>
<script type="text/javascript">
    function showCarBelongInfo(pa1, pa2, pa3) {
        var url = buildQueryUrl("GM/List/GVM/CarEntityList.aspx", { "actionType": 1, "IsDss": 1, "IndustriesName": escape(pa2) });
        showDivDialog(url, null, 1000, 550, null);
        return false;
    }  
</script>
