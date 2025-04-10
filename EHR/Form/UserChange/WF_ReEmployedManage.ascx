<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReEmployedManage.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_Re_EmployedManage" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDeptName" runat="server" field="DeptName" tablename="EHR_REEMPLOYEDAPPPLY"
                class="kpms-textbox" readonly="readonly" activestatus="(23.通知各室组申报返聘需求)" />
            <input type="hidden" id="hiStartDeptID" runat="server" field="DeptID" tablename="EHR_REEMPLOYEDAPPPLY" />
            <input type="hidden" id="hiStartDeptCode" runat="server" field="DeptCode" tablename="EHR_REEMPLOYEDAPPPLY" />
        </td>
        <td class="td-l">
            发起人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartUserName" runat="server" field="FILLUSERNAME"
                tablename="EHR_REEMPLOYEDAPPPLY" class="kpms-textbox" readonly="readonly" activestatus="(23.通知各室组申报返聘需求)" />
            <input type="hidden" id="hiStartUserID" runat="server" field="FILLUSERID" tablename="EHR_REEMPLOYEDAPPPLY" />
            <input type="hidden" id="hiStartUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_REEMPLOYEDAPPPLY" />
        </td>
        <td class="td-l">
            发起日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" field="FILLDATE" tablename="EHR_REEMPLOYEDAPPPLY"
                class="kpms-textbox-date" readonly="readonly" activestatus="(23.通知各室组申报返聘需求)"
                req="1" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center; font-weight: bold" colspan="6" class="td-l">
            返聘人员
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-l">
            <div class="kpms-longtable" style="width: 898px; overflow-x: scroll; border: none;">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="1000"
                    AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="REEMPLOYEDDETAILID"
                    OnRowCommand="gvList_RowCommand" OnRowDeleting="gvList_RowDeleting" OnRowDataBound="gvList_RowDataBound"
                    ShowFooter="true" OnExport="gvList_Export" ShowExport="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSequence" Text="<%# Container.DataItemIndex + 1 %>"
                                    detailitem="1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="工号" ItemStyle-Width="50px" ItemStyle-Wrap="false"
                            FooterStyle-Width="50px">
                            <ItemTemplate>
                                <asp:Label ID="lblPersonnelCode" runat="server" Text='<%#Eval("USERCODE") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPersonnelCode" class="kpms-textbox" runat="server"
                                    style="width: 50px" readonly="readonly" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名<span class='req-star'>*</span>" ItemStyle-Width="80px"
                            ItemStyle-Wrap="false" FooterStyle-Width="80px" FooterStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblPersonnelInfoName" runat="server" Text='<%#Eval("USERNAME") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtPersonnelInfoName" class="kpms-textbox" runat="server"
                                    style="width: 80px" readonly="readonly" />
                                <input type="hidden" runat="server" id="hiPersonnelInfoID" />
                                <asp:LinkButton runat="server" ID="ibtnSelectPersonnel" CausesValidation="false"
                                    EnableTheming="false">
                        <img alt="选择" src="../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                                </asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="部门" ItemStyle-Width="150px" FooterStyle-Width="150px">
                            <ItemTemplate>
                                <asp:Label ID="lblDeptName" runat="server" Text='<%#Eval("DeptName") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtDeptName" runat="server" maxlength="32" class="kpms-textbox"
                                    readonly="readonly" style="width: 120px" value='<%#Eval("DeptName") %>' />
                                <input type="hidden" runat="server" id="hiDeptID" value='<%#Eval("DeptID") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="科室" ItemStyle-Width="150px" FooterStyle-Width="150px"
                            FooterStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblSubDeptName" runat="server" Text='<%#Eval("SubDeptName") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtSubDeptName" runat="server" maxlength="32" class="kpms-textbox"
                                    readonly="readonly" style="width: 120px" value='<%#Eval("SubDeptName") %>' />
                                <input type="hidden" runat="server" id="hiSubDeptID" value='<%#Eval("SubDeptID") %>' />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="出生年月" ItemStyle-Width="70px" ItemStyle-Wrap="false"
                            FooterStyle-Width="70px">
                            <ItemTemplate>
                                <asp:Label ID="lblBirthday" runat="server" Text='<%#Eval("Birthday","{0:yyyy-MM-dd}") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtBirthday" class="kpms-textbox" runat="server" style="width: 70px"
                                    readonly="readonly" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="年龄" ItemStyle-Width="30px" ItemStyle-Wrap="false"
                            FooterStyle-Width="30px" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <asp:Label ID="lblYearsOld" runat="server" Text='<%#Eval("Age") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtYearsOld" class="kpms-textbox-money" runat="server"
                                    style="width: 30px" readonly="readonly" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="职称" ItemStyle-Width="100px" FooterStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Label ID="lblTechnicalTitle" runat="server" Text='<%#Eval("SKILLTITLE") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText ID="txtTechnicalTitle" runat="server" class="kpms-textbox"
                                    readonly="readonly" style="width: 100px" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="返聘起始日期<span class='req-star'>*</span>" ItemStyle-Width="70px"
                            FooterStyle-Width="70px">
                            <ItemTemplate>
                                <asp:Label ID="lblReEmployedTime" runat="server" Text='<%#Eval("REEMPLOYEDSTARTDATE","{0:yyyy-MM-dd}") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText runat="server" ID="txtReEmployedTime" class="kpms-textbox-comparedate"
                                    readonly="readonly" compare="1" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="返聘终止日期<span class='req-star'>*</span>" ItemStyle-Width="70px"
                            FooterStyle-Width="70px">
                            <ItemTemplate>
                                <asp:Label ID="lblReEmployedEndTime" runat="server" Text='<%#Eval("REEMPLOYEDENDDATE","{0:yyyy-MM-dd}") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:XHtmlInputText runat="server" ID="txtReEmployedEndTime" class="kpms-textbox-comparedate"
                                    readonly="readonly" compare="1" />
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注" ItemStyle-Width="100px" FooterStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Label ID="lblRemark" runat="server" Text='<%# gvList.GetSubString(DataBinder.Eval(Container.DataItem, "MEMO"), 15)%>'
                                    ToolTip='<%#Eval("MEMO") %>'>
                                </asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbRemark" maxtext="128" TextMode="MultiLine"
                                    CssClass="kpms-textarea" EnableTheming="false" Style="width: 100px"></zhongsoft:LightTextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="30px">
                            <ItemStyle HorizontalAlign="Center" />
                            <FooterStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("REEMPLOYEDDETAILID") %>'
                                    EnableTheming="false">
						<img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("是否要删除此返聘信息？")) return false;'
							src="../../Themes/Images/btn_dg_delete.gif" border="0">
                                </asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="btnSave" runat="server" CommandName="Save" title="保存" ImageUrl="../../../Themes/Images/btn_tb_save.gif">
                                </asp:ImageButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </div>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否同意<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbIsAgree" field="ISAGREE" tablename="EHR_REEMPLOYEDAPPPLY"
                req="1" activestatus="(23.接收通知)" RepeatDirection="Horizontal">
                <asp:ListItem Text="同意" Value="1"></asp:ListItem>
                <asp:ListItem Text="不同意" Value="0"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRemark" runat="server" field="Memo" tablename="EHR_REEMPLOYEDAPPPLY"
                TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" maxtext="256"
                activestatus="(23.通知各室组申报返聘需求)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiReEmployedManageFormID" field="REEMPLOYEDAPPPLYID"
    tablename="EHR_REEMPLOYEDAPPPLY" />
