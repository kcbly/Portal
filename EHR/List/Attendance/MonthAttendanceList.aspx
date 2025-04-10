<%@ Page Title="部门月度考勤上报" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="MonthAttendanceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Attendance.MonthAttendanceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">考勤年</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">考勤月</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"  DataKeyNames="MonthAttendanceFormID" PageSize="15"    ShowExport="true" BindGridViewMethod="BindData" 
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="考勤年" DataField="Year" SortExpression="Year">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="考勤月" DataField="Month" SortExpression="Month">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作日（天）" DataField="WorkDays" ItemStyle-HorizontalAlign="Right" SortExpression="WorkDays">
            </zhongsoft:LightBoundField>            
              <asp:TemplateField HeaderText="部门名称" ItemStyle-HorizontalAlign="left" SortExpression="DeptName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId") %>','<%#Eval("PId") %>')" style="color: Blue;">
                        <%#Eval("DeptName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门职工人数（人）" DataField="TotalNumber" ItemStyle-HorizontalAlign="Right" SortExpression="TotalNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="缺勤人数（人）" DataField="NoInNumber" ItemStyle-HorizontalAlign="Right" SortExpression="NoInNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="理论工作人日" DataField="Llgzrr" ItemStyle-HorizontalAlign="Right" SortExpression="Llgzrr">
            </zhongsoft:LightBoundField> 
            <zhongsoft:LightBoundField HeaderText="缺勤工作人日" DataField="Qqgzrr" ItemStyle-HorizontalAlign="Right" SortExpression="Qqgzrr">
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
