<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LaborContractExpireSignStatisticsList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.LaborContractManagement.LaborContractExpireSignStatisticsList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">

               <span class="filter-block"><span> <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                    RepeatColumns="3" RepeatDirection="Horizontal" />
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                        <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                            RepeatDirection="Horizontal" />
                    </ContentTemplate>
                </asp:UpdatePanel></span></span> 

                <span class="filter-block"><span class="filter-block-lb">建议签订年限</span><span>
                <asp:CheckBox ID="cbYear" runat="server" Text="" />
                <zhongsoft:LightTextBox type="text" ID="tbMinSuggestYears" runat="server" regex="^[1-9]\d*$"
                    errmsg="请输入正整数" class="kpms-textbox-money" Style="width: 50px;" />
                至
                <zhongsoft:LightTextBox type="text" ID="tbMaxSuggestYears" runat="server" regex="^[1-9]\d*$"
                    errmsg="请输入正整数" class="kpms-textbox-money" Style="width: 50px;" /></span></span>
                <span class="filter-block"><span class="filter-block-lb">工号/名称/简拼</span><span>
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox></span></span>

                <span class="filter-block"><span class="filter-block-lb">到期日期</span><span>
                <asp:CheckBox ID="cbEndDate" runat="server" Text="" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateFrom" readonly="readonly"
                    compare="1" class="kpms-textbox-comparedate" />
                至
                <zhongsoft:XHtmlInputText runat="server" ID="txtEndDateTo" readonly="readonly" compare="1"
                    class="kpms-textbox-comparedate" /></span></span>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" AllowPaging="true"
        AllowSorting="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="LABORCONTRACTEXPIRENTDTID"
        HideFieldOnExport="序号,查看" RowStyle-Wrap="false" OnExport="gvList_Export" ShowEmptyDataHeader="true">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME" SortExpression="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE" SortExpression="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME" SortExpression="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="到期日期" DataField="ENDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="合同归属单位" DataField="CONTRACTBELONGTO">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="建议签订年限" DataField="SUGGESTYEARS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门及个人意见" DataField="DEPTANDUSERIDEA">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField HeaderText="分管院领导意见" DataField="LEADERIDEA">
            </zhongsoft:LightBoundField> 
            <zhongsoft:LightBoundField HeaderText="流程状态" DataField="WFlag"  ItemStyle-Width="30px">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="备注" ItemStyle-Width="200px" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lbMemo" runat="server" Text='<%#Eval("MEMO") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                        Maxtext="512" TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
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

        function checkEndDate() {
            var startdate = $("#<%=txtEndDateFrom.ClientID %>").val();
            var enddate = $("#<%=txtEndDateTo.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("合同到期日下限应早于上限！");
                return false;
            }
            else
                return true;
        }


        function checkForm() {
            if (checkEndDate())
                return true;
            else
                return false;
        }


        //查看流程页面
        function DetailItem(FId, PId) {
            var param = { formId: FId, prcInstId: PId };
            var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
            window.open(urlStr);
            return false;
        }
       

    </script>
</asp:Content>
