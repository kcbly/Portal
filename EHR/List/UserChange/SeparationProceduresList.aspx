<%@ Page Language="C#" AutoEventWireup="true" Title="职工离职清单汇总" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="SeparationProceduresList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.SeparationProceduresList" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
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
                    填写日期
                    <asp:CheckBox ID="cbDate" runat="server" Checked="true" />
                    <input type="text" id="txtDateStart" runat="server" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" />
                    -
                    <input type="text" id="txtDateEnd" runat="server" class="kpms-textbox-comparedate"
                        compare="1" readonly="readonly" />
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
                ShowExport="true" OnExport="gvList_Export" DataKeyNames="SEPARATIONPROCEDUREID"
                AllowSorting="true" OnSorting="gvList_Sorting">
                <Columns>
                    <asp:BoundField HeaderText="工号" DataField="USERCODE" SortExpression="USERCODE" />
                    <asp:BoundField HeaderText="姓名" DataField="USERNAME" SortExpression="USERNAME" />
                    <asp:BoundField HeaderText="部门" DataField="DEPTNAME" SortExpression="DEPTNAME" />
                    <asp:BoundField HeaderText="职务" DataField="RANKNAME" SortExpression="RANKNAME" />
                    <asp:BoundField HeaderText="联系电话" DataField="MOBILEPHONE" SortExpression="MOBILEPHONE" />
                    <asp:BoundField HeaderText="离职原因" DataField="CHANGEREASON2" SortExpression="CHANGEREASON2" />
                    <asp:BoundField HeaderText="填写日期" DataField="FILLDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="70px" SortExpression="FILLDATE" />
                    <asp:TemplateField HeaderText="办理单" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDetailPrint" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/subtoolbarprint.gif"onclick='return Print("<%#Eval("SEPARATIONPROCEDUREID") %>","<%#Eval("ProcessInstanceId") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
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

        function Print(bizId, wfId) {
            url = "<%=WebAppPath %>/EHR/List/UserChange/SeparationProceduresPrinter.aspx?ProcessInstanceId=" + wfId + "&bizId=" + bizId;
            window.open(url, '_blank');
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
