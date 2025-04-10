<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BusinessPassportSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.BusinessPassportSelector"
    Title="选择因公护照" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="kpms-detsearch">
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
                人员类型
                <zhongsoft:LightDropDownList ID="ddlUserType" runat="server">
                </zhongsoft:LightDropDownList>
                工号/姓名/简称
                <zhongsoft:LightTextBox ID="tbUser" CssClass="kpms-textbox" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
                持有何种护照
                <zhongsoft:LightDropDownList ID="ddlPassportType" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox Text="护照有效开始日期" runat="server" ID="cbPassportStartDate" />
                <zhongsoft:XHtmlInputText ID="txtStartPassportStartDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndPassportStartDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox Text="护照有效截止日期" runat="server" ID="cbPassportEndDate" />
                <zhongsoft:XHtmlInputText ID="txtStartPassportEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndPassportEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="10"
        DataKeyNames="BUSINESSPASSPORTID" AutoGenerateColumns="false" BindJsonClick="true"
        OnJsonClick="addObject" JsonClickMode="onclick" OnRowCommand="gvList_RowCommand" UseDefaultDataSource = "true">
        <Columns>
           <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="SUBDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="持何种护照" DataField="PASSPORTTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照号码" DataField="PASSPORTNUMBER">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效</br>开始日期" DataField="PASSPORTSTARTDATE" HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效</br>截止日期" DataField="PASSPORTENDDATE" HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
