<%@ Page Language="C#" AutoEventWireup="true" Title="辞职申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master" CodeBehind="ResignationApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ResignationApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门 
    </span><span>
        <zhongsoft:LightTextBox ID="tbDept" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">姓名</span><span>
        <zhongsoft:LightTextBox ID="tbUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">减员日期</span><span>
        <input type="text" id="txtDateStart" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
        -
        <input type="text" id="txtDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">离职状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlFlag" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="">请选择</asp:ListItem>
            <asp:ListItem Value="1">已办理</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">办理中</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" BindGridViewMethod="BindGrid" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" ShowExport="true" DataKeyNames="ResignationApplyID" AllowSorting="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="APPLYUSERNAME"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return DetailItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("APPLYUSERNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME" SortExpression="DEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="离职类型" DataField="QuitType" SortExpression="QuitType" />
            <zhongsoft:LightBoundField HeaderText="离职原因" DataField="CHANGEREASON" ShowToolTip="true" Width="200px" SortExpression="CHANGEREASON" />
            <zhongsoft:LightBoundField HeaderText="岗位" DataField="Position" SortExpression="Position" />
            <zhongsoft:LightBoundField HeaderText="合同期限" DataField="ContractDate" SortExpression="ContractDate" />
            <zhongsoft:LightBoundField HeaderText="流程状态" DataField="WFlag" SortExpression="WFlag" Width="50px" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" SortExpression="Memo" ShowToolTip="true" Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程页面
        function DetailItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
