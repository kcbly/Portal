<%@ Page Language="C#" AutoEventWireup="true" Title="档案信息" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="FileInfoList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.FileInfoList" %>

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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
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
                    传递方式
                    <asp:DropDownList ID="ddlTransferForm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlTransferForm_SelectedIndexChanged">
                        <asp:ListItem Value="">全部</asp:ListItem>
                        <asp:ListItem Value="机要">机要</asp:ListItem>
                        <asp:ListItem Value="自提">自提</asp:ListItem>
                        <asp:ListItem Value="代领">代领</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                     <span content="searchResult">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                     <span>重置</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click"
                        OnClientClick="return FileInfoItem('','2')">
                     <span>新建</span>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr align="right">
                <td>
                    档案转入日期
                    <asp:CheckBox ID="cbIn" runat="server" />
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtInTime" class="kpms-textbox-comparedate"
                        compare="1" />
                    至
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtInTime2" class="kpms-textbox-comparedate"
                        compare="1" />
                    档案转出日期
                    <asp:CheckBox ID="cbOut" runat="server" />
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtOutTime" class="kpms-textbox-comparedate"
                        compare="2" />
                    至
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtOutTime2" class="kpms-textbox-comparedate"
                        compare="2" />
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
            <zhongsoft:LightPowerGridView ID="gvFileInfo" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserId"
                OnRowCommand="gvFileInfo_RowCommand" AllowSorting="true" BindGridViewMethod="BindGrid"
                ShowExport="true" OnExport="gvFileInfo_Export">
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="UserName" ItemStyle-Wrap="false"
                        SortExpression="UserName"></asp:BoundField>
                    <asp:BoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false"
                        SortExpression="UserCode"></asp:BoundField>
                    <asp:BoundField HeaderText="所属部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="档案类别" DataField="FileType" SortExpression="FileType">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="转入日期" DataField="InDate" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="InDate"></asp:BoundField>
                    <asp:BoundField HeaderText="档案来处" DataField="FromPlace" SortExpression="FromPlace">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="转出日期" DataField="OutDate" DataFormatString="{0:yyyy-MM-dd}"
                        SortExpression="OutDate"></asp:BoundField>
                    <asp:BoundField HeaderText="档案去处" DataField="ToPlace" SortExpression="ToPlace"></asp:BoundField>
                    <asp:BoundField HeaderText="管理单位" DataField="ManageCorp" SortExpression="ManageCorp">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnView" runat="server">
                        <img alt="查看" id="Img1"  onclick='return FileInfoItem("<%#DataBinder.Eval(Container.DataItem,"UserId") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData">
                        <img alt="编辑" id="Img1"  onclick='return FileInfoItem("<%#DataBinder.Eval(Container.DataItem,"UserId") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"UserId") %>'>
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function FileInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FileInfoEditorBatch.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/FileInfoEditorBatch.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
