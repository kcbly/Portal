<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="ResignationApplyPrinter.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ResignationApplyPrinter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">

    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,5"
        }
        function printOrientation() {
            return true;
        }
    </script>

    <div>
        <div>
            <div id="divBill" runat="server" style="page-break-after: always">
                <div class="print-maintitle">
                    <asp:Label ID="Label1" runat="server">辞职申请书</asp:Label>
                </div>
                <table class="print-sedtitle" style="border-style: none;">
                    <tr style="border-style: none;">
                        <td style="border-style: none; text-align: left">
                            工号:
                            <asp:Label ID="lbApplyUserCode" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table class="print-table">
                    <tr>
                        <td rowspan="2" style="width: 20pt">
                            申<br />请<br />人
                        </td>
                        <td style="width: 50pt">
                            姓名
                        </td>
                        <td style="width: 140pt">
                            <asp:Label ID="lbApplyUserName" runat="server"></asp:Label>
                        </td>
                        <td style="width: 50pt">
                            职务
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbPosition" runat="server"></asp:Label>
                        </td>
                        <td style="width: 50pt">
                            职称
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbTitle" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50pt">
                            部门
                        </td>
                        <td style="width: 140pt">
                            <asp:Label ID="lbOrganizationName" runat="server"></asp:Label>
                        </td>
                        <td colspan="2" style="width: 130pt">
                            辞职日期
                        </td>
                        <td colspan="2" style="width: 130pt">
                            <asp:Label ID="lbResignationDate" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 150px; width: 20pt">
                            辞职原因
                        </td>
                        <td colspan="6" style="width: 450pt">
                            <table style="border: none;">
                                <tr style="height: 120px; border-style: none;">
                                    <td style="width: 450pt; border-style: none; text-align: left; border: 0px; letter-spacing: 1pt;
                                        text-indent: 22pt">
                                        <asp:Label ID="lbResignationReason" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="height: 30px; border-style: none">
                                    <td style="border-style: none" align="right">
                                        本人签名：
                                        <asp:Label ID="lbApplyUserNameSign" runat="server" Width="60px" Visible="false"></asp:Label>
                                        <asp:Image ID="imgApplyUser" runat="server" Width="60px" Visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 75.65pt; width: 20pt" rowspan="2">
                            科室意见
                        </td>
                        <td style="text-align: left; width: 320pt" rowspan="2" colspan="4">
                            <asp:Label ID="lbGHOpinion" runat="server"></asp:Label>
                        </td>
                        <td align="center" style="width: 50pt">
                            签字
                        </td>
                        <td style="width: 80pt">
                            <asp:Image ID="imgGH" runat="server" Width="60px" Visible="false" />
                            <asp:Label ID="lbGHSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 70pt">
                            日期
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbGHDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 75.65pt; width: 20pt" rowspan="2">
                            部门意见
                        </td>
                        <td style="text-align: left; width: 320pt" rowspan="2" colspan="4">
                            <asp:Label ID="lbDeptOpinion" runat="server"></asp:Label>
                        </td>
                        <td align="center" style="width: 50pt">
                            签字
                        </td>
                        <td style="width: 80pt">
                            <asp:Image ID="imgDept" runat="server" Width="60px" Visible="false" />
                            <asp:Label ID="lbDeptSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 70pt">
                            日期
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbDeptDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 75.65pt; width: 20pt" rowspan="2">
                            人资部意见
                        </td>
                        <td style="text-align: left; width: 320pt" rowspan="2" colspan="4">
                            <asp:Label ID="lbRZOpinion" runat="server"></asp:Label>
                        </td>
                        <td align="center" style="width: 50pt">
                            签字
                        </td>
                        <td style="width: 80pt">
                            <asp:Image ID="imgRZ" runat="server" Width="60px" Visible="false" />
                            <asp:Label ID="lbRZSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 70pt">
                            日期
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbRZDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="vertical-align: middle; height: 75.65pt; width: 20pt" rowspan="2">
                            主管院长
                        </td>
                        <td style="text-align: left; width: 320pt" rowspan="2" colspan="4">
                            <asp:Label ID="lbLeaderOpinion" runat="server"></asp:Label>
                        </td>
                        <td align="center" style="width: 50pt">
                            签字
                        </td>
                        <td style="width: 80pt">
                            <asp:Image ID="imgLeader" runat="server" Width="60px" Visible="false" />
                            <asp:Label ID="lbLeaderSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 70pt">
                            日期
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbLeaderDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: middle; height: 75.65pt; width: 20pt" rowspan="2">
                            院长意见
                        </td>
                        <td style="text-align: left; width: 320pt" rowspan="2" colspan="4">
                            <asp:Label ID="lbHeaderOpinion" runat="server"></asp:Label>
                        </td>
                        <td align="center" style="width: 50pt">
                            签字
                        </td>
                        <td style="width: 80pt">
                            <asp:Image ID="imgHeader" runat="server" Width="60px" Visible="false" />
                            <asp:Label ID="lbHeaderSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 70pt">
                            日期
                        </td>
                        <td style="width: 80pt">
                            <asp:Label ID="lbHeaderDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
