<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="UserTransferNoticePrint.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.UserTransferNoticePrint" %>

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
                <div class="print-maintitle" style="text-align: center">
                    <asp:Label ID="Label1" runat="server">职工流动通知单</asp:Label>
                </div>
                <div class="print-sedtitle" style="text-align: right; margin-right: 20pt">
                    人资<asp:Label ID="lbNoticeNo" runat="server"></asp:Label>号
                </div>
                <div class="print-sedtitle" style="text-align: left; text-indent: 20pt;">
                    因
                    <asp:Label ID="lbChangeReason" runat="server" Width="120px">
                    </asp:Label>
                    <asp:Label ID="lbCHANGEEXPLAIN" runat="server"></asp:Label>
                </div>
                <br />
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                    AutoGenerateColumns="false" DataKeyNames="USERTRANSFERDETAILID" ShowFooter="true"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="工号" ItemStyle-Wrap="false" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <%#Eval("USERCODE")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" ItemStyle-Wrap="false" ItemStyle-Width="70px">
                            <ItemTemplate>
                                <%#Eval("USERNAME")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="调出部门" ItemStyle-Width="180px">
                            <ItemTemplate>
                                <%#Eval("OGDEPTNAME")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="原岗位" ItemStyle-Wrap="false" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#Eval("OGPOSITION")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗级" ItemStyle-Wrap="false" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#Eval("OGPOSITIONLEVEL")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="调入部门" ItemStyle-Width="180px">
                            <ItemTemplate>
                                <%#Eval("CHANGEDEPTNAME")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="新岗位" ItemStyle-Wrap="false" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#Eval("POSITION")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗级" ItemStyle-Wrap="false" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <%#Eval("POSITIONLEVEL")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
                <br />
                <div class="print-bottoml" style="text-indent: 20pt; font-size: 14px">
                    <asp:Label ID="lbSTARTENDMEMO" runat="server"></asp:Label>：<asp:Label ID="lbSALARYDATE"
                        runat="server"></asp:Label>
                </div>
                <div class="print-bottoml" style="text-indent: 20pt; font-size: 14px">
                    经&nbsp;办&nbsp;人：<asp:Image ID="imgMaker" runat="server" Width="60px" Visible="false" />
                    <asp:Label ID="lbMaker" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="print-bottoml" style="text-indent: 20pt; text-align: right; font-size: 14px;
                    margin-right: 20pt">
                    人力资源部
                    <br />
                    <asp:Label ID="lbMakeDate" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
