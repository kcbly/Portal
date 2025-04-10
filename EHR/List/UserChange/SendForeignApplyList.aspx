<%@ Page Language="C#" Title="人员外派" AutoEventWireup="true" CodeBehind="SendForeignApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.SendForeignApplyList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/登录号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">外派单位</span><span>
        <zhongsoft:LightTextBox ID="tbUnit" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">拟外派时间</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">外派状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSendStatus" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true" ShowPageSizeChange="true" DataKeyNames="SendForeignApplyID" OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="BindDataGrid" HideFieldOnExport="全选">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                EditItemClick="editSendForeign" DataParamFields="SendForeignApplyID" ItemStyle-Width="5%">
            </zhongsoft:LightButtonField>
            <%--            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                EditItemClick="ViewItem" DataParamFields="FID,PID" ItemStyle-Width="5%">
            </zhongsoft:LightButtonField>--%>
            <zhongsoft:LightBoundField HeaderText="登录号" DataField="ApplyUserCode" SortExpression="ApplyUserCode">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="ApplyUserName"
                ItemStyle-Width="5%">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("ApplyUserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName" ItemStyle-Wrap="false" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外派单位" DataField="PlanSendUintAndPost" ItemStyle-Wrap="false" SortExpression="PlanSendUintAndPost">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外派/延长外派理由" DataField="SendReason" ShowToolTip="true" SortExpression="SendReason">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="拟外派时间（起）" DataField="PlanSendStartDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanSendStartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="拟外派时间（止）" DataField="PlanSendEndDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanSendEndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="外派状态" DataField="SendState" SortExpression="SendState">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" SortExpression="Memo">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function editSendForeign(bizId) {
            var url = buildQueryUrl("/EHR/List/UserChange/SendForeignApplyEditor.aspx", { actionType: 3, bizid: bizId });
            showDivDialog(url, null, 300, 200, rebindGridData);
            return false;
        }
        function ViewItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
