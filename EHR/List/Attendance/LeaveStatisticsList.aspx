<%@ Page Language="C#" AutoEventWireup="true" Title="请假统计表" MasterPageFile="~/UI/Master/ObjectList.Master" 
    CodeBehind="LeaveStatisticsList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Attendance.LeaveStatisticsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">请假日期</span> <span>
        <zhongsoft:XHtmlInputText ID="tbLeaveStartDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
            -
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="tbLeaveEndDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true"  PageSize="15" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="部门" />
            <zhongsoft:LightTemplateField HeaderText="合计" ItemStyle-HorizontalAlign="Center"  SortExpression="sumLeaveDays">
                <ItemTemplate>
                    <%#(Convert.ToDouble(Eval("sumLeaveDays")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="病假" ItemStyle-HorizontalAlign="Center"  SortExpression="binCnt">
                <ItemTemplate>
                    <%#(Convert.ToDouble(Eval("binCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="事假" ItemStyle-HorizontalAlign="Center"   SortExpression="shiCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("shiCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="婚假" ItemStyle-HorizontalAlign="Center"   SortExpression="hunCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("hunCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="产假" ItemStyle-HorizontalAlign="Center"   SortExpression="chanCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("chanCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="年休假" ItemStyle-HorizontalAlign="Center"   SortExpression="nianCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("nianCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="护理假" ItemStyle-HorizontalAlign="Center"   SortExpression="huliCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("huliCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="探亲假" ItemStyle-HorizontalAlign="Center"   SortExpression="tanqinCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("tanqinCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="丧假" ItemStyle-HorizontalAlign="Center"   SortExpression="shangCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("shangCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="哺乳假" ItemStyle-HorizontalAlign="Center"   SortExpression="buruCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("buruCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="痛经假" ItemStyle-HorizontalAlign="Center"   SortExpression="tongCnt">
                <ItemTemplate>
                   <%#(Convert.ToDouble(Eval("tongCnt")))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

