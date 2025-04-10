<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageIndexList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.ManageIndexList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register TagPrefix="uc1" TagName="ProjectState" Src="../UI/ManageIndex/ProjectState.ascx" %>
<%@ Register TagPrefix="uc2" TagName="BidProject" Src="../UI/ManageIndex/BidProject.ascx" %>
<%@ Register TagPrefix="uc3" TagName="BidBond" Src="../UI/ManageIndex/BidBond.ascx" %>
<%@ Register TagPrefix="uc4" TagName="PlanExecute" Src="../UI/ManageIndex/PlanExecute.ascx" %>
<%@ Register TagPrefix="uc5" TagName="ProjectAllValue" Src="../UI/ManageIndex/ProjectAllValue.ascx" %>
<%@ Register TagPrefix="uc6" TagName="BusinessInfo" Src="../UI/ManageIndex/BusinessInfo.ascx" %>
<%@ Register TagPrefix="uc7" TagName="NewContract" Src="../UI/ManageIndex/NewContract.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
<link href="../UI/DSSStyle.css" rel="stylesheet" type="text/css" />
    <span class="filter-block"><span class="filter-block-lb">业务板块</span><span>
        <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged" />
    </span></span><span class="filter-block"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlContractType" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged" />
    </span></span><span class="filter-block"><span class="filter-block-lb">区域类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlRegion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged" />
    </span></span><span class="filter-block"><span class="filter-block-lb">客户类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlCustomerType" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlCustmerType_SelectedIndexChanged" />
    </span><span>
        <zhongsoft:LightDropDownList ID="ddlCustomerType2" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged" />
    </span></span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <table style="vertical-align: top;">
        <tr>
            <td colspan="3" height="5"></td>        
        </tr>
        <tr>
            <td class="small-box bg-lightgreen">
                <asp:Label ID="Label1" runat="server" Text="经营分析" CssClass="small-box-title"/>
                <span class="filter-block">
                    <asp:RadioButtonList ID="rblChoose" runat="server" RepeatColumns="3" AutoPostBack="true"
                        OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                </span><span class="filter-block" runat="server" id="spTime">
                    <asp:RadioButtonList ID="rblTime" runat="server" RepeatColumns="3" AutoPostBack="true"
                        OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                </span><span class="filter-block" runat="server" id="spYear" visible="false"><span
                    class="filter-block-lb">年份</span><span>
                        <zhongsoft:LightDropDownList ID="ddlBusinessYear" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                    </span></span>
            </td>
             <td width="15"></td>
            <td class="small-box bg-green">
                <asp:Label ID="lbTitle" runat="server" Text="生产分析" CssClass="small-box-title" />
                <span class="filter-block"><span class="filter-block-lb">年份</span><span>
                    <zhongsoft:LightDropDownList ID="ddlProductYear" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlProductYear_SelectedIndexChanged" />
                </span></span>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10"></td>        
        </tr>
        <tr style="vertical-align: top;">
            <td class="box box-danger">
                <uc7:NewContract ID="NewContract1" runat="server" />
            </td>
            <td width="15"></td>
            <td class="box box-primary">
                <uc5:ProjectAllValue ID="ProjectAllValue1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10"></td>        
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-warning">
                <uc6:BusinessInfo ID="BusinessInfo1" runat="server" />
            </td>
             <td width="15"></td>
            <td class="box box-success">
                <uc4:PlanExecute ID="PlanExecute1" runat="server" />
            </td>
        </tr>
         <tr>
            <td colspan="3" height="10"></td>        
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-info">
                <uc6:BusinessInfo ID="BusinessInfo2" runat="server" />
            </td>
             <td width="15"></td>
            <td class="box box-primary">
                <uc3:BidBond ID="BidBond1" runat="server" />
            </td>
        </tr>
         <tr>
            <td colspan="3" height="10"></td>        
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-danger">
                <uc6:BusinessInfo ID="BusinessInfo3" runat="server" />
            </td>
             <td width="15"></td>
            <td class="box box-primary">
                <uc2:BidProject ID="BidProject1" runat="server" />
            </td>
        </tr>
         <tr>
            <td colspan="3" height="10"></td>        
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-success">
                <uc6:BusinessInfo ID="BusinessInfo4" runat="server" />
            </td>
             <td width="15"></td>
            <td class="box box-warning">
                <uc1:ProjectState ID="ProjectState1" runat="server" />
            </td>
        </tr>
    </table>
    <!-- 是否隐藏工具栏查询、重置，目前自动查询-->
    <input type="hidden" runat="server" id="hiHiddenButton" value="true" />
</asp:Content>
