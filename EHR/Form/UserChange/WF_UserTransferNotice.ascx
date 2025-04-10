<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_UserTransferNotice.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_UserTransferNotice" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            流水号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtNOTICENO" runat="server" class="kpms-textbox" readonly="readonly"
                field="NOTICENO" tablename="EHR_USERTRANSFERNOTICE" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)"
                style="width: 70px;" />
        </td>
        <td class="td-l">
            制单日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtMakeDate" runat="server" class="kpms-textbox" style="width: 70px;"
                readonly="readonly" field="MAKEDATE" tablename="EHR_USERTRANSFERNOTICE" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)" />
        </td>
        <td class="td-l">
            经办人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFILLUSERNAME" runat="server" class="kpms-textbox"
                style="width: 70px;" readonly="readonly" field="FILLUSERNAME" tablename="EHR_USERTRANSFERNOTICE"
                activestatus="(23.汇总人事异动)(3.修改汇总人事异动)" />
            <input type="hidden" id="hiFILLUSERCODE" runat="server" field="FILLUSERCODE" tablename="EHR_USERTRANSFERNOTICE" />
            <input type="hidden" id="hiFILLUSERID" runat="server" field="FILLUSERID" tablename="EHR_USERTRANSFERNOTICE" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变动原因<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlChangeReason" runat="server" field="ChangeReason"
                tablename="EHR_USERTRANSFERNOTICE" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)" req="1">
            </zhongsoft:LightDropDownList>
            <asp:LinkButton runat="server" ID="btnNew" OnClientClick="return PersonnelItem(2)"
                Visible="false" EnableTheming="false">
                                <img alt="" src="../../Themes/Images/btn_new.gif"/><span>新建</span>
            </asp:LinkButton>
        </td>
        <td class="td-l" style="white-space: nowrap">
            <asp:RadioButtonList ID="radSTARTENDMEMO" runat="server" RepeatDirection="Horizontal"
                field="STARTENDMEMO" tablename="EHR_USERTRANSFERNOTICE" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)">
                <asp:ListItem Value="起薪时间" Text="起薪时间"></asp:ListItem>
                <asp:ListItem Value="停薪时间" Text="停薪时间"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtSALARYDATE" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="SALARYDATE" tablename="EHR_USERTRANSFERNOTICE" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变动原因<br />
            补充说明<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbCHANGEEXPLAIN" runat="server" CssClass="kpms-textarea" TextMode="MultiLine"
                EnableTheming="false" field="CHANGEEXPLAIN" tablename="EHR_USERTRANSFERNOTICE"
                Maxtext="128" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center" style="font-weight: bold">
            人事异动列表
        </td>
    </tr>
    <tr>
        <td colspan="6">
          <%--  <div class="kpms-longtable" style="width: 898px; overflow-x: scroll; border: none;">--%>
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                    AllowPaging="true" PageSize="15" AutoGenerateColumns="false" DataKeyNames="USERTRANSFERDETAILID"
                    OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" ShowExport="true"
                    OnExport="gvList_Export" ShowFooter="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="工号" ItemStyle-Wrap="false" ItemStyle-Width="50px"
                            FooterStyle-Wrap="false" FooterStyle-Width="50px">
                            <ItemTemplate>
                                <asp:Label ID="lbPersonnelCode" runat="server" Text='<%# Eval("USERCODE") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPersonnelCode" runat="server" readonly="readonly"
                                    class="kpms-textbox" style="width: 40px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名<span class='req-star'>*</span>" ItemStyle-Wrap="false"
                            ItemStyle-Width="100px" FooterStyle-Width="100px" FooterStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lbPersonnelName" runat="server" Text='<%# Eval("USERNAME") %>'>
                                </asp:Label>
                                <input type="hidden" id="hiPersonnelInfoID2" value='<%#Eval("USERID") %>' runat="server" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPersonnelName" runat="server" readonly="readonly"
                                    class="kpms-textbox" style="width: 80px" />
                                <asp:LinkButton runat="server" ID="lbtnChooseUser" CausesValidation="false" EnableTheming="false">
                        <img alt="选择" src="../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                                <input type="hidden" id="hiPersonnelInfoID" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="调出部门" ItemStyle-Width="15%" FooterStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lbOriginalDeptName" runat="server" Text='<%# Eval("OGDEPTNAME") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtOriginalDeptName" runat="server" readonly="readonly"
                                    class="kpms-textbox" />
                                <input type="hidden" id="hiOriginalDeptId" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="原岗位" ItemStyle-Width="10%" FooterStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lbOGPOSITION" runat="server" Text='<%# Eval("OGPOSITION") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtOGPOSITION" runat="server" style="width: 80px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗级" ItemStyle-Width="10%" FooterStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lbOGPOSITIONLEVEL" runat="server" Text='<%# Eval("OGPOSITIONLEVEL") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtOGPOSITIONLEVEL" runat="server" class="kpms-textbox"
                                    style="width: 70px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="调入部门" ItemStyle-Width="15%" ItemStyle-Wrap="false"
                            FooterStyle-Width="10%" FooterStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lbChangeDeptName" runat="server" Text='<%# Eval("CHANGEDEPTNAME") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtChangeDept" runat="server" class="kpms-textbox"/>
                                <asp:LinkButton runat="server" ID="lbtnChooseChangeDept" CausesValidation="false"
                                    EnableTheming="false">
                        <img alt="选择" src="../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                                <input type="hidden" id="hiChangeDeptID" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="新岗位" ItemStyle-Width="10%" FooterStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lbPOSITION" runat="server" Text='<%# Eval("POSITION") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPOSITION" runat="server" class="kpms-textbox" style="width: 80px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="岗级" ItemStyle-Width="10%" FooterStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lbPOSITIONLEVEL" runat="server" Text='<%# Eval("POSITIONLEVEL") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPOSITIONLEVEL" runat="server" class="kpms-textbox"
                                    style="width: 70px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="27px">
                            <ItemStyle HorizontalAlign="Center" />
                            <FooterStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("USERTRANSFERDETAILID") %>'
                                    EnableTheming="false">
						<img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
							src="../../Themes/Images/btn_dg_delete.gif" border="0">
                                </asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="btnSave" runat="server" CommandName="SaveData" title="保存" OnClientClick="return CheckDetailReq();"
                                    ImageUrl="../../../Themes/Images/btn_tb_save.gif"></asp:ImageButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
           <%-- </div>--%>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMEMO" runat="server" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                field="MEMO" tablename="EHR_USERTRANSFERNOTICE" maxtext="1024" activestatus="(23.汇总人事异动)(3.修改汇总人事异动)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            会知部门 <span class="req-star">*</span><br /><br />  全选<asp:CheckBox runat="server" ID="cbAllCheck" />
        </td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList ID="cbCopyDept" runat="server" RepeatDirection="Horizontal" RepeatColumns="8"
                activestatus="(23.汇总人事异动)(3.修改汇总人事异动)">
            </asp:CheckBoxList>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPersonnelchangesNotifyId" runat="server" field="USERTRANSFERNOTICEID"
    tablename="EHR_USERTRANSFERNOTICE" />
