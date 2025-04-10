<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="AbroadInsuranceList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.AbroadInsuranceList" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
   <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%> 
    <table style="text-align:left">
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
                出访国家
                <zhongsoft:LightTextBox ID="tbVisitNation" CssClass="kpms-textbox" runat="server"
                    Width="60px">
                </zhongsoft:LightTextBox>
                是否过期
                <zhongsoft:LightDropDownList ID="ddlIsDate" runat="server">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox Text="保险有效开始日期" runat="server" ID="cbInsuranceStartDate" />
                <zhongsoft:XHtmlInputText ID="txtStartInsuranceStartDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndInsuranceStartDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                <asp:CheckBox Text="保险有效截至日期" runat="server" ID="cbInsuranceEndDate" />
                <zhongsoft:XHtmlInputText ID="txtStartInsuranceEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="2">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="txtEndInsuranceEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="2">
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
    <zhongsoft:LightPowerGridView ID="gvAbroad" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindAbroadGrid"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="ABROADINSURANCEID"
        RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
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
            <zhongsoft:LightBoundField HeaderText="出生年月" DataField="BIRTHDAY" DataFormatString="{0:yyyy-MM-dd}">
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
            <zhongsoft:LightBoundField HeaderText="出访国家" DataField="VISITNATION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="上一次购买<br />截止日期" DataField="INSURANCEPERDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保险有效<br />开始日期" DataField="INSURANCESTARTDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保险有效<br />截止日期" DataField="INSURANCEENDDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="保险<br />是否过期" DataField="ISDATED" HtmlEncode="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
<script type="text/javascript">
    $gridCheckedClientID = "<%=gvAbroad.CheckedClientID %>";
</script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
