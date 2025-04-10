<%@ Page Title="学历及学位" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="AcademicDegreeList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsersView.AcademicDegreeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">姓名/工号</span><span>
        <zhongsoft:LightTextBox ID="tbUser" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">部门</span><span>
        <zhongsoft:LightTextBox ID="tbDeptName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">是否最高学历</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlIsDegree" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">是否单位送培</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlIsDWSPAcademic" class="kpms-ddlsearch" EnableTheming="false" Width="80px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">证书</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlCertificateName" class="kpms-ddlsearch" EnableTheming="false" Width="185px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvDegree" runat="server" AutoGenerateColumns="false" BindGridViewMethod="BindData"
        ShowExport="true" UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" PageSize="10" DataKeyNames="AcademicDegreeID"
        OnRowCommand="gvDegree_RowCommand" HideFieldOnExport="查看,编辑,删除">
        <Columns>
            <%--<zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>--%>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode" SortExpression="UserCode"></zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName"
                ItemStyle-Width="155px">
                <ItemTemplate>
                    <a onclick="return ViewCustomListLink('<%#Eval("AcademicDegreeID")%>');" style="color: Blue;">
                        <%#Eval("UserName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="deptName" SortExpression="deptName"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="入学时间" DataField="ENROLLMENTDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="ENROLLMENTDATE"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="毕业时间" DataField="GraduateDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="GraduateDate"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="教育类型/学历" DataField="Education" SortExpression="Education"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="教育/培训" DataField="EducationType" SortExpression="EducationType"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="证书" DataField="CertificateName" SortExpression="CertificateName"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="学制" DataField="SchoolingLength" SortExpression="SchoolingLength"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="从学单位类别" DataField="UnitCategory" SortExpression="UnitCategory"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="毕业院校" DataField="GraduateSchool" SortExpression="GraduateSchool"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否最高学历" DataField="IsDegree2" SortExpression="IsDegree2"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="是否单位送培标识" DataField="IsDWSPAcademic2" SortExpression="IsDWSPAcademic2"></zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true" SortExpression="Memo"></zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvDegree.CheckedClientID %>";
        //$KeyUrl = "/EHR/List/OrgUsers/AcademicDegreeEditor.aspx";
        //$isFlow = "0";
        function initCustomerPlugin() {
            $("#ctl00_btnView").hide();
        }
        function ViewCustomListLink(id) {
            var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/AcademicDegreeEditor.aspx";
            var actionType =1;
            url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: id });
            showDivDialog(encodeURI(url), null, 1150, 800);
            return false;
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