<input type="hidden" runat="server" id="hiCopyDept" field="CopyDept" tablename="EHR_USERTRANSFERNOTICE"
    value="<root></root>" />
<script type="text/javascript">
    var nameIndex = 2; //姓名列
    function initCustomerPlugin() {
        checkMaxLength();

        //全选与反全选
        $("#<%=cbAllCheck.ClientID %>").live("change", function () {
            var $deptList = $("#<%=cbCopyDept.ClientID %> input[type=checkbox]");

            if ($(this).attr("checked")) {
                for (i = 0; i < $deptList.length; i++) {
                    $($deptList[i]).attr("checked", "checked");
                }
            }
            else {
                for (i = 0; i < $deptList.length; i++) {
                    $($deptList[i]).removeAttr("checked");
                }
            }
        });
    }

    function checkForm() {
        if ($actName == '汇总人事异动' || $actName == '修改汇总人事异动') {
            if ($bizCtx.action == 3) {
                var grid = $('#<%=gvList.ClientID %>')[0];
                if (grid.rows.length < 3) {
                    alert("请填写人事异动列表!");
                    return false;
                }
                else if (grid.rows.length == 3) {
                    if (grid.rows[1].cells[1].children[0].value == "" || grid.rows[1].cells[3].children[0].value == "") {
                        alert("请填写人事异动列表!");
                        return false;
                    }
                }
            }
            if ($formAction == 0) {
                var bCopy = false;
                $("#<%=cbCopyDept.ClientID %> input[type=checkbox]").each(function () {
                    if (this.checked) {
                        bCopy = true;
                    }
                })
                if (!bCopy) {
                    alert("请选择会知部门");
                    return false;
                }
            }
        }

        return true;
    }

    //选择流动人员
    function ChooseUser(pId, pCode, pName, deptId, DeptName, Position, PositionLevel) {
        var param = new InputParamObject("s");
        var re = getUsersNew("re", param, null);

        if (re != null) {
            var id = re.buildAttrJson("o", "id");
            var grid = $('#<%=gvList.ClientID %>')[0];
            for (var i = 1; i < grid.rows.length - 2; i++) {
                if (id == grid.rows[i].cells[nameIndex].children[1].value)
                    return false;
            }

            $("#" + pId).val(re.buildAttrJson("o", "id"));
            $("#" + pName).val(re.buildAttrJson("o", "name"));
            $("#" + pCode).val(re.buildAttrJson("o", "UserCode"));
            $("#" + deptId).val(re.buildAttrJson("o", "OrgUnitId"));
            $("#" + DeptName).val(re.buildAttrJson("o", "OrgUnitName"));
            $("#" + Position).val(re.buildAttrJson("o", "PositionNames"));
            $("#" + PositionLevel).val(re.buildAttrJson("o", "PositionLevel"));
        }
        return false;
    }
    //选择现部门
    function ChooseChangeDept(deptName, deptID) {
        var param = new InputParamObject("s");
        var filter = "";
        var re = getOrgs("", param, filter);

        if (re != null) {
            $("#" + deptID).val(re.buildAttrJson("o", "id"));
            $("#" + deptName).val(re.buildAttrJson("o", "name"));
        }
        return false;
    }

    //检查明细行必填项
    function CheckDetailReq() {
        var grid = $('#<%=gvList.ClientID %>')[0];
        var gvRow = grid.rows[grid.rows.length - 2];
        var name = gvRow.cells[nameIndex].children[0].value;
        if (name == "") {
            alert("请选择流动人员！");
            return false;
        }
        return true;
    }

    //打印
    function beforePrint() {
        url = "<%=WebAppPath %>/EHR/List/UserChange/UserTransferNoticePrint.aspx?ProcessInstanceId=" + "<%=ProcessInstanceId %>&bizId=<%=BusinessObjectId %>";
        window.open(url, '_blank');
        return false;
    }

    function PersonnelItem(actionType, bizId) {
        var stringFeatures = "dialogHeight:900px; dialogWidth: 1000px;resizable: Yes; scroll:auto; status: no;";
        var url = "<%=WebAppPath %>/EHR/List/PersonnelInfoEditor.aspx?&actionType=" + actionType;
        if (actionType == "1" || actionType == "3") {
            url += "&bizId=" + bizId;
        }
        if (actionType == "2") {
            url += "&orgID=";
        }
        url += "&IsInCompany=0";
        if (window.showModalDialog(url, null, stringFeatures) == undefined) {
            return false;
        }
        return true;
    }

    function ChangeReason() {
        var type = $("#<%=ddlChangeReason.ClientID %> option:selected").text();
        if ((type == "新增" || type == "调入") && ($bizCtx.action == 3 || $bizCtx.action == 2)) {
            $('#<%=btnNew.ClientID %>').show();
        }
        else {
            $('#<%=btnNew.ClientID %>').hide();
        }
    }

</script>
