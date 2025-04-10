<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_YearInstituteTrainPlan.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_YearInstituteTrainPlan" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(2.填写年度院培训计划表)(2.修改年度院培训计划表)"
                field="YEAR" tablename="EHR_YEARINSTTRAINPLANFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">发起部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="FILLDEPTNAME" tablename="EHR_YEARINSTTRAINPLANFORM" req="1" activestatus="(23.填写年度院培训计划表)(23.修改年度院培训计划表)" />
            <input type="hidden" id="hiDeptId" runat="server" field="FILLDEPTID" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="FILLDEPTCODE" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiUserId" runat="server" field="FILLUSERID" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiFILLUSERNAME" runat="server" field="FILLUSERNAME" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiFILLDATE" runat="server" field="FILLDATE" tablename="EHR_YEARINSTTRAINPLANFORM" />
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-r">
            <span style="float: right">
                <asp:Button ID="btnAddTrainReq" runat="server" Text="添加年度公司培训计划" displayStatus="(3.填写年度院培训计划表)(3.修改年度院培训计划表)"
                    OnClientClick="return addPlan();" />
            </span>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True" AllowSorting="true" AllowPaging="true" PageSize="10" AutoGenerateColumns="False" DataKeyNames="YEARINSTTRAINPLANDTID" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControls.BindDataGrid" OnRowDataBound="gvList_RowDataBound" ShowPageSizeChange="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="计划月份" DataField="TrainMonth">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="培训班名称" DataField="TRAINPROJECTNAME" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="培训形式" DataField="TRAININGFORM">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="培训类型" DataField="TRAININGFORM">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="需求部门" DataField="ReqDeptName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="组织部门" DataField="UNDERDEPTNAME">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="培训对象" DataField="TRAINOBJECT">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划培训<br />总人数（人）" DataField="TraingPeoples" ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划培训<br />期次（次）" DataField="NUMBEROFTRAINING" ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="每期天数（天）" DataField="OneTraingDays" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="计划总费用（元）" DataField="COSTESTIMATING" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                        DataParamFields="YEARINSTTRAINPLANDTID" EditItemClick="viewPlan">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                        DataParamFields="YEARINSTTRAINPLANDTID" EditItemClick="editPlan">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        Visible="false" DeleteText="您确定删除该记录吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiType" field="TYPE" tablename="EHR_YEARINSTTRAINPLANFORM"
    value="计划内" />
<input type="hidden" runat="server" id="hiYearInstituteTrainPlanFormId" field="YEARINSTTRAINPLANFORMID"
    tablename="EHR_YEARINSTTRAINPLANFORM" />
<asp:LinkButton ID="lkbBindGrid" runat="server" style="display:none"  OnClick="btnAddTrainReq_Click"></asp:LinkButton>
<!--人资部部门Code-->
<input type="hidden" runat="server" id="hiRZDeptCode" value="01017032" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }


    $(function () {
        $("#<%=gvList.ClientID%> > caption").css("font-size", "15px");
        $("#<%=gvList.ClientID%> > caption").css("margin-bottom", "10");
    });

    function checkForm() {
        if ($formAction == 0 && ($actName == "填写年度院培训计划表" || $actName == "修改年度院培训计划表")) {
            var grid = $("#<%=gvList.ClientID %>")[0];
            if (grid.rows.length < 3) {
                alert("请添加年度院培训计划列表！");
                $("#<%=btnAddTrainReq.ClientID%>").focus();
                return false;
            }
        }

        return true;
    }

    function addPlan() {
        var year = $("#<%=ddlYear.ClientID%>").val();
        var formId = "<%=BusinessObjectId %>";
        var url = buildQueryUrl("/EHR/List/TrainManagement/YearInstituteTrainPlanEditor.aspx", { actionType: 2, year: year, formId: formId });
        showDivDialog(url, null, 800, 500, callback);
        return false;
    }

    function editPlan(bizid) {
        var url = buildQueryUrl("/EHR/List/TrainManagement/YearInstituteTrainPlanEditor.aspx", { actionType: 3, bizid: bizid });
        showDivDialog(url, null, 800, 500, callback);
        return false;
    }

    function viewPlan(bizid) {
        var url = buildQueryUrl("/EHR/List/TrainManagement/YearInstituteTrainPlanEditor.aspx", { actionType: 1, bizid: bizid });
        showDivDialog(url, null, 800, 500, null);
        return false;
    }

    function callback() {
        $("#<%=lkbBindGrid.ClientID%>")[0].click();
    }



</script>
