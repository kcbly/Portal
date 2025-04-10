<%@ Page Title="会议纪要传阅台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="MeetMinutesCirculateList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetMinutesCirculateList" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">会议名称</span>
        <span>
            <zhongsoft:LightTextBox ID="txtMeetName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">文件编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtDocumentNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">会议日期</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtMeetDateStartDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
        <span>-</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtMeetDateEndDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">会议类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMeetType" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="MeetMinutesCirculateFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="会议类型" DataField="MeetTypeText" />
            <zhongsoft:LightBoundField HeaderText="文件编号" DataField="DocumentNumber" />
            <zhongsoft:LightBoundField HeaderText="会议名称" DataField="MeetName" />
            <zhongsoft:LightBoundField HeaderText="会议日期" DataField="MeetDate" DataFormatString="{0:yyyy-MM-dd}" />

            <zhongsoft:LightBoundField HeaderText="签收状态" ItemStyle-HorizontalAlign="Center" DataField="OverPer" EditItemClick="viewDetail" DataParamFields="MeetMinutesCirculateFormId" />
            <asp:TemplateField HeaderText="流程状态" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbFlag" runat="server" Text='<%# Zhongsoft.Portal.CommonHelper.GetFlowFlag(Eval("Flag")) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiId" runat="server" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $isFlow = "1";
        function viewDetail(bizId) {
            var url = buildQueryUrl("<%=WebAppPath %>/KMS/List/Meet/MeetMinutesCirculateViewDetail.aspx?bizid=" + bizId);
            showDivDialog(encodeURI(url), null, 900, 550, rebindGridData);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


