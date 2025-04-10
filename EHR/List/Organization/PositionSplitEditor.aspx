<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="岗位分离" CodeBehind="PositionSplitEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.PositionSplitEditor" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="BusinessObjectHolder">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                分离岗位名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSplitName" runat="server" readonly="readonly" class="kpms-textbox-short"
                    field="PositionName" tablename="EHR_Position" activestatus="(23.*)" req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiSplitId" runat="server" field="PositionID" tablename="EHR_Position" />
                <asp:ImageButton runat="server" ID="btnSplit" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseSplitPosition();" CausesValidation="False"
                    DisplayStatus="(23.*)" OnClick="btnSplit_Click" />
            </td>
            <td class="td-l">
                分离岗位编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSplitCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PositionCode" tablename="EHR_Position" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                分离岗位类型
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiRoleId" field="RoleId" tablename="EHR_Position" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtRoleName" readonly="readonly" class="kpms-textbox"
                    field="RoleName" tablename="EHR_Position" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                分离岗位职级
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbPostLevel" readonly="readonly" class="kpms-textbox"
                    field="POSITIONLEVEL" tablename="EHR_Position" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right" class="td-m" colspan="4">
                <asp:Label ID="lblNum" runat="server" Text="新增岗位条数："></asp:Label>
                <asp:TextBox ID="tbNumber" runat="server" Width="50px">2</asp:TextBox>
                <asp:Button ID="btnAddNewRow" runat="server" Text="确认新增" 
                    OnClick="btnAddNewRow_Click" displaystatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="td-m" colspan="4">
                <h3>
                    分离后岗位列表</h3>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" DataKeyNames="PositionID" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="序号">
                            <ItemTemplate>
                                <%#Container.DisplayIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗位编号<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiPositionID" value='<%#Eval("PositionID") %>' />
                                <zhongsoft:LightTextBox ID="tbCode" runat="server" Text='<%#Eval("PositionCode") %>' req="1"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗位名称<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbName" runat="server" Text='<%#Eval("PositionName") %>' req="1">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗位类型<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiRoleId" value='<%#Eval("RoleId") %>' />
                                <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationID") %>' />
                                <zhongsoft:XHtmlInputText runat="server" ID="txtRoleName" readonly="readonly" class="kpms-textbox-short"
                                    value='<%#Eval("RoleName") %>' req="1" />
                                <asp:ImageButton runat="server" ID="btnRole" ImageUrl="~/Themes/Images/btn_select.gif"
                                    ToolTip="选择" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗位职级">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlPostLevel" runat="server">
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hiPostLevel" value='<%#Eval("POSITIONLEVEL") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="确定要删除该岗位吗？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiUndoTime" field="UNDODATE" tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"  tablename="EHR_Position" />
    <script type="text/javascript">
       
        function ChooseSplitPosition() {
            var param = new InputParamObject("s");
            var re = getPosition("re", param, null);
            if (re != null) {
                var id = re.buildAttrJson("o", "id");
                if (id != '') {
                    $("#<%=hiSplitId.ClientID %>").val(re.buildAttrJson("o", "id"));
                    $("#<%=tbSplitName.ClientID %>").val(re.buildAttrJson("o", "name"));
                    $("#<%=tbSplitCode.ClientID %>").val(re.buildAttrJson("o", "att2"));
                    return true;
                }
                else {
                    $("#<%=hiSplitId.ClientID %>").val('');
                    $("#<%=tbSplitName.ClientID %>").val('');
                    $("#<%=tbSplitCode.ClientID %>").val('');
                }
            }
            return false;
        }
        //选择流程角色
        function ChoosePositionRole(hiRoleId, txtRoleName, hiOrganizationID) {
            var param = new InputParamObject("s");
            var re = getRoles("re", param, null);
            if (re != null) {
                $("#" + hiRoleId).val(re.buildAttrJson("o", "id"));
                $("#" + txtRoleName).val(re.buildAttrJson("o", "name"));
                $("#" + hiOrganizationID).val(re.buildAttrJson("o", "att4"));
            }
            return false;
        }
    </script>
</asp:Content>
