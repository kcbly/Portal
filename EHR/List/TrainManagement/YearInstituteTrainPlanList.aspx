<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearInstituteTrainPlanList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.YearInstituteTrainPlanList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block"><span class="filter-block-lb">年度</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">组织部门</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训名称</span><span>
        <zhongsoft:LightTextBox ID="tbProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px">
        </zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训形式</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" AllowSorting="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="序号,查看" DataKeyNames="YEARINSTTRAINPLANDTID"
        BindGridViewMethod="BindDataGrid" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="YEAR" HeaderText="培训年度" SortExpression="">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="培训班名称" ItemStyle-HorizontalAlign="left" SortExpression="TRAINPROJECTNAME">
                <ItemTemplate>
                    <a onclick="return DetailItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("TRAINPROJECTNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="TrainMonth" HeaderText="计划月份" SortExpression="TrainMonth">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGFORM" HeaderText="培训形式" SortExpression="TRAININGFORM">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGTYPE" HeaderText="培训类型" SortExpression="TRAININGTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINOBJECT" HeaderText="培训对象" SortExpression="TRAINOBJECT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ReqDeptName" HeaderText="需求部门" SortExpression="ReqDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERDEPTNAME" HeaderText="组织部门" SortExpression="UNDERDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TraingPeoples" HeaderText="计划培训总人数（人）"
                ItemStyle-HorizontalAlign="Right" SortExpression="TraingPeoples">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NUMBEROFTRAINING" HeaderText="计划培训期次（次）"
                ItemStyle-HorizontalAlign="Right" SortExpression="NUMBEROFTRAINING">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OneTraingDays" HeaderText="每期天数（天）"
                ItemStyle-HorizontalAlign="Right" SortExpression="OneTraingDays">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="COSTESTIMATING" HeaderText="计划总费用（元）"
                ItemStyle-HorizontalAlign="Right" SortExpression="COSTESTIMATING">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程页面
        function DetailItem(FId, PId) {
            var param = { formId: FId, prcInstId: PId };
            var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
