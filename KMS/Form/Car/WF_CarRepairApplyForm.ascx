<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_CarRepairApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Car.WF_CarRepairApplyForm" %>
<div class="form-content" id="partappCar">
    <div class="form-content-t" style="align: right; cursor: pointer;" onclick="openDetail('divPartappCar')">
        <span>
            <img src="../../themes/images/ico_banliyijian.gif" />申请情况</span> <a class="rimg">
                <img src="../../themes/images/lright.png" /></a>
    </div>
    <div class="form-content-b" id="divPartappCar" width="100%">
        <table class="tz-table">
             <tr>
                <td class="td-l">单据号<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                        EnableTheming="false" tablename="KMS_Car_CarRepair" activestatus="(23.填写申请)(23.接收并送修)"
                        runat="server" ReadOnly="true">
                    </zhongsoft:LightTextBox>
                </td> 
                 <td class="td-l">车牌号<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtCarNumber" Writeable="false"
                        SelectPageMode="Dialog" activestatus="(23.填写申请)(23.接收并送修)" Field="CarNumber" req="1"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                        ResultAttr="name" EnableTheming="false" ShowAttrs="name" PageHeight="650px"
                        IsMutiple="false" ResultForControls="{'hiCarInfoId':'id'}" PageUrl="~/KMS/Obsolete/CarSelector.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiCarInfoId" field="CarInfoId" tablename="KMS_Car_CarRepair" />
                </td>
            </tr>
 <tr>
                <td class="td-l">申请事项<span class="req-star">*</span></td>
                <td>
                    <asp:CheckBoxList ID="cblApplyTypeInfo" runat="server" ActiveStatus="(23.填写申请)(23.接收并送修)"
                        RepeatDirection="Horizontal" RepeatColumns="10">
                    </asp:CheckBoxList>
                    <input type="hidden" runat="server" id="hiApplyTypeInfo" field="ApplyType" tablename="KMS_Car_CarRepair" />
                    <input type="hidden" runat="server" id="hiApplyTypeInfoText" field="ApplyTypeText" tablename="KMS_Car_CarRepair" />
                </td>
            </tr>
            <tr>
              
                <td class="td-l">迄今行驶里程（KM）</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbTotalMileage" runat="server" MaxLength="16" Field="TotalMileage"  Width="120px"
                    ActiveStatus="(23.填写申请)(23.接收并送修)" TableName="KMS_Car_CarRepair" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正整数"  CssClass="kpms-textbox-money"/>
                </td>
                <td class="td-l">预计费用（元）<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbEstimatedCosts" runat="server" MaxLength="16" Field="EstimatedCosts" req="1" Width="120px"
                    ActiveStatus="(23.填写申请)(23.接收并送修)" TableName="KMS_Car_CarRepair" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正数,最多2位小数"  CssClass="kpms-textbox-money"/>
                </td>

            </tr>
           
            <tr>
                <td class="td-l">问题描述</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="LightTextBox1" TableName="KMS_Car_CarRepair" Field="Describe" ActiveStatus="(23.填写申请)(23.接收并送修)"
                        runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
                </td>
            </tr> 
            <tr>
                <td class="td-l">申请日期<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText ID="txtApplyDate" TableName="KMS_Car_CarRepair" Field="ApplyDate" ActiveStatus="(23.填写申请)(23.接收并送修)" req="1"
                        class="kpms-textbox-date" runat="server" readonly="readonly" />
                </td>
                <td class="td-l">经手人<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtApplyUserName" SelectPageMode="Dialog" activestatus="(23.填写申请)(23.接收并送修)" PageHeight="650px"
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="ApplyUserName" tablename="KMS_Car_CarRepair"
                        ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                        IsMutiple="false" ResultForControls="{'hiApplyUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiApplyUserId" field="ApplyUserId" tablename="KMS_Car_CarRepair" />
                </td>
            </tr>
            <tr>
                <td class="td-l">备注</td>
                <td class="td-r" colspan="3">
                    <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_CarRepair" Field="Remark" ActiveStatus="(23.填写申请)(23.接收并送修)"
                        runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
                </td>
            </tr>           
        </table>
    </div>
</div>
<input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_CarRepair" field="CarRepairId" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        return true;
    }
</script>