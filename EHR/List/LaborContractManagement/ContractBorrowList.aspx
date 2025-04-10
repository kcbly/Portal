<%@ Page Language="C#" Title="合同借用" AutoEventWireup="true" CodeBehind="ContractBorrowList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.ContractBorrowList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">申请日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">预计归还日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtPlanStartDate" class="kpms-textbox-comparedate"
            compare="2" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtPlanEndDate" class="kpms-textbox-comparedate"
             compare="2" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlStatus" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true" ShowPageSizeChange="true" DataKeyNames="ContractBorrowFormID" OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="BindDataGrid" HideFieldOnExport="全选">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="ApplyUserCode" SortExpression="ApplyUserCode">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="ApplyUserName" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FID")%>','<%#Eval("PID")%>');" style="color: Blue;">
                        <%#Eval("ApplyUserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="ApplyDeptName" ItemStyle-Wrap="false" SortExpression="ApplyDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借用合同数（份）" DataField="ContractNumber" ItemStyle-Wrap="false" SortExpression="ContractNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借用事由" DataField="BorrowCause" ShowToolTip="true" SortExpression="BorrowCause">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同对应人员" DataField="UserNames" SortExpression="UserNames">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借出日期" DataField="BorrowDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="BorrowDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="预计归还日期" DataField="PlanReturnDate" SortExpression="PlanReturnDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="状态" DataField="BorrowState" SortExpression="BorrowState">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function ViewItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
