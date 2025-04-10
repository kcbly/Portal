<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WorkContactForm.ascx.cs"
    Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_WorkContactForm" %>
<table id="Table1" class="tz-table" width="100%">
    <tr>
        <td></td>
        <td colspan="3"></td>
        <td class="td-l">单据号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                EnableTheming="false" tablename="KMS_Other_WorkContactForm" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿部门负责人审核)"
                runat="server" ReadOnly="true">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">发送部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSendDeptName" field="SENDDEPTNAME"
                tablename="KMS_Other_WorkContactForm" class="kpms-textbox" readonly="readonly" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿部门负责人审核)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiSendDeptId" field="SENDDEPTID" tablename="KMS_Other_WorkContactForm" />
            <input type="hidden" runat="server" id="hiSendDeptCode" field="SENDDEPTCODE" tablename="KMS_Other_WorkContactForm" />
        </td>
        <td class="td-l">发送人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSendUserName" field="SENDUSERNAME"
                tablename="KMS_Other_WorkContactForm" class="kpms-textbox" readonly="readonly" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿部门负责人审核)">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiSendUserId" field="SENDUSERID" tablename="KMS_Other_WorkContactForm" />
            <input type="hidden" runat="server" id="hiSendUserCode" field="SENDUSERCODE" tablename="KMS_Other_WorkContactForm" />
        </td>
        <td class="td-l">发送时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtSendDate" runat="server" readonly="readonly" field="SENDDATE"
                tablename="KMS_Other_WorkContactForm" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿部门负责人审核)" class="kpms-textbox-date" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>接收部门<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5" align="left">
            <asp:CheckBoxList runat="server" ID="cblDept" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)"
                RepeatColumns="5" RepeatDirection="Horizontal" req="1">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiDeptIds" field="DEPTIDS" tablename="KMS_Other_WorkContactForm" />
            <input type="hidden" runat="server" id="hiDeptNames" field="DEPTNAMES" tablename="KMS_Other_WorkContactForm" />
            <input type="hidden" runat="server" id="hiDeptXml" field="DEPTXML" tablename="KMS_Other_WorkContactForm" />
            <font color="Red" style="display:none;">备注:被选中部门的第一负责人,将在"发送至接收部门"步骤自动收到本工作联系单;<br />
                在发送至接收部门的时候,您也可以手动选择不是第一负责人的职工作为接收人之一.</font>
        </td>
    </tr>
    <tr style="display: none;">
        <td class="td-l" nowrap>重要事项
        </td>
        <td class="td-r" colspan="5">
            <input type="hidden" runat="server" id="hiYgcApproval" field="YGCAPPROVAL" tablename="KMS_Other_WorkContactForm" />
            <asp:CheckBox runat="server" ID="chkYgcApproval" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)"
                RepeatDirection="Horizontal"></asp:CheckBox><font color="Red">备注:如需院高层审批,请选中此项.</font>
            <asp:CheckBox runat="server" ID="chkYzApproval" activestatus="(3.主管领导审批)(3.拟稿部门负责人审核)" RepeatDirection="Horizontal"></asp:CheckBox><font color="Red">备注:如需院长审批,请选中此项.</font>
            <input type="hidden" runat="server" id="hiYzApproval" field="YZAPPROVAL" tablename="KMS_Other_WorkContactForm" />
        </td>

    </tr>
    <tr>
        <td class="td-l">工作单类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <input type="hidden" runat="server" id="hiWorkType" field="WORKTYPE" tablename="KMS_Other_WorkContactForm" />
            <asp:CheckBoxList ID="cblWorkType" runat="server" RepeatDirection="Horizontal" req="1"
                activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)">
            </asp:CheckBoxList>
        </td>
        <td class="td-l">完成时间<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <input type="hidden" runat="server" id="hiFinishDate" field="FINISHDATE" tablename="KMS_Other_WorkContactForm" />
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" class="kpms-textbox-wholedate"
                readonly="readonly" req="1" field="FINISHDATE" tablename="KMS_Other_WorkContactForm"
                Activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
        <td class="td-l">标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" req="1" Field="TITLE" TableName="KMS_Other_WorkContactForm"
                EnableTheming="false" MaxLength="50" CssClass="kpms-textbox" Activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">工作内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbContent" req="1" Field="CONTENT" TableName="KMS_Other_WorkContactForm"
                runat="server" EnableTheming="false" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)"
                CssClass="kpms-textarea" TextMode="MultiLine" maxtext="2000">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="txtMemo" runat="server" Field="MEMO" TableName="KMS_Other_WorkContactForm"
                EnableTheming="false" activestatus="(23.拟稿)(23.修改拟稿)(3.拟稿科室负责人审核)(3.拟稿部门负责人审核)" CssClass="kpms-textarea"
                TextMode="MultiLine" maxtext="1024">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<%--主键--%>
<input type="hidden" runat="server" id="hiWorkeContactFormId" field="WORKCONTACTFORMID"
    tablename="KMS_Other_WorkContactForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

        if ($actName == "院长批准" || $actName == "主管院领导审批") {
            //需要自动发送的步骤，调用以下方法即可
            setAutoSend();
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($("#<%=chkYzApproval.ClientID %>").is(":checked")) {
                if ($("#<%=chkYgcApproval.ClientID %>").is(":checked")) {

                } else {
                    alert(' 选中院长审批时必须同时选中主管院领导审批');
                    return false;
                }
            }
        }
        return true;
    }

</script>
