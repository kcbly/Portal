<%@ Page Title="院车队汽车运输价格表编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarTypePriceEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarTypePriceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%"> 
        <tr>
            <td class="td-l">车辆类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlCarType" TableName="KMS_Car_CarTypePrice" Field="CarType" ActiveStatus="(23.*)"   req="1" runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiCarTypeText" field="CarTypeText" tablename="KMS_Car_CarTypePrice" />
            </td> 
        </tr>
        <tr>
            <td class="td-l">元/公里<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtOutlineSize" TableName="KMS_Car_CarTypePrice" Field="CarPrice" ActiveStatus="(23.*)" DataType="Decimal2" runat="server" Width="180px" />
            </td> 
        </tr> 
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r"  >
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Car_CarTypePrice" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Car_CarTypePrice" field="CarTypePriceId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>

