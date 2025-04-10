<%@ Page Title="工作履历台账" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="WorkExperienceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.WorkExperienceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
     <span class="filter-block">
        <span class="filter-block-lb">姓名/工号</span>
        <span>
             <zhongsoft:LightTextBox ID="ltbUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">所在部门</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbOrgUnitName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="WORKEXPERIENCEID" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" />
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" />
            <zhongsoft:LightBoundField HeaderText="所在部门" DataField="OrgUnitName" />
            <zhongsoft:LightBoundField HeaderText="单位（公司）" DataField="WORKCORP" />
            <zhongsoft:LightBoundField HeaderText="单位性质" DataField="CORPPROPERTY" /> 
            <zhongsoft:LightBoundField HeaderText="开始日期" DataField="STARTDATE" DataFormatString="{0:yyyy-MM-dd}" /> 
            <zhongsoft:LightBoundField HeaderText="结束日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="工作部门" DataField="WORKDEPT" />
            <zhongsoft:LightBoundField HeaderText="岗位" DataField="POST" />
            <zhongsoft:LightBoundField HeaderText="行业" DataField="Industry" />
            <zhongsoft:LightBoundField HeaderText="证明人" DataField="Witness" />
            <zhongsoft:LightBoundField HeaderText="证明人联系方式" DataField="WitnessInformation" /> 
            <zhongsoft:LightBoundField HeaderText="备注" DataField="MEMO" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/WorkExperienceEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

