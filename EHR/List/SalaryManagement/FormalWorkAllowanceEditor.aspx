<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkAllowanceEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkAllowanceEditor"
    Title="正式职工补贴编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                年<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" field="YEAR" tablename="EHR_FORMALWORKALLOWANCE"
                    activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                月<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth" req="1" field="MONTH" tablename="EHR_FORMALWORKALLOWANCE"
                    activestatus="(2.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUserCode" class="kpms-textbox" field="USERCODE"
                    tablename="EHR_FORMALWORKALLOWANCE" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" field="USERNAME" tablename="EHR_FORMALWORKALLOWANCE"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false"
                    Filter="{FormalOrExternal:'1'}" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUserId':'id','txtUserCode':'UserCode','tbUserName':'UserName','hiDeptId':'OrgUnitId','hiDeptCode':'OrgUnitCode','txtDeptName':'OrgUnitName','txtSex':'Sex'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="lbtnChooseUser_Click">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_FORMALWORKALLOWANCE" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_FORMALWORKALLOWANCE" />
                <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_FORMALWORKALLOWANCE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSex" class="kpms-textbox" field="SEX"
                    tablename="EHR_FORMALWORKALLOWANCE" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                部室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" class="kpms-textbox" field="DEPTNAME"
                    tablename="EHR_FORMALWORKALLOWANCE" activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center" style="font-weight: bold; font-size: medium">
                补贴列表
            </td>
        </tr>
        <tr>
            <td align="right" colspan="4" runat="server" activestatus="(23.*)">
                <asp:LinkButton runat="server" ID="btn_Add" EnableTheming="false" CssClass="subtoolbarlink"
                    OnClick="btnAdd_Click" OnClientClick="return addList();">
                <span>添加</span>
                </asp:LinkButton>
                <zhongsoft:LightTextBox ID="tbNum" runat="server" Text="3" MaxLength="2" regex="^[1-9]{1}$"
                    Style="text-align: right" errmsg="请输入正确的行数" Width="30px"></zhongsoft:LightTextBox>
                <label id="lb" runat="server">
                    行</label>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                            RowStyle-HorizontalAlign="Center" ShowFooter="true" AutoGenerateColumns="False"
                            OnRowCommand="gvList_RowCommand" PageSize="10" OnRowDataBound="gvList_RowDataBound"
                            activestatus="(23.*)" ShowHeaderWhenEmpty="true" PermissionStatus="true">
                            <Columns>
                                <asp:TemplateField HeaderText="序号">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="补贴内容" ItemStyle-Width="30%">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList runat="server" ID="ddlAllowanceContent" req="1" activestatus="(23.*)" />
                                        <input type="hidden" id="hiContent" value='<%#Eval("ALLOWANCECONTENT") %>' runat="server" />
                                        <input type="hidden" runat="server" id="hiId" value='<%#Eval("ALLOWANCELISTID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="补贴金额" ItemStyle-Width="30%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="tbAllowanceAmount" CssClass="kpms-textbox-money"
                                            EnableTheming="false" req="1" regex="^(-)?(([1-9]\d{0,9})|0)(\.\d{1,2})?$" OnTextChanged="CalculateSum"
                                            AutoPostBack="true" errmsg="请输入正确的金额" activestatus="(23.*)" Text='<%#Eval("ALLOWANCEAMOUNT")%>'>
                                        </zhongsoft:LightTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="是否扣税" ItemStyle-Width="30%">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList runat="server" ID="ddlTax" activestatus="(23.*)" />
                                        <input type="hidden" id="hiTax" value='<%#Eval("ISNEEDTAX") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" HeaderStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                            OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("ALLOWANCELISTID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxLength="512" EnableTheming="false"
                    ActiveStatus="(23.*)" CssClass="kpms-textarea" TextMode="MultiLine" field="MEMO"
                    Width="93%" tablename="EHR_FORMALWORKALLOWANCE">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="8" align="center">
                <span class="req-star" style="font-size: medium">注意：金额填写时，小数点后最多两位，小数点前最多十位</span>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFormalWorkAllowanceId" field="FORMALWORKALLOWANCEID"
        tablename="EHR_FORMALWORKALLOWANCE" />
    <input type="hidden" runat="server" id="hiSumAmount" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function addList() {
            if ("<%=ActionType%>" == "Create") {
                window.alert('请先保存后再添加补贴列表！');
                return false;
            }
        }
    </script>
</asp:Content>
