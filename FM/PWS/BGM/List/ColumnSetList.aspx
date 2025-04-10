<%@ Page Title="栏目设置" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ColumnSetList.aspx.cs" Inherits="Zhongsoft.Portal.PWS.BGM.List.ColumnSetList" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">栏目名称</span><span>
        <zhongsoft:LightTextBox ID="tbColumnName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">栏目类别</span><span>
        <zhongsoft:LightDropDownList ID="ddlColumnClass" runat="server" OnSelectedIndexChanged="ddlColumnType_SelectedIndexChanged" AutoPostBack="true"></zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">栏目位置</span><span>
        <zhongsoft:LightDropDownList ID="ddlColumnPosition" runat="server" OnSelectedIndexChanged="ddlColumnType_SelectedIndexChanged" AutoPostBack="true"></zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeView" runat="server" Height="100%" Width="100%" ShowLines="true" OnSelectedNodeChanged="treeView_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
    <asp:Button runat="server" ID="btnList"   Visible="false" OnClick="btnList_Click"></asp:Button>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnNew" EnableTheming="false" AccessLevel="2" OnClientClick="return editColumn(2,'','root');" CssClass="subtoolbarlink"><span>
        <img   src="<%=WebAppPath %>/Themes/Images/btn_add.gif"  width="16" height="16" alt="添加栏目" />添加栏目</span></asp:LinkButton>
    </div>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" OnRowCommand="gvList_RowCommand" AllowPaging="true"  PageSize="15" DataKeyNames="ColumnID"  
        ShowExport="true" BindGridViewMethod="BindGrid" UseDefaultDataSource="true"  OnRowDataBound="gvList_RowDataBound" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="栏目名称" DataField="ColumnName" Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="栏目类别">
                <ItemStyle Width="120px" />
                <ItemTemplate>
                    <%# Eval("ColumnClass")==null?"":Enum.GetName(typeof(ColumnClass), Eval("ColumnClass")) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="栏目位置">
                <ItemStyle Width="120px" />
                <ItemTemplate>
                    <asp:Label ID="lblColumnPosition" runat="server"></asp:Label> 
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="访问权限">
                <ItemStyle Width="120px" />
                <ItemTemplate>
                    <%# Eval("VisitAccess")==null?"":Enum.GetName(typeof(VisitAccess), Eval("VisitAccess")) %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="BelongDeptName" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false">
                       <img alt="img" src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif"  title="查看" onclick="editColumn('1','<%# Eval("ColumnID") %>','<%# Eval("ParentID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif"  title="编辑"
                                    onclick="editColumn('3','<%# Eval("ColumnID") %>','<%# Eval("ParentID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                        CommandArgument='<%# Eval("ColumnID") %>' OnClientClick="return confirm('您确定删除吗？');">
                        <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除"  title="删除"/></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script type="text/javascript"> 
        function editColumn(actionType, columnId, parentId) {
            var url = null, callBack = null, bizId = null, json = null, pId = null;            if (columnId != "") {                bizId = columnId;
            }            if (parentId != "") {                pId = parentId;
            }            if (actionType == '2' || actionType == '3')                callBack = bindData;
            json = { ParentId: pId, CurrColumnType:'<%=CurrColumnType%>' };
            url = buildBizUrl(actionType, bizId, "/PWS/BGM/List/ColumnSetEditor.aspx", json);
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }
        //执行后台绑定列表
        function bindData() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnList,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
