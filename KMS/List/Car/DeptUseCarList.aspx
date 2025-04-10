<%@ Page Title="部门用车情况统计" MasterPageFile="~/UI/Master/ObjectList.Master" Language="C#" AutoEventWireup="true" CodeBehind="DeptUseCarList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Car.DeptUseCarList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
      <span class="filter-block"><span class="filter-block-lb">实际用车时间</span> <span>
        <zhongsoft:XHtmlInputText ID="txtStartQDDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText ID="txtEndQDDate" runat="server" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block">
        <span class="filter-block-lb">用车部门</span>
        <span>
               <zhongsoft:DropCheckBoxList runat="server" ID="dcbUseDEpt" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
        </span> 
    </span> 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="CarMainDeptId" PageSize="15"  OnRowDataBound="gvList_RowDataBound" ShowFooter="true">
        <Columns> 
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="用车部门" DataField="CarMainDeptName" />
            <zhongsoft:LightBoundField HeaderText="申请公里数" DataField="ShareKM" /> 
            <zhongsoft:LightBoundField HeaderText="费用" DataField="ShareMoney" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript"> 
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

