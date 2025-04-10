<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormalWorkPayrollList.aspx.cs" 
Inherits="Zhongsoft.Portal.EHR.List.SalaryManagement.FormalWorkPayrollList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                年度
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                月度
                <zhongsoft:LightDropDownList runat="server" ID="ddlMonth">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                编制日期
                <asp:CheckBox ID="cbDate" runat="server" Text="" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtStDate" readonly="readonly"
                    compare="1" class="kpms-textbox-comparedate" />
                至
                <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" readonly="readonly"
                    compare="1" class="kpms-textbox-comparedate" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="序号,查看" DataKeyNames="FORMALWORKPAYROLLFORMID"
        BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="YEAR" HeaderText="年" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MONTH" HeaderText="月" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FILLDATE" HeaderText="编制日期" ItemStyle-Width="20%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="REQFILLDATE" HeaderText="要求填报日期" ItemStyle-Width="20%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FILLREQUIREMENTS" HeaderText="填报要求" ItemStyle-Width="30%">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程页面
        function DetailItem(FId, PId) {
            var param = { formId: FId, prcInstId: PId };
            var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
            window.open(urlStr);
            return false;
        }


        function checkDate() {
            var startdate = $("#<%=txtStDate.ClientID %>").val();
            var enddate = $("#<%=txtEndDate.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("开始时间应早于结束时间！");
                return false;
            }
            else
                return true;
        }


        function checkForm() {
            if (checkDate())
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

