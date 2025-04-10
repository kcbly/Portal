<%@ Page Language="C#" Title="人事档案" AutoEventWireup="true" CodeBehind="PersonnelFileList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsersView.PersonnelFileList" MasterPageFile="~/UI/Master/ObjectList.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">人事档案类别</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlFileType" class="kpms-ddlsearch" EnableTheming="false" Width="180px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">档案管理单位</span><span>
        <zhongsoft:LightTextBox ID="tbManagementUnit" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
            MaxLength="20"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" Width="100%" AllowPaging="true" AllowSorting="true" 
        ShowPageSizeChange="true" DataKeyNames="PersonnelFileID" ShowExport="true" BindGridViewMethod="BindDataGrid" 
        HideFieldOnExport="全选" UseDefaultDataSource="true" PageSize="15">
        <Columns>
           <%-- <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>--%>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("PersonnelFileID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="OrgUnitName" ItemStyle-Wrap="false" SortExpression="OrgUnitName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="档案编号" DataField="FileCode" ItemStyle-Wrap="false" SortExpression="FileCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="人事档案类别" DataField="FileType" SortExpression="FileType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="地点" DataField="Place" SortExpression="Place">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="档案管理单位" DataField="ManagementUnit" SortExpression="ManagementUnit">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="正本卷数" DataField="OriginalNumber" SortExpression="OriginalNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="副本卷数" DataField="CopyNumber" SortExpression="CopyNumber">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="档案变动原因" DataField="ChangeReason" ShowToolTip="true" SortExpression="ChangeReason">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        } 
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelFileEditor.aspx";
            var actionType = 1;
            url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: id });
            showDivDialog(encodeURI(url), null, 1150, 800);
            return false;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>