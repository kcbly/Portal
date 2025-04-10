<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="SeparationProceduresPrinter.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.SeparationProceduresPrinter" %>

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
                <div class="print-maintitle" style="text-align: center; width: 100%">
                    <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋; text-align: center">职  工  离  职  清  单</asp:Label>
                </div>
                <div>
                    <table class="kpms-this-container">
                        <tr>
                            <td style="width: 60pt">
                                工号
                            </td>
                            <td colspan="2" style="width: 156pt">
                                <asp:Label ID="lbPersonnelCode" runat="server"></asp:Label>
                            </td>
                            <td style="width: 96pt">
                                联系电话
                            </td>
                            <td colspan="2" style="width: 156pt">
                                <asp:Label ID="lbOfficePhone" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 60pt">
                                姓名
                            </td>
                            <td style="width: 96pt">
                                <asp:Label ID="lbPersonnelName" runat="server"></asp:Label>
                            </td>
                            <td style="width: 60pt">
                                职务
                            </td>
                            <td style="width: 96pt">
                                <asp:Label ID="lbPosition" runat="server"></asp:Label>
                            </td>
                            <td style="width: 60pt">
                                部门
                            </td>
                            <td style="width: 96pt">
                                <asp:Label ID="lbOrganizationName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 60pt">
                                离职原因
                            </td>
                            <td colspan="5" style="width: 408pt; text-align: left; letter-spacing: 1pt; text-indent: 22pt">
                                <asp:Label ID="lbSeparationReason" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <div style="width: 470.0pt;">
                        <zhongsoft:LightPowerGridView ID="gvListSign" runat="server" AutoGenerateColumns="false"
                            UseDefaultDataSource="true" AllowPaging="false" DataKeyNames="SEPARATIONSIGNID"
                            OnRowDataBound="gvListSign_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="办理部门" ItemStyle-Wrap="false" ItemStyle-Width="120px">
                                    <ItemTemplate>
                                        <%#Eval("ORGUNITNAME")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="移交情况" ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <%#Eval("MEMO")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="负责人<br>签字/盖章" ItemStyle-Width="60px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSignLeader" runat="server" Width="60px" Visible="false"></asp:Label>
                                        <asp:Image ID="imgSignLeader" runat="server" Width="60px" Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="办理日期" ItemStyle-Width="70px">
                                    <ItemTemplate>
                                        <%#Eval("SIGNDATE") == DBNull.Value ? "" : DateTime.Parse(Eval("SIGNDATE").ToString()).ToString("yyyy-MM-dd")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </div>
                    <table class="kpms-this-container">
                        <tr>
                            <td style="width: 60pt">
                                备注
                            </td>
                            <td colspan="5" style="width: 408pt; text-align: left; letter-spacing: 1pt; text-indent: 22pt">
                                <asp:Label ID="lbRemark" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="print-bottoml">
                    <span style="letter-spacing: 1pt;">
                        <br />
                        说明：<br />
                        1、凡本院职工在离开本院时，须先持本清单按规定至有关部门办理交接手续。<br />
                        2、各部门领导须认真查明该同志是否有未交待清楚事宜后再签字。<br />
                        3、当事人办完手续，应将此单交人力资源部。 </span>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hisignUnits" runat="server" value="'所在部门','人力资源部','财务部','信息中心','工会','物业中心','院长工作部'" />
</asp:Content>
