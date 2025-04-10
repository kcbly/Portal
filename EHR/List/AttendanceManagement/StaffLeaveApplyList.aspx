<%@ Page Title="员工请假审批台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="StaffLeaveApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.AttendanceManagement.StaffLeaveApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请人</span><span>
        <zhongsoft:LightTextBox ID="tbApplyUserName" runat="server"  CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">申请部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server"  CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
     <span class="filter-block"><span class="filter-block-lb">请假类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlLeaveType" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"/></span></span>
    <span class="filter-block"><span class="filter-block-lb">请假日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="LeaveApplyFormID" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
             <asp:TemplateField HeaderText="申请人" ItemStyle-HorizontalAlign="left" SortExpression="ApplyUserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId") %>','<%#Eval("PId") %>')" style="color: Blue;">
                        <%#Eval("ApplyUserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假类型" DataField="LeaveType" SortExpression="LeaveType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="可补休假天数（天）" DataField="CanBXDays" ItemStyle-HorizontalAlign="Right" SortExpression="CanBXDays">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划请假天数（天）" DataField="LeaveDay" ItemStyle-HorizontalAlign="Right" SortExpression="LeaveDay">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划请假开始日期" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="StartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划请假结束日期" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="EndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假事由" DataField="Absence" ShowToolTip="true" SortExpression="Absence">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true" SortExpression="Memo">
            </zhongsoft:LightBoundField>
        </Columns>
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
