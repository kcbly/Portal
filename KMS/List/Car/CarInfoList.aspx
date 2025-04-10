<%@ Page Title="车辆信息台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="CarInfoList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.CarInfoList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
   <%-- <span class="filter-block">
        <span class="filter-block-lb">派车状态</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlSendCarStatus" class="kpms-ddlsearch" EnableTheming="false"
                runat="server" />
        </span>
    </span>--%>
    <%--<span class="filter-block">
        <span class="filter-block-lb">所属部门</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" />
        </span>
    </span>--%>
     <span class="filter-block">
        <span class="filter-block-lb">品牌型号</span>
        <span>
             <zhongsoft:LightTextBox ID="txtCarBrand" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">驾驶员</span>
        <span>
            <zhongsoft:LightObjectSelector runat="server" ID="txtDriverName" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" ShowAttrs="name"
                IsMutiple="false" ResultForControls="{'hiDriverInfoId':'id'}" PageUrl="~/KMS/Obsolete/DriverSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDriverInfoId" />
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">机动车号码</span>
        <span>
            <zhongsoft:LightTextBox ID="txtCarNumber" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="CarInfoId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="机动车号码" DataField="CarNumber" />
            <zhongsoft:LightBoundField HeaderText="车辆品牌" DataField="CarBrand" />
            <zhongsoft:LightBoundField HeaderText="车辆类型" DataField="CarTypeText" /><%--车辆类型--%>
            <zhongsoft:LightBoundField HeaderText="车辆型号" DataField="CarModel" />
            <zhongsoft:LightBoundField HeaderText="车身颜色" DataField="CarColour" /> 
            <zhongsoft:LightBoundField HeaderText="车辆所属" DataField="CarBelongText" /> 
            <zhongsoft:LightBoundField HeaderText="发动机号" DataField="EngineNumber" />
            <zhongsoft:LightBoundField HeaderText="车架号" DataField="CarframeNumber" />
            <zhongsoft:LightBoundField HeaderText="加油卡号" DataField="FuelCardNumber" />
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="DriverName" />
            <zhongsoft:LightBoundField HeaderText="性别" DataField="Gender" />
            <zhongsoft:LightBoundField HeaderText="执照等级" DataField="LicenseLevel" /> 
            <%--<zhongsoft:LightBoundField HeaderText="所属部门" DataField="DeptName" />
            <zhongsoft:LightBoundField HeaderText="派车状态" DataField="SendCarStatusText" />--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/Car/CarInfoEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

