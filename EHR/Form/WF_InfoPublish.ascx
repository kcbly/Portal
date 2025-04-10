<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_InfoPublish.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.WF_InfoPublish" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            申请人
        </td>
        <td class="td-r">
            <input type="text" id="txtApplyUserName" runat="server" maxlength="32" style="width: 90px"
                readonly="readonly" class="kpms-textbox" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                field="ApplyUserName" tablename="KOAInfoPublishForm" />
            <input type="hidden" runat="server" id="hiApplyUserID" field="ApplyUserID" tablename="KOAInfoPublishForm" />
        </td>
        <td class="td-l">
            申请部门
        </td>
        <td class="td-r">
            <input type="text" runat="server" id="txtApplyDeptName" tablename="KOAInfoPublishForm"
                readonly="readonly" style="width: 120px" class="kpms-textbox" field="ApplyDeptName"
                activestatus="(23.填写申请发布信息)(23.修改申请发布信息)" />
            <input type="hidden" runat="server" id="hiApplyDeptID" field="ApplyDeptID" tablename="KOAInfoPublishForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            电话号码
        </td>
        <td class="td-r">
            <input type="text" runat="server" id="txtApplyUserPhone" tablename="KOAInfoPublishForm"
                readonly="readonly" maxlength="36" style="width: 120px" class="kpms-textbox"
                field="ApplyUserPhone" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)" />
        </td>
        <td class="td-l">
            手机号码
        </td>
        <td class="td-r">
            <input type="text" runat="server" id="txtApplyUserMobile" tablename="KOAInfoPublishForm"
                readonly="readonly" maxlength="36" style="width: 120px" class="kpms-textbox"
                field="ApplyUserMobilePhone" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)" />
        </td>
    </tr>
    <tr>
        <td class="kpms-fim-l">
            申请时间
        </td>
        <td class="kpms-fim-r">
            <input type="text" runat="server" enabletheming="false" id="txtApplyDate" tablename="KOAInfoPublishForm"
                readonly="readonly" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)" class="kpms-textbox-date"
                field="ApplyDate" />
        </td>
        <td class="kpms-fim-l">
            下拉框
        </td>
        <td class="kpms-fim-r">
            <zhongsoft:LightDropDownList ID="ddlhuah" runat="server">
            </zhongsoft:LightDropDownList>
        </td> 
    </tr>
    <tr>
        <td class="kpms-fim-l">
            发布时间<span class="req-star">*</span>
        </td>
        <td class="kpms-fim-m">
            <input type="text" runat="server" enabletheming="false" id="txtPublishDate" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                class="kpms-textbox-date" req="1" readonly="readonly" />
            <asp:TextBox runat="server" ID="tbStartHour" Text="0" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                MaxLength="2" Width="30px" Style="text-align: right"></asp:TextBox>时
            <asp:RangeValidator ID="RangeValidator4" ControlToValidate="tbStartHour" Type="Integer"
                MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="小时数应填写0到23之间的数字">*</asp:RangeValidator>
            <asp:TextBox runat="server" ID="tbStartMinute" Text="0" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                MaxLength="2" Width="30px" Style="text-align: right"></asp:TextBox>分
            <asp:RangeValidator ID="RangeValidator5" ControlToValidate="tbStartMinute" Type="Integer"
                MinimumValue="0" MaximumValue="59" runat="server" ErrorMessage="分钟数应填写0到59之间的数字">*</asp:RangeValidator>
            <input type="hidden" id="hiPublishDate" runat="server" field="PublishDate" tablename="KOAInfoPublishForm" />
        </td>
        <td class="kpms-fim-l">
            结束时间
        </td>
        <td class="kpms-fim-m">
            <input type="text" runat="server" enabletheming="false" id="txtFinishDate" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                class="kpms-textbox-date" />
            <asp:TextBox runat="server" ID="tbEndHour" Text="0" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                MaxLength="2" Width="30px" Style="text-align: right"></asp:TextBox>时
            <asp:RangeValidator ID="RangeValidator1" ControlToValidate="tbEndHour" Type="Integer"
                MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="小时数应填写0到23之间的数字">*</asp:RangeValidator>
            <asp:TextBox runat="server" ID="tbEndMinute" Text="0" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                MaxLength="2" Width="30px" Style="text-align: right"></asp:TextBox>分
            <asp:RangeValidator ID="RangeValidator2" ControlToValidate="tbEndMinute" Type="Integer"
                MinimumValue="0" MaximumValue="59" runat="server" ErrorMessage="分钟数应填写0到59之间的数字">*</asp:RangeValidator>
            <input type="hidden" id="hiFinishDate" runat="server" field="FinishDate" tablename="KOAInfoPublishForm" />
        </td>
    </tr>
    <tr>
        <td class="kpms-fim-l">
            发布类型<span class="req-star">*</span>
        </td>
        <td class="kpms-fim-r">
            <asp:DropDownList ID="ddlPublishType" runat="server" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)"
                AutoPostBack="true" field="PublishType" tablename="KOAInfoPublishForm" req="1">
            </asp:DropDownList>
        </td>
        <td class="kpms-fim-l">
            重要信息
        </td>
        <td class="kpms-fim-r">
            <asp:CheckBox runat="server" ID="cbIsImportant" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)(23.核准)"
                field="IsImportant" tablname="KOAInfoPublishForm" />
            <span id="span1" class="req-star">备注：如是重要信息，须院领导审批，请选中此项。</span>
        </td>
    </tr>
    <tr>
        <td class="kpms-fim-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="kpms-fim-m" colspan="3">
            <asp:TextBox runat="server" ID="tbTitle" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)(23.校审)"
                Field="Title" MaxLength="128" tablename="KOAInfoPublishForm" req="1"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="kpms-fim-l">
            发布内容<span class="req-star">*</span>
        </td>
        <td class="kpms-fim-m" colspan="3">
            <asp:TextBox runat="server" ID="tbPublishContent" activestatus="(23.填写申请发布信息)(23.修改申请发布信息)(23.校审)"
                Field="PublishContent" tablename="KOAInfoPublishForm" TextMode="MultiLine" Rows="6"
                CssClass="kpms-textarea" req="1" maxText="2048"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="kpms-fim-l">
            备注
        </td>
        <td class="kpms-fim-m" colspan="3">
            <asp:TextBox runat="server" ID="tbMemo" activestatus="(23.*)" CssClass="kpms-textarea"
                Field="Memo" tablename="KOAInfoPublishForm" TextMode="MultiLine" Rows="3" maxText="512"></asp:TextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiKOAInfoPublishFormID" runat="server" field="KOAInfoPublishFormID"
    tablename="KOAInfoPublishForm" />
<asp:ValidationSummary ID="ValidationSummary" runat="server" ShowMessageBox="true"
    Style="display: none;" ForeColor="#ffffff" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function checkForm() {

        return true;
    }
</script>
