<%@ Page Language="C#" Title="收文台账" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ReceiveFileList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.HistoryData.ReceiveFileList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
   
    <span class="filter-block">
        <span class="filter-block-lb">收文编号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtSerialCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>

    <span class="filter-block">
        <span class="filter-block-lb">文件标题</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileTitle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">收文类别</span>
        <span>
           <zhongsoft:LightTextBox ID="txtFileStyle" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>  
            
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">原文字号</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileCode" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">发文单位</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileDeptName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">密级</span>
        <span>
             <zhongsoft:LightTextBox ID="txtSecurityLevel" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox> 
           
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">收文日期</span>
        <span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtReceiveFileDateStart" runat="server" class="kpms-textbox-comparedate" compare="1"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </span>
            <span>-</span>
            <span>
                <zhongsoft:XHtmlInputText ID="txtReceiveFileDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1"
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
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ReceiveFileFormID" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField> 
            <zhongsoft:LightBoundField HeaderText="收文编号" DataField="SerialCode" />
            <asp:TemplateField HeaderText="文件标题" ItemStyle-HorizontalAlign="left"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("ReceiveFileFormID")%>');" style="color: Blue;">
                        <%#Eval("FileTitle")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="收文类别" DataField="FileStyleText" />
            <zhongsoft:LightBoundField HeaderText="发文单位" DataField="FileDeptName" />
            <zhongsoft:LightBoundField HeaderText="原文字号" DataField="FileCode" />
            <zhongsoft:LightBoundField HeaderText="份数" DataField="Copies" />
            <zhongsoft:LightBoundField HeaderText="发文日期" DataField="FileDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="收文日期" DataField="ReceiveFileDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="密级" DataField="SecurityLevelName" />
            <zhongsoft:LightBoundField HeaderText="紧急程度" DataField="PriorityLevelName" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
   
          //查看普通编辑页js
            function ViewItem(bizId) { 
                 var json = { actionType: 1, bizId: bizId };
                 var url = buildQueryUrl('/KMS/List/HistoryData/ReceiveFileEditor.aspx', json);
                showDivDialog(encodeURI(url), null, 1150, 800, "");
                return false;
            }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


