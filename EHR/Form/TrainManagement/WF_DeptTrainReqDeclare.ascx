<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DeptTrainReqDeclare.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_DeptTrainReqDeclare" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(2.发起)"
                field="YEAR" tablename="EHR_DEPTTRAINREQDECLAREFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">发起人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="FILLUSERNAME"
                Width="100px" tablename="EHR_DEPTTRAINREQDECLAREFORM" req="1" activestatus="(23.发起)" />
            <input type="hidden" id="hiUserId" runat="server" field="FILLUSERID" tablename="EHR_DEPTTRAINREQDECLAREFORM" />
            <input type="hidden" id="hiUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_DEPTTRAINREQDECLAREFORM" />
        </td>
        <td class="td-l">部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="FILLDEPTNAME"
                Width="120px" tablename="EHR_DEPTTRAINREQDECLAREFORM" req="1" activestatus="(23.发起)" />
            <input type="hidden" id="hiDeptId" runat="server" field="FILLDEPTID" tablename="EHR_DEPTTRAINREQDECLAREFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="FILLDEPTCODE" tablename="EHR_DEPTTRAINREQDECLAREFORM" />
        </td>
        <td class="td-l">发起日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_DEPTTRAINREQDECLAREFORM" req="1" activestatus="(23.发起)" />
        </td>
    </tr>
    <tr showtype="bidInfo">
        <td class="td-m" colspan="8" height="25" style="font-weight: bold; text-align: center">培训需求信息
        </td>
    </tr>
    <tr>
        <td colspan="8" align="right" runat="server" displaystatus="(3.发起)">
            <asp:Button ID="btnAddTrainReq" runat="server" Text="添加培训计划" displayStatus="(3.发起)"
                OnClick="btnAddTrainReq_Click" OnClientClick="return editor('','2');" />
        </td>
    </tr>
    <tr>
        <td colspan="8">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True" AllowSorting="true" HeaderStyle-Wrap="true" AllowPaging="false" PageSize="10" AutoGenerateColumns="False" DataKeyNames="DEPTTRAINREQDECLAREDTID" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControls.BindDataGrid" OnRowDataBound="gvList_RowDataBound">
                <Columns>                    
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>                    
                    <zhongsoft:LightBoundField HeaderText="计划月份" DataField="TrainMonth"/>
                    <zhongsoft:LightBoundField HeaderText="培训班名称" DataField="TRAINPROJECTNAME"/>
                    <zhongsoft:LightBoundField HeaderText="培训形式" DataField="TRAININGFORM"/>
                    <zhongsoft:LightBoundField HeaderText="培训类型" DataField="TRAININGTYPE"/>
                    <zhongsoft:LightBoundField HeaderText="培训对象" DataField="TRAINOBJECT"/>
                    <zhongsoft:LightBoundField HeaderText="计划培训总人数（人）" DataField="TraingPeoples"/>
                    <zhongsoft:LightBoundField HeaderText="计划培训期次（次）" DataField="NUMBEROFTRAINING"/>
                    <zhongsoft:LightBoundField HeaderText="每期天数（天）" DataField="OneTraingDays"/>
                    <zhongsoft:LightBoundField HeaderText="计划总费用（元）" DataField="COSTESTIMATING"/>
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                        EditIdField="DEPTTRAINREQDECLAREDTID" EditPageWidth="900px" EditPageHeight="440px"
                        ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/DeptTrainReqDeclareEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                        Visible="false" EditIdField="DEPTTRAINREQDECLAREDTID" EditPageWidth="900px" EditPageHeight="440px"
                        ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/DeptTrainReqDeclareEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        Visible="false" ItemStyle-Width="3%" DeleteText="您确定删除该记录吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiDeptTrainReqDeclareFormId" field="DEPTTRAINREQDECLAREFORMID"
    tablename="EHR_DEPTTRAINREQDECLAREFORM" />
<input type="hidden" runat="server" id="hiPathToCheck" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //打开编辑页面
    function editor(bizId, acType) {
        var year = $("#<%=ddlYear.ClientID%>").val();
        var formId = "<%=BusinessObjectId %>";
        var stringFeatures = "dialogHeight:480px; dialogWidth: 900px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:auto; status: no;";
        var url = "";
        if (acType == "2") {
            url = "<%=WebAppPath%>/EHR/List/TrainManagement/DeptTrainReqDeclareEditor.aspx?&actionType=" + acType + "&year=" + year + "&formId=" + formId;
        }
        else {
            url = "<%=WebAppPath%>/EHR/List/TrainManagement/DeptTrainReqDeclareEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
        }

        showDivDialog(url, null, 850, 500, resetTrainList);
        return false;
    }

    function resetTrainList() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddTrainReq,"") %>

    }

    $(function () {
        $("#<%=gvList.ClientID%> > caption").css("font-size", "15px");
        $("#<%=gvList.ClientID%> > caption").css("margin-bottom", "10");
    });

    function checkForm() {
        if ($sendBtnId == "btnSend" && ($actName == "填写年度部门培训需求申报表" || $actName == "修改年度部门培训需求申报表")) {
            var grid = $("#<%=gvList.ClientID %>")[0];
             if (grid.rows.length < 3) {
                 alert("请添加培训需求列表！");
                 $("#<%=btnAddTrainReq.ClientID%>").focus();
                return false;
             }
        }
        return true;
    }


</script>
