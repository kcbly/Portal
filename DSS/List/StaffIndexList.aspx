<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffIndexList.aspx.cs"
    Inherits="Zhongsoft.Portal.DSS.List.StaffIndexList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<%@ Register TagPrefix="uc1" TagName="DeptDistribute" Src="../UI/StaffIndex/DeptDistribute.ascx" %>
<%@ Register TagPrefix="uc2" TagName="AgeDistribute" Src="../UI/StaffIndex/AgeDistribute.ascx" %>
<%@ Register TagPrefix="uc3" TagName="EduDistribute" Src="../UI/StaffIndex/EduDistribute.ascx" %>
<%@ Register TagPrefix="uc4" TagName="SkillLevelDistribute" Src="../UI/StaffIndex/SkillLevelDistribute.ascx" %>
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
                <span style="font-size: large; font-weight: bold;">人员指标</span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <link href="../UI/DSSStyle.css" rel="stylesheet" type="text/css" />
    <table width="100%">
        <tr>
            <td colspan="3" height="5">
            </td>
        </tr>
        <tr>
            <td colspan="3" class="boxtwo box-primary">
                <uc1:DeptDistribute ID="DeptDistribute1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr style="width: 100%">
            <td class="box box-danger">
                <uc2:AgeDistribute ID="AgeDistribute1" runat="server" />
            </td>
            <td width="15">
            </td>
            <td class="box box-success">
                <uc3:EduDistribute ID="EduDistribute1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr>
            <td colspan="3" class="boxtwo box-warning">
                <uc4:SkillLevelDistribute ID="SkillLevelDistribute1" runat="server" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            //隐藏工具栏显示的页面标题
            $('#toolbarlay').hide();
        }
    </script>
</asp:Content>
