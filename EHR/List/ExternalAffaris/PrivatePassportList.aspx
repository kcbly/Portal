<%@ Page  Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="PrivatePassportList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.PrivatePassportList" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
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
                是否借出
                <zhongsoft:LightDropDownList ID="ddlIsLoan" runat="server">
                </zhongsoft:LightDropDownList>
                是否过期
                <zhongsoft:LightDropDownList ID="ddlIsDated" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox Text="护照有效开始日期" runat="server" ID="cbPassportStartDate" />
                <zhongsoft:XHtmlInputText ID="txtStartPassportStartDate" runat="server" readonly="readonly"
                    compare="1" class="kpms-textbox-comparedate">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndPassportStartDate" runat="server" readonly="readonly"
                    compare="1" class="kpms-textbox-comparedate">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox Text="护照有效截止日期" runat="server" ID="cbPassportEndDate" />
                <zhongsoft:XHtmlInputText ID="txtStartPassportEndDate" runat="server" readonly="readonly"
                    compare="2" class="kpms-textbox-comparedate">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndPassportEndDate" runat="server" readonly="readonly"
                    compare="2" class="kpms-textbox-comparedate">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox Text="借出日期" runat="server" ID="cbLoanDate" />
                <zhongsoft:XHtmlInputText ID="txtSatrtLoanDate" runat="server" readonly="readonly"
                    compare="3" class="kpms-textbox-comparedate">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndLoanDate" runat="server" readonly="readonly"
                    compare="3" class="kpms-textbox-comparedate">
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
    <zhongsoft:LightPowerGridView ID="gvPrivate" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindPrivateGrid"
        ShowExport="true" HideFieldOnExport="全选" ShowPageSizeChange="true" DataKeyNames="PRIVATEPASSPORTID"
        OnRowDataBound="gvPrivate_RowDataBound" OnRowCommand="gvPrivate_RowCommand" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField HeaderText="性别" DataField="SEX">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="民族" DataField="NATION">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField HeaderText="身份证号" DataField="IDCARD">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生年月" DataField="BIRTHDAY">
            </zhongsoft:LightBoundField>
            <%--            <zhongsoft:LightBoundField HeaderText="出生地" DataField="HOMETOWN">
            </zhongsoft:LightBoundField>--%>
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
            <zhongsoft:LightBoundField HeaderText="护照有效<br />开始日期" DataField="PASSPORTSTARTDATE"
                HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效<br />截止日期" DataField="PASSPORTENDDATE"
                HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否借出" DataField="ISLOAN">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借出日期" DataField="LOANDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否过期" DataField="ISOVERDUED">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvPrivate.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
