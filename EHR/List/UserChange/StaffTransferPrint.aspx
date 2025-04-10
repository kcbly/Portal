<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="StaffTransferPrint.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.StaffTransferPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">

    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,5"
        }
        function printOrientation() {
            return true;
        }
    </script>

    <div id="divBill" runat="server" style="page-break-after: always">
        <div class="print-maintitle">
            <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋; text-align: center">员工内部调动审批</asp:Label>
        </div>
        <table class="print-table">
            <tr>
                <td style="width: 100pt">
                    调出部门
                </td>
                <td style="width: 100pt">
                    调入部门
                </td>
                <td style="width: 60pt">
                    姓名
                </td>
                <td style="width: 70pt">
                    职务
                </td>
                <td style="width: 70pt">
                    职称
                </td>
                <td style="width: 70pt">
                    岗位
                </td>
            </tr>
            <tr style="height:35px">
                <td style="width: 100pt">
                    <asp:Label ID="lbOrgSourceName" runat="server"></asp:Label>
                </td>
                <td style="width: 100pt">
                    <asp:Label ID="lbOrgTargetName" runat="server"></asp:Label>
                </td>
                <td style="width: 60pt">
                    <asp:Label ID="lbPersonnelName" runat="server"></asp:Label>
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbPosition" runat="server"></asp:Label>
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbTitle" runat="server"></asp:Label>
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbOriginalPositionName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    调动理由
                </td>
                <td style="text-align: left; letter-spacing: 1pt; text-indent: 22pt; height: 150px;
                    width: 370pt" colspan="5">
                    <asp:Label ID="lbTransferReason" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; height: 75.65pt; width: 100pt" rowspan="2">
                    调入单位意见
                </td>
                <td style="text-align: left; width: 230pt" rowspan="2" colspan="3">
                    <asp:Label ID="lbInUnit" runat="server"></asp:Label>
                </td>
                <td align="center" style="width: 70pt">
                    签字
                </td>
                <td style="width: 70pt">
                    <asp:Image ID="imgInUnitSign" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbInUnitSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 70pt">
                    日期
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbInUnitDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; height: 75.65pt; width: 100pt" rowspan="2">
                    调入分管院领导意见
                </td>
                <td style="text-align: left; width: 230pt" rowspan="2" colspan="3">
                    <asp:Label ID="lbInLeader" runat="server"></asp:Label>
                </td>
                <td align="center" style="width: 70pt">
                    签字
                </td>
                <td style="width: 70pt">
                    <asp:Image ID="imgInLeaderSign" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbInLeaderSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 70pt">
                    日期
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbInLeaderDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; height: 75.65pt; width: 100pt" rowspan="2">
                    调出单位意见
                </td>
                <td style="text-align: left; width: 230pt" rowspan="2" colspan="3">
                    <asp:Label ID="lbOutUnit" runat="server"></asp:Label>
                </td>
                <td align="center" style="width: 70pt">
                    签字
                </td>
                <td style="width: 70pt">
                    <asp:Image ID="imgOutUnitSign" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbOutUnitSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 70pt">
                    日期
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbOutUnitDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; height: 75.65pt; width: 100pt" rowspan="2">
                    调出分管院领导意见
                </td>
                <td style="text-align: left; width: 230pt" rowspan="2" colspan="3">
                    <asp:Label ID="lbOutLeader" runat="server"></asp:Label>
                </td>
                <td align="center" style="width: 70pt">
                    签字
                </td>
                <td style="width: 70pt">
                    <asp:Image ID="imgOutLeaderSign" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbOutLeaderSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 70pt">
                    日期
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbOutLeaderDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: middle; height: 75.65pt; width: 100pt" rowspan="2">
                    院长批示
                </td>
                <td style="text-align: left; width: 230pt" rowspan="2" colspan="3">
                    <asp:Label ID="lbLeader" runat="server"></asp:Label>
                </td>
                <td align="center" style="width: 70pt">
                    签字
                </td>
                <td style="width: 70pt">
                    <asp:Image ID="imgLeaderSign" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbLeaderSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 70pt">
                    日期
                </td>
                <td style="width: 70pt">
                    <asp:Label ID="lbLeaderDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
