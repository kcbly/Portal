<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SalaryAdjustmentForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.SalaryManagement.WF_SalaryAdjustmentForm" %>

<table class="tz-table">
    <tr>
        <td class="td-l">年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbAdjustedYear" runat="server" ActiveStatus="(23.发起)" Field="AdjustedYear" MaxLength="4" CssClass="kpms-textbox-money" TableName="EHR_US_SalaryAdjustment" DataType="Integer" req="1" EnableTheming="false" />
        </td>
        <td class="td-l">调整起始月份<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlAdjustedMonth" runat="server" field="AdjustedMonth" tablename="EHR_US_SalaryAdjustment" activestatus="(23.发起)" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center;">调整人员列表
            <span style="float: right">
                <asp:Button ID="btnNew" runat="server" Text="添加调整信息" OnClientClick="return addItem();" displaystatus="(23.发起)" />
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGrid"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="15" ShowExport="true" DataKeyNames="SalaryAdjustmentDetailID" AllowSorting="true" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" />
                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" />
                    <zhongsoft:LightBoundField HeaderText="来源渠道" DataField="SourceChannel" />
                    <zhongsoft:LightBoundField HeaderText="原岗位名称" DataField="OldPost" />
                    <zhongsoft:LightBoundField HeaderText="岗级" DataField="OldPostGrade" />
                    <zhongsoft:LightBoundField HeaderText="薪级" DataField="OldSalaryGrade" />
                    <zhongsoft:LightBoundField HeaderText="现岗位名称" DataField="NowPost" />
                    <zhongsoft:LightBoundField HeaderText="岗级" DataField="NewPostGrade" />
                    <zhongsoft:LightBoundField HeaderText="薪级" DataField="NewSalaryGrade" />
                    <zhongsoft:LightBoundField HeaderText="岗薪工资" DataField="NewWages" />
                    <zhongsoft:LightBoundField HeaderText="预发奖金" DataField="AdvanceBonus" />
                    <zhongsoft:LightBoundField HeaderText="调整理由和依据" DataField="ReasonsAndBasis" ShowToolTip="true" />
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="viewItem" DataParamFields="SalaryAdjustmentDetailID">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="editItem" DataParamFields="SalaryAdjustmentDetailID" Visible="false">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？" Visible="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="Memo" tablename="EHR_US_SalaryAdjustment" Activestatus="(23.发起)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" id="hiSalaryAdjustmentID" runat="server" field="SalaryAdjustmentID" tablename="EHR_US_SalaryAdjustment" />
<input type="hidden" id="hiCreateUserId" runat="server" field="CreateUserId" tablename="EHR_US_SalaryAdjustment" />
<input type="hidden" id="hiCreateDate" runat="server" field="CreateDate" tablename="EHR_US_SalaryAdjustment" />
<asp:LinkButton ID="lkbReBindGrid" runat="server" OnClick="lkbReBindGrid_Click" Style="display: none"></asp:LinkButton>
<script type="text/javascript"> 

    function addItem() {
        var url = buildQueryUrl("/EHR/List/SalaryManagement/SalaryAdjustmentDetail.aspx", { actionType: 2, SalaryAdjustmentID: $("#<%=hiSalaryAdjustmentID.ClientID%>").val() });
        showDivDialog(url, "", 800, 500, callback);
        return false;
    }

    function viewItem(bizId) {
        var url = buildQueryUrl("/EHR/List/SalaryManagement/SalaryAdjustmentDetail.aspx", { actionType: 1, bizid: bizId });
        showDivDialog(url, "", 800, 500, null);
        return false;
    }

    function editItem(bizId) {
        var url = buildQueryUrl("/EHR/List/SalaryManagement/SalaryAdjustmentDetail.aspx", { actionType: 3, bizid: bizId });
        showDivDialog(url, "", 800, 500, callback);
        return false;
    }

    function callback() {
        $("#<%=lkbReBindGrid.ClientID%>")[0].click();
    }

</script>
