<%@ Page Language="C#" Title="选择会议室" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="MeetingRoomSelector.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Obsolete.MeetingRoomSelector" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    会议室名称
    <zhongsoft:LightTextBox ID="tbMeetingRoomName" runat="server" MaxLength="32" Width="100px"></zhongsoft:LightTextBox>
     <input type="hidden" id="hiType" runat="server" /> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="10"
        DataKeyNames="MeetingRoomID" BindJsonClick="true" AutoGenerateColumns="false"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" OnJsonClick="addObject"
        JsonClickMode="onclick">
        <Columns>
            <zhongsoft:LightBoundField DataField="MeetingRoomID" HeaderText="MeetingRoomID" Visible="false" />
            <zhongsoft:LightTemplateField HeaderText="会议室名称" ItemStyle-Width="20%">
                <ItemTemplate>
                   <a  onclick="return SelectRoom()"
                        target="_blank">
                        <%#Eval("MeetingRoomName")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="Scale" HeaderText="规模" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="80px" />
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="100px" />
            <zhongsoft:LightTemplateField HeaderText="占用状态" Visible="true" ItemStyle-Width="30%">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblMeetingRoom"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function SelectRoom() {
            return false;
        }
    </script>
</asp:Content>
    