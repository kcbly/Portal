<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="UserWorkAttendanceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Attendance.UserWorkAttendanceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名</span> <span>
        <zhongsoft:LightTextBox ID="tbUserName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span>
        <%-- <zhongsoft:LightTextBox ID="tbApplyDeptName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>--%>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
    </span></span>
    <%-- <span class="filter-block"><span class="filter-block-lb">考勤日期</span> <span>
        <zhongsoft:XHtmlInputText ID="txtWorkDate" runat="server" class="kpms-textbox-date"
            readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>--%>
    <span class="filter-block"><span class="filter-block-lb">考勤日期</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartWorkDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
            -
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndWorkDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlAttendanceType" runat="server" CssClass="kpms-ddlsearch" Width="70px"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <%--<span class="filter-block"><span class="filter-block-lb">迟到</span> <span>
        <zhongsoft:LightDropDownList ID="ddlLateState" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">早退</span> <span>
        <zhongsoft:LightDropDownList ID="ddlEarlyState" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">出差</span> <span>
        <zhongsoft:LightDropDownList ID="ddlBusinessState" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">请假</span> <span>
        <zhongsoft:LightDropDownList ID="ddlLeaveState" runat="server" CssClass="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table>
        <tr>
            <td>
                <label runat="server" id="TjResult" style="font-size: 15px;"></label>
            </td>
        </tr>
    </table>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="WorkAttendanceId" PageSize="15" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="OrgUnitName" HeaderText="部门" />
            <zhongsoft:LightBoundField DataField="WorkDate" HeaderText="考勤日期" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="LateStateText" HeaderText="上午" HtmlEncode="false" ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="OnDutyDate" HeaderText="上班时间"  ItemStyle-HorizontalAlign="Center"/>
            <asp:TemplateField HeaderText="上午离开时长" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Eval("MorningLeaveTime").ToString()=="0"?"": Eval("MorningLeaveTime")%>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField DataField="EarlyStateText" HeaderText="下午" HtmlEncode="false"  ItemStyle-HorizontalAlign="Center"/>
            <zhongsoft:LightBoundField DataField="OffDutyDate" HeaderText="下班时间"  ItemStyle-HorizontalAlign="Center"/>
            <asp:TemplateField HeaderText="下午离开时长" HeaderStyle-Width="5%" ItemStyle-HorizontalAlign="Center" >
                <ItemTemplate>
                    <%# Eval("AfternoonLeaveTime").ToString()=="0"?"": Eval("AfternoonLeaveTime")%>
                </ItemTemplate>
            </asp:TemplateField>
            <%--  <zhongsoft:LightBoundField DataField="BusinessStateText" HeaderText="出差" />
            <zhongsoft:LightBoundField DataField="LeaveStateText" HeaderText="请假" />--%>
            <%--   <zhongsoft:LightBoundField DataField="OnDutyMiniteCnt" HeaderText="时长（上午）" />
            <zhongsoft:LightBoundField DataField="OffDutyMiniteCnt" HeaderText="时长（下午）" />--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
