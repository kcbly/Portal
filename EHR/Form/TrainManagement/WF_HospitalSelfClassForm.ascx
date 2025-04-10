<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_HospitalSelfClassForm.ascx.cs" Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_HospitalSelfClassForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">培训班名称</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbClassName" runat="server" MaxText="50" TableName="EHR_HospitalSelfClassForm" Field="ClassName" ActiveStatus="(23.填写自办班培训申请)" />
        </td>
        <td class="td-l">编号<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbCode" runat="server" TableName="EHR_HospitalSelfClassForm" Field="Code" ActiveStatus="(23.填写自办班培训申请)" ReadOnly="true" Style="width: 70px" />
        </td>
        <td class="td-l">计划办班日期（起）<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassForm" Field="StartDate" ActiveStatus="(23.填写自办班培训申请)" req="1" />
        </td>
        <tr>
            <td class="td-l">办班部室<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbChargeDeptName" req="1" IsMutiple="false" SelectPageMode="Dialog" ResultForControls="{'hiChargeDeptID':'id'}" EnableTheming="false"
                    Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.填写自办班培训申请)" TableName="EHR_HospitalSelfClassForm" Field="ChargeDeptName" />
                <input type="hidden" id="hiChargeDeptID" name="hiChargeDeptID" runat="server" tablename="EHR_HospitalSelfClassForm" field="ChargeDeptID" />
            </td>
            <td class="td-l">培训时长（小时）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTrainingHours" runat="server" TableName="EHR_HospitalSelfClassForm" Field="TrainingHours" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训时长(正整数或2位小数)" Style="width: 70px; text-align: right" MaxText="14" />
            </td>

            <td class="td-l">计划办班日期（止）<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEndDate" runat="server" readonly="readonly" TableName="EHR_HospitalSelfClassForm" Field="EndDate" ActiveStatus="(23.填写自办班培训申请)" req="1" />
            </td>
        </tr>
    <tr>
        <td class="td-l">培训地点</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbWorkPlace" runat="server" MaxText="100" TableName="EHR_HospitalSelfClassForm" Field="WorkPlace" ActiveStatus="(23.填写自办班培训申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">预计参训人数（人）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbJoinPeopleNum" runat="server" TableName="EHR_HospitalSelfClassForm" Field="JoinPeopleNum" ActiveStatus="(23.填写自办班培训申请)" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正确的预计参训人数(正整数)" Style="width: 70px; text-align: right" />
        </td>
        <td class="td-l">授课酬金（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTeachingFee" runat="server" TableName="EHR_HospitalSelfClassForm" Field="TeachingFee" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的授课酬金(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" />
        </td>
        <td class="td-l">托外单位代培经费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOutSideFee" runat="server" TableName="EHR_HospitalSelfClassForm" Field="OutSideFee" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的托外单位代培经费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" MaxText="14" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设备及资料购置费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPurchaseCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="PurchaseCost" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的设备及资料购置费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" MaxText="14" />
        </td>
        <td class="td-l">实习培训费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="TrainCost" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的实习培训费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" />
        </td>
        <td class="td-l">业务费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbBusinessCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="BusinessCost" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的业务费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" MaxText="14" />
        </td>
    </tr>
    <tr>
        <td class="td-l">公务费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPublicCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="PublicCost" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的公务费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()"  MaxText="14" />
        </td>
        <td class="td-l">其他经费（元）</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbOtherCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="OtherCost" ActiveStatus="(23.填写自办班培训申请)" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的其他经费(正整数或2位小数)" Style="width: 70px; text-align: right" onblur="SumTotalCost()" MaxText="14" />
        </td>
        <td class="td-l">培训费合计（元）</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbTrainTotalCost" runat="server" TableName="EHR_HospitalSelfClassForm" Field="TrainTotalCost" ActiveStatus="(23.填写自办班培训申请)" readonly="readonly" class="kpms-textbox" Style="width: 70px; text-align: right" MaxText="14" />
        </td>
    </tr>
    <tr class="tdIsAgree">
        <td class="td-l">是否同意<span class="req-star">*</span></td>
        <td class="td-r" colspan="5">
            <asp:RadioButtonList ID="rdIsAgree" runat="server" RepeatDirection="Horizontal" TableName="EHR_HospitalSelfClassForm" Field="IsAgree" req="1" activestatus="(3.部门主任审核)(3.人资部主任审核)(3.主管院领导审核)"></asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">培训内容</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainContent" runat="server" TableName="EHR_HospitalSelfClassForm" Field="TrainContent" ActiveStatus="(23.填写自办班培训申请)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="512" TableName="EHR_HospitalSelfClassForm" Field="Memo" ActiveStatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiHospitalSelfClassFormID" name="hiHospitalSelfClassFormID" runat="server" tablename="EHR_HospitalSelfClassForm" field="HospitalSelfClassFormID" />
<input type="hidden" id="hiRZ" runat="server" value="w201708090000002" />
<%--角色名称--%>
<input type="hidden" id="hiRoleNameA" runat="server" value="部门负责人（正职）" />  
<input type="hidden" id="hiRoleNameB" runat="server" value="培训专责" /> 
<script type="text/javascript">
    function initCustomerPlugin() {
        if ($actName != "填写自办班培训申请") {
            $(".tdIsAgree").show();
        } else {
            $(".tdIsAgree").hide();
        }
    }
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "填写自办班培训申请") {//$actName 系统变量
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
    //计算总培训费用
    function SumTotalCost() {
        var TeachingFee = $("#<%=tbTeachingFee.ClientID%>").val();
        var OutSideFee = $("#<%=tbOutSideFee.ClientID%>").val();
        var PurchaseCost = $("#<%=tbPurchaseCost.ClientID%>").val();
        var TrainCost = $("#<%=tbTrainCost.ClientID%>").val();
        var BusinessCost = $("#<%=tbBusinessCost.ClientID%>").val();
        var PublicCost = $("#<%=tbPublicCost.ClientID%>").val();
        var tbOtherCost = $("#<%=tbOtherCost.ClientID%>").val();
        var $TrainTotalCost = $("#<%=tbTrainTotalCost.ClientID%>");
        var SumTotal = 0;
        if (TeachingFee != undefined && TeachingFee.length > 0) {
            SumTotal = accAdd(SumTotal, TeachingFee);
        }
        if (OutSideFee != undefined && OutSideFee.length > 0) {
            SumTotal = accAdd(SumTotal, OutSideFee);
        }
        if (PurchaseCost != undefined && PurchaseCost.length > 0) {
            SumTotal = accAdd(SumTotal, PurchaseCost);
        }
        if (TrainCost != undefined && TrainCost.length > 0) {
            SumTotal = accAdd(SumTotal, TrainCost);
        }
        if (BusinessCost != undefined && BusinessCost.length > 0) {
            SumTotal = accAdd(SumTotal, BusinessCost);
        }
        if (PublicCost != undefined && PublicCost.length > 0) {
            SumTotal = accAdd(SumTotal, PublicCost);
        }
        if (tbOtherCost != undefined && tbOtherCost.length > 0) {
            SumTotal = accAdd(SumTotal, tbOtherCost);
        }
        $TrainTotalCost.val(SumTotal);
    }
</script>

