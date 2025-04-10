<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StaffTransferTrace.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_StaffTransferTrace" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            工号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtUserCode" readonly="readonly" class="kpms-textbox"
                field="USERCODE" tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)" />
        </td>
        <td class="td-l">
            姓名<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" field="USERNAME"
                tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" SelectPageMode="Dialog"
                ResultAttr="name" EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode"
                ResultForControls="{'hiPersonnelInfoID':'id','txtUserCode':'UserCode','hiOrganizationID':'OrgUnitId','txtOrganizationName':'OrgUnitName','hiOrganizationCode':'OrgUnitCode','txtMobilePhone':'MobilePhone'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1" OnClick="txtPersonnelName_Click">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID" tablename="EHR_USERTRANSFERTRACE" />
            <%--<input type="hidden" runat="server" id="hiPersonnelCode" field="USERCODE" tablename="EHR_USERTRANSFERTRACE" />--%>
        </td>
        <td class="td-l">
            变动原因<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="radTransferReason" runat="server" RepeatDirection="Horizontal"
                req="1" AutoPostBack="true" field="CHANGEREASON" tablename="EHR_USERTRANSFERTRACE"
                activestatus="(23.填写流动人员信息跟踪表)" OnSelectedIndexChanged="radTransferReason_SelectedIndexChanged">
                <asp:ListItem Text="调入" Value="调入"></asp:ListItem>
                <asp:ListItem Text="调出" Value="调出"></asp:ListItem>
                <asp:ListItem Text="离职(含死亡)" Value="离职(含死亡)"></asp:ListItem>
                <asp:ListItem Text="退休" Value="退休"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtOrganizationName" readonly="readonly"
                class="kpms-textbox" field="DEPTNAME" tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)" />
            <input type="hidden" id="hiOrganizationID" runat="server" field="DEPTID" tablename="EHR_USERTRANSFERTRACE" />
            <input type="hidden" id="hiOrganizationCode" runat="server" />
        </td>
         <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMobilePhone" readonly="readonly"
                class="kpms-textbox" field="MobilePhone" tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)" />
            
        </td>
        <td class="td-l">
            办理日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtDealDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="DEALDATE" tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            调入（出）单位名称
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOutUnit" runat="server" MaxLength="128" field="CHANGECORP"
               style="Width:280px"  tablename="EHR_USERTRANSFERTRACE" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m" colspan="4" height="25" style="font-weight: bold; text-align: center">
            跟踪事项
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.填写流动人员信息跟踪表)(23.修改流动人员信息跟踪表)">
        <td colspan="6" align="right">
            <asp:Button ID="btnAdd" runat="server" Text="选择跟踪事项" OnClick="btnAdd_Click" OnClientClick="return selTraceItem();" />
            <input type="hidden" id="hiAddItems" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                PermissionStatus="true" AutoGenerateColumns="false" AllowPaging="true" PageSize="1000"
                DataKeyNames="USERTRANSFERITEMID" OnRowDataBound="gvList_RowDataBound" ShowExport="true"
                OnExport="gvList_Export" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="需办理事项">
                        <ItemTemplate>
                            <%#Eval("ItemContent")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="管理部门">
                        <ItemTemplate>
                            <%#Eval("MGRDEPTNAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="办理事项内容">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbDealItemConfirm" runat="server" MaxLength="32" Text='<%#Eval("ITEMCONFIRM")%>'
                                activestatus="(23.指派事项负责人)" class="kpms-textbox"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="办理日期" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtDealDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                                activestatus="(23.指派事项负责人)" Value=' <%# Eval("DEALDATE") == DBNull.Value ? "" : string.IsNullOrEmpty(Eval("DEALDATE").ToString()) ? "" : DateTime.Parse(Eval("DEALDATE").ToString()).ToString("yyyy-MM-dd")%>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="指定责任人">
                        <ItemTemplate>
                            <table cellpadding='0' cellspacing='0' width="100%">
                                <tr>
                                    <td>
                                        <zhongsoft:XHtmlInputText ID="tbResponerName" runat="server" class="kpms-textbox"
                                            activestatus="(23.指派事项负责人)" Value='<%#Eval("RESPONSERNAME") %>' readonly="readonly">
                                        </zhongsoft:XHtmlInputText>
                                    </td>
                                    <td valign='middle' style='width: 19px; padding-left: 0px'>
                                        <asp:LinkButton runat="server" ID="ibtnSelectPersonnel" CausesValidation="false"
                                            displaystatus="(23.指派事项负责人)" EnableTheming="false" Style="height: 18px; width: 20px;
                                            padding: 0px" CssClass="btn-look-up">
                        <img alt="选择" src="../../Themes/Images/look-up.gif" style="cursor:hand; border:0" />
                                        </asp:LinkButton>
                                        <input type="hidden" id="hiResponerCode" runat="server" />
                                        <input type="hidden" id="hiResponerID" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="完成情况">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbToDealItemConfirm" runat="server" MaxLength="32" Text='<%#Eval("TOITEMCONFIRM")%>'
                                activestatus="(3.负责人确认办理事项)">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="备注">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"  
                                Text='<%#Eval("MEMO") %>' Maxtext="256" TextMode="MultiLine" activestatus="(3.负责人确认办理事项)"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="27px">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" CommandArgument='<%# Container.DataItemIndex %>'
                                displaystatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)" activestatus="(23.填写流动人员信息跟踪表)(3.修改流动人员信息跟踪表)"
                                EnableTheming="false">
						<img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
							src="../../Themes/Images/btn_dg_delete.gif" border="0">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiStaffTransferTraceID" runat="server" field="USERTRANSFERTRACEID"
    tablename="EHR_USERTRANSFERTRACE" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function filterPerson() {
        return "{OrganizationOfficialCode:'<%=OrgUnitCode %>'}";
    }

    function selTraceItem() {
        var param = new InputParamObject("m");
        getDivTraceItem("<%=hiAddItems.ClientID %>", param, null,afterSelTraceCallBack);
        return false;
    }

    function afterSelTraceCallBack(re) {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAdd, "")%>;
    }

    var hiUserid;
    var hiUserCode;
    var hiUserName;
    function selResponser(hiID, hiCode, txtName) {
        var param = new InputParamObject("s");
        var filter = {'OrganizationOfficialCode':'<%=OrgUnitCode %>'};
        hiUserid = hiID;
        hiUserCode = hiCode;
        hiUserName = txtName;
        getDivUsersNew("", param, filter, callbackFuction);
        return false;
    }

    function callbackFuction(re) {

        if (null != re) {

            $("#" + hiUserid).val(re.buildAttrJson("o", "id"));
            $("#" + hiUserCode).val(re.buildAttrJson("o", "UserCode"));
            $("#" + hiUserName).val(re.buildAttrJson("o", "name"));
        }
        else {
            $("#" + hiUserid).val('');
            $("#" + hiUserCode).val('');
            $("#" + hiUserName).val('');
        }

        return false;
    }

    //    function beforePrint() {
    //        url = "<%=WebAppPath %>/EHR/List/UserChange/StaffTransferTracePrint.aspx?ProcessInstanceId=" + "<%=ProcessInstanceId %>" + "&bizId=" + $('#<%=hiStaffTransferTraceID.ClientID %>').val();
    //        window.open(url, '_blank');
    //        return false;
    //    }
</script>
