<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancialIndexList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.FinancialIndexList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register TagPrefix="uc1" TagName="Cashflow" Src="../UI/FinancialIndex/Cashflow.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ComputerDevice" Src="../UI/FinancialIndex/ComputerDevice.ascx" %>
<%@ Register TagPrefix="uc3" TagName="CarType" Src="../UI/FinancialIndex/CarType.ascx" %>
<%@ Register TagPrefix="uc4" TagName="CarBelong" Src="../UI/FinancialIndex/CarBelong.ascx" %>
<%@ Register TagPrefix="uc5" TagName="CarCost" Src="../UI/FinancialIndex/CarCost.ascx" %>
<%@ Register TagPrefix="uc6" TagName="BudgetCost" Src="../UI/FinancialIndex/BudgetCost.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <link href="../UI/DSSStyle.css" rel="stylesheet" type="text/css" />
    <style>
        .clickTitle
        {
            cursor: pointer;
            font-size: 12pt;
            font-weight: bold; /* text-align: center;*/
            background-color: rgb(178, 236, 250); /*filter: Alpha(opacity=30);*/
        }
        /*决策大标题由于母版原因会多个边框，需去掉*/
        .rtm_fds_bd
        {
            border: none !important;
        }
    </style>
    <table width="100%">
        <tr>
            <td class="small-box bg-lightgreen">
                <span style="font-size: large; font-weight: bold;">财务指标</span>
                <%--<span runat="server"
                    id="lbRate"></span>--%>
                <asp:Label ID="lbRate" runat="server" CssClass="small-title" />
            </td>
            <%--            <td class="box-header">
                
            </td>--%>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <link href="../UI/DSSStyle.css" rel="stylesheet" type="text/css" />
    <style>
        body
        {
            overflow-x: hidden;
        }
    </style>
    <table style="width: 100%; vertical-align: top;">
        <%--        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td colspan="3" class="small-boxtwo bg-lightgreen">
                <asp:Label ID="Label1" runat="server" Text="财务分析" CssClass="small-boxtwo-title" />
                <asp:Label ID="lbRate" runat="server" />
            </td>
        </tr>--%>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr>
            <td colspan="3" class="boxtwo box-danger">
                <uc1:Cashflow ID="Cashflow1" runat="server" />
            </td>
        </tr>
     <%--   <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr>
            <td colspan="3" class="boxtwo box-primary">
                <uc6:BudgetCost ID="BudgetCost1" runat="server" />
            </td>
        </tr>--%>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr>
            <td class="box box-warning">
                <uc2:ComputerDevice ID="ComputerDevice1" runat="server" />
            </td>
            <td width="15">
            </td>
            <td class="box box-success">
                <uc3:CarType ID="CarType1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr>
            <td class="box box-info">
                <uc5:CarCost ID="CarCost1" runat="server" />
            </td>
            <td width="15">
            </td>
            <td class="box box-primary">
                <uc4:CarBelong ID="CarBelong1" runat="server" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiHiddenButton" value="true" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            //隐藏工具栏显示的页面标题
            $('#toolbarlay').hide();
        }
    </script>
</asp:Content>
