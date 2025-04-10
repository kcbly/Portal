<%@ Page Language="C#" Title="人员奖惩信息" AutoEventWireup="true" CodeBehind="RewardOrPunishEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.RewardOrPunishEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"   TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
<%--                <zhongsoft:LightObjectSelector runat="server" ID="tbLoginID" Field="LoginID" tablename="EHR_UB_RewardOrPunishEntity"
                    Activestatus="(23.*)" DoCancel="true" req="1" ResultAttr="LoginId" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserName':'name','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />--%>
                <zhongsoft:XHtmlInputText ID="tbLoginID" runat="server" readonly="readonly" class="kpms-textbox" req="1"
                    field="LoginID" tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)" />
                <input type="hidden" id="hiUserId" runat="server" field="UserID" tablename="EHR_UB_RewardOrPunishEntity" />
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
<%--                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="UserName" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>--%>
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','tbLoginID':'UserCode','hiDeptID':'OrgUnitId','txtDeptName':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="UserName" tablename="EHR_UB_RewardOrPunishEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiDeptID" field="DeptID" tablename="EHR_UB_RewardOrPunishEntity" />
                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="DeptName" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">奖惩类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRewardOrPunish" req="1" Field="RewardOrPunish" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr content="Punish">
            <td class="td-l">处分处罚类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPunishType" Field="PunishType" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">惩处名称<span class="req-star">*</span>

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPunishName" runat="server" Field="PunishName" Tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Punish">
            <td class="td-l">惩处日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPunishDate" runat="server" readonly="readonly" class="kpms-textbox-date" Field="PunishDate" Tablename="EHR_UB_RewardOrPunishEntity"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">批准机构

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbApprovingBody" runat="server" Field="ApprovingBody" Tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)" MaxLength="50">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Punish">
            <td class="td-l">处罚原因
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbPunishReason" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="PunishReason" tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Punish">
            <td class="td-l">是否解除
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rdblIsRelease" field="IsRelease" tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)" RepeatColumns="2">
                    <asp:ListItem Text="是" Value="是"></asp:ListItem>
                    <asp:ListItem Text="否" Value="否"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">解除日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtReleaseDate" runat="server" readonly="readonly" class="kpms-textbox-date" Field="ReleaseDate" Tablename="EHR_UB_RewardOrPunishEntity"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr content="Punish">
            <td class="td-l">解除原因
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbReleaseReason" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="ReleaseReason" tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Reward">
            <td class="td-l">奖励类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRewardType" Field="RewardType" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">奖励级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRewardLevel" Field="RewardLevel" Tablename="EHR_UB_RewardOrPunishEntity" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr content="Reward">
            <td class="td-l">取得奖励日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRewardDate" runat="server" readonly="readonly" class="kpms-textbox-date" Field="RewardDate" Tablename="EHR_UB_RewardOrPunishEntity"
                    Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">奖励名称<span class="req-star">*</span>

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbRewardName" runat="server" Field="RewardName" Tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)" MaxLength="50">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Reward">
            <td class="td-l">颁发单位

            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRewardUnit" runat="server" Field="RewardUnit" Tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)" MaxLength="50">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Reward">
            <td class="td-l">奖励原因
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRewardReason" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="RewardReason" tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="Memo" tablename="EHR_UB_RewardOrPunishEntity" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">相关附件
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                    DisplayStatus="(3.*)">
                    <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                    <span>上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4">
                <uc1:attachmentview id="AttachmentView1" runat="server" repeatcolumns="1" showdelete="true"
                    showdeletebyself="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiRewardOrPunishID" tablename="EHR_UB_RewardOrPunishEntity" field="RewardOrPunishID" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            loadRewardOrPunish();
            $("#<%=ddlRewardOrPunish.ClientID%>").change(function () {
                loadRewardOrPunish();
            });
        }

        function loadRewardOrPunish() {
            var rp = $("#<%=ddlRewardOrPunish.ClientID%>").val();

            if (rp == "奖励") {
                $("[content='Reward']").show();
                $("[content='Punish']").hide();

                //去除惩处的req添加奖励的req
                $("#<%=ddlPunishType.ClientID%>").removeAttr("req");
                $("#<%=tbPunishName.ClientID%>").removeAttr("req");
                $("#<%=txtPunishDate.ClientID%>").removeAttr("req");

                $("#<%=ddlRewardType.ClientID%>").attr("req", "1");
                $("#<%=ddlRewardLevel.ClientID%>").attr("req", "1");
                $("#<%=txtRewardDate.ClientID%>").attr("req", "1");
                $("#<%=tbRewardName.ClientID%>").attr("req", "1");

            } else if (rp == "惩处") {
                $("[content='Reward']").hide();
                $("[content='Punish']").show();

                //去除奖励的req添加惩处的req
                $("#<%=ddlPunishType.ClientID%>").attr("req", "1");
                $("#<%=tbPunishName.ClientID%>").attr("req", "1");
                $("#<%=txtPunishDate.ClientID%>").attr("req", "1");

                $("#<%=ddlRewardType.ClientID%>").removeAttr("req");
                $("#<%=ddlRewardLevel.ClientID%>").removeAttr("req");
                $("#<%=txtRewardDate.ClientID%>").removeAttr("req");
                $("#<%=tbRewardName.ClientID%>").removeAttr("req");
            } else {
                $("[content='Reward']").hide();
                $("[content='Punish']").hide();
                //去除奖励、惩处的req

                $("#<%=ddlPunishType.ClientID%>").removeAttr("req");
                $("#<%=tbPunishName.ClientID%>").removeAttr("req");
                $("#<%=txtPunishDate.ClientID%>").removeAttr("req");
                $("#<%=ddlRewardType.ClientID%>").removeAttr("req");
                $("#<%=ddlRewardLevel.ClientID%>").removeAttr("req");
                $("#<%=txtRewardDate.ClientID%>").removeAttr("req");
                $("#<%=tbRewardName.ClientID%>").removeAttr("req");
            }
        }

    </script>
</asp:Content>
