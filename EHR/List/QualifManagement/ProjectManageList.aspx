<%@ Page Title="项目经理证书管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ProjectManageList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.ProjectManageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> --%>
    <table style="text-align: left">
        <tr>
            <td>
                <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                    RepeatColumns="3" RepeatDirection="Horizontal" />
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                        <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                            RepeatDirection="Horizontal" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                证书编号
                <zhongsoft:LightTextBox ID="tbQuaflificationCode" runat="server" Width="150px"></zhongsoft:LightTextBox>
                工号/姓名/简拼
                <zhongsoft:LightTextBox ID="tbPersonnel" runat="server" Width="100px">
                </zhongsoft:LightTextBox>
                性别
                <zhongsoft:LightDropDownList ID="ddlSex" runat="server">
                </zhongsoft:LightDropDownList>
                人员状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlState">
                </zhongsoft:LightDropDownList>
                颁发单位
                <zhongsoft:LightDropDownList runat="server" ID="ddlIssueUnit">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                证书名称
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationName">
                </zhongsoft:LightDropDownList>
                <asp:CheckBox ID="cbGetDate" runat="server" Text="证书取得日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox ID="cbEffectiveEndTime" runat="server" Text="有效期至" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartEffectiveEndTime" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="2">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndEffectiveEndTime" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="2">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox ID="cbHandleUpdate" runat="server" Text="办理更新日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtHandleUpdateStartDate" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="3">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtHandleUpdateEndDate" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="3">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click"
        OnClientClick="return proExperienceItem('','2')">
                    <span>新建</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvProject" runat="server" AutoGenerateColumns="false"
        OnRowCommand="gvProject_RowCommand" AllowPaging="true" DataKeyNames="PRACTICEQUALIFID"
        ShowExport="true" BindGridViewMethod="BindProjectGrid" AllowSorting="true" OnSorting="gvProject_Sorting"
        HideFieldOnExport="查看,编辑,删除" UseDefaultDataSource="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="PERSONNELCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="PERSONNELNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="SUBDEPTNAME">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightBoundField HeaderText="人员状态" DataField="STATE">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="证书名称" DataField="QUAFLIFICATIONNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="证书编号" DataField="QUAFLIFICATIONCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="证书取得日期" DataField="QUAFLIFICATIONGETDATE"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册有效期至" DataField="EFFECTIVEENDTIME" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="颁发单位" DataField="ISSUEUNIT">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="办理更新日期" DataField="UPDATEDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <%--            <zhongsoft:LightBoundField HeaderText="性别" DataField="SEX">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="身份证号" DataField="IDENTITYCARDNO">
            </zhongsoft:LightBoundField>
            --%>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="PRACTICEQUALIFID"
                EditPageWidth="600px" EditPageHeight="600px" EditPageUrl="~/EHR/List/QualifManagement/ProjectManageEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="PRACTICEQUALIFID"
                EditPageWidth="600px" EditPageHeight="600px" EditPageUrl="~/EHR/List/QualifManagement/ProjectManageEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" DeleteText="您确定删除该记录吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function proExperienceItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 600px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/ProjectManageEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/ProjectManageEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
