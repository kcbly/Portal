<%@ Page Language="C#" Title="会议决议督办台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="MeetingSuperviseList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingSuperviseList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">会议名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtMeetingName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">会议类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMeetType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">议题决议</span>
        <span>
            <zhongsoft:LightTextBox ID="txtIssueResolution" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">主办部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtHostDept" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">办理状态</span> <span>
            <zhongsoft:LightDropDownList ID="ddlStatus" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="0">办理中</asp:ListItem>
                <asp:ListItem Value="1">办理完成</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">进度更新时间</span>
        <span>
            <zhongsoft:XHtmlInputText runat="server" ID="xmlStartFeedbackDate" class="kpms-textbox-comparedate"
                readonly="readonly" compare="1">
            </zhongsoft:XHtmlInputText>
            <zhongsoft:XHtmlInputText runat="server" ID="xmlEndFeedbackDate" class="kpms-textbox-comparedate"
                readonly="readonly" compare="1">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ResolutionSuperviseFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightBoundField HeaderText="会议类型" DataField="MeetTypeText" SortExpression="MeetTypeText" Width="90px" />
            <zhongsoft:LightBoundField HeaderText="会议名称" DataField="MeetingName" SortExpression="MeetingName" ShowToolTip="true" Width="100px" />
            <zhongsoft:LightTemplateField HeaderText="议题决议" ItemStyle-HorizontalAlign="left" ItemStyle-Width="320px" SortExpression="IssueResolution">
                <ItemTemplate>
                    <a onclick="View('<%# Eval("ResolutionSuperviseFormId") %>','')" style="color: Blue;" title='<%#Eval("IssueResolution")%>'><%#Eval("IssueResolution")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="主办部门" DataField="HostDeptName" SortExpression="HostDeptName" Width="100px" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="配合部门" DataField="FitDeptName" SortExpression="FitDeptName" Width="180px" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="要求最晚完成日期" DataField="LatestCompleteDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="LatestCompleteDate" Width="70px" />
            <zhongsoft:LightBoundField HeaderText="进度说明" DataField="Progress" ShowToolTip="true" SortExpression="Progress" Width="180px" />
            <zhongsoft:LightBoundField HeaderText="进度更新时间" DataField="FeedbackDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="FeedbackDate" Width="60px" />
            <asp:TemplateField HeaderText="办理状态" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" SortExpression="Flag">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# "流程中".Equals(Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")))? "办理中":"办理完成"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {

            $("#divToolBtn").hide();

        }
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";

        function View(bizId) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;

        }

        GetRequest();
        //截取url参数
        function GetRequest() {
            //会议纪要传阅台账中量化显示（议题决议数、办理完成数、未完成数）查看时，判断如果有传参数bizid（会议纪要传阅主表主键）则隐藏搜索区域
            var url = location.search;
            if (url.indexOf("bizid") != -1) {
                $("#ctl00_trQuery").hide();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
