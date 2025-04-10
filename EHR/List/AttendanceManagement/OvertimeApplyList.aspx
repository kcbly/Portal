<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OvertimeApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.AttendanceManagement.OvertimeApplyList" Title="加班申请" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtApplyStartDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtApplyEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">加班日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="2" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">加班人</span><span>
        <zhongsoft:LightTextBox ID="tbOverTimeUserNames" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowSorting="true" AllowPaging="true" ShowPageSizeChange="true" DataKeyNames="OvertimeApplyFormID" OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="BindDataGrid" HideFieldOnExport="全选">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ApplyDate">
            </zhongsoft:LightBoundField>
               <asp:TemplateField HeaderText="部门" ItemStyle-HorizontalAlign="left" SortExpression="ApplyDeptName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId") %>','<%#Eval("PId") %>')" style="color: Blue;">
                        <%#Eval("ApplyDeptName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="加班人员" DataField="OverTimeUserNames" ItemStyle-Wrap="false" SortExpression="OverTimeUserNames">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="加班时间（起）" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" SortExpression="StartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="加班时间（止）" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" SortExpression="EndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="记（小时）" DataField="OvertimeHours" ItemStyle-HorizontalAlign="Right" SortExpression="OvertimeHours">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合计（天）" DataField="OvertimeDays" ItemStyle-HorizontalAlign="Right" SortExpression="OvertimeDays">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="加班事由" DataField="OvertimeReasons" ShowToolTip="true" SortExpression="OvertimeReasons">
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
