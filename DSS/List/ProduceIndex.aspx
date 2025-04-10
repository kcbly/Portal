<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProduceIndex.aspx.cs" Inherits="Zhongsoft.Portal.DSS.List.ProduceIndex" %>

<%@ Register TagPrefix="uc1" TagName="ProjectState" Src="../UI/ManageIndex/ProjectState.ascx" %>
<%@ Register TagPrefix="uc2" TagName="BidProject" Src="../UI/ManageIndex/BidProject.ascx" %>
<%@ Register TagPrefix="uc3" TagName="BidBond" Src="../UI/ManageIndex/BidBond.ascx" %>
<%@ Register TagPrefix="uc4" TagName="PlanExecute" Src="../UI/ManageIndex/PlanExecute.ascx" %>
<%@ Register TagPrefix="uc5" TagName="ProjectAllValue" Src="../UI/ManageIndex/ProjectAllValue.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <link href="../UI/DSSStyle.css" rel="stylesheet" type="text/css" />
    <script src="<%=WebAppPath %>/EPMS/UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <style>
        .clickTitle
        {
            cursor: pointer;
            font-size: 12pt;
            font-weight: bold;
            background-color: rgb(178, 236, 250);
        }
        /*决策大标题由于母版原因会多个边框，需去掉*/
        .rtm_fds_bd
        {
            border: none !important;
        }
        .list-tree
        {
            border: none;
        }
        .clickTitle .all
        {
            font: normal !important;
            font-size: 12px;
        }
    </style>
    <table width="100%">
        <tr>
            <td class="small-box bg-green">
                <span style="font-size: large; font-weight: bold;">生产指标</span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
    <table width="100%">
        <tr>
            <td class="clickTitle box box-primary">
                <span class="filter-block-lb">区域类型</span>
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
                <span class="filter-block-lb">所属行业</span>
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
                <span class="filter-block-lb">合同类型</span>
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
                <span class="filter-block-lb">客户类型</span>
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
<asp:Content ID="Content1" ContentPlaceHolderID="listGrid" runat="server">
    <table style="vertical-align: top; width: 100%;">
        <tr>
            <td colspan="3">
                <%--<asp:Label ID="lbTitle" runat="server" Text="生产分析" CssClass="small-box-title" />--%>
                <%--<span class="filter-block"><span class="filter-block-lb">业务板块</span><span>
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
                </span></span>--%>
                <span class="filter-block"><span class="filter-block-lb">年份</span><span>
                    <%--<zhongsoft:LightDropDownList ID="ddlProductYear" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlProductYear_SelectedIndexChanged" />--%>
                    <asp:RadioButtonList runat="server" ID="rblProductYear" AutoPostBack="true" RepeatDirection="Horizontal"
                        OnSelectedIndexChanged="ddlProductYear_SelectedIndexChanged">
                    </asp:RadioButtonList>
                </span></span>
            </td>
        </tr>
        <tr style="vertical-align: top;">
            <td class="box box-danger">
                <uc5:ProjectAllValue ID="ProjectAllValue1" runat="server" />
            </td>
            <td width="5">
            </td>
            <td class="box box-primary">
                <uc4:PlanExecute ID="PlanExecute1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr style="vertical-align: top">
            <td class="box box-info">
                <uc3:BidBond ID="BidBond1" runat="server" />
            </td>
            <td width="5">
            </td>
            <td class="box box-warning">
                <uc2:BidProject ID="BidProject1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="3" height="10">
            </td>
        </tr>
        <tr style="vertical-align: top; display: none">
            <td class="box box-success">
                <!--项目状态统计意义不大，去掉-->
                <%--<uc1:ProjectState ID="ProjectState1" runat="server" />--%>
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
        }

        function initCbl(cbl) {
            $('#' + cbl + ' input:checkbox').each(function () {
                $(this).attr('checked', false);
            });
        }

        function initRb(rb) {
            $('#' + rb).attr('checked', false);
        }
    </script>
</asp:Content>
