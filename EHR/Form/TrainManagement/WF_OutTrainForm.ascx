<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_OutTrainForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_OutTrainForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">申请人<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbApplyUserName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiApplyUserID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.填写外训申请)" TableName="EHR_OutTrainForm" Field="ApplyUserName" />
            <input type="hidden" id="hiApplyUserID" name="hiApplyUserID" runat="server" tablename="EHR_OutTrainForm" field="ApplyUserID" />
        </td>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="tbApplyDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiApplyDeptID':'id'}" EnableTheming="false"
                Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.填写外训申请)" TableName="EHR_OutTrainForm" Field="ApplyDeptName" />
            <input type="hidden" id="hiApplyDeptID" name="hiApplyDeptID" runat="server" tablename="EHR_OutTrainForm" field="ApplyDeptID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训名称<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbTrainName" runat="server" MaxText="100" TableName="EHR_OutTrainForm" Field="TrainName" ActiveStatus="(23.填写外训申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训日期（起）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" TableName="EHR_OutTrainForm" Field="StartDate" ActiveStatus="(23.填写外训申请)" req="1" />
        </td>
        <td class="td-l">培训日期（止）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" TableName="EHR_OutTrainForm" Field="EndDate" ActiveStatus="(23.填写外训申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训地点<span class="req-star">*</span></td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbTrainPlace" runat="server" MaxText="100" TableName="EHR_OutTrainForm" Field="TrainPlace" ActiveStatus="(23.填写外训申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训内容</td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightTextBox ID="tbTrainContent" runat="server" MaxText="512" TableName="EHR_OutTrainForm" Field="TrainContent" ActiveStatus="(23.填写外训申请)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">培训组织单位<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainUnit" runat="server" MaxText="100" TableName="EHR_OutTrainForm" Field="TrainUnit" ActiveStatus="(23.填写外训申请)" req="1" />
        </td>
        <td class="td-l">培训类型</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainForm" runat="server" MaxText="50" TableName="EHR_OutTrainForm" Field="TrainForm" ActiveStatus="(23.填写外训申请)" />
        </td>
    </tr>
    <tr>
        <td colspan="4" class="td-r"  style="text-align: center; font-size: 15px; font-weight: bold">
            预算类型
        </td>
    </tr>
    <tr>
        <td class="td-l">预算支出类别</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBudgetType" runat="server" MaxText="50" TableName="EHR_OutTrainForm" Field="BudgetType" ActiveStatus="(23.填写外训申请)" />
        </td>
        <td class="td-l">培训类型</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBudgetSource" runat="server" MaxText="50" TableName="EHR_OutTrainForm" Field="BudgetSource" ActiveStatus="(23.填写外训申请)" />
        </td>
    </tr>
     <tr>
        <td class="td-l">培训费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainingFee" runat="server" MaxText="14" DataType="Money"  TableName="EHR_OutTrainForm" Field="TrainingFee" ActiveStatus="(23.填写外训申请)" EnableTheming="false" CssClass="kpms-textbox-money" onBlur="sumTrainCost();"/>
        </td>
        <td class="td-l">差旅费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTravelFee" runat="server" MaxText="14" DataType="Money"  TableName="EHR_OutTrainForm" Field="TravelFee" ActiveStatus="(23.填写外训申请)" EnableTheming="false" CssClass="kpms-textbox-money" onBlur="sumTrainCost();"/>
        </td>
    </tr>
         <tr>
        <td class="td-l">食宿费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbFoodFee" runat="server" MaxText="14" DataType="Money"  TableName="EHR_OutTrainForm" Field="FoodFee" ActiveStatus="(23.填写外训申请)" EnableTheming="false" CssClass="kpms-textbox-money" onBlur="sumTrainCost();"/>
        </td>
        <td class="td-l">其他（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOtherFee" runat="server" MaxText="14" DataType="Money"  TableName="EHR_OutTrainForm" Field="OtherFee" ActiveStatus="(23.填写外训申请)" EnableTheming="false" CssClass="kpms-textbox-money" onBlur="sumTrainCost();"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">培训费用（元）</td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTrainCost" class="kpms-textbox-money" field="TrainCost"
                readonly="readonly" tablename="EHR_OutTrainForm" activestatus="(23.填写外训申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">参训人<span class="req-star">*</span></td>
        <td class="td-r tdJoinUser" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbJoinUserName" req="1" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiJoinUserID':'id'}" EnableTheming="false"
                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.填写外训申请)" TableName="EHR_OutTrainForm" Field="JoinUserName" />
            <input type="hidden" id="hiJoinUserID" runat="server" tablename="EHR_OutTrainForm" field="JoinUserID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">计划参训人数（人）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPlanPeopleNum" runat="server" TableName="EHR_OutTrainForm" Field="PlanPeopleNum" ActiveStatus="(23.填写外训申请)" req="1" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正确的计划参训人数(正整数)" Style="width: 70px; text-align: right" />
        </td>
        <td class="td-l tdIsAgree">是否同意参训<span class="req-star">*</span></td>
        <td class="td-r tdIsAgree">
            <asp:RadioButtonList ID="rdIsAgree" runat="server" RepeatDirection="Horizontal" tablename="EHR_OutTrainForm" field="IsAgree" req="1" activestatus="(3.部门主任审核)(3.人资部主任审核)(3.分管领导审批)"></asp:RadioButtonList>
        </td>
    </tr>

    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_OutTrainForm" Field="Memo" ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiOutTrainFormID" runat="server" tablename="EHR_OutTrainForm" field="OutTrainFormID" />
<input type="hidden" id="hiCreateDate" name="hiCreateDate" runat="server" field="CreateDate"
    tablename="EHR_OutTrainForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        if ($actName != "填写外训申请") {
            $(".tdIsAgree").show();
            $(".tdJoinUser").attr("colspan", 3);
        } else {
            $(".tdIsAgree").hide();
            $(".tdJoinUser").attr("colspan", 5);
        }
    }
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "填写外训申请") {//$actName 系统变量
                var grid = $("#FormAttachmentView_dlAttachment")[0];
                if (grid == "" || grid == undefined || grid.rows.length <= 0) {
                    alert("请上传相关附件！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        return true;
    }

    function sumTrainCost() {
        var trainingFee = $("#<%=tbTrainingFee.ClientID%>").val();
        var travelFee = $("#<%=tbTravelFee.ClientID%>").val();
        var foodFee = $("#<%=tbFoodFee.ClientID%>").val();
        var otherFee = $("#<%=tbOtherFee.ClientID%>").val();
        var trainCost = 0;
        if (!isNaN(parseFloat(trainingFee))) {
            trainCost = trainCost + parseFloat(trainingFee)
        }
        if (!isNaN(parseFloat(travelFee))) {
            trainCost = trainCost + parseFloat(travelFee)
        }
        if (!isNaN(parseFloat(foodFee))) {
            trainCost = trainCost + parseFloat(foodFee)
        }
        if (!isNaN(parseFloat(otherFee))) {
            trainCost = trainCost + parseFloat(otherFee)
        }

        $("#<%=txtTrainCost.ClientID%>").val(trainCost)
    }

    tbTrainingFee
    tbTravelFee
    tbFoodFee
    tbOtherFee
    tbTrainCost
</script>
