<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="StaffTransferTracePrint.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.StaffTransferTracePrint" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
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
    <style type="text/css">
        .kpms-gridview1header
        {
            text-align: center;
        }
        .kpms-gridview1header th
        {
            border: 1px solid;
        }
        .kpms-gridviewbody-ji1
        {
            background: #fff;
        }
        .kpms-gridviewbody-ji1 td
        {
            border: 1px solid;
        }
    </style>
    <div>
        <div>
            <div id="divBill" runat="server" style="page-break-after: always">
                <div class="kpms-print-maintitle" style="text-align: center; width: 100%">
                    <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋; text-align: center">调动人员信息跟踪表</asp:Label>
                </div>
                <div>
                    <table class="kpms-this-container" style="border-bottom:0px">
                        <tr>
                            <td style="width: 80pt">
                                姓名
                            </td>
                            <td style="width: 80pt">
                                <asp:Label ID="lbPersonnelName" runat="server"></asp:Label>
                            </td>
                            <td style="width: 80pt">
                                部门
                            </td>
                            <td style="width: 100pt">
                                <asp:Label ID="lbOrganizationName" runat="server"></asp:Label>
                            </td>
                            <td style="width: 80pt">
                                变动原因
                            </td>
                            <td style="width: 120pt">
                                <asp:CheckBoxList ID="cbReason" runat="server" RepeatDirection="Horizontal" BorderStyle="None"
                                    Enabled="false">
                                    <asp:ListItem Text="调入" Value="调入"></asp:ListItem>
                                    <asp:ListItem Text="调出" Value="调出"></asp:ListItem>
                                    <asp:ListItem Text="辞职" Value="辞职"></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr style="border-bottom:0px">
                            <td colspan="2" style="width: 160pt">
                                调入（出）单位名称
                            </td>
                            <td colspan="2" style="width: 180pt">
                                <asp:Label ID="lbOutUnit" runat="server"></asp:Label>
                            </td>
                            <td style="width: 100pt">
                                办理日期
                            </td>
                            <td style="width: 120pt">
                                <asp:Label ID="lbDealDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div style="width: 470.0pt;">
                        <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                            AutoGenerateColumns="false" DataKeyNames="USERTRANSFERITEMID">
                            <Columns>
                                <asp:TemplateField HeaderText="需办理事项" ItemStyle-Width="131pt">
                                    <ItemTemplate>
                                        <%#Eval("ITEMCONTENT")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="管理部门" ItemStyle-Width="131pt">
                                    <ItemTemplate>
                                        <%#Eval("MGRDEPTNAME")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="办理事项确认">
                                    <ItemTemplate>
                                        <%#Eval("ITEMCONFIRM")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="办理时间" ItemStyle-Width="70px" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <%# Eval("DealDate") == DBNull.Value ? "" : string.IsNullOrEmpty(Eval("DealDate").ToString()) ? "" : DateTime.Parse(Eval("DealDate").ToString()).ToString("yyyy-MM-dd")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="责任人" ItemStyle-Width="60px">
                                    <ItemTemplate>
                                        <%#Eval("RESPONSERNAME")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="待完成事项确认">
                                    <ItemTemplate>
                                        <%#Eval("TOITEMCONFIRM")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="备注" ItemStyle-Width="100px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbRemark" runat="server" Text='<%#Eval("MEMO") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
