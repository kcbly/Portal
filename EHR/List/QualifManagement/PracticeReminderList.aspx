<%@ Page Title="执业注册资质到期提醒" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="PracticeReminderList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.PracticeReminderList" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
                <span class="filter-block"><span><zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                    RepeatColumns="3" RepeatDirection="Horizontal" />
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                        <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                            RepeatDirection="Horizontal" />
                    </ContentTemplate>
                </asp:UpdatePanel></span></span> 
                <span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
                <zhongsoft:LightTextBox ID="tbPersonnel" runat="server" Width="100px" CssClass="kpms-textboxsearch"
            EnableTheming="false">
                </zhongsoft:LightTextBox> </span></span>
                <span class="filter-block"><span class="filter-block-lb">性别</span><span>
                <zhongsoft:LightDropDownList ID="ddlSex" runat="server" EnableTheming="false">
                </zhongsoft:LightDropDownList> </span></span>

                 <span class="filter-block"><span><asp:CheckBox ID="cbAge" runat="server" Text="年龄" />
                <zhongsoft:LightTextBox ID="tbStartAge" runat="server" Width="30px" regex="^\d+$"
                    MaxLength="3" errmsg="请输入最多两位正整数" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>至
                <zhongsoft:LightTextBox ID="tbEndAge" runat="server" Width="30px" regex="^\d+$" MaxLength="3"
                    errmsg="请输入最多两位正整数" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox></span></span> 
                <span class="filter-block"><span class="filter-block-lb">人员状态</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlState" EnableTheming="false">
                </zhongsoft:LightDropDownList> </span></span>
                <span class="filter-block"><span class="filter-block-lb">注册证书编号</span><span>
                <zhongsoft:LightTextBox ID="tbRegisteredQuflifCode" runat="server" Width="150px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox> </span></span>
                <span class="filter-block"><span class="filter-block-lb">注册单位</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlIssueUnit" EnableTheming="false">
                </zhongsoft:LightDropDownList> </span></span> 
                <span class="filter-block"><span class="filter-block-lb">资格证书名称</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationName" EnableTheming="false">
                </zhongsoft:LightDropDownList> </span></span>
                <span class="filter-block"><span class="filter-block-lb">资格证书专业</span><span>
                <zhongsoft:LightTextBox ID="tbQuaflificationProfession" runat="server" Width="150px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox> </span></span>
                <span class="filter-block"><span class="filter-block-lb">资格证书编号</span><span>
                <zhongsoft:LightTextBox ID="tbQuaflificationCode" runat="server" Width="150px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox> </span></span>

                 <span class="filter-block"><span><asp:CheckBox ID="cbGetDate" runat="server" Text="资格证书取得日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndGetDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1">
                </zhongsoft:XHtmlInputText></span></span> 
                 <span class="filter-block"><span><asp:CheckBox ID="cbDate" runat="server" Text="注册发证日期" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="2">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="2">
                </zhongsoft:XHtmlInputText></span></span> 
                 <span class="filter-block"><span><asp:CheckBox ID="cbEffectiveEndTime" runat="server" Text="注册有效期至" />
                <zhongsoft:XHtmlInputText type="text" ID="txtStartEffectiveEndTime" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="3">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText type="text" ID="txtEndEffectiveEndTime" runat="server"
                    readonly="readonly" class="kpms-textbox-comparedate" compare="3">
                </zhongsoft:XHtmlInputText></span></span> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvPractice" runat="server" AutoGenerateColumns="false"
        AllowPaging="true" PageSize="15" DataKeyNames="PRACTICEQUALIFID" AllowFrozing="true"
        FrozenColNum="5" ShowExport="true" BindGridViewMethod="BindPraticeGrid" AllowSorting="true"
        HideFieldOnExport="查看" UseDefaultDataSource="true" RowStyle-Wrap="false">
        <Columns>
             <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="PERSONNELCODE" SortExpression="PERSONNELCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="PERSONNELNAME" SortExpression="PERSONNELCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书级别" DataField="QUAFLIFICATIONLEVEL" SortExpression="RegisteredQualifLevel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书名称" DataField="QUAFLIFICATIONNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书专业" DataField="QUAFLIFICATIONPROFESSION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书编号" DataField="QUAFLIFICATIONCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="资格证书取得日期" DataField="QUAFLIFICATIONGETDATE"
                DataFormatString="{0:yyyy-MM-dd}" SortExpression="QUAFLIFICATIONGETDATE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册发证日期" DataField="EFFECTIVESTARTTIME" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册证书编号" DataField="REGISTEREDQUALIFCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册有效期至" DataField="EFFECTIVEENDTIME" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="距有效期_月" DataField="EFFECTIVEMONTH1">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="执业印章号" DataField="REGISTRATIONCODE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册专业1" DataField="MAINPROFESSION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册专业2" DataField="SECONDPROFESSION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="注册单位" DataField="ISSUEUNIT">
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
            <zhongsoft:LightBoundField HeaderText="一次性奖励日期" DataField="REWARDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="一次性奖励金额（元）" DataField="REWARDMONEY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月奖励津贴开始日期" DataField="MANTHWARDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="月奖励津贴金额(元)" DataField="MANTHWARDMONEY" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" DataParamFields="PRACTICEQUALIFID"  EditItemClick="ViewPractice">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
         function ViewPractice(bizId) {
            var url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/PracticeEditor.aspx?&actionType=1&bizId=" + bizId;
            showDivDialog(encodeURI(url), null, 1000, 800, null);
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
