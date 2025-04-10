<%@ Page Language="C#" Title="员工持证奖励申请审批台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="StaffCertifiedRewardApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.IC.StaffCertifiedRewardApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">


    <span class="filter-block">
        <span class="filter-block-lb">申请人</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtApplyDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">证书名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCertificateName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请注册资质证书</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlApplyRegisterCertificate" runat="server" EnableTheming="false" class="kpms-ddlsearch" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"/>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">证书发证机构</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCertificationAuthority" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">岗位</span>
        <span>
            <zhongsoft:LightTextBox ID="txtPost" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请日期</span>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="StaffCertifiedRewardApplyFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="申请日期" DataField="ApplyDate" SortExpression="ApplyDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="部门" DataField="ApplyDeptName" SortExpression="ApplyDeptName" />
            <asp:TemplateField HeaderText="申请人" ItemStyle-HorizontalAlign="left" SortExpression="ApplyUserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewFlow('<%#Eval("StaffCertifiedRewardApplyFormId")%>');" style="color: Blue;">
                        <%#Eval("ApplyUserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>

            <zhongsoft:LightBoundField HeaderText="岗位" DataField="Post" SortExpression="Post" />
            <zhongsoft:LightBoundField HeaderText="证书名称" DataField="CertificateName" SortExpression="CertificateName" />
            <zhongsoft:LightBoundField HeaderText="申请注册资质证书" DataField="ApplyRegisterCertificateText" SortExpression="ApplyRegisterCertificateText" />
            <zhongsoft:LightBoundField HeaderText="证书法政机构" DataField="CertificationAuthority" SortExpression="CertificationAuthority" />
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



