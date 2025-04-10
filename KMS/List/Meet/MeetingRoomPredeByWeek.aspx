<%@ Page Title="会议室预定周视图台账页" Language="C#" AutoEventWireup="true" CodeBehind="MeetingRoomPredeByWeek.aspx.cs"
    Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomPredeByWeek" MasterPageFile="~/UI/Master/ObjectWhList.Master" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">申请人</span>
        <span>
            <zhongsoft:LightTextBox ID="tbApplyUser" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false">
            </zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">申请部门</span>
        <span>
            <asp:DropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </asp:DropDownList>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <link href="<%=WebAppPath %>/Themes/DayPilot/DayPilotLayout.css" rel="stylesheet" type="text/css" />
    <link href="<%=WebAppPath %>/Themes/DayPilot/themes.css" rel="stylesheet" type="text/css" />

    <script src="../../../UI/Script/jquery-1.4.3.min.js" type="text/javascript"></script>
    <div class="daypilot-main">
        <div class="daypilot-left">
            <DayPilot:DayPilotNavigator ID="DayPilotNavigator1" runat="server" BoundDayPilotID="DayPilotScheduler1"
                SelectMode="Week" CssClassPrefix="navigator_silver_" ShowMonths="1" ClientObjectName="dpn" />
        </div>
        <div class="daypilot-right">
            <div class="pilot-tab">
                <a href="javascript:SelectRoomDay();">天视图</a> <a class="pilot-tablink" href="javascript:SelectRoomWeek();">周视图</a> <a href="javascript:SelectRoomMouth();">月视图</a>
            </div>
            <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" ClientObjectName="dp"
                Days="7" ShowEventStartEnd="true" Width="95%" EventHeight="20" EventFontSize="12px"
                CssClassPrefix="scheduler_blue" CssOnly="true" LoadingLabelBackColor="Silver"
                Crosshair="Full" BusinessBeginsHour="8" BusinessEndsHour="22" DataStartField="MeeStartDate"
                DataEndField="MeetEndDate" DataTextField="MeetingName" DataValueField="MeetingRoomApplyId"
                DataResourceField="ApplyMeetingRoomIDs" ContextMenuID="DayPilotMenu1" EventMoveHandling="CallBack"
                OnEventMove="DayPilotCalendar1_EventMove" OnEventMenuClick="DayPilotCalendar1_EventMenuClick"
                EventResizeHandling="CallBack" OnEventResize="DayPilotCalendar1_EventResize"
                OnCommand="DayPilotCalendar1_Command" EventClickHandling="JavaScript" EventClickJavaScript="eventClick(e);"
                TimeRangeSelectedHandling="JavaScript" TimeRangeSelectedJavaScript="timeRangeSelected(start, end, resource);"
                OnBeforeEventRender="DayPilotCalendar1_BeforeEventRender" AfterRenderJavaScript="afterRender();"
                OnBeforeTimeHeaderRender="DayPilotScheduler1_BeforeTimeHeaderRender">
            </DayPilot:DayPilotScheduler>
            <DayPilot:DayPilotMenu ID="DayPilotMenu1" runat="server" CssClassPrefix="menu_">
                <DayPilot:MenuItem Text="编辑" Action="JavaScript" JavaScript="eventClick(e);" />
                <DayPilot:MenuItem Text="-" Action="NavigateUrl" />
                <DayPilot:MenuItem Text="删除" Action="JavaScript" JavaScript=" if (confirm('你确定要删除这个安排')) dp.eventMenuClickCallBack(e,'Delete');" />
            </DayPilot:DayPilotMenu>
            <DayPilot:DayPilotMenu ID="DayPilotMenu2" runat="server" CssClassPrefix="menu_">
                <DayPilot:MenuItem Text="浏览" Action="JavaScript" JavaScript="eventClick(e);" />
            </DayPilot:DayPilotMenu>
        </div>
    </div>
    <input type="hidden" id="hdnIsPower" runat="server" />
    <input type="hidden" id="hiType" runat="server" />
    <script type="text/javascript">
        $KeyUrl = "/KMS/List/Meet/MeetingRoomPredeEditor.aspx";
        $isFlow = "0";
        $("#ctl00_divConfigBar").hide();
        var isPower=$('#<%=hdnIsPower.ClientID %>').val();
        function SelectRoomDay() {
            var hiTypeValue = $('#<%=hiType.ClientID %>').val();
            var url = "/Portal/KMS/List/Meet/MeetingRoomPredeByDay.aspx?&meetingType=" + hiTypeValue;
            window.location.href = url;
            return false;
        }
        function SelectRoomWeek() {
            var hiTypeValue = $('#<%=hiType.ClientID %>').val();
            var url = "/Portal/KMS/List/Meet/MeetingRoomPredeByWeek.aspx?&meetingType=" + hiTypeValue;
            window.location.href = url;
            return false;
        }
        function SelectRoomMouth() {
            var hiTypeValue = $('#<%=hiType.ClientID %>').val();
            var url = "/Portal/KMS/List/Meet/MeetingRoomPredeByMouth.aspx?&meetingType=" + hiTypeValue;
            window.location.href = url;
            return false;
        }

    </script>
    <script src="../../../UI/Script/dayploit.handling.js" type="text/javascript" charset="gb2312"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
