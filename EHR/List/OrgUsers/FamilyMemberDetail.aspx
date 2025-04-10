<%@ Page Language="C#" Title="家庭成员" AutoEventWireup="true" CodeBehind="FamilyMemberDetail.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FamilyMemberDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">登录号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserCode"
                    Activestatus="(23.*)" DoCancel="true" req="1" ResultAttr="UserCode" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserName':'name'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="tbUserCode_Click" />
                <input type="hidden" id="hiUserId" runat="server" />
            </td>
            <td class="td-l">姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4">
                <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click" OnClientClick="return checkUser();">
                    <span>添加家庭成员</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-r" colspan="4">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" ShowPageSizeChange="true" DataKeyNames="FAMILYMEMBERID" UseDefaultDataSource="true" ShowExport="true" BindGridViewMethod="BindDataGrid" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="成员姓名">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbFamilyMemberName" req="1" MaxLength="20" class="kpms-textbox" Text='<%# Eval("MEMBERNAME") %>'></zhongsoft:LightTextBox>

                                <input type="hidden" runat="server" id="hiPersonnelInfoID" value='<%#Eval("USERID") %>' />
                                <input type="hidden" runat="server" id="hiFamilyMemberID" value='<%#Eval("FamilyMemberID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="成员类型">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlRelationship" runat="server" req="1">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="出生日期">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtBirthday" class="kpms-textbox-date" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="性别<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlSex" runat="server" req="1">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="工作单位">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkUnit" MaxLength="128" class="kpms-textbox" Text='<%#Eval("WORKCORP") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="联系方式">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbTelPhone" MaxLength="64" class="kpms-textbox" Text='<%#Eval("PHONE") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbRemark" MaxLength="64" class="kpms-textbox" Text='<%#Eval("MEMO") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function checkUser() {
            if ($("#<%=hiUserId.ClientID%>").val() == "") {
                alert("请选择人员");
                return false;
            } else {
                return true;
            }
        }

    </script>

</asp:Content>
