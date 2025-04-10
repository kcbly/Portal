<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="ReEmployedManagePrint.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ReEmployedManagePrint" %>

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
                    <asp:Label ID="Label1" runat="server">返聘人员花名表</asp:Label>
                </div>
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="false" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" DataKeyNames="REEMPLOYEDDETAILID" CssClass="print-list-notable"
                    EnableTheming="false">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSequence" Text="<%# Container.DataItemIndex + 1 %>"
                                    detailitem="1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门名称" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <%#Eval("DeptName")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" ItemStyle-Width="100px" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <%#Eval("USERNAME")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="技术职称" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#Eval("SKILLTITLE")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="返聘起始日期" ItemStyle-Width="70px" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <%#Eval("REEMPLOYEDSTARTDATE") == DBNull.Value ? "" : Eval("REEMPLOYEDSTARTDATE", "{0:yyyy-MM-dd}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="返聘终止日期" ItemStyle-Width="70px" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <%#Eval("REEMPLOYEDENDDATE") == DBNull.Value ? "" : Eval("REEMPLOYEDENDDATE", "{0:yyyy-MM-dd}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <%#Eval("MEMO")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <br />
                <table class='print-sedtitle' style="border: none">
                    <tr>
                        <td align="left" style='font-size: 12.0pt; font-family: 宋体; line-height: 16px; white-space: nowrap;
                            width: 130pt'>
                            主管领导：<asp:Label ID="lbLeaderSign" runat="server" Width="60px" Visible="false"></asp:Label>
                            <asp:Image ID="imgLeader" runat="server" Width="60px" Visible="false" />
                        </td>
                        <td align="left" style='font-size: 12.0pt; font-family: 宋体; line-height: 16px; white-space: nowrap;
                            width: 130pt'>
                            人资部主任：<asp:Label ID="lbRZ" runat="server" Width="60px" Visible="false"></asp:Label>
                            <asp:Image ID="imgRZ" runat="server" Width="60px" Visible="false" />
                        </td>
                        <td style='font-size: 12.0pt; font-family: 宋体; white-space: nowrap; width: 210pt;
                            text-align: center'>
                            制表:<asp:Label ID="lbUserNameSign" runat="server" Width="60px" Visible="false"></asp:Label>
                            <asp:Image ID="imgUser" runat="server" Width="60px" Visible="false" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
