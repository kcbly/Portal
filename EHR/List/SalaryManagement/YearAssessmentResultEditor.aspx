<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearAssessmentResultEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.YearAssessmentResultEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                考核年度
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAssessmentYear" runat="server" CssClass="kpms-ddl" activestatus="(23.*)"
                    Field="AssessmentYear" TableName="EHR_YearAssessmentResult" req="1" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-m" align="center" colspan="6">
                考核人员列表
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" ShowExport="true" PageSize="200"
                    AllowPaging="true" AutoGenerateColumns="false" DataKeyNames="YearAssessmentResultID"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门" ItemStyle-Width="150px" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" ID="txtDeptName" class="kpms-textbox" runat="server"
                                    readonly="readonly" value='<%#Eval("DeptName") %>' maxlength="64" />
                                <input type="hidden" runat="server" id="hiYearAssResultDetailID" value='<%#Eval("YearAssResultDetailID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" ID="txtUserName" runat="server" maxlength="32"
                                    class="kpms-textbox" readonly="readonly" value='<%#Eval("UserName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="考核结果" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlResult" runat="server" Width="60px" req="1" activestatus="(23.*)">
                                <asp:ListItem Value="不评等次">不评等次</asp:ListItem>
                                    <asp:ListItem Value="优秀">优秀</asp:ListItem>
                                    <asp:ListItem Value="合格">合格</asp:ListItem>
                                    <asp:ListItem Value="基本合格">基本合格</asp:ListItem>
                                    <asp:ListItem Value="不合格">不合格</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hiResult" value='<%#Eval("Result") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" ID="txtMemo" runat="server" maxlength="1000" activestatus="(23.*)"
                                    class="kpms-textbox" value='<%#Eval("Memo") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiYearAssessmentResultID" field="YearAssessmentResultID"
        tablename="EHR_YearAssessmentResult" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
