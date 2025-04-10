<%@ Page Title="选择项目" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master" AutoEventWireup="true" CodeBehind="ProjectEntitySelector.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Obsolete.ProjectEntitySelector" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
<table style="width: 100%;">
        <tr>
            <td colspan="2">项目编号/名称
                <asp:TextBox ID="tbProjectInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                项目设总
                <asp:TextBox ID="tbManagerUserName" runat="server" CssClass="kpms-textboxsearch" Style="width: 80px"
                    MaxLength="10" EnableTheming="false"></asp:TextBox>
                立项时间
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">项目类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                项目阶段
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                项目状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        BindGridViewMethod="DoSelectByFilter" PageSize="8" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" DataKeyNames="OrganizationId" OnRowDataBound="gvList_RowDataBound"
        OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" ItemStyle-Width="40px" ShowToolTip="True" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="250px"
                ShowToolTip="true" Width="250px" />
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="项目类别" ItemStyle-Width="100px"
                HtmlEncode="false"/>
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" ItemStyle-Width="100px"
                HtmlEncode="false" />
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段" ItemStyle-Width="70px"
                HtmlEncode="false" />
            <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="设计规模" ItemStyle-Width="80px"
                HtmlEncode="false" ShowToolTip="True" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
    </script>

</asp:Content>
