<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AbsentApplySelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.Obsolete.AbsentApplySelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content runat="server" ID="content" ContentPlaceHolderID="toolBar">
    <span class="filter-block">
        <span class="filter-block-lb">申请日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtStartTime" runat="server" readonly="readonly" class="kpms-textbox-comparedate" compare="startdate">
            </zhongsoft:XHtmlInputText>
            —
            <zhongsoft:XHtmlInputText ID="txtEndTime" runat="server" readonly="readonly" class="kpms-textbox-comparedate" compare="startdate">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>
</asp:Content>
<asp:Content runat="server" ID="content2" ContentPlaceHolderID="listGrid">
    <zhongsoft:LightPowerGridView runat="server" ID="gvAbsentApply"
        BindJsonClick="true" AllowPaging="true" PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="gvAbsentApply_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true" HeaderStyle-HorizontalAlign="Center">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假类型" DataField="YearlLeaveType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假开始日期" DataField="StartDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假开始时段" DataField="StartDatePeriod"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假结束日期" DataField="EndDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假结束时段" DataField="EndDatePeriod"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="预计请假天数" DataField="ApplyHolidayDays"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="请假理由" DataField="HolidayReason"
                ShowToolTip="true" ItemStyle-Width="120px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
