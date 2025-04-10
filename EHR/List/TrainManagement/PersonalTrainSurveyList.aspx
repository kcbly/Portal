<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonalTrainSurveyList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.PersonalTrainSurveyList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
<%--    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
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
                学历
                <zhongsoft:LightDropDownList runat="server" ID="ddlEducation">
                </zhongsoft:LightDropDownList>
                工号/名称/简拼
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                年度
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
                </zhongsoft:LightDropDownList>
                人员类别
                <zhongsoft:LightDropDownList runat="server" ID="ddlCategory">
                </zhongsoft:LightDropDownList>
                年龄
                <asp:CheckBox ID="cbAge" runat="server" Text="" />
                <zhongsoft:LightTextBox type="text" ID="tbMinAge" runat="server" regex="^\d{1,2}$"
                    errmsg="请输入100以内正整数" class="kpms-textbox-money" Style="width: 50px;" />
                至
                <zhongsoft:LightTextBox type="text" ID="tbMaxAge" runat="server" regex="^\d{1,2}$"
                    errmsg="请输入100以内正整数" class="kpms-textbox-money" Style="width: 50px;" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="序号,查看" DataKeyNames="PERSONALTRAINSURVEYFORMID"
        BindGridViewMethod="BindDataGrid" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="USERCODE" HeaderText="工号" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DEPTNAME" HeaderText="部门" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="AGE" HeaderText="年龄">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="EDUCATION" HeaderText="学历" >
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="PERSONNELCATEGORY" HeaderText="人员类别" ItemStyle-Width="20%">
            </zhongsoft:LightBoundField>--%>
            <%--            <zhongsoft:LightBoundField DataField="EDUCATION" HeaderText="职务" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="FILLDATE" HeaderText="填表日期"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField DataField="TRAINSTATUSSURVEY" HeaderText="培训现状调查" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINREQUIRESURVEY" HeaderText="培训需求调查" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SUGGEST" HeaderText="建议" MaxLength="10">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" >
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return DetailItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">


        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        //查看流程页面
        function DetailItem(FId, PId) {
            var param = { formId: FId, prcInstId: PId };
            var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
            window.open(urlStr);
            return false;
        }

        function checkAge() {
            var minAge = $("#<%=tbMinAge.ClientID%>").val();
            var maxAge = $("#<%=tbMaxAge.ClientID%>").val();
            if (parseInt(minAge, 10) > parseInt(maxAge, 10)) {
                return false;
            } else {
                return true;
            }

        }


        function check() {
            if (checkAge()) {
                return true;
            }
            else {
                alert("输入的年龄下限大于上限，请重新输入");
                $("#<%=tbMaxAge.ClientID%>").focus();
                return false;
            }
        }


        $("#ctl00_btnQuery").click(function () {
            if ($("#<%=cbAge.ClientID %>").is(":checked")) {
                if (check())
                    return true;
                else
                    return false;
            }
            else
                return true;
        });



    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
