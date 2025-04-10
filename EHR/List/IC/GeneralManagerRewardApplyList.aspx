<%@ Page Language="C#" Title="总经理嘉奖审批台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="GeneralManagerRewardApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.IC.GeneralManagerRewardApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">申报部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申报项目</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyProject" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">申报日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtApplyDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtApplyDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申报理由及成果描述</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyReasonAchievements" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="GeneralManagerRewardApplyFormId" PageSize="15">
        <columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="申报日期" DataField="ApplyDate" SortExpression="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="申报人" DataField="ApplyUserName" SortExpression="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="申报部门" DataField="ApplyDeptName" SortExpression="ApplyDeptName" />
            <asp:TemplateField HeaderText="申报项目" ItemStyle-HorizontalAlign="left" SortExpression="ApplyProject"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("GeneralManagerRewardApplyFormId")%>');" style="color: Blue;">
                        <%#Eval("ApplyProject")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>

            <zhongsoft:LightBoundField HeaderText="申报理由及成果描述" DataField="ApplyReasonAchievements" SortExpression="ApplyReasonAchievements" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" SortExpression="Remark" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" SortExpression="Flag">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
        function initCustomerPlugin() {
            $("#divToolBtn").hide();//页面初始化时隐藏顶部按钮部分，只适用于引用模板为~/UI/Master/ObjectWhList.Master的页面
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>



