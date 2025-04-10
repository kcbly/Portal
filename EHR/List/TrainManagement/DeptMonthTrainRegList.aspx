<%@ Page Title="培训实施登记" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="DeptMonthTrainRegList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.DeptMonthTrainRegList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">培训名称</span><span>
        <zhongsoft:LightTextBox ID="tbTrainName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">组织部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否计划内培训</span><span>
        <zhongsoft:LightDropDownList ID="ddlIsPlanTrain" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"></zhongsoft:LightDropDownList>
    </span>
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="DeptMonthTrainRegID" OnRowCommand="gvList_RowCommand"
        ShowExport="true" BindGridViewMethod="BindData" OnRowDataBound="gvList_RowDataBound"
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看,编辑,删除" ShowFooter="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="组织部门" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否计划内培训" DataField="IsPlanTrain" SortExpression="IsPlanTrain">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="培训名称" ItemStyle-HorizontalAlign="left" SortExpression="TrainName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("DeptMonthTrainRegID")%>');" style="color: Blue;">
                        <%#Eval("TrainName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="培训日期（起）" DataField="TrainDate" SortExpression="TrainDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（止）" DataField="TrainEndDate" SortExpression="TrainEndDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参训人数（人）" DataField="PeopleNum" ItemStyle-HorizontalAlign="Right" SortExpression="PeopleNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训费用（元）" DataField="TrainingFee" ItemStyle-HorizontalAlign="Right" SortExpression="TrainingFee">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训地点" DataField="TrainingHours" SortExpression="TrainingHours">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参训人员" DataField="JoinUserName" ShowToolTip="true" SortExpression="JoinUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训内容" DataField="TrainContent" ShowToolTip="true" SortExpression="TrainContent">
            </zhongsoft:LightBoundField>
        </Columns>
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/TrainManagement/DeptMonthTrainRegEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
