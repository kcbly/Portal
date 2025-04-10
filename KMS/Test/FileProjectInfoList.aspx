<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="FileProjectInfoList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.Test.FileProjectInfoList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" class="searchbtn" ID="ltbAdd" OnClientClick="return AddFile();">
                                         <span><img alt="" src="<%=WebAppPath %>/Themes/Images/C_write.gif" />添加</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" class="searchbtn" ID="lbEdit" Enabled="false" OnClientClick="return EditFile();">
                                         <span><img alt="" src="<%=WebAppPath %>/Themes/Images/C_write.gif" />编辑</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" class="searchbtn" ID="lbShowView" Enabled="false" OnClientClick="ViewEdit()">
                                         <span><img alt="" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" />查看</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" class="searchbtn" ID="ltbDelete" Enabled="false" OnClientClick="return DeleteItem();">
                                         <span><img alt="" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" />删除</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">正式项目编号</span> <span>
        <zhongsoft:LightTextBox ID="ltbProjectCode" runat="server" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">子项目编号</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbSubProjectCode" runat="server" />
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">正式项目名称</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbProjectName" runat="server" />
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">子项目名称</span>
        <span>
            <zhongsoft:LightTextBox ID="ltbSubProjectName" runat="server" />
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" OnRowCommand="gvList_RowCommand"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="FileProjectInfoId" PageSize="15" OnRowDataBound="gvList_RowDataBound" OnRowDeleting="gvList_RowDeleting" >
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="selectGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="正式项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="正式项目名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="子项目编号" DataField="SubProjectCode" />
            <zhongsoft:LightBoundField HeaderText="子项目名称" DataField="SubProjectName" />
            <zhongsoft:LightBoundField HeaderText="项目类型" DataField="ProjectTypeText" />
            <zhongsoft:LightBoundField HeaderText="客户名称" DataField="CustomerName" />
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" OnClientClick="return false;" EnableTheming="false">
                                    <img onclick='return  ViewEdit("<%# Eval("FileProjectInfoId") %>")' alt="查看" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" title="查看"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="false" CommandName="delete" ToolTip="删除" CommandArgument='<%# Eval("FileProjectInfoId") %>'
                        OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                    <img  alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" title="删除"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiFields" runat="server" />
    <asp:Button ID="btnDelete" runat="server" Visible="false" OnClick="btnDelete_Click" />

    <asp:Button ID="btnUpdate" runat="server" Visible="false" OnClick="btnUpdate_Click" />
    <asp:Button ID="btnUpdateList" runat="server" Visible="false" OnClick="btnUpdateList_Click" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        //编辑详细信息
        function EditFile(id) {
            if (typeof (id) == "undefined") {
                id = $("#<%=hiFields.ClientID %>").val();
            }
            var url = buildQueryUrl("/DAMS/List/ADM/FileProjectInfoEdit.aspx", { actionType: "3", bizId: id });
            showDivDialog(url, "", "960", "600", UpdateGridViewRow);
            return false;

        }

        function AddFile() {
            var url = buildQueryUrl("/DAMS/List/ADM/FileProjectInfoEdit.aspx", { actionType: "2" });
            showDivDialog(url, "", "960", "600", UpdateGridViewRow);
            return false;
        }

        //编辑详细信息
        function ViewEdit(id) {

            if (typeof (id) == "undefined") {
                id = $("#<%=hiFields.ClientID %>").val();
            }
            var url = buildQueryUrl("/DAMS/List/ADM/FileProjectInfoEdit.aspx", { actionType: "1", bizId: id });
            showDivDialog(url, "", "960", "600", null);
            return false;
        }

        function DeleteItem() {
            if (!confirm('您确定删除吗？')) return false;
            <%=this.Page.GetPostBackEventReference(this.btnDelete,"") %>;
            return false;
        }

        function UpdateGridViewRow() {
            <%=this.Page.GetPostBackEventReference(this.btnUpdateList,"") %>;
        }


        function selectGridViewRow(arr) {
            $("#<%=hiFields.ClientID %>").val(arr);
            <%=this.Page.GetPostBackEventReference(this.btnUpdate,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
