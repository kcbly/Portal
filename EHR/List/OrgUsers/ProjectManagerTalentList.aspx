<%@ Page Language="C#" AutoEventWireup="true" Title="项目经理人才库" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectManagerTalentList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ProjectManagerTalentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <div id="templateTabs" style="min-height: 500px">
        <ul>
            <li id="liManagerCapacity"><a id="aManagerCapacity" href="#ManagerCapacity" onclick="return RecordTab(0);">
                已经具备项目经理资格</a></li>
            <li id="liManager"><a id="aManager" href="#Manager" onclick="return RecordTab(1);">获得项目经理证书</a></li>
        </ul>
        <div id="ManagerCapacity">
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
                        <asp:TextBox ID="tbPersonnel" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        性别
                        <asp:DropDownList ID="ddlSex" runat="server" BackColor="White" AutoPostBack="True" Width="50px"
                            OnSelectedIndexChanged="ddlSex_SelectedIndexChanged">
                        </asp:DropDownList>
                        人员状态
                        <asp:DropDownList ID="ddlState" runat="server" BackColor="White" AutoPostBack="True" Width="80px"
                            OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                            <span content="searchResult0">查找</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                            <span>重置</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnNewBatch" class="searchbtn" OnClick="btnNewBatch_Click"
                            OnClientClick="return NewItemBatch();">
                            <span>添加人员</span>
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        党政职务
                        <asp:TextBox ID="tbPosition" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        技术职称
                        <asp:TextBox ID="tbTitle" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        政治面貌
                        <asp:DropDownList ID="ddlPoliticalAffiliation" runat="server" BackColor="White" AutoPostBack="True" Width="130px"
                            OnSelectedIndexChanged="ddlPoliticalAffiliation_SelectedIndexChanged">
                        </asp:DropDownList>
                        文化程度
                        <asp:DropDownList ID="ddlCulturalLevel" runat="server" BackColor="White" AutoPostBack="True" Width="100px"
                            OnSelectedIndexChanged="ddlCulturalLevel_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnOrg" EventName="click" />
                    
                </Triggers>
                <ContentTemplate>
                    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList"
                        OnClick="btnSearch_Click"></asp:LinkButton>
                    <zhongsoft:FlexGridView ID="gvList" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                        AllowPaging="true" OnChangeSize="changeSize" OnDragCol="dragCol" OnDragTo="dragColTo"
                        DragToId="group-filter" OnPageSizeChanged="gvList_PageSizeChanged" ShowPageSizeChange="true"
                        DataKeyNames="UserId" OnRowCommand="gvList_RowCommand" ShowExport="true" OnExport="gvList_Export"
                        AllowSorting="true" OnSorting="gvList_Sorting" ShowGroup="true" BindGridViewMethod="BindGrid1">
                        <Columns>
                            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="年龄" DataField="Age" ItemStyle-HorizontalAlign="Right">
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
                            <zhongsoft:LightBoundField HeaderText="文化程度" DataField="Education">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="办公电话" DataField="Phone">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="手机号码" DataField="MobilePhone">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="Email" DataField="Email">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                EditIdField="UserId" EditPageWidth="1000px" EditPageHeight="900px" EditPageUrl="~/EHR/List/OrgUsers/PersonnelInfoEditor.aspx">
                            </zhongsoft:LightButtonField>
                            <zhongsoft:LightButtonField HeaderText="资格" ImageUrl="../../../Themes/Images/btn_dg_detail.gif"
                                EditItemClick="PersonnelDetail" DataParamFields="UserCode,UserId">
                            </zhongsoft:LightButtonField>
                            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:FlexGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <input type="hidden" id="hiUserXml" runat="server" />
        </div>
        <div id="Manager">
            <table>
                <tr>
                    <td>
                        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept2" TitleName="部门" SearchBtnId="btnOrg2"
                            RepeatColumns="3" RepeatDirection="Horizontal" />
                        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:LinkButton runat="server" ID="btnOrg2" Style="display: none" OnClick="btnOrg2_Click"></asp:LinkButton>
                                <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg2" TitleName="科室" SearchBtnId="btnList2"
                                    RepeatColumns="2" RepeatDirection="Horizontal" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        工号/姓名/简拼
                        <asp:TextBox ID="tbPersonnel2" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        性别
                        <asp:DropDownList ID="ddlSex2" runat="server" BackColor="White" AutoPostBack="True" Width="50px"
                            OnSelectedIndexChanged="ddlSex2_SelectedIndexChanged">
                        </asp:DropDownList>
                        人员状态
                        <asp:DropDownList ID="ddlState2" runat="server" BackColor="White" AutoPostBack="True" Width="80px"
                            OnSelectedIndexChanged="ddlState2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch2" OnClick="btnSearch2_Click"
                            >
                            <span content="searchResult1">查找</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset2" OnClick="btnReset2_Click"
                            >
                            <span>重置</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnNew2" class="searchbtn" OnClick="btnNew2_Click"
                            OnClientClick="return NewItemBatch2()">
                            <span>添加人员</span>
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        党政职务
                        <asp:TextBox ID="tbPosition2" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        技术职称
                        <asp:TextBox ID="tbTitle2" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox>
                        政治面貌
                        <asp:DropDownList ID="ddlPoliticalAffiliation2" runat="server" BackColor="White" Width="130px"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlPoliticalAffiliation2_SelectedIndexChanged">
                        </asp:DropDownList>
                        文化程度
                        <asp:DropDownList ID="ddlCulturalLevel2" runat="server" BackColor="White" AutoPostBack="True" Width="100px"
                            OnSelectedIndexChanged="ddlCulturalLevel2_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnOrg2" EventName="click" />
                    <asp:AsyncPostBackTrigger ControlID="btnSearch2" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnReset2" EventName="Click" />
                     <asp:AsyncPostBackTrigger ControlID="btnNew2" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList2"
                        OnClick="btnSearch2_Click"></asp:LinkButton>
                    <zhongsoft:FlexGridView ID="gvList2" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
                        AllowPaging="true" OnChangeSize="changeSize" OnDragCol="dragCol" OnDragTo="dragColTo"
                        DragToId="group-filter" OnPageSizeChanged="gvList2_PageSizeChanged" ShowPageSizeChange="true"
                        DataKeyNames="UserId" OnRowCommand="gvList2_RowCommand" ShowExport="true" OnExport="gvList2_Export"
                        AllowSorting="true" OnSorting="gvList2_Sorting" ShowGroup="true" BindGridViewMethod="BindGrid2">
                        <Columns>
                            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="年龄" DataField="Age" ItemStyle-HorizontalAlign="Right">
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
                            <zhongsoft:LightBoundField HeaderText="文化程度" DataField="Education">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="办公电话" DataField="Phone">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="手机号码" DataField="MobilePhone">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="Email" DataField="Email">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                EditIdField="UserId" EditPageWidth="1000px" EditPageHeight="900px" EditPageUrl="~/EHR/List/OrgUsers/PersonnelInfoEditor.aspx">
                            </zhongsoft:LightButtonField>
                            <zhongsoft:LightButtonField HeaderText="资格" ImageUrl="../../../Themes/Images/btn_dg_detail.gif"
                                EditItemClick="PersonnelDetail" DataParamFields="UserCode,UserId">
                            </zhongsoft:LightButtonField>
                            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:FlexGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <input type="hidden" id="hiUserXml2" runat="server" />
        </div>
    </div>
    <input type="hidden" runat="server" id="tabIndex" value="0" />
    <script type="text/javascript">
        var tabIndex = 0;
        $(function () {
            var $tab1 = $('#templateTabs').tabs();
        });

        function RecordTab(index) {
            $("#<%=tabIndex.ClientID %>").val(index);
            tabIndex = index;
            return false;
        }
        //Enter键查询
        function search() {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                $("[content='searchResult" + parseInt($("#<%=tabIndex.ClientID %>").val()) + "']").click();
            }
        }
    </script>
    <script type="text/javascript">

        function NewItemBatch() {
            var param = new InputParamObject("m");
            var re = getUsersNew("<%=hiUserXml.ClientID %>", param, "");
            if (re != null) {
                return true;
            }
            return false;
        }
    </script>
    <script type="text/javascript">

        function NewItemBatch2() {
            var param = new InputParamObject("m");
            var re = getUsersNew("<%=hiUserXml2.ClientID %>", param, "");
            if (re != null) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
