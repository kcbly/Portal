<%@ Page Title="特殊岗位资格管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="SpecialtyPositionList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.SpecialtyPositionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>
        <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
            RepeatColumns="3" RepeatDirection="Horizontal" />
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                    RepeatDirection="Horizontal" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">资格证书名称</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationName">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span class="filter-block-lb">资格证书专业</span><span>
        <zhongsoft:LightTextBox ID="tbQuaflificationProfession" runat="server" Width="150px" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>

    <span class="filter-block"><span class="filter-block-lb">资格证书编号</span><span>
        <zhongsoft:LightTextBox ID="tbQuaflificationCode" runat="server" Width="150px" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>

    <span class="filter-block"><span>
        <asp:CheckBox ID="cbGetDate" runat="server" Text="资格证书取得日期" />
        <zhongsoft:XHtmlInputText type="text" ID="txtStartGetDate" runat="server" readonly="readonly"
            class="kpms-textbox-comparedate" compare="1">
        </zhongsoft:XHtmlInputText>
        至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
    </span></span>

    <span class="filter-block"><span>
        <asp:CheckBox ID="cbEffectiveEndTime" runat="server" Text="资格有效期至" />
        <zhongsoft:XHtmlInputText type="text" ID="txtStartEffectiveEndTime" runat="server"
            readonly="readonly" class="kpms-textbox-comparedate" compare="3">
        </zhongsoft:XHtmlInputText>
        至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndEffectiveEndTime" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="3">
                </zhongsoft:XHtmlInputText>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
        <zhongsoft:LightTextBox ID="tbPersonnel" runat="server" Width="100px" CssClass="kpms-search" EnableTheming="false">
        </zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">性别</span><span>
        <zhongsoft:LightDropDownList ID="ddlSex" runat="server">
        </zhongsoft:LightDropDownList></span></span>
    <span class="filter-block"><span>
        <asp:CheckBox ID="cbAge" runat="server" Text="年龄" />
        <zhongsoft:LightTextBox ID="tbStartAge" runat="server" Width="30px" regex="^\d+$"
            MaxLength="3" errmsg="请输入最多两位正整数" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox>至
                <zhongsoft:LightTextBox ID="tbEndAge" runat="server" Width="30px" regex="^\d+$" MaxLength="3"
                    errmsg="请输入最多两位正整数" CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block">
        <span class="filter-block-lb">人员状态</span><span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlState">
            </zhongsoft:LightDropDownList></span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="lbtnUpdate" EnableTheming="false" AccessLevel="2" OnClientClick="return AddSpecialty()"
        CssClass="subtoolbarlink"> <span>
        <img  src="/Portal/Themes/Images/btn_new.gif"  width="16" height="16"/>新建</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvSpecialty" runat="server" AutoGenerateColumns="false"
        OnRowCommand="gvSpecialty_RowCommand" AllowPaging="true" DataKeyNames="PRACTICEQUALIFID"
        ShowExport="true" BindGridViewMethod="BindSpecialtyGrid"
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看,编辑,删除">
        <Columns>
             <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="PERSONNELCODE" SortExpression="PERSONNELCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="PERSONNELNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书级别" DataField="QUAFLIFICATIONLEVEL">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书名称" DataField="QUAFLIFICATIONNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书专业" DataField="QUAFLIFICATIONPROFESSION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书编号" DataField="QUAFLIFICATIONCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书<br/>取得日期" DataField="QUAFLIFICATIONGETDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格<br/>有效期至" DataField="EFFECTIVEENDTIME"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="SEX">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年龄" DataField="AGE" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="人员状态" DataField="STATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="科室" DataField="SUBDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="身份证号" DataField="IDENTITYCARDNO">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月工资奖励<br/>开始日期" DataField="MANTHWARDDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月工资奖励<br/>金额(元)" DataField="MANTHWARDMONEY"
                ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月工资奖励<br/>终止日期" DataField="MANTHWARDDATE"
                DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" EditItemClick="ViewSpecialty" DataParamFields="PRACTICEQUALIFID">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="EditSpecialty" DataParamFields="PRACTICEQUALIFID">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" DeleteText="您确认删除吗？">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:LinkButton runat="server" Style="display: none" class="searchbtn" ID="btnList" OnClick="btnList_Click"></asp:LinkButton>
    <script type="text/javascript">
        function AddSpecialty() {
            var url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=2";
            showDivDialog(url, "", 800, 600, callBack);
            return false;
        }
        function EditSpecialty(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=3&bizId=" + bzid;
            showDivDialog(url, "", 800, 600, callBack);
            return false;
        }
        function ViewSpecialty(bzid) {
            var url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/SpecialtyPositionEditor.aspx?&actionType=1&bizId=" + bzid;
            showDivDialog(url, "", 800, 600, null);
            return false;
        }
        function callBack() {
            <%=Page.GetPostBackEventReference(this.btnList,"") %>;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
