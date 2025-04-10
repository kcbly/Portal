<%@ Page Title="外出培训台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="OutTrainList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.OutTrainList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">培训组织单位</span><span>
        <zhongsoft:LightTextBox ID="tbTrainUnit" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训名称</span><span>
        <zhongsoft:LightTextBox ID="tbTrainName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否参训</span><span>
        <zhongsoft:LightDropDownList ID="ddlIsAgree" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"></zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="OutTrainFormID"
        ShowExport="true" BindGridViewMethod="BindData" ShowFooter="true" OnRowDataBound="gvList_RowDataBound"
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ApplyDeptName" SortExpression="ApplyDeptName">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="培训名称" ItemStyle-HorizontalAlign="left" SortExpression="TrainName">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("TrainName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="组织单位" DataField="TrainUnit" SortExpression="TrainUnit">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（起）" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="StartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（止）" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="EndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训费用（元）" DataField="TrainCost1" ItemStyle-HorizontalAlign="Right" SortExpression="TrainCost1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否参训" DataField="IsAgree" SortExpression="IsAgree">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="预算支出类别" DataField="BudgetType" SortExpression="BudgetType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="预算支出来源" DataField="BudgetSource" SortExpression="BudgetSource">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="拟参训人数" DataField="PlanPeopleNum1" ItemStyle-HorizontalAlign="Right" SortExpression="PlanPeopleNum1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训地点" DataField="TrainPlace" ShowToolTip="true" SortExpression="TrainPlace">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训类型" DataField="TrainForm" ShowToolTip="true" SortExpression="TrainForm">
            </zhongsoft:LightBoundField>
        </Columns>
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">      
        function ViewItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
