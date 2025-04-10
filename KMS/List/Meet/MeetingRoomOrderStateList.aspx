<%@ Page Language="C#" Title="会议室预订状态" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectWhList.Master"
    CodeBehind="MeetingRoomOrderStateList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomOrderStateList" %>

<%@ Register Src="~/KMS/UI/Controls/UCMeetingRoomBookState.ascx" TagName="UCMeetingRoomBookState" TagPrefix="uc1" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">开始时间</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">结束时间</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate" compare="1"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </span>
    </span>
    <span class="filter-block">
        <span>
            <asp:LinkButton runat="server" class="kpms-btn" ID="lbtnPre" OnClick="lbtnPre_Click"> <span>上一周</span>
            </asp:LinkButton>
        </span>
    </span>
    <span class="filter-block">
        <span>
            <asp:LinkButton runat="server" class="kpms-btn" ID="lbtnNext" OnClick="lbtnPre_Click"> <span>下一周</span>
            </asp:LinkButton>
        </span>
    </span>
    <span class="filter-block">
        <span>
            <asp:LinkButton runat="server" class="kpms-btn" ID="lbtnMonth" OnClick="lbtnPre_Click"> <span>本月</span>
            </asp:LinkButton>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <table class="kpms-tabletwo" style="width: 100%">
        <tr>
            <td colspan="4">
                <div class="kpms-longtable" style="width: 100%;  border: none;">
                    <div class="kpms-longertable" style="border: none;">
                        <uc1:UCMeetingRoomBookState ID="UCMeetingRoomBookState1" runat="server" />
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#ctl00_divConfigBar").hide();
        }
    </script>
</asp:Content>

