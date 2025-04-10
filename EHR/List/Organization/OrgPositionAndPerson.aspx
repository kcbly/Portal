<%@ Page Language="C#" Title="部门岗位、成员" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="OrgPositionAndPerson.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.OrgPositionAndPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li><a href='#baseInfo' id='abaseInfo'>部门岗位设置</a></li>
            <li><a href='#userInfo' id='auserInfo'>部门成员</a></li>
        </ul>
        <div id="baseInfo">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <span class="filter-block"><span class="filter-block-lb">岗位编号/名称</span><span>
                                    <asp:TextBox ID="tbPosition" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox></span></span>
                                    <span class="filter-block"><span class="filter-block-lb">所属职务</span><span>
                                    <asp:TextBox ID="tbSubordinatePost" runat="server" Width="100px" MaxLength="20" BackColor="White"></asp:TextBox></span></span>
                                    <span class="filter-block"><span class="filter-block-lb">岗位分类</span><span>
                                    <zhongsoft:LightDropDownList runat="server" ID="ddlPositionClassify" class="kpms-ddlsearch" EnableTheming="false">
                                    </zhongsoft:LightDropDownList></span></span>
                                    <span class="filter-block"><span class="filter-block-lb">是否撤销</span><span>
                                    <zhongsoft:LightDropDownList ID="ddlFlag" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                                        <asp:ListItem Value="" Text="全部"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="未撤销"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="已撤销"></asp:ListItem>
                                    </zhongsoft:LightDropDownList></span></span>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" class="searchbtn bluecolor" ID="btnSearch" OnClick="btnSearch_Click">
                                        <span content="searchResult">查找</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                        <span>重置</span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <zhongsoft:LightPowerGridView ID="gvPosition" runat="server" AutoGenerateColumns="false"
                        AllowPaging="true" OnPageSizeChanged="gvList_PageSizeChanged" ShowPageSizeChange="true"
                        DataKeyNames="PositionID" ShowExport="true" AllowSorting="true" BindGridViewMethod="BindDataGridPosition">
                        <Columns>
                            <zhongsoft:LightBoundField HeaderText="岗位编号" DataField="PositionCode">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位名称" DataField="PositionName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位职级" DataField="POSITIONLEVEL">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="所属职务" DataField="BELONGRANK">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位分类" DataField="PositionClassify">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="成立日期" DataField="SetUpDate" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="撤销日期" DataField="UndoDate" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位定编人数" DataField="PersonsNum" ItemStyle-HorizontalAlign="Right">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位缺编人数" DataField="LessNum" ItemStyle-HorizontalAlign="Right">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="岗位超编人数" DataField="OutterNum" ItemStyle-HorizontalAlign="Right">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                EditIdField="PositionID" EditPageWidth="700px" EditPageHeight="450px" EditPageUrl="~/EHR/List/Organization/PositionEditor.aspx">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="userInfo">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    工号/姓名/拼音简称
                                    <asp:TextBox ID="tbPersonnel" runat="server" Width="100px" BackColor="White" MaxLength="20"></asp:TextBox>
                                    用工形式
                                    <zhongsoft:LightDropDownList runat="server" ID="ddlEmploymentForm" class="kpms-ddlsearch"  EnableTheming="false">
                                    </zhongsoft:LightDropDownList>
                                    人员类别
                                    <zhongsoft:LightDropDownList runat="server" ID="ddlCategories" class="kpms-ddlsearch"  EnableTheming="false">
                                    </zhongsoft:LightDropDownList>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" class="searchbtn bluecolor" ID="btnSerchPerson" OnClick="btnSerchPerson_Click">
                                         <span content="searchResult">查找</span>
                                    </asp:LinkButton>
                                    <asp:LinkButton runat="server" class="searchbtn" ID="btnResetPerson" OnClick="btnResetPerson_Click">
                                         <span>重置</span>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                        AllowPaging="true" OnPageSizeChanged="gvList_PageSizeChanged" ShowPageSizeChange="true"
                        DataKeyNames="UserId" ShowExport="true" AllowSorting="true" BindGridViewMethod="BindDataGridPerson">
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
                            <zhongsoft:LightBoundField HeaderText="科组" DataField="SubDeptName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="专业" DataField="MAJORSPECIALTY">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="党政职务" DataField="RankName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="技术职称" DataField="SkillTitle">
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
                            <%--<zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                EditIdField="UserId" EditPageWidth="1000px" EditPageHeight="870px" EditPageUrl="~/EHR/List/OrgUsers/PersonnelInfoEditor.aspx">
                            </zhongsoft:LightButtonField>--%>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script type="text/javascript">
        function initCustomerPlugin() {
            $('#templateTabs').tabs();
        }
    </script>
</asp:Content>
