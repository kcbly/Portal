<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" Title="后备干部人才库"
    AutoEventWireup="true" CodeBehind="CadreList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.CadreList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
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
                    干部类型
                    <asp:DropDownList runat="server" ID="ddlCadreType" Width="80px">
                    </asp:DropDownList>
                    性别
                    <asp:DropDownList ID="ddlSex" runat="server" Width="50px">
                    </asp:DropDownList>
                    人员状态
                    <asp:DropDownList ID="ddlState" runat="server" Width="80px">
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
                        OnClientClick="return CadreItem('','2')">
                    <span>新建</span>
                    </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td>
                    党政职务
                    <asp:TextBox ID="tbPosition" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                    技术职称
                    <asp:TextBox ID="tbTitle" runat="server" Width="100px" MaxLength="20"></asp:TextBox>
                    政治面貌
                    <asp:DropDownList ID="ddlPoliticalAffiliation" runat="server" Width="130px">
                    </asp:DropDownList>
                    文化程度
                    <asp:DropDownList ID="ddlCulturalLevel" runat="server" Width="100px">
                    </asp:DropDownList>
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
            <zhongsoft:FlexGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false"
                AllowPaging="true" OnChangeSize="changeSize" OnDragCol="dragCol" OnDragTo="dragColTo"
                DragToId="group-filter" OnPageSizeChanged="gvList_PageSizeChanged" ShowPageSizeChange="true"
                DataKeyNames="CadreID" OnRowCommand="gvList_RowCommand" ShowExport="true" AllowSorting="true"
                BindGridViewMethod="BindDataGrid" ShowGroup="true">
                <Columns>
                    <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="年龄" DataField="Years" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="科室" DataField="SubDeptName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="从事专业" DataField="Specialty">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="党政职务" DataField="RANKNAME">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="技术职称" DataField="SKILLTITLE">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="政治面貌" DataField="PoliticalLandscape">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="文化程度" DataField="EDUCATION">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="办公电话" DataField="Phone">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="手机号码" DataField="MobilePhone">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="Email" DataField="Email">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="干部类型" DataField="CadreType">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                        EditIdField="UserId" EditPageWidth="1000px" EditPageHeight="900px" EditPageUrl="~/EHR/List/OrgUsers/PersonnelInfoEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                        EditIdField="CadreID" EditPageWidth="850px" EditPageHeight="300px" EditPageUrl="~/EHR/List/OrgUsers/CadreEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:FlexGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function CadreItem(bizId, acType) {
            var stringFeatures = "dialogHeight:350px; dialogWidth: 850px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/CadreEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/CadreEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
