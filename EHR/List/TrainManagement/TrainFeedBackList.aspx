<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainFeedBackList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainFeedBackList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                年度
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
                </zhongsoft:LightDropDownList>
                部门
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
                </zhongsoft:LightDropDownList>
                工号/名称/简拼
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                培训项目名称
                <zhongsoft:LightTextBox ID="tbTrainProjectName" CssClass="kpms-textbox" runat="server"
                    Width="250px">
                </zhongsoft:LightTextBox>
                培训类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                培训老师
                <zhongsoft:LightTextBox ID="tbInstructorName" CssClass="kpms-textbox" runat="server"
                    Width="50px">
                </zhongsoft:LightTextBox>
                培训起始日期
                <zhongsoft:XHtmlInputText ID="txtTrainStDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                培训截止日期
                <zhongsoft:XHtmlInputText ID="txtTrainEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                培训形式
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="序号,查看" DataKeyNames="TRAINFEEDBACKFORMID"
        BindGridViewMethod="BindDataGrid" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="USERCODE" HeaderText="工号" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DEPTNAME" HeaderText="部门" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目" ItemStyle-Width="10%" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="INSTRUCTORNAMES" HeaderText="培训老师" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINSTDATE" HeaderText="培训起始日期" ItemStyle-Width="8%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINENDDATE" HeaderText="培训截止日期" ItemStyle-Width="8%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="HARVEST" HeaderText="本次培训最大收获" ItemStyle-Width="15%" MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ENHANCE" HeaderText="课程需加强的地方" ItemStyle-Width="15%" MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SUGGEST" HeaderText="建议或还需要的培训" ItemStyle-Width="15%" MaxLength="20">
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
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
