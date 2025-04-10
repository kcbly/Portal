<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMeetingRoomBookState.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCMeetingRoomBookState" %>
<zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" DownLoadFileName="会议室预订状态"
    PageSize="10" DataKeyNames="MeetingRoomID" AutoGenerateColumns="false" OnExport="gvList_Export"
    OnRowDataBound="gvList_RowDataBound" OnRowCreated="gvList_RowCreated">
    <Columns>
        <asp:BoundField DataField="MeetingRoomID" HeaderText="MeetingRoomID" Visible="false" />
        <asp:BoundField DataField="MeetingRoomName" HeaderText="会议室名称" ItemStyle-HorizontalAlign="Left"
            ItemStyle-Width="80px" />
        <asp:BoundField HeaderText="周一" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周二" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周三" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周四" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
        <asp:BoundField HeaderText="周五" ItemStyle-HorizontalAlign="Left" ItemStyle-Width="100px" />
    </Columns>
</zhongsoft:LightPowerGridView>
<input type="hidden" runat="server" id="hiDays" value="5" />
<input type="hidden" runat="server" id="hiTimeFormatStr" value="{0}-{1}" />
<input type="hidden" runat="server" id="hiMeetStart" value="08:00" />
<input type="hidden" runat="server" id="hiMeetEnd" value="18:000" />
<input type="hidden" runat="server" id="hiToolTip" value="会议名称：{0} &#10;会议时间：{1} &#10;会议室：{2} &#10;申请部门：{3} &#10;预订人：{4} &#10;预订人电话：{5}  &#10;主持人：{6} " />
<asp:Button ID="btnReload" runat="server" Visible="false" OnClick="btnReload_Click"/>
<script type="text/javascript">

    function ViewDetail(keyID, actionType) {
        var json = { bizId: keyID, actionType: actionType, isOrder: "1" };
         
        var url = buildQueryUrl('/KMS/List/Meet/MeetingRoomPredeEditor.aspx', json);
        showDivDialog(url, "", 700, 500, callBackEdit);

<%--        close();
        <%=Page.ClientScript.GetPostBackEventReference(this.btnReload,"") %>--%>
        return false;
    }
    function EditDetail(keyID, actiontype) {
        var url = buildBizUrl(actiontype, keyID, "/KMS/List/Meet/MeetingRoomPredeEditor.aspx", null);
        showDivDialog(url, null, 1200, 600, callBackEdit);
        
        return false;
    }
      //跳转到发文流程表单
    function SendFlow(id) {
        var pName = "KMSMeetingRoomApplyForm.xpdl";
        var url = "<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx"
        var pId = "KMSMeetingRoomApplyForm_wp1";
        url = buildQueryUrl(url, { actionType: 2, packageName: pName, xpdlId: pId, formId: 903, ver: '|', MeetingRoomId: id });
        window.open(url);
    }
 
      function callBackEdit() {
          <%=Page.ClientScript.GetPostBackEventReference(this.btnReload,"") %>
    }


</script>