<input type="hidden" id="hiRZ" runat="server" value="01017032" />
<script type="text/javascript">
    var nameIndex = 2; //姓名列
    var timeIndex = 8; //返聘开始日期列
    var endTimeIndex = 9; //返聘结束日期列
    //选择要返聘的人员信息
    function SelectPersonnelInfo(hiPersonnelInfoID, txtPersonnelCode, txtPersonnelInfoName, txtBirthday, txtYearsOld, txtTechnicalTitle) {
        var param = new InputParamObject("s");
        var reObj = getUsersNew("re", param, "{SelectReEmploye:'1'}");

        if (null != reObj) {
            var id = reObj.getAttrVal(0, "o", "id");
            var name = reObj.getAttrVal(0, "o", "name");
            var code = reObj.getAttrVal(0, "o", "UserCode");
            var birthday = reObj.getAttrVal(0, "o", "BIRTHDAY");
            var yearsold = reObj.getAttrVal(0, "o", "Age");
            var title = reObj.getAttrVal(0, "o", "SKILLTITLE");
            $("#" + hiPersonnelInfoID).val(id);
            $("#" + txtPersonnelCode).val(code);
            $("#" + txtPersonnelInfoName).val(name);
            $("#" + txtBirthday).val(birthday);
            $("#" + txtYearsOld).val(yearsold);
            $("#" + txtTechnicalTitle).val(title);
        }
        else {
            $("#" + hiPersonnelInfoID).val('');
            $("#" + txtPersonnelCode).val('');
            $("#" + txtPersonnelInfoName).val('');
            $("#" + txtBirthday).val('');
            $("#" + txtYearsOld).val('');
            $("#" + txtTechnicalTitle).val('');
        }
        return false;
    }

    function initCustomerPlugin() {
        checkMaxLength();
    }

    function checkForm() {
        if (($actName == "申报返聘需求" || $actName == "通知各室组申报返聘需求"
            || $actName == "汇总返聘需求" || $actName == "调整返聘需求")
            && ($bizCtx.action == 2 || $bizCtx.action == 3)) {
            var tbl = document.getElementById("<%=gvList.ClientID %>");
            var we = tbl.rows.length;
            var footerIndex = tbl.rows.length - 2;
            var name = tbl.rows[footerIndex].cells[nameIndex].children[0].value.trim();
            var time = tbl.rows[footerIndex].cells[timeIndex].children[0].value.trim();
            var endTime = tbl.rows[footerIndex].cells[endTimeIndex].children[0].value.trim();

            if ((name == "" || name == null) && (time != "" || endTime != "")) {
                alert('请在列表最后一行选择人员或将其必填内容清空');
                return false;
            }

            if ((time == "" || time == null) && (name != "" || endTime != "")) {
                alert('请在列表最后一行填写返聘起始日期或将其必填内容清空');
                return false;
            }
            if ((endTime == "" || endTime == null) && (name != "" || time != "")) {
                alert('请在列表最后一行填写返聘终止日期或将其必填内容清空');
                return false;
            }
        }
        return true;
    }

    function CheckValidator(pdgID) {
        var tbl = document.getElementById(pdgID);
        var we = tbl.rows.length;
        var footerIndex = tbl.rows.length - 2;
        var name = tbl.rows[footerIndex].cells[nameIndex].children[0].value.trim();
        var time = tbl.rows[footerIndex].cells[timeIndex].children[0].value.trim();
        var endTime = tbl.rows[footerIndex].cells[endTimeIndex].children[0].value.trim();

        if (name == "" || name == null) {
            alert('请选择人员');
            return false;
        }

        if (time == "" || time == null) {
            alert('请填写返聘起始日期');
            return false;
        }
        if (endTime == "" || endTime == null) {
            alert('请填写返聘终止日期');
            return false;
        }
        return true;

    }

    //选择科室
    function ChooseSubDept(organizationId, organizationName) {
        var param = new InputParamObject("s");

        var re = getEHROrg("", param, "||||" + '<%=EHROrgId %>');
        if (re != null) {
            $("#" + organizationId).val(re.buildAttrJson("o", "id"));
            $("#" + organizationName).val(re.buildAttrJson("o", "name"));
        }
        return false;
    }

    //打印
    function beforePrint() {
        url = "<%=WebAppPath %>/EHR/List/UserChange/ReEmployedManagePrint.aspx?ProcessInstanceId=" + "<%=ProcessInstanceId %>&bizId=<%=BusinessObjectId %>";
        window.open(url, '_blank');
        return false;
    }
           
</script>
