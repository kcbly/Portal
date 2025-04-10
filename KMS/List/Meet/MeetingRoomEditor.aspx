<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master" CodeBehind="MeetingRoomEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetingRoomEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="kpms-table" style="width: 100%;">
        <tr>
            <td class="td-l">会议室名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMeetingRoomName" runat="server" MaxLength="16" req="1"
                    Field="MeetingRoomName" ActiveStatus="(23.*)" TableName="KMS_Meet_MeetingRoom"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">所在楼层
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFloors" runat="server" MaxLength="16" Field="FLOORS"
                    ActiveStatus="(23.*)" TableName="KMS_Meet_MeetingRoom"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">会议室面积（㎡）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbArea" runat="server" MaxLength="16" Field="Area" ActiveStatus="(23.*)"
                    TableName="KMS_Meet_MeetingRoom" CssClass="kpms-textbox-money" regex="^[0-9]+(\.[0-9]{1,2})?$" errmsg="请输入数字（最多两位小数）"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">最大可容纳人数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbScale" runat="server" MaxLength="16" Field="Scale"
                    ActiveStatus="(23.*)" TableName="KMS_Meet_MeetingRoom" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正整数" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">正常座位数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSeating" runat="server" MaxLength="16" Field="Seating" ActiveStatus="(23.*)"
                    TableName="KMS_Meet_MeetingRoom" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正整数" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">最多可增加座位数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbMaxSeating" runat="server" MaxLength="16" Field="MaxSeating"
                    ActiveStatus="(23.*)" TableName="KMS_Meet_MeetingRoom" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正整数" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">设备情况
            </td>
            <td class="td-r" colspan="3">
                <asp:CheckBoxList ID="cblAssetInfo" runat="server" ActiveStatus="(23.*)"
                    RepeatDirection="Horizontal" RepeatColumns="10">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiAssetInfo" field="AssetInfo" tablename="KMS_Meet_MeetingRoom" />
                <input type="hidden" runat="server" id="hiAssetInfoText" field="AssetInfoText" tablename="KMS_Meet_MeetingRoom" />
            </td>
        </tr>
        <tr>
            <td class="td-l">管理部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <div style="width:180px;">
                    <zhongsoft:LightObjectSelector runat="server" ID="losManageDeptName" PageUrl="~/Sys/OrgUsers/OrgSelector.aspx"
                        ResultForControls="{'hdnManageDeptId':'id'}" ResultAttr="name" ActiveStatus="(23.*)"
                        PageHeight="560" PageWidth="500" field="ManageDeptName" tablename="KMS_Meet_MeetingRoom"
                        SelectPageMode="Dialog" req="1"
                        CssClass="kpms-textbox" EnableTheming="false" />
                </div>
                <input id="hdnManageDeptId" type="hidden" tablename="KMS_Meet_MeetingRoom" field="ManageDeptId" runat="server" />
            </td>
            <td class="td-l">责任人<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="losManagerUserName"   PageHeight="650px"   
                    ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultForControls="{ 'hdnManagerUserId':'id'}"
                    ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="../../../Sys/OrgUsers/UserSelectorJson.aspx"
                    req="1" field="ManagerUserName" tablename="KMS_Meet_MeetingRoom"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hdnManagerUserId" runat="server" field="ManagerUserId"
                    tablename="KMS_Meet_MeetingRoom" />
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbDescription" runat="server" maxtext="128" CssClass="kpms-textarea"
                    Width="95%" EnableTheming="false" Field="Description" ActiveStatus="(23.*)" TableName="KMS_Meet_MeetingRoom"
                    Rows="3" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="td-l">排序
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbSortIndex" runat="server" MaxLength="3" TableName="KMS_Meet_MeetingRoom"
                    Field="SORTINDEX" ActiveStatus="(23.*)" regex="^[0-9]\d{0,3}$" errmsg="请输入整数" Width="100px" />
            </td>

        </tr>
    </table>
    <input type="hidden" runat="server" id="hiMeetingRoomId" tablename="KMS_Meet_MeetingRoom" field="MeetingRoomID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>
