<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelInfoEditorList.aspx.cs"
    Title="人员基本信息设置" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelInfoEditorList" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="toolBar">
    <style type="text/css">
        #searchcontain
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="listGrid">
    <style type="text/css">
        .list-red td
        {
            color: red;
        }
    </style>
    <div style="min-width: 1000px; _width: 1000px;" class="tz-toolbar">
        <table class="kpms-seniorsearchtable">
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
                    工号/姓名/简拼<asp:TextBox runat="server" ID="tbPerson"></asp:TextBox>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                        <span content="searchResult">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                        <span>重置</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnBacthUpdate" OnClick="lbtnBacthUpdate_Click"
                        CssClass="searchbtn">
                        <span>批量更新</span>
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
            <zhongsoft:LightPowerGridView ID="gvList" AutoGenerateColumns="false" Width="100%"
                UseDefaultDataSource="true" runat="server" OnExport="lpgvList_Export" ShowExport="true"
                DataKeyNames="UserId" AllowPaging="true" PageSize="15" AllowSorting="true" OnSorting="gvList_Sorting"
                OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="工号" DataField="LoginId" SortExpression="UserCode" />
                    <asp:BoundField HeaderText="姓名" DataField="UserName" SortExpression="UserName" />
                    <asp:BoundField HeaderText="部门" DataField="OrganizationName" SortExpression="OrganizationName" />
                    <asp:BoundField HeaderText="科室" DataField="GroupName" SortExpression="GroupName" />
                    <asp:BoundField HeaderText="人员状态" DataField="State" SortExpression="State" />
                    <asp:TemplateField HeaderText="手机号码" SortExpression="MobilePhone" Visible="false">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="tbMobilePhone" Text='<%#Eval("MobilePhone") %>' CssClass="kpms-textbox"
                                regex="^(1(([35][0-9])|(47)|[8][01236789]))\d{8}$" errmsg="请输入正确的手机号码"></asp:TextBox>
                            <asp:Label runat="server" ID="lbMobilePhone" Text='<%#Eval("MobilePhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="办公电话" SortExpression="Phone" Visible="false">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="tbOfficePhone" Text='<%#Eval("Phone") %>' CssClass="kpms-textbox"
                                regex="^(\d{3,4}-)?\d{7,8}$" errmsg="请输入正确的办公电话"></asp:TextBox>
                            <asp:Label runat="server" ID="lblOfficePhone" Text='<%#Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="Email" Visible="false">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="tbEmail" Text='<%#Eval("Email") %>' MaxLength="128"
                                CssClass="kpms-textbox" regex="^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                errmsg="请输入正确的Email"></asp:TextBox>
                            <asp:Label runat="server" ID="lblEmail" Text='<%#Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="人员排序号" SortExpression="Sort" ItemStyle-Width="40px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="tbSort" Text='<%#Eval("Sort") %>' MaxLength="4" EnableTheming="false"
                                CssClass="kpms-textbox-money" regex="^\d+$" errmsg="请填写最多四位正整数" Width="90%"></asp:TextBox>
                            <asp:Label runat="server" ID="lblSort" Text='<%#Eval("Sort") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="房间号" SortExpression="SeatNO" Visible="false">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ID="tbSeatNO" Text='<%#Eval("SeatNO") %>' MaxLength="40"
                                CssClass="kpms-textbox"></asp:TextBox>
                            <asp:Label runat="server" ID="lblSeatNO" Text='<%#Eval("SeatNO") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="转正日期" SortExpression="REGULARDATE" Visible="false">
                        <ItemTemplate>
                            <input type="text" runat="server" id="txtRotationTime" readonly="readonly" class="kpms-textbox-date"
                                value='<%#Eval("REGULARDATE","{0:yyyy-MM-dd}") %>' />
                            <asp:Label runat="server" ID="lblRotationTime" Text='<%#Eval("REGULARDATE","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="起薪日期" SortExpression="SALARYSTARTDATE" Visible="false">
                        <ItemTemplate>
                            <input type="text" runat="server" id="txtStartingTime" readonly="readonly" class="kpms-textbox-comparedate"
                                enabletheming="false" compare='<%#Eval("UserId") %>' value='<%#Eval("SALARYSTARTDATE","{0:yyyy-MM-dd}") %>' />
                            <asp:Label runat="server" ID="lblStartingTime" Text='<%#Eval("SALARYSTARTDATE","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="停薪日期" SortExpression="SALARYENDDATE" Visible="false">
                        <ItemTemplate>
                            <input type="text" runat="server" id="txtEndingTime" readonly="readonly" class="kpms-textbox-comparedate"
                                enabletheming="false" compare='<%#Eval("UserId") %>' value='<%#Eval("SALARYENDDATE","{0:yyyy-MM-dd}") %>' />
                            <asp:Label runat="server" ID="lblEndingTime" Text='<%#Eval("SALARYENDDATE","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="保存">
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnSave" CommandName="save" EnableTheming="false">
                    <img alt="保存" title="保存" src="../../../Themes/Images/btn_tb_save.gif"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
