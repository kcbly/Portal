<%@ Page Title="用车申请台账" MasterPageFile="~/UI/Master/ObjectList.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarUseApplyList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarUseApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">

    <span class="filter-block">
        <span class="filter-block-lb">车牌号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCarNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">用车部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtApplayDeptName" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name" ResultForControls="{'hiApplyDeptId':'id'}"
                IsMutiple="false" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
        </span>
        <input type="hidden" runat="server" id="hiApplyDeptId" />
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">项目名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtProjectName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">司机姓名</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbDriverName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="CarUseApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="申请人" ItemStyle-HorizontalAlign="left">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("CarUseApplyFormId")%>');" style="color: Blue;">
                        <%#Eval("ApplyUserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="申请部门" DataField="ApplyDeptName" />
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="联系方式" DataField="Contact" />
            <zhongsoft:LightBoundField HeaderText="出车性质" DataField="DriveOutNatureText" />
            <zhongsoft:LightBoundField HeaderText="申请用车类型" DataField="ApplyCarTypeText" />
            <zhongsoft:LightBoundField HeaderText="预计用车时间（起）" DataField="UseCarStartDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            <zhongsoft:LightBoundField HeaderText="预计用车时间（止）" DataField="UseCarEndDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            <zhongsoft:LightBoundField HeaderText="用车人数" DataField="UseCarNumber" />
            <zhongsoft:LightBoundField HeaderText="司机姓名" DataField="DriverName" />
            <zhongsoft:LightBoundField HeaderText="目的地" DataField="Destination" />
            <zhongsoft:LightBoundField HeaderText="实际用车时间（起）" DataField="FactStartDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="实际用车时间（止）" DataField="FactEndDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="实际里程" DataField="FactOdograph" />
            <zhongsoft:LightBoundField HeaderText="费用" DataField="FactCost" />
            <zhongsoft:LightBoundField HeaderText="运输任务说明" DataField="JobDescription" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
  
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

