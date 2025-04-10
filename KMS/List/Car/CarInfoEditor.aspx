<%@ Page Title="车辆信息编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarInfoEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">机动车号码<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtCarNumber" TableName="KMS_Car_CarInfo" Field="CarNumber" runat="server" ActiveStatus="(23.*)" req="1" Width="180px" />
            </td>
            <td class="td-l">车辆出厂日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtCarProductionDate" TableName="KMS_Car_CarInfo" Field="CarProductionDate" ActiveStatus="(23.*)" class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">驾驶员姓名</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDriverName" PageHeight="650px"
                    SelectPageMode="Dialog" activestatus="(23.*)" Field="DriverName"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiDriverInfoId':'id','hiGender':'GenderText','hiLicenseLevel':'LicenseLevelText'}" PageUrl="~/KMS/Obsolete/DriverSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiDriverInfoId" field="DriverInfoId" tablename="KMS_Car_CarInfo" />
                <input type="hidden" runat="server" id="hiGender" field="Gender" tablename="KMS_Car_CarInfo" />
                <input type="hidden" runat="server" id="hiLicenseLevel" field="LicenseLevel" tablename="KMS_Car_CarInfo" />
            </td>
            <td class="td-l">车身颜色</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtCarColour" TableName="KMS_Car_CarInfo" Field="CarColour" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">车辆品牌</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtCarBrand" TableName="KMS_Car_CarInfo" Field="CarBrand" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">使用性质</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtUseNature" TableName="KMS_Car_CarInfo" Field="UseNature" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">车辆类型</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCarType" TableName="KMS_Car_CarInfo" Field="CarType" ActiveStatus="(23.*)" runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiCarTypeText" field="CarTypeText" tablename="KMS_Car_CarInfo" />
                <label id="lbTypePrice" runat="server"></label>
            </td>
            <td class="td-l">车辆登记日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtCarRegisterDate" TableName="KMS_Car_CarInfo" Field="CarRegisterDate" ActiveStatus="(23.*)" class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">外廓尺寸</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtOutlineSize" TableName="KMS_Car_CarInfo" Field="OutlineSize" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <%--<td class="td-l">派车状态</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSendCarStatus" TableName="KMS_Car_CarInfo" Field="SendCarStatus" ActiveStatus="(23.*)"
                    runat="server" Width="100px" />
                <input type="hidden" runat="server" id="hiSendCarStatusText" field="SendCarStatusText" tablename="KMS_Car_CarInfo" />
            </td>--%>
        </tr>
        <tr>
            <td class="td-l">车辆型号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtCarModel" TableName="KMS_Car_CarInfo" Field="CarModel" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">车辆所属<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCarBelong" TableName="KMS_Car_CarInfo" Field="CarBelong" ActiveStatus="(23.*)" req="1"
                    runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiCarBelongText" field="CarBelongText" tablename="KMS_Car_CarInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">所属部门</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="DeptName" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Car_CarInfo" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiDeptId" field="DeptId" tablename="KMS_Car_CarInfo" />
            </td>
            <td class="td-l">发动机号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtEngineNumber" TableName="KMS_Car_CarInfo" Field="EngineNumber" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">车架号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtCarframeNumber" TableName="KMS_Car_CarInfo" Field="CarframeNumber" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">加油卡号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtFuelCardNumber" TableName="KMS_Car_CarInfo" Field="FuelCardNumber" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">台班价格（元/台班）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtClassShftPrice" TableName="KMS_Car_CarInfo" Field="ClassShftPrice" ActiveStatus="(23.*)" runat="server" Width="120px" EnableTheming="false" CssClass="kpms-textbox-money" DataType="Money6" />
            </td>
            <td class="td-l">超驶价格（元/公里）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtStartPrice" TableName="KMS_Car_CarInfo" Field="StartPrice" ActiveStatus="(23.*)" runat="server" Width="120px" EnableTheming="false" CssClass="kpms-textbox-money" DataType="Money6" />
            </td>
        </tr>
        <tr style="display:none">
            <td class="td-l">核定载客</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtVerification" TableName="KMS_Car_CarInfo" Field="VerificationNum" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">排放标准</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtStandard" TableName="KMS_Car_CarInfo" Field="SluiceStandard" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
        </tr>
        <tr style="display:none">
            <td class="td-l">制造厂商</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtMakeCompany" TableName="KMS_Car_CarInfo" Field="MakeCompany" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l"></td>
            <td class="td-r"></td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_CarInfo" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_CarInfo" field="CarInfoId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>

