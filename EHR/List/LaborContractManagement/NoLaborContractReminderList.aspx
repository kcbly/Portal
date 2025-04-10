<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoLaborContractReminderList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.NoLaborContractReminderList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
                <span class="filter-block"><span><zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                    RepeatColumns="3" RepeatDirection="Horizontal" />
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                        <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                            RepeatDirection="Horizontal" />
                    </ContentTemplate>
                </asp:UpdatePanel></span></span> 
                <span class="filter-block"><span class="filter-block-lb">登录号/名称/简拼</span><span>
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-search"  EnableTheming="false" runat="server" Width="120px">
                </zhongsoft:LightTextBox></span></span> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        OnRowCommand="gvList_RowCommand" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid"
        UseDefaultDataSource="true" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="UserId"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="UserCode" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" SortExpression="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex" SortExpression="Sex">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" SortExpression="Birthday"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年龄" DataField="Age" SortExpression="Age" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="OrgUnitName" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="从事专业" DataField="SPECIALTY" SortExpression="SPECIALTY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="职务" DataField="UserRank" SortExpression="UserRank">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="职称" DataField="USERGRADE" SortExpression="USERGRADE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="政治面貌" DataField="PoliticalLandscape" SortExpression="PoliticalLandscape">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="文化程度" DataField="Degree" SortExpression="Degree">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="办公电话" DataField="Phone" SortExpression="Phone">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="手机号码" DataField="MobilePhone" SortExpression="MobilePhone">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="Email" DataField="Email" SortExpression="Email">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        

    </script>
</asp:Content>
