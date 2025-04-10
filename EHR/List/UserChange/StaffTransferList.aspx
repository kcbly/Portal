<%@ Page Language="C#" AutoEventWireup="true" Title="员工内部调动审批汇总" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="StaffTransferList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.StaffTransferList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">登录号/姓名/简拼</span>
        <span>
            <zhongsoft:LightTextBox ID="tbPer" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">调出部门</span>
        <span>
            <zhongsoft:LightTextBox ID="tbOGDEPTNAME" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block"><span class="filter-block-lb">调入部门</span>
        <span>
            <zhongsoft:LightTextBox ID="tbCHANGEDEPTNAME" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        AutoGenerateColumns="false" AllowPaging="true" PageSize="15" ShowExport="true" HideFieldOnExport="查看"
        DataKeyNames="StaffTransferID" AllowSorting="true">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="USERNAME"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return DetailItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("USERNAME")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="调出部门" DataField="OGDEPTNAME" SortExpression="OGDEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="原职务" DataField="OGRANKNAME" SortExpression="OGRANKNAME" />
            <zhongsoft:LightBoundField HeaderText="岗级" DataField="OldPostGrade" SortExpression="OldPostGrade" />
            <zhongsoft:LightBoundField HeaderText="薪级" DataField="OldSalaryGrade" SortExpression="OldSalaryGrade" />
            <zhongsoft:LightBoundField HeaderText="工资额" DataField="OldWages" SortExpression="OldWages" />
            <zhongsoft:LightBoundField HeaderText="调入部门" DataField="CHANGEDEPTNAME" SortExpression="CHANGEDEPTNAME" />
            <zhongsoft:LightBoundField HeaderText="现职务" DataField="NowPost" SortExpression="NowPost" />
            <zhongsoft:LightBoundField HeaderText="岗级" DataField="NewPostGrade" SortExpression="NewPostGrade" />
            <zhongsoft:LightBoundField HeaderText="薪级" DataField="NewSalaryGrade" SortExpression="NewSalaryGrade" />
            <zhongsoft:LightBoundField HeaderText="工资额" DataField="NewWages" SortExpression="NewWages" />
            <zhongsoft:LightBoundField HeaderText="调动日期" DataField="TransferDate" DataFormatString="{0:yyyy-MM-dd}"
                ItemStyle-Width="70px" SortExpression="TransferDate" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" SortExpression="Memo" ShowToolTip="true" />
            <%--            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField >--%>
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
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
