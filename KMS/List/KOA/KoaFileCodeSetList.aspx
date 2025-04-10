<%@ Page Title="公文编码维护台账" MasterPageFile="~/UI/Master/ObjectWhList.Master" Language="C#" AutoEventWireup="true" CodeBehind="KoaFileCodeSetList.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.KoaFileCodeSetList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
   
    <span class="filter-block">
        <span class="filter-block-lb">公文类型</span>
        <span>
           <zhongsoft:LightDropDownList ID="ddlKoaType"  runat="server" Width="128px" >
                     <asp:ListItem Text="收文流程" Value="0"></asp:ListItem>
                      <asp:ListItem Text="发文流程" Value="1"></asp:ListItem>
                     </zhongsoft:LightDropDownList>    

        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">收/发文类型</span>
        <span>
            <zhongsoft:LightTextBox ID="txtFileCategory" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindData"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="KoaFileCodeSetId" PageSize="15">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField> 
             <asp:TemplateField HeaderText="公文类型" ItemStyle-Width="90px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lbKoaType" runat="server" Text='<%# Eval("KoaType").ToString()=="0"?"收文":"发文" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="收/发文类型" DataField="FileCategoryText" Width="80px" />
            <zhongsoft:LightBoundField HeaderText="编码前缀" DataField="SetFileCode" Width="100px" />
             <zhongsoft:LightBoundField HeaderText="创建日期" DataField="CreateDate" Width="80px" /> 
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Remark" Width="40%" /> 
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID ="<%=gvList.CheckedClientID %>";
        $KeyUrl = "/KMS/List/KOA/KoaFileCodeSetEditor.aspx";
        $isFlow = "0";
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

