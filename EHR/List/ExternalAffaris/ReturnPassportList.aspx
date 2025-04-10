<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ReturnPassportList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.ReturnPassportList" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> --%>
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
                工号/名称/简拼
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
                <asp:CheckBox Text="借出日期" runat="server" ID="cbLoanDate" />
                <zhongsoft:XHtmlInputText ID="txtSatrtLoanDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndLoanDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvReturn" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" AllowPaging="true" AllowFrozing="true" FrozenColNum="4"
        AllowSorting="true" BindGridViewMethod="BindReturnGrid" ShowExport="true" ShowPageSizeChange="true"
        DataKeyNames="BUSINESSPASSPORTID" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="SEX">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="民族" DataField="NATION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="身份证号" DataField="IDCARD">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生年月" DataField="BIRTHDAY" DataFormatString="{0:yyyy-MM}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生地" DataField="HOMETOWN">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="SUBDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="职务" DataField="POSITION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="职称" DataField="TECHNICALPOST">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照号码" DataField="PASSPORTNUMBER">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效<br />开始日期" DataField="STARTDATE" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效<br />截止日期" DataField="ENDDATE" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借出日期" DataField="LOANDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
