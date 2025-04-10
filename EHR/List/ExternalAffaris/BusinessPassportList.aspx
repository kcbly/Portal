<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="BusinessPassportList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.BusinessPassportList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <%-- <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>--%>
    <table>
        <tr>
            <td align="left">
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
                <zhongsoft:XHtmlInputText ID="txtStartLoanDate" runat="server" readonly="readonly"
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
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:Button ID="btnNew" runat="server" class="searchbtn" Text="新建" OnClick="btnNew_Click"
        OnClientClick="return busPassItem('','2')"></asp:Button>
    <asp:Button ID="btNewBatch" runat="server" class="searchbtn" Text="批量处理" OnClick="btnNewBatch_Click"
        OnClientClick="return busPassItemBatch('','2')"></asp:Button>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>--%>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvBusiness" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" OnRowCommand="gvBusiness_RowCommand" AllowPaging="true"
        AllowFrozing="true" FrozenColNum="4" AllowSorting="true" BindGridViewMethod="BindBusinessGrid"
        ShowExport="true" ShowPageSizeChange="true" DataKeyNames="BUSINESSPASSPORTID"
        RowStyle-Wrap="false">
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
            <zhongsoft:LightBoundField HeaderText="持何种护照" DataField="PASSPORTTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照号码" DataField="PASSPORTNUMBER">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效</br>开始日期" DataField="PASSPORTSTARTDATE"
                HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="护照有效</br>截止日期" DataField="PASSPORTENDDATE"
                HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否借出" DataField="ISLOAN">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="借出日期" DataField="LOANDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否过期" DataField="ISOVERDUED">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="BUSINESSPASSPORTID"
                EditPageWidth="800px" EditPageHeight="700px" EditPageUrl="~/EHR/List/ExternalAffaris/BusinessPassportEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="BUSINESSPASSPORTID"
                EditPageWidth="800px" EditPageHeight="700px" EditPageUrl="~/EHR/List/ExternalAffaris/BusinessPassportEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                ItemStyle-HorizontalAlign="Center" DeleteText="您确定删除该记录吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function busPassItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/ExternalAffaris/BusinessPassportEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/ExternalAffaris/BusinessPassportEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }

        function busPassItemBatch(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 1000px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "/Portal/EHR/List/ExternalAffaris/BusinessPassportBatchEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "/Portal/EHR/List/ExternalAffaris/BusinessPassportBatchEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
