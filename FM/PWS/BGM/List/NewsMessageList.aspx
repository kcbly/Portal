<%@ Page Title="新闻列表" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="NewsMessageList.aspx.cs" Inherits="Zhongsoft.Portal.PWS.BGM.List.NewsMessageList" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">作者</span><span>
        <zhongsoft:LightTextBox ID="tbAuthor" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">新闻标题</span><span>
        <zhongsoft:LightTextBox ID="tbTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">所属栏目</span><span>
        <zhongsoft:LightTextBox ID="tbColumnName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">状态</span><span>
        <asp:RadioButtonList runat="server" ID="rblNewsState" RepeatDirection="Horizontal"
            AutoPostBack="true" OnSelectedIndexChanged="rblNewsState_SelectedIndexChanged">
            <asp:ListItem Value="1">已发布</asp:ListItem>
            <asp:ListItem Value="0">未发布</asp:ListItem>
        </asp:RadioButtonList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeView" runat="server" Height="100%" Width="100%" ShowLines="true" OnSelectedNodeChanged="treeView_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnAdd" EnableTheming="false" AccessLevel="2" Visible="false"
            CssClass="subtoolbarlink"> <span>
        <img  src="<%=WebAppPath %>/Themes/Images/btn_new.gif"  width="16" height="16" alt="新建"/>新建</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtBatchPublish" EnableTheming="false" AccessLevel="2" OnClientClick="return batchPublish();" OnClick="lbtBatchPublish_Click"
            CssClass="subtoolbarlink"> <span>
        <img  src="<%=WebAppPath %>/Themes/Images/btn_finish.gif"  width="16" height="16" alt="批量发布"/>批量发布</span></asp:LinkButton>
    </div>
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" AllowPaging="true" PageSize="15" DataKeyNames="NewsMessageID"
        ShowExport="true" BindGridViewMethod="BindGrid"
        RowStyle-Wrap="false" AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="所属栏目" DataField="ColumnName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="标题">
                <ItemTemplate>
                    <div class="autoskip" style="width: 300px" id="divTitle" runat="server">
                        <a title='<%#Eval("Title") %>' style="text-decoration: none"><%#Eval("Title") %></a>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="内容">
                <ItemTemplate>
                    <div class="autoskip" style="width: 350px;" title='<%#CommonHelper.NoHTML(Convert.ToString(Eval("Contents")))%>'>
                        <%#CommonHelper.NoHTML(Convert.ToString(Eval("Contents")))%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="字数" DataField="TextCnt"  ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="来源" DataField="NewsFrom" HeaderStyle-Width="100px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="作者" DataField="Author" HeaderStyle-Width="50px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="发布日期" DataField="SendDate" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="点击量" DataField="HitCount" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" >
                <ItemTemplate>
                    <%#GetIsPublish(Eval("NewsState").ToString())%>
                    <asp:LinkButton ID="lbtnPublish" runat="server" CommandName="Publish" CommandArgument='<%#Eval("NewsMessageID") %>'
                        EnableTheming="false">
						<img title="发布"  src="<%=WebAppPath %>/Themes/Images/btn_finish.gif" alt="发布" />
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="CancelPublish" CommandArgument='<%#Eval("NewsMessageID") %>'
                        EnableTheming="false">
						<img title="取消发布" src="<%=WebAppPath %>/Themes/Images/btn_back.gif" alt="取消发布" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看"
                                    onclick="editNews(1,'<%# Eval("NewsMessageID") %>','<%# Eval("ColumnID") %>','<%# Eval("ColumnClass") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif"  title="编辑"
                                    onclick="editNews(3,'<%# Eval("NewsMessageID") %>','<%# Eval("ColumnID") %>','<%# Eval("ColumnClass") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="ItemDelete" CommandArgument='<%# Eval("NewsMessageID") %>' EnableTheming="false">
                        <img alt="删除"   src="../../../Themes/Images/btn_dg_delete.gif"  onclick="if(!confirm('您确定删除吗？')) return false;" border='0' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">       
        function batchPublish() {
            var array = buildGirdRowIds("<%=gvList.CheckedClientID %>");
            if (array.length == 0) {
                alert("请先选择要批量发布的新闻信息！");
                return false;
            } else {
                return true;
            }            
        }    
        
        function editNews(actionType, bizId, columnId,columnClass) {
            var width=1000,height=800, json = { ColumnId: columnId, CurrColumnType: '<%=CurrColumnType%>' },
                url = buildBizUrl(actionType, bizId, "/PWS/BGM/List/NewsMessageEditor.aspx", json);
            if (columnClass ==<%=ColumnClass.友情链接.GetHashCode()%>) {
                width = 600;
                height = 400;              
            }
            switch (actionType) {
                case 1:
                    showDivDialog(url, "", width, height, null);
                    break;
                case 2:
                case 3:
                    //如果是新建、编辑的页面，弹出层需要回调函数，同时关闭窗口前也需要带有提示框（showDivDialogTip）
                    //查看页面不需要调用回调函数，也不需要关闭窗口前弹出提示框（showDivDialog）
                    showDivDialogTip(url, "", width, height, bindData);
                    break;
            } 
            return false;
        }
        function bindData() {
            <%=Page.GetPostBackEventReference(this.btnList,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
