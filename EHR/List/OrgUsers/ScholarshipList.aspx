<%@ Page Language="C#" AutoEventWireup="true" Title="学术团体" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ScholarshipList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ScholarshipList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <style type="text/css">
        #searchcontain
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style type="text/css">
        .list-red td
        {
            color: red;
        }
    </style>
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
                    <asp:TextBox ID="tbPersonnel" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                    社团名称
                    <asp:TextBox ID="tbScholarshipName" MaxLength="128" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                     <span content="searchResult">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                     <span>重置</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click"
                        OnClientClick="return ScholarshipItem('','2')">
                     <span>新建</span>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr align="right">
                <td>
                    参加日期
                    <asp:CheckBox ID="cbDate" runat="server" Checked="true" />
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtStart" class="kpms-textbox-date" />
                    至
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtEnd" class="kpms-textbox-date" />
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
            <zhongsoft:LightPowerGridView ID="gvScholarship" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserId"
                OnRowCommand="gvScholarship_RowCommand" OnRowDataBound="gvScholarship_RowDataBound"
                ShowExport="true" OnExport="gvScholarship_Export" AllowSorting="true" BindGridViewMethod="BindGrid">
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="UserName" ItemStyle-Wrap="false" SortExpression="UserName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="所属部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="社团名称" DataField="ScholarshipName" SortExpression="ScholarshipName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="主管单位名称" DataField="ManageCorp" SortExpression="ManageCorp">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="职务" DataField="RANK" SortExpression="RANK"></asp:BoundField>
                    <asp:BoundField HeaderText="参加日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="APPOINTDATE"></asp:BoundField>
                    <asp:BoundField HeaderText="最新学术团体" DataField="IsNew2" SortExpression="IsNew2"></asp:BoundField>
                    <asp:BoundField HeaderText="退出日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="LEAVEDATE"></asp:BoundField>
                    <asp:BoundField HeaderText="备注" DataField="Memo" SortExpression="Memo"></asp:BoundField>
                    <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return ScholarshipItem("<%#DataBinder.Eval(Container.DataItem,"UserId") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return ScholarshipItem("<%#DataBinder.Eval(Container.DataItem,"UserId") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserId") %>'
                                EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function ScholarshipItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ScholarshipEditorBatch.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ScholarshipEditorBatch.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {

            }
            return true;
        }
    </script>
</asp:Content>
