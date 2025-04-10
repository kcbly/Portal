<%@ Page Title="岗位变动" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="PositionChangeList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PositionChangeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">所属部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">上岗日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvPostionChange" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindData"
        ShowExport="true" UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" PageSize="10" DataKeyNames="USERCHANGEID"
        OnRowCommand="gvPostionChange_RowCommand" OnRowDataBound="gvPostionChange_RowDataBound" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("USERCHANGEID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="deptName" SortExpression="deptName"></zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="原岗位" ItemStyle-Width="100px" SortExpression="OGPOSITIONXML">
                <ItemTemplate>
                    <asp:Label ID="lbPositionOrg" runat="server"></asp:Label>
                    <input type="hidden" id="hiPositionXml" runat="server" value='<%#Eval("OGPOSITIONXML") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="离岗日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="LEAVEDATE"></zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="现岗位" ItemStyle-Width="100px" SortExpression="CHANGEPOSITIONXML">
                <ItemTemplate>
                    <asp:Label ID="lbPositionChange" runat="server"></asp:Label>
                    <input type="hidden" id="hiChangePositionXml" runat="server" value='<%#Eval("CHANGEPOSITIONXML") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="上岗日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="APPOINTDATE"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="变动原因" DataField="ChangeReason" SortExpression="ChangeReason"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否主岗" DataField="IsMainPosition2" SortExpression="IsMainPosition2"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true" SortExpression="Memo"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvPostionChange.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/PositionChangeEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
