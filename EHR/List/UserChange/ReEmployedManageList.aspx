<%@ Page Language="C#" AutoEventWireup="true" Title="返聘人员台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ReEmployedManageList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ReEmployedManageList" %>

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
                    <asp:TextBox ID="tbUser" runat="server" Width="100px"></asp:TextBox>
                    年龄
                    <asp:CheckBox ID="cbYearsOld" runat="server" />
                    <zhongsoft:LightTextBox ID="tbYearsOldStart" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" regex="^\d+$" MaxLength="2" errmsg="请输入最多两位正整数" Width="30px"></zhongsoft:LightTextBox>-
                    <zhongsoft:LightTextBox ID="tbYearsOldEnd" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" regex="^\d+$" MaxLength="2" errmsg="请输入最多两位正整数" Width="30px"></zhongsoft:LightTextBox>
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
            <tr>
                <td align="right">
                    返聘起始日期
                    <asp:CheckBox ID="cbDate" runat="server" />
                    <input type="text" id="txtDateStart" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
                    -
                    <input type="text" id="txtDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
                    返聘终止日期
                    <asp:CheckBox ID="cbDateEnd" runat="server" />
                    <input type="text" id="txtEndDateStart" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
                    -
                    <input type="text" id="txtEndDateEnd" runat="server" class="kpms-textbox-comparedate" compare="2" readonly="readonly" />
                </td>
                <td>
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
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="15" OnRowCommand="gvList_RowCommand"
                ShowExport="true" OnExport="gvList_Export" OnRowDataBound="gvList_RowDataBound"
                DataKeyNames="REEMPLOYEDDETAILID" AllowSorting="true" OnSorting="gvList_Sorting">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="工号" DataField="USERCODE" SortExpression="USERCODE" />
                    <asp:BoundField HeaderText="姓名" DataField="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField HeaderText="部门" DataField="DeptName" SortExpression="DeptName" />
                    <asp:BoundField HeaderText="科室" DataField="SUBDEPTNAME" SortExpression="SUBDEPTNAME" />
                    <asp:BoundField HeaderText="出生日期" DataField="Birthday" SortExpression="Birthday"
                        DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="70px" />
                    <asp:BoundField HeaderText="年龄" DataField="Age" SortExpression="Age" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField HeaderText="职称" DataField="SKILLTITLE" SortExpression="SKILLTITLE" />
                    <asp:BoundField HeaderText="返聘起始日期" DataField="REEMPLOYEDSTARTDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="70px" SortExpression="REEMPLOYEDSTARTDATE" />
                    <asp:BoundField HeaderText="返聘终止日期" DataField="REEMPLOYEDENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="70px" SortExpression="REEMPLOYEDENDDATE" />
                    <asp:BoundField HeaderText="备注" DataField="MEMO" SortExpression="MEMO" />
                    <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        $(function () {
            checkRegex();
        })
        //查看流程页面
        function DetailItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
