<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="AttendanceCollectFormList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Attendance.AttendanceCollectFormList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">填报月份</span> <span>
       <zhongsoft:XHtmlInputText runat="server" ID="txtYearAndMonth"  readonly="readonly" class="kpms-textbox-yearmonthdate" style="width: 70px; text-align: right"></zhongsoft:XHtmlInputText>
    </span></span>
<%--    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightTextBox ID="ltbDeptName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>--%>
       <span class="filter-block"><span>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="YearAndMonth" HeaderText="填报月份" />
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门名称" />
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名"  />
            <zhongsoft:LightBoundField DataField="LateCnt" HeaderText="迟到（次）" ItemStyle-HorizontalAlign="Center"  />
            <zhongsoft:LightBoundField DataField="EarlyCnt" HeaderText="早退（次）" ItemStyle-HorizontalAlign="Center"  />
            <zhongsoft:LightTemplateField HeaderText="旷工（次）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                <ItemTemplate>
                    <label><%#(Convert.ToDouble(Eval("AbsentCnt")))%></label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="事假（天）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                <ItemTemplate>
                    <label><%#(Convert.ToDouble(Eval("LeaveCnt").ToString()==""?0:Eval("LeaveCnt")))%></label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="病假（天）" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                <ItemTemplate>
                    <label><%#(Convert.ToDouble(Eval("SickLeaveCnt").ToString()==""?0:Eval("SickLeaveCnt")))%></label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Remark" HeaderText="备注" Width="200" ShowToolTip="true" />
            <asp:TemplateField HeaderText="流程状态" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
