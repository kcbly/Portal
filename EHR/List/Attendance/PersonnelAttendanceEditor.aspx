<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelAttendanceEditor.aspx.cs"
 MasterPageFile="~/UI/Master/ObjectEditor.Master"
 Inherits="Zhongsoft.Portal.EHR.List.Attendance.PersonnelAttendanceEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <asp:Label ID="lbUserName" runat="server" field="UserName" tablename="EHR_MonthAttendanceUserDetail"></asp:Label>
            </td>
            <td class="td-l">
                年度
            </td>
            <td class="td-r">
                <asp:Label ID="lbYear" runat="server"></asp:Label>
            </td>
            <td class="td-l">
                月度
            </td>
            <td class="td-r">
                <asp:Label ID="lbMonth" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <asp:Button ID="btnAddNew" runat="server" Text="添加考勤信息" OnClick="btnAddNew_Click" />
            </td>
        </tr>
      
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="100" Width="100%" ID="gvTest"
                    EmptyDataText="请点击添加人员" runat="server" ShowExport="false" UseDefaultDataSource="true"
                    AutoGenerateColumns="false" OnRowCommand="gvTest_RowCommand" OnRowDataBound="gvTest_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="序号">
                            <ItemStyle Width="25px" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <%# (((GridViewRow)Container).DataItemIndex + 1) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="日期">
                            <ItemTemplate>
                                <asp:Label ID="lbDay" Style="display: none;" runat="server" Text='<%#Eval("Day") %>'></asp:Label>
                                <asp:Label ID="lbYearAndMonth" runat="server" Text='<%#Eval("YearAndMonth") %>'></asp:Label>-
                                <zhongsoft:LightDropDownList runat="server" ID="ddlDay" Width="130px">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出勤情况">
                            <ItemTemplate>
                                <asp:Label ID="lbAttendanceType" Style="display: none;" runat="server" Text='<%#Eval("AttendanceType") %>'></asp:Label>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlAttendanceType" req="1">
                                <asp:ListItem Value=""></asp:ListItem>
                                 <asp:ListItem Value="迟到">迟到</asp:ListItem>
                                  <asp:ListItem Value="早退">早退</asp:ListItem>
                                   <asp:ListItem Value="旷工">旷工</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="次数或天数">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbAttendanctDetails" req="1" Width="150px"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server"  EnableTheming="false" CommandName="Del" CommandArgument='<%#Eval("AttendanceDetailID")%>'> 
                                <img id="imgEdit" alt="删除" style="CURSOR: hand" 
												onclick="if(!confirm('确认要删除此人员吗？')) return false;"
												 src="../../../Themes/Images/btn_dg_delete.gif" border="0" /></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_MonthAttendanceUserDetail" />
    <input type="hidden" runat="server" id="hiMonthAttendanceUserDetailID" field="MonthAttendanceUserDetailID"
        tablename="EHR_MonthAttendanceUserDetail" />
    <input type="hidden" runat="server" id="hiDeptId" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>