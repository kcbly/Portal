<%@ Page Language="C#" AutoEventWireup="true" Title="项目履历" MasterPageFile="~/UI/Master/ObjectWhList.Master"
    CodeBehind="ProExperienceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ProExperienceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div class="tz-toolbar">
        <table>
            <tr>
                <td>
                    <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                        RepeatColumns="3" RepeatDirection="Horizontal" />
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                            <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" SearchBtnId="btnList"
                                RepeatColumns="2" RepeatDirection="Horizontal" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    工号/姓名/简拼
                    <asp:TextBox ID="tbPersonnel" runat="server" Width="100px" MaxLength="20" CssClass="kpms-search" EnableTheming="false"></asp:TextBox>
                    项目名称
                    <asp:TextBox ID="tbProjectName" runat="server" Width="100px" CssClass="kpms-search" EnableTheming="false"></asp:TextBox>
                    项目编号
                    <asp:TextBox ID="tbProjectCode" runat="server" Width="100px" CssClass="kpms-search" EnableTheming="false"></asp:TextBox>
                </td>
                <td>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                     <span content="searchResult">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                     <span>重置</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnOrg" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList"
                OnClick="btnSearch_Click"></asp:LinkButton>
            <zhongsoft:LightPowerGridView ID="gvPro" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PROEXPERIENCEID"
                OnRowCommand="gvPro_RowCommand" AllowSorting="true" BindGridViewMethod="BindGrid"
                ShowExport="true">
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
                            <a onclick="return ViewCustomListLink('<%#Eval("PROEXPERIENCEID")%>');" style="color: Blue;">
                                <%#Eval("UserName")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="所属部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode"></zhongsoft:LightBoundField>
                    <asp:BoundField HeaderText="担任角色" DataField="RoleName" SortExpression="RoleName"></asp:BoundField>
                    <zhongsoft:LightBoundField HeaderText="上任日期" DataField="AppointDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="AppointDate">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="卸任日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="LEAVEDATE">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="主要任务及工作内容" DataField="WorkContent" SortExpression="WorkContent"></zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <input type="hidden" id="hiRZDeptCode" runat="server" value="01017032" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvPro.CheckedClientID %>";
        $KeyUrl = "/EHR/List/OrgUsers/ProExperienceEditor.aspx";
        $isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
    </script>
</asp:Content>
