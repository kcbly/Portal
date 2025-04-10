<%@ Page Language="C#" AutoEventWireup="true" Title="技术职称" MasterPageFile="~/UI/Master/ObjectList.Master" CodeBehind="SkillLevelList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SkillLevelList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div class="tz-toolbar">
        <table>
            <tr>
                <td>
                    <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg" RepeatColumns="3" RepeatDirection="Horizontal" />
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                            <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" SearchBtnId="btnList" RepeatColumns="2" RepeatDirection="Horizontal" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    工种
                    <asp:DropDownList ID="ddlSkillTitle" runat="server" Width="100px">
                    </asp:DropDownList>
                    工号/姓名/简拼
                    <asp:TextBox ID="tbPersonnel" runat="server" Width="100px" MaxLength="20" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
                    技能等级
                    <asp:DropDownList ID="ddlSkillLevel" runat="server" Width="80px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                     <span content="searchResult">查询</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                     <span>重置</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnSearch_Click"
                        OnClientClick="return skillLevelItem('','2')">
                     <span>新建</span>
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
            <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnSearch_Click"></asp:LinkButton>
            <zhongsoft:LightPowerGridView ID="gvSkill" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" AllowPaging="true" PageSize="10"
                DataKeyNames="UserId" OnRowCommand="gvSkill_RowCommand" AllowSorting="true" BindGridViewMethod="BindGrid"
                ShowExport="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="身份证号" DataField="IdentityCardNO" SortExpression="IdentityCardNO"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="员工编号" DataField="UserCode" SortExpression="UserCode"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName" SortExpression="UserName"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="排序码" DataField="Code" SortExpression="Code"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="技能等级" DataField="SKILLLEVEL"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="取得时间" DataField="DESERVEDATE" DataFormatString="{0:yyyy-MM-dd}"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="工种" DataField="SKILLTITLE"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="证书名称" DataField="CertificateName"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="证书号" DataField="CertificateNo"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="鉴定机构" DataField="IdentifyOrg" ShowToolTip="true"></zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="特殊工种标识" DataField="IsSpecialMarkText"></zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        CausesValidation="false" CommandName="ViewData" EditIdField="UserId" EditPageUrl="~/EHR/List/OrgUsers/SkillLevelEditorBatch.aspx"
                        EditPageHeight="600px" EditPageWidth="800px">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        CausesValidation="false" CommandName="EditData" EditIdField="UserId" EditPageUrl="~/EHR/List/OrgUsers/SkillLevelEditorBatch.aspx"
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
       function skillLevelItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditorBatch.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditorBatch.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
