<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_UserChange.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.UI.Controls.C_UserChange" %>
<div class="wp_listleft">
    <div class="wp_header">
        <div>
            <span>人员变动情况</span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <table class="wp_table">
                <tr>
                    <td>
                        月份
                    </td>
                    <td>
                        <asp:Label ID="lbMonth" runat="server"></asp:Label>月
                    </td>
                </tr>
                <tr>
                    <td>
                        新增人数
                    </td>
                    <td>
                        <a onclick="openUserIn()">共<asp:Label ID="lbInCount" runat="server"></asp:Label>人
                        </a>
                    </td>
                </tr>
                <tr>
                    <td>
                        减少人数
                    </td>
                    <td>
                        <a onclick="openUserOut()">共<asp:Label ID="lbOutCount" runat="server"></asp:Label>人，其中辞职<asp:Label
                            ID="lbQuitCount" runat="server"></asp:Label>人，退休<asp:Label ID="lbRetireCount" runat="server"></asp:Label>人
                        </a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    function openUserIn() {
        var myDate = new Date();
        var startDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-01 00:00:00";
        var endDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " 23:59:59";
        var param = {StartDate: startDate, EndDate: endDate };
        window.parent.setDashBoardTab("UserIn");
        window.parent.setWebPartParam(self.frameElement.id, param);
        //        var url = buildQueryUrl("/EHR/List/OrgUsers/PersonnelInfoListUnInCompany.aspx", { IsInCompany: "0", StartDate: startDate, EndDate: endDate });
        //        return checkReturn(showModal(url, null, 1080, 600));
    }

    function openUserOut() {
        var myDate = new Date();
        var startDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-01 00:00:00";
        var endDate = myDate.getFullYear() + "-" + (myDate.getMonth() + 1) + "-" + myDate.getDate() + " 23:59:59";
        var param = {StartDate: startDate, EndDate: endDate };
        window.parent.setDashBoardTab("UserOut");
        window.parent.setWebPartParam(self.frameElement.id, param);
//        var url = buildQueryUrl("/EHR/List/OrgUsers/PersonnelInfoListUnInCompany.aspx", { IsInCompany: "1", StartDate: startDate, EndDate: endDate });
//        return checkReturn(showModal(url, null, 1080, 600));
    }
</script>
