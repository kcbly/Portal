<%@ Page Title="会议室使用情况统计" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="MeetingRoomUseSituationList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomUseSituationList" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">申请部门</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlDeptName" runat="server">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">会议室</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMeetingR" runat="server" CssClass="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">会议日期</span>
        <span>
            <zhongsoft:XHtmlInputText type="text" ID="txtMBegin" runat="server" readonly="readonly"
                class="kpms-textbox-comparedate" compare="1" />
        </span>
        <span> 至 </span>
        <span>
            <zhongsoft:XHtmlInputText type="text" ID="txtMEnd" runat="server" readonly="readonly"
                class="kpms-textbox-comparedate" compare="1" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">年度</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear"></zhongsoft:LightDropDownList>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">月度</span>
        <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlMth"></zhongsoft:LightDropDownList>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="10" ID="gvList" UseDefaultDataSource="true"
        runat="server" DataKeyNames="MeetingRoomApplyId" ShowExport="true" HideFieldOnExport="查看"
        BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="部门名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MeetingName" HeaderText="会议名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MEETINGROOMNAME" HeaderText="会议室">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MeetDate" HeaderText="会议时间">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="预订人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyDate" HeaderText="预订日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewDetail" runat="server" EnableTheming="false">
                    <img alt="查看" title="查看" onclick="return viewDetail('<%#Eval("MeetingRoomApplyId") %>')" 
                    src="/Portal/Themes/Images/btn_dg_view.gif" style="cursor: hand" border="0"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Label ID="MeetingCount" runat="server"></asp:Label>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#ctl00_divConfigBar").hide();
        }
        function viewDetail(bizid) {
            var url = buildQueryUrl("/KMS/List/Meet/MeetingRoomPredeEditor.aspx", { actionType: 1, bizId: bizid });
            showDivDialog(url, null, 950, 500, null);
            return false;
        }

    </script>
</asp:Content>
