<%@ Page Language="C#" Title="师带徒考核记录审批台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="TeacherApprenticeAssessmentApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.IC.TeacherApprenticeAssessmentApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">师傅/徒弟姓名</span>
        <span>
            <zhongsoft:LightTextBox ID="txtName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">考核日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtAssessmentDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtAssessmentDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">考核阶段</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlExaminationStage" runat="server" EnableTheming="false" class="kpms-ddlsearch" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"/>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">考核方式</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlAssessmentMethod" runat="server" EnableTheming="false" class="kpms-ddlsearch" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"/>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">考核成绩</span>
        <span>
            <zhongsoft:LightTextBox ID="txtAssessmentResult" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="TeacherApprenticeAssessmentApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="考核日期" DataField="AssessmentDate" SortExpression="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="师傅姓名" DataField="MasterWorker" SortExpression="ApplyUserName" />

            <asp:TemplateField HeaderText="徒弟姓名" ItemStyle-HorizontalAlign="left" SortExpression="Apprentice"
                ItemStyle-Width="100px">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("TeacherApprenticeAssessmentApplyFormId")%>');" style="color: Blue;">
                        <%#Eval("Apprentice")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="考核阶段" DataField="ExaminationStageText" SortExpression="ApplyDeptName" />
            <zhongsoft:LightBoundField HeaderText="考核方式" DataField="AssessmentMethodText" SortExpression="ApplyReasonAchievements" />
            <zhongsoft:LightBoundField HeaderText="考核成绩" DataField="AssessmentResult" SortExpression="ApplyReasonAchievements" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" SortExpression="Remark" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center" SortExpression="Flag">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
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



