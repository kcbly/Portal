<%@ Page Language="C#" AutoEventWireup="true" Title="获奖信息" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="PrizeInfoList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PrizeInfoList" %>

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
                    获奖类别
                    <asp:DropDownList ID="ddlPrizeType" runat="server" Width="120px">
                    </asp:DropDownList>
                    获奖级别
                    <asp:DropDownList ID="ddlPrizeLevel" runat="server" Width="80px">
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
                        OnClientClick="return prizeInfoItem('','2')">
                     <span>新建</span>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr align="right">
                <td>
                    获奖日期
                    <asp:CheckBox ID="cbDate" runat="server" Checked="true" />
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtStart" class="kpms-textbox-comparedate"
                        compare="1" />
                    至
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="txtEnd" class="kpms-textbox-comparedate"
                        compare="1" />
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
            <zhongsoft:LightPowerGridView ID="gvPrizeInfo" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="UserId"
                OnRowCommand="gvPrizeInfo_RowCommand" AllowSorting="true" BindGridViewMethod="BindGrid"
                ShowExport="true">
                <Columns>
                    <asp:BoundField HeaderText="姓名" DataField="UserName" ItemStyle-Wrap="false" SortExpression="UserName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="工号" DataField="UserCode" ItemStyle-Wrap="false" SortExpression="UserCode">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="所属部门" DataField="OrgUnitName" SortExpression="OrgUnitName">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="获奖名称" DataField="PrizeName"></asp:BoundField>
                    <asp:BoundField HeaderText="获奖项目名称" DataField="ProjectName"></asp:BoundField>
                    <asp:BoundField HeaderText="担任角色" DataField="ROLENAME"></asp:BoundField>
                    <asp:BoundField HeaderText="获奖级别" DataField="PrizeLevel"></asp:BoundField>
                    <asp:BoundField HeaderText="授奖单位" DataField="AWARDCORP"></asp:BoundField>
                    <asp:BoundField HeaderText="获奖日期" DataField="PRIZEDATE" DataFormatString="{0:yyyy-MM-dd}">
                    </asp:BoundField>
                    <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        CausesValidation="false" CommandName="ViewData" EditIdField="UserId" EditPageUrl="~/EHR/List/OrgUsers/PrizeInfoEditorBatch.aspx"
                        EditPageHeight="600px" EditPageWidth="800px">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        CausesValidation="false" CommandName="EditData" EditIdField="UserId" EditPageUrl="~/EHR/List/OrgUsers/PrizeInfoEditorBatch.aspx"
                        EditPageHeight="600px" EditPageWidth="800px">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="删除" ItemStyle-HorizontalAlign="Center" CausesValidation="false"
                        CommandName="DeleteData" DeleteText="确认删除？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function prizeInfoItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditorBatch.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditorBatch.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
