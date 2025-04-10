<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ScientificIndex.aspx.cs" Inherits="Zhongsoft.Portal.DSS.List.ScientificIndex" %>

<%@ Register TagPrefix="uc2" TagName="ResearchDistribution" Src="../UI/ScientificIndex/ResearchDistribution.ascx" %>
<%@ Register TagPrefix="uc3" TagName="MajorProjects135" Src="../UI/ScientificIndex/MajorProjects135.ascx" %>
<%@ Register TagPrefix="uc4" TagName="IndustryStandard" Src="../UI/ScientificIndex/IndustryStandard.ascx" %>
<%@ Register TagPrefix="uc5" TagName="ResearchAward" Src="../UI/ScientificIndex/ResearchAward.ascx" %>
<%@ Register TagPrefix="uc10" TagName="TitleInfo" Src="../UI/TitleInfo.ascx" %>
<%@ Register TagPrefix="uc11" TagName="IntellectualProperty" Src="../UI/ScientificResearchStaticInfo/IntellectualProperty.ascx" %>
<%@ Register TagPrefix="uc12" TagName="AwardsStaticOfProject" Src="../UI/ScientificResearchStaticInfo/AwardsStaticOfProject.ascx" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
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
                <span style="font-size: large; font-weight: bold;">科研指标</span>
            </td>
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
        <!-- 知识产权成果 -->
        <tr>
            <td colspan="3" class="box box-primary">
                <uc10:TitleInfo ID="ScientificResearchStaticInfoSelector" runat="server" TitleName="知识产权成果">
                </uc10:TitleInfo>
                <asp:RadioButtonList ID="rblTime" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                    OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
            </td>
        </tr>
        <tr>
            <td colspan="3" class="box box-primary">
                <uc11:IntellectualProperty ID="IntellectualProperty1" runat="server" />
            </td>
        </tr>
        <!-- 科技获奖 -->
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td colspan="3" class="boxtwo box-danger">
                <uc5:ResearchAward ID="ResearchAwardView" runat="server" />
            </td>
        </tr>
        <!-- 科研项目分布 -->
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr style="vertical-align: top">
            <td colspan="3" class="boxtwo box-primary">
                <uc2:ResearchDistribution ID="ResearchDistributionView" runat="server" />
            </td>
        </tr>
        <!-- 十三五重大项目科技项目进度图 -->
        <tr style="display:none">
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr style="vertical-align: top;display:none">
            <td colspan="3" class="box box-danger">
                <uc3:MajorProjects135 ID="MajorProjects135View" runat="server" />
            </td>
        </tr>
        <!-- 成果获奖 -->
        <tr style="display:none">
            <td colspan="3" class="box box-primary">
                <uc12:AwardsStaticOfProject ID="AwardsStaticOfProject1" runat="server" />
            </td>
        </tr>
        <!-- 科标业项目 -->
        <tr style="display:none">
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr style="vertical-align: top;display:none">
            <td colspan="3" class="boxtwo box-danger">
                <uc4:IndustryStandard ID="IndustryStandardView" runat="server" />
            </td>
        </tr>
    </table>
    <!-- 是否隐藏工具栏查询、重置，目前自动查询-->
    <input type="hidden" runat="server" id="hiHiddenButton" value="true" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            //隐藏工具栏显示的页面标题
            $('#toolbarlay').hide();
        }
    </script>
</asp:Content>
