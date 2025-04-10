<%@ Page Title="车辆维修记录编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarRepairEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarRepairEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">车牌号<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCarNumber" Writeable="false"     PageHeight="650px"   
                    SelectPageMode="Dialog" activestatus="(23.*)" Field="CarNumber"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiCarInfoId':'id','txtCarBrand':'CarBrand'}" PageUrl="~/KMS/Obsolete/CarSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiCarInfoId" field="CarInfoId" tablename="KMS_Car_CarRepair" />
            </td>
            <td class="td-l">品牌 </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCarBrand" TableName="KMS_Car_CarRepair"
                    Field="CarBrand" activestatus="(23.*))" class="kpms-textbox" readonly="readonly" />
            </td> 
        </tr>
          <tr>
            <td class="td-l">维修内容<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRepairContent" TableName="KMS_Car_CarRepair" Field="RepairContent" ActiveStatus="(23.*)"  req="1"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" Rows="5 " /></td>
        </tr>
        <tr>
            <td class="td-l">维修金额<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtRepairCost" TableName="KMS_Car_CarRepair" Field="RepairCost" ActiveStatus="(23.*)"  req="1"  DataType="Decimal2" runat="server" Width="80px" />
            </td>
                <td class="td-l">维修时间<span class="req-star">*</span></td>
            <td class="td-r">
               <zhongsoft:XHtmlInputText ID="txtRepairDate" TableName="KMS_Car_CarRepair" Field="RepairDate" ActiveStatus="(23.*)" req="1"
                        class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
            <tr>
            <td class="td-l">维修厂家<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtRepairCompany" TableName="KMS_Car_CarRepair" Field="RepairCompany"   req="1" ActiveStatus="(23.*)"   runat="server"   />
            </td>
                <td class="td-l">送修人</td>
            <td class="td-r">
                 <zhongsoft:LightObjectSelector runat="server" ID="txtGiveRepairUserName" SelectPageMode="Dialog" activestatus="(23.*)"     PageHeight="650px"   
                        SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false" Width="100px" field="GiveRepairUserName" tablename="KMS_Car_CarRepair"
                        ResultAttr="name" EnableTheming="false" Writeable="true"  
                        IsMutiple="false" ResultForControls="{'hiGiveRepairUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiGiveRepairUserId" field="GiveRepairUserId" tablename="KMS_Car_CarRepair" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r"  colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_CarRepair" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_CarRepair" field="CarRepairId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>

