<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="AssetInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Other.AssetInfoEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">设备编号<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtEquNumber" TableName="KMS_Other_AssetInfo" Field="EquNumber" runat="server" ActiveStatus="(23.*)" req="1" Width="280px" />
            </td>
            <td class="td-l">设备名称<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtEquName" TableName="KMS_Other_AssetInfo" Field="EquName" runat="server" ActiveStatus="(23.*)" req="1" Width="280px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAssetType" TableName="KMS_Other_AssetInfo" Field="AssetType" ActiveStatus="(23.*)" req="1"
                    runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiAssetTypeText" field="AssetTypeText" tablename="KMS_Other_AssetInfo" />
            </td>
            <td class="td-l">购置日期<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPurchaseDate" TableName="KMS_Other_AssetInfo" Field="PurchaseDate" ActiveStatus="(23.*)" class="kpms-textbox-date" runat="server" readonly="readonly" req="1"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">使用部门</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="UseDepName" PageHeight="650px"
                    SelectPageMode="Dialog" tablename="KMS_Other_AssetInfo" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiDeptId" field="UseDepId" tablename="KMS_Other_AssetInfo" />
            </td>
            <td class="td-l">使用人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUseName" PageHeight="650px"
                    SelectPageMode="Dialog" activestatus="(23.*)" Field="UseName" tablename="KMS_Other_AssetInfo"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                    ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                    IsMutiple="false" ResultForControls="{'hiUseId':'id','hiUseLoginId':'LoginId'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUseId" field="UseId" tablename="KMS_Other_AssetInfo" />
                <input type="hidden" runat="server" id="hiUseLoginId" field="UseLoginId" tablename="KMS_Other_AssetInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">品牌型号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtBrandType" TableName="KMS_Other_AssetInfo" Field="BrandType" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">资产原值（元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtAssetValue" TableName="KMS_Other_AssetInfo" Field="AssetValue" ActiveStatus="(23.*)" 
                    runat="server" Width="180px" CssClass="kpms-textbox-money" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="资产原值（元）应为正整数（两位小数）"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">生产厂家</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtManufacturer" TableName="KMS_Other_AssetInfo" Field="Manufacturer" ActiveStatus="(23.*)" runat="server" Width="180px" />
            </td>
            <td class="td-l">生产日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProductionDate" TableName="KMS_Other_AssetInfo" Field="ProductionDate" ActiveStatus="(23.*)" class="kpms-textbox-date" runat="server" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">主要参数</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtMainParameter" TableName="KMS_Other_AssetInfo" Field="MainParameter" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">主要配件</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtPrimaryAttachments" TableName="KMS_Other_AssetInfo" Field="PrimaryAttachments" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
        <tr>
            <td class="td-l">折旧年限（年）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtDepreciationYear" TableName="KMS_Other_AssetInfo" Field="DepreciationYear" ActiveStatus="(23.*)" 
                    runat="server" Width="180px" CssClass="kpms-textbox-money" regex="^[0-9]+(\.[0-9]{2})?$" errmsg="折旧年限（年）应为正整数（两位小数）"/>
            </td>
            <td class="td-l">状态<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAssetStatus" TableName="KMS_Other_AssetInfo" Field="AssetStatus" ActiveStatus="(23.*)" req="1"
                    runat="server" Width="128px" />
                <input type="hidden" runat="server" id="hiAssetStatusText" field="AssetStatusText" tablename="KMS_Other_AssetInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_AssetInfo" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Other_AssetInfo" field="AssetInfoId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
