<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="OperateIndex.aspx.cs" Inherits="Zhongsoft.Portal.DSS.List.OperateIndex" %>

<%@ Register TagPrefix="uc6" TagName="BusinessInfo" Src="../UI/ManageIndex/BusinessInfo.ascx" %>
<%@ Register TagPrefix="uc7" TagName="NewContract" Src="../UI/ManageIndex/NewContract.ascx" %>
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
        /*决策标题由于母版原因会多个边框，需去掉，左侧树边框*/
        .rtm_fds_bd
        {
            border: none !important;
        }
        .list-tree
        {
            border: none;
        }
        
        /*.filter-block-lb
        {
            border-bottom:1px solid #fefefe;   
        }*/
        .clickTitle .all
        {
            font: normal !important;
            font-size: 12px;
        }
    </style>
    <table width="100%">
        <tr>
            <td class="small-box bg-lightgreen">
                <span style="font-size: large; font-weight: bold;">经营指标</span> <span style="float: right;
                    margin-right: 20px;">
                    <% if (!IsDept)
                       { //部门统计的时候隐藏筛选类型，直接按照时间筛选统计%>
                    <asp:RadioButtonList ID="rblChoose" runat="server" RepeatColumns="3" AutoPostBack="true"
                        OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                    <%} %>
                </span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
    <table width="100%">
        <tr>
            <td class="clickTitle box box-primary">
                <span class="filter-block-lb">区域类型</span><br />
            </td>
        </tr>
        <tr>
            <td class="box box-primary">
                <asp:RadioButton runat="server" ID="rbRegion" Text="全部" AutoPostBack="true" Checked="true"
                    OnCheckedChanged="ddlStatType_SelectedIndexChanged" CssClass="all" />
                <asp:CheckBoxList runat="server" ID="cblRegion" AutoPostBack="true" RepeatDirection="Vertical"
                    OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="clickTitle box box-primary">
                <span class="filter-block-lb">所属行业</span><br />
            </td>
        </tr>
        <tr>
            <td class="box box-primary">
                <asp:RadioButton runat="server" ID="rbBusinessPlate" Text="全部" AutoPostBack="true"
                    Checked="true" OnCheckedChanged="ddlStatType_SelectedIndexChanged" CssClass="all" />
                <asp:CheckBoxList runat="server" ID="cblBusinessPlate" AutoPostBack="true" RepeatDirection="Vertical"
                    OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="clickTitle box box-primary">
                <span class="filter-block-lb">合同类型</span><br />
            </td>
        </tr>
        <tr>
            <td class="box box-primary">
                <asp:RadioButton runat="server" ID="rbContractType" Text="全部" AutoPostBack="true"
                    Checked="true" OnCheckedChanged="ddlStatType_SelectedIndexChanged" CssClass="all" />
                <asp:CheckBoxList runat="server" ID="cblContractType" AutoPostBack="true" RepeatDirection="Vertical"
                    OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr style="display:none">
            <td class="clickTitle box box-primary">
                <span class="filter-block-lb">客户类型</span><br />
            </td>
        </tr>
        <tr style="display:none">
            <td class="box box-primary">
                <asp:RadioButton runat="server" ID="rbCustomerType2" Text="全部" AutoPostBack="true"
                    Checked="true" OnCheckedChanged="ddlStatType_SelectedIndexChanged" CssClass="all" />
                <zhongsoft:LightDropDownList ID="ddlCustomerType" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCustmerType_SelectedIndexChanged" />
                <%--<asp:CheckBox runat="server" ID="allCustomerType2" Text="全部" AutoPostBack="true"
                    Visible="false" OnCheckedChanged="ddlStatType_SelectedIndexChanged" />--%>
                <asp:CheckBoxList runat="server" ID="cblCustomerType2" AutoPostBack="true" RepeatDirection="Vertical"
                    OnSelectedIndexChanged="ddlStatType_SelectedIndexChanged">
                </asp:CheckBoxList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="detailContent" runat="server">
    <table style="vertical-align: top; width: 100%;">
        <tr>
            <td colspan="3">
                <%--<asp:Label ID="Label1" runat="server" Text="经营分析" CssClass="small-box-title" />--%>
                <span class="filter-block" runat="server" id="spTime">
                    <asp:RadioButtonList ID="rblTime" runat="server" RepeatColumns="3" AutoPostBack="true"
                        OnSelectedIndexChanged="rblTime_SelectedIndexChanged" />
                </span><span class="filter-block" runat="server" id="spYear" visible="false"><span
                    class="filter-block-lb">年份</span><span>
                        <asp:RadioButtonList runat="server" ID="rblBusinessYear" AutoPostBack="true" RepeatDirection="Horizontal"
                            OnSelectedIndexChanged="rblTime_SelectedIndexChanged">
                        </asp:RadioButtonList>
                    </span></span><span class="filter-block" runat="server" id="spQuater" visible="false">
                        <span class="filter-block-lb">季度</span><span>
                            <asp:CheckBoxList runat="server" ID="cblQuater" AutoPostBack="true" RepeatDirection="Horizontal"
                                OnSelectedIndexChanged="rblTime_SelectedIndexChanged">
                            </asp:CheckBoxList>
                        </span></span><span class="filter-block" runat="server" id="spMonth" visible="false">
                            <span class="filter-block-lb">月度</span><span>
                                <asp:RadioButtonList runat="server" ID="rblMonth" AutoPostBack="true" RepeatDirection="Horizontal"
                                    OnSelectedIndexChanged="rblTime_SelectedIndexChanged">
                                </asp:RadioButtonList>
                            </span></span>
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td class="box box-danger">
                <uc7:NewContract ID="NewContract1" runat="server" />
            </td>
            <td width="5">
            </td>
            <td class="box box-primary">
                <uc6:BusinessInfo ID="BusinessInfo1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-info">
                <uc6:BusinessInfo ID="BusinessInfo2" runat="server" />
            </td>
            <td width="5">
            </td>
            <td class="box box-warning">
                <uc6:BusinessInfo ID="BusinessInfo3" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-success">
                <uc6:BusinessInfo ID="BusinessInfo4" runat="server" />
            </td>
            <td width="5">
            </td>
            <td>
            </td>
        </tr>
    </table>
    <!-- 是否隐藏工具栏查询、重置，目前自动查询-->
    <input type="hidden" runat="server" id="hiHiddenButton" value="true" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            //隐藏工具栏显示的页面标题
            $('#toolbarlay').hide();

            //区域
            $('#<%=cblRegion.ClientID %> input:checkbox').live('click', function () {
                initRb('<%=rbRegion.ClientID %>');
            });
            $('#<%=rbRegion.ClientID %>').live('change', function () {
                initCbl('<%=cblRegion.ClientID %>');
            });

            //业务板块
            $('#<%=cblBusinessPlate.ClientID %> input:checkbox').live('click', function () {
                initRb('<%=rbBusinessPlate.ClientID %>');
            });
            $('#<%=rbBusinessPlate.ClientID %>').live('change', function () {
                initCbl('<%=cblBusinessPlate.ClientID %>');
            });

            //合同类型
            $('#<%=cblContractType.ClientID %> input:checkbox').live('click', function () {
                initRb('<%=rbContractType.ClientID %>');
            });
            $('#<%=rbContractType.ClientID %>').live('change', function () {
                initCbl('<%=cblContractType.ClientID %>');
            });

            //客户类型
            $('#<%=cblCustomerType2.ClientID %> input:checkbox').live('click', function () {
                initRb('<%=rbCustomerType2.ClientID %>');
            });
            $('#<%=rbCustomerType2.ClientID %>').live('change', function () {
                initCbl('<%=cblCustomerType2.ClientID %>');
            });

            //月度、季度互斥操作
            $('#<%=cblQuater.ClientID %> input:checkbox').live('click', function () {
                initRbl('<%=rblMonth.ClientID %>');
            });
            $('#<%=rblMonth.ClientID %> input:radio').live('click', function () {
                initCbl('<%=cblQuater.ClientID %>');
            });
        }

        function initCbl(cbl) {
            $('#' + cbl + ' input:checkbox').each(function () {
                $(this).attr('checked', false);
            });
        }

        function initRb(rb) {
            $('#' + rb).attr('checked', false);
        }

        function initRbl(rbl) {
            $('#' + rbl + ' input:radio').each(function () {
                $(this).attr('checked', false);
            });
        }
    </script>
</asp:Content>
