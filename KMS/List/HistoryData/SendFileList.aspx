<%@ Page Language="C#" Title="发文台账" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="SendFileList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.HistoryData.SendFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
 
    <span class="filter-block">
        <span class="filter-block-lb">文号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">文件标题</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">发文类型</span>
        <span>
               <zhongsoft:LightTextBox ID="txtSendFileType" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
         
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">签发人</span>
        <span>
            <zhongsoft:LightTextBox ID="SignUserName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">密级</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSecurityLevel" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox> 
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">拟稿部门</span>
        <span>
            <zhongsoft:LightTextBox ID="txtHostDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    
    <span class="filter-block">
        <span class="filter-block-lb">拟稿日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtCreateDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtCreateDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData" 
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="SendFileFormId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="文号" DataField="FileCode" />
             <asp:TemplateField HeaderText="文件标题" ItemStyle-HorizontalAlign="left" 
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("SendFileFormId")%>');" style="color: Blue;">
                        <%#Eval("FileTitle")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="发文类型" DataField="FileCategoryText" />
            <zhongsoft:LightBoundField HeaderText="主送" DataField="MainSendDeptName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="抄送" DataField="CopySendDeptName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="签发人" DataField="SignUserName" ShowToolTip="true" />
            <zhongsoft:LightBoundField HeaderText="签发日期" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="密级" DataField="SecurityLevelName" />
            <zhongsoft:LightBoundField HeaderText="拟稿人" DataField="CreateUserName" />
            <zhongsoft:LightBoundField HeaderText="拟稿部门" DataField="HostDeptName" />
            <zhongsoft:LightBoundField HeaderText="拟稿日期" DataField="CreateDate" DataFormatString="{0:yyyy-MM-dd}" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
      
        //查看普通编辑页js
            function ViewItem(bizId) { 
                 var json = { actionType: 1, bizId: bizId };
                 var url = buildQueryUrl('/KMS/List/HistoryData/SendFileEditor.aspx', json);
                showDivDialog(encodeURI(url), null, 1150, 800, "");
                return false;
            }


    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

