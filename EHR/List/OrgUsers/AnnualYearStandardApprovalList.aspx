<%@ Page Language="C#" Title="年休假标准核定台帐" AutoEventWireup="true" CodeBehind="AnnualYearStandardApprovalList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.AnnualYearStandardApprovalList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">核定年份</span><span>
        <zhongsoft:LightDropDownList ID="ddlApprovalYear" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">工号/名称/简拼</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false">
        </zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">所属部门</span><span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">参加工作日期</span><span>
        <asp:CheckBox ID="cbDate" runat="server" Text="" />
        <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDateFrom" readonly="readonly"
            compare="1" class="kpms-textbox-comparedate" />
        至
        <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDateTo" readonly="readonly" compare="1"
            class="kpms-textbox-comparedate" />
    </span></span><span class="filter-block"><span class="filter-block-lb">正式工/外聘工</span><span>
        <zhongsoft:LightDropDownList ID="ddlFormalExternal" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
            <asp:ListItem Text="全部" Value=""></asp:ListItem>
            <asp:ListItem Text="正式工" Value="正式工"></asp:ListItem>
            <asp:ListItem Text="外聘工" Value="外聘工"></asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnApproval" class="searchbtn" OnClick="lbtnApprovalAnnualLeaveNextYear">
        <span>核定明年年休假</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="LinkButton2" class="searchbtn" OnClick="lbtnApprovalAnnualLeaveCancelNextYear">
        <span>取消核定明年年休</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="LinkButton1" class="searchbtn" OnClick="lbtnApprovalAnnualLeaveThisYear">
        <span>核定今年年休假</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="LinkButton3" class="searchbtn" OnClick="lbtnApprovalAnnualLeaveCancelThisYear">
        <span>取消核定今年年休</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" AllowSorting="true" BindGridViewMethod="BindDataGrid" OnPageSizeChanged="gvList_PageSizeChanged"
        HideFieldOnExport="全选" ShowPageSizeChange="true" DataKeyNames="ANNUALLEAVEAPPROVALID"
        UseDefaultDataSource="true" ShowExport="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="核定年份" DataField="APPROVALYEAR">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="USERCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="USERNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属部门" DataField="DEPTNAME" HeaderStyle-Width="300px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="SEX">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年龄" DataField="AGE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工龄" DataField="WORKINGAGE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="正式工/外聘工" DataField="FORMALEXTERNAL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年休假标准(天/年)" DataField="ANNUALLEAVESTDAYS"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际休假天数" DataField="ACTLEAVEDAYS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="剩余年休假天数" DataField="SURPLUSLEAVEDAYS" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";


        function checkDate() {
            var startdate = $("#<%=txtWorkDateFrom.ClientID %>").val();
            var enddate = $("#<%=txtWorkDateTo.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("参加工作时间下限应早于参加工作时间上线限！");
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
