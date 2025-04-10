<%@ Page Language="C#" AutoEventWireup="true" Title="返聘申请汇总" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ReEmployedManageFormList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.ReEmployedManageFormList" %>

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
                    发起日期
                    <asp:CheckBox ID="cbDate" runat="server" Checked="true" />
                    <input type="text" id="txtDateStart" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
                    -
                    <input type="text" id="txtDateEnd" runat="server" class="kpms-textbox-comparedate" compare="1" readonly="readonly" />
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
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnOrg" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList"
                OnClick="btnSearch_Click"></asp:LinkButton>
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="15" OnRowCommand="gvList_RowCommand"
                ShowExport="true" OnExport="gvList_Export" DataKeyNames="REEMPLOYEDAPPPLYID"
                AllowSorting="true" OnSorting="gvList_Sorting">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="部门" DataField="DeptName" SortExpression="DeptName" />
                    <asp:BoundField HeaderText="发起人" DataField="FILLUSERNAME" SortExpression="FILLUSERNAME" />
                    <asp:BoundField HeaderText="发起日期" DataField="FILLDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="70px" SortExpression="FILLDATE" />
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
