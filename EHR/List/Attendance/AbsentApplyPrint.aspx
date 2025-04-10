<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="AbsentApplyPrint.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.AbsentApplyPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">

    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,5"
        }
        function printOrientation() {
            return true;
        }
    </script>

    <style type="text/css">
        /**//*外部表格内容*/.kpms-this-container
        {
            width: 470.0pt;
            border: #000000 1px solid;
            border-collapse: collapse;
        }
        .kpms-this-container td
        {
            font-size: 10.5pt;
            font-family: 宋体;
            text-align: center;
            height: 23.8pt;
            line-height: 16px;
            border: #000000 1px solid;
            border-collapse: collapse;
        }
        /*内部表格*/.kpms-this-inner
        {
            width: 470.0pt;
            border: none;
            border-collapse: collapse;
            text-align: center;
        }
        .kpms-this-inner td
        {
            font-size: 10.5pt;
            font-family: 宋体;
            text-align: center;
            padding-left: 5px;
            height: 23.8pt;
            line-height: 15pt;
            border: #000000 1px solid;
            border-collapse: collapse;
        }
    </style>
    <div>
        <div>
            <div id="divBill" runat="server" style="page-break-after: always">
                <div class="kpms-print-maintitle" style="text-align: center; width: 100%">
                    <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋; text-align: center">中国电力工程顾问集团中南电力设计院员工请假单</asp:Label>
                </div>
                <div>
                    <div style="line-height: 28.0pt; text-align: center; font-size: 9.0pt; font-family: 宋体;
                        width: 470.0pt;">
                        修改码
                        <asp:Label ID="lbModifyCode" runat="server" Width="100px">0  220306.03-R02</asp:Label>
                    </div>
                </div>
                <div>
                    <table class="kpms-this-container">
                        <tr>
                            <td style="width: 70pt">
                                请假人
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbPersonnelName" runat="server"></asp:Label>
                            </td>
                            <td style="width: 50pt">
                                院号
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbPersonnelCode" runat="server"></asp:Label>
                            </td>
                            <td style="width: 90pt">
                                所属部室
                            </td>
                            <td style="width: 120pt">
                                <asp:Label ID="lbDeptName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 70pt">
                                请假时间
                            </td>
                            <td colspan="3" style="width: 190pt">
                                <asp:Label ID="lbStartDate" runat="server"></asp:Label>到<asp:Label ID="lbEndDate"
                                    runat="server"></asp:Label>
                            </td>
                            <td style="width: 90pt">
                                请假天数
                            </td>
                            <td style="width: 120pt">
                                <asp:Label ID="lbApplyHolidayDays" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 70pt">
                                请假类型
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbYearlLeaveTypeName" runat="server"></asp:Label>
                            </td>
                            <td style="width: 50pt">
                                联系方式
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbMobilePhone" runat="server"></asp:Label>
                            </td>
                            <td style="width: 90pt">
                                申请日期
                            </td>
                            <td style="width: 120pt">
                                <asp:Label ID="lbApplyTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 100pt; width: 70pt">
                                请假事由
                            </td>
                            <td colspan="5" style="text-align: left; letter-spacing: 1pt; text-indent: 22pt;
                                width: 400pt">
                                <asp:Label ID="lbHolidayReason" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 100pt; width: 70pt">
                                备注
                            </td>
                            <td colspan="5" style="text-align: left; letter-spacing: 1pt; text-indent: 22pt;
                                width: 400pt">
                                <asp:Label ID="lbRemark" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle; height: 75.65pt; width: 90pt" rowspan="2">
                                科长意见
                            </td>
                            <td style="text-align: left; width: 250pt" rowspan="2" colspan="3">
                                <asp:Label ID="lbSubOpinion" runat="server"></asp:Label>
                            </td>
                            <td align="center" style="width: 50pt">
                                签字
                            </td>
                            <td style="width: 80pt">
                                <asp:Image ID="imgSubSign" runat="server" Width="60px" Visible="false" />
                                <asp:Label ID="lbSubSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 70pt">
                                日期
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbSubDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle; height: 75.65pt; width: 90pt" rowspan="2">
                                部（室）主管意见
                            </td>
                            <td style="text-align: left; width: 250pt" rowspan="2" colspan="3">
                                <asp:Label ID="lbDeptOpinion" runat="server"></asp:Label>
                            </td>
                            <td align="center" style="width: 50pt">
                                签字
                            </td>
                            <td style="width: 80pt">
                                <asp:Image ID="imgDeptSign" runat="server" Width="60px" Visible="false" />
                                <asp:Label ID="lbDeptSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 70pt">
                                日期
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbDeptDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle; height: 75.65pt; width: 90pt" rowspan="2">
                                人力资源部意见
                            </td>
                            <td style="text-align: left; width: 250pt" rowspan="2" colspan="3">
                                <asp:Label ID="lbRZOpinion" runat="server"></asp:Label>
                            </td>
                            <td align="center" style="width: 50pt">
                                签字
                            </td>
                            <td style="width: 80pt">
                                <asp:Image ID="imgRZSign" runat="server" Width="60px" Visible="false" />
                                <asp:Label ID="lbRZSign" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 70pt">
                                日期
                            </td>
                            <td style="width: 70pt">
                                <asp:Label ID="lbRZDate" runat="server" Font-Bold="true" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: middle; height: 75.65pt; width: 90pt" rowspan="2">
                                分管院领导意见
                            </td>
                            <td style="text-align: left; width: 250pt" rowspan="2" colspan="3">
                                <asp:Label ID="lbLeaderOpinion" runat="server"></asp:Label>
                            </td>
                            <td align="center" style="width: 50pt">
                                签字
                            </td>
                            <td style="width: 80pt">
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
            </div>
        </div>
    </div>
</asp:Content>
