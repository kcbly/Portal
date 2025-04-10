<%@ Page Language="C#" AutoEventWireup="true" Title="出差申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="TravelApplyFormList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Attendance.TravelApplyFormList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请人</span> <span>
        <zhongsoft:LightTextBox ID="tbUserName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightTextBox ID="tbApplyDeptName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">出差类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlTravelType" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">出差日期</span> <span>
        <zhongsoft:XHtmlInputText ID="tbTravelStartDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
            -
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="tbTravelEndDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">项目编号/项目名称</span> <span>
        <zhongsoft:LightTextBox ID="ltbProjectName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="TravelApplyFormId" PageSize="15"  OnRowCommand="gvList_RowCommand" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="申请人" EditItemClick="ViewFlow" DataParamFields="TravelApplyFormId" />
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="部门" />
            <zhongsoft:LightBoundField DataField="TravelTypeText" HeaderText="出差类型" />
            <zhongsoft:LightBoundField DataField="PlanDays" HeaderText="计划天数（天）" />
            <zhongsoft:LightBoundField DataField="TravelStartDate" HeaderText="出差开始日期" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="TravelEndDate" HeaderText="出差结束日期" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Width="300px" ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" />
            <zhongsoft:LightBoundField DataField="Reason" HeaderText="出差事由" Width="200px" ShowToolTip="true" />
            <%--<zhongsoft:LightBoundField DataField="Remark" HeaderText="备注" Width="200px" ShowToolTip="true" />--%>
            <asp:TemplateField HeaderText="流程状态" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="newLeaveStatus" HeaderText="状态" />
            <zhongsoft:LightTemplateField HeaderText="取消请假" ItemStyle-Width="10px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnUndo" runat="server" EnableTheming="false"  CommandName="Undo" CommandArgument='<%# Eval("TravelApplyFormId") %>'>
                        <img alt="img" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif"  title="取消请假"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

