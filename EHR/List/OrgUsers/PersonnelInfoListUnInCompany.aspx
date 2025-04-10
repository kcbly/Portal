<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelInfoListUnInCompany.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelInfoListUnInCompany" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
        RepeatColumns="3" RepeatDirection="Horizontal" />
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
            <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                RepeatDirection="Horizontal" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <span class="filter-block"><span class="filter-block-lb">人员类别</span><span>
        <asp:DropDownList runat="server" ID="ddlCategories" EnableTheming="false" CssClass="kpms-ddl" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            Style="width: 120px; margin: 3px 0px;">
        </asp:DropDownList>
    </span></span>

    <span class="filter-block" id="trInCompany" runat="server" visible="false"><span class="filter-block-lb">是否入库</span><span>
        <asp:DropDownList runat="server" ID="ddlInCompany" EnableTheming="false" CssClass="kpms-ddl" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            Style="width: 155px; margin: 3px 0px;">
            <asp:ListItem Value="True" Text="已入库"></asp:ListItem>
            <asp:ListItem Value="False" Text="未入库" Selected="True"></asp:ListItem>
        </asp:DropDownList>
    </span></span>

    <span class="filter-block" id="trRetire" runat="server" visible="false"><span class="filter-block-lb">退出类别</span><span>
        <asp:DropDownList ID="ddlRetireType" runat="server" EnableTheming="false" CssClass="kpms-ddl" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
            Style="width: 80px; margin: 3px 0px;">
        </asp:DropDownList></span></span>

    <span class="filter-block"><span class="filter-block-lb">工号/姓名</span><span>
        <asp:TextBox ID="tbPersonnel" runat="server" Width="120px" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
    </span></span>

    <span class="filter-block" id="trRetire1" runat="server" visible="false"><span class="filter-block-lb">退出日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" compare="1" ID="txtRetiredTime" readonly="readonly"
            class="kpms-textbox-comparedate" />
        <zhongsoft:XHtmlInputText runat="server" compare="1" ID="txtRetiredTime2" readonly="readonly"
            class="kpms-textbox-comparedate" />
    </span></span>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <asp:LinkButton runat="server" ID="btnNew" OnClick="btnNew_Click" class="searchbtn"
                    EnableTheming="false" OnClientClick="return PersonnelItem(2)" Visible="false">
                         <span>新建</span>
                </asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="lbtnNewOut" OnClick="lbtnNewOut_Click" class="searchbtn"
                    EnableTheming="false" OnClientClick="return NewOutItem(2)" Visible="false">
                         <span>新建</span>
                </asp:LinkButton>
            </td>
            <td>
                <asp:LinkButton ID="btnInCompany" runat="server" OnClientClick="return confirm('您确定将选中人员全部入库吗？')" class="searchbtn"
                    OnClick="btnInCompany_Click" Visible="false" EnableTheming="false">
                        <span>批量入库</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
        ShowExport="true" OnExport="gvList_Export" AllowSorting="true" OnSorting="gvList_Sorting"
        AllowPaging="true" DataKeyNames="UserId" OnRowCommand="gvList_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="全选" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                Visible="false">
                <HeaderTemplate>
                    <asp:CheckBox runat="server" ID="cbSelAll" Text="全选" onclick="AllChecked(this)" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="cbSel" />
                    <input type="hidden" runat="server" id="hiPersonnelChangeID" value='<%#Eval("UserId") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="查看" Visible="false">
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbView" runat="server" CommandName="viewdata" EnableTheming="false">
						<img alt="" onclick='return WorkStaffChange("1","<%#Eval("USERCHANGEID")%>");' src="../../../Themes/Images/btn_dg_view.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="编辑" Visible="false">
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="editdata" EnableTheming="false">
						<img alt=""  onclick='return PersonnelItem("3","<%#Eval("UserId")%>");'  src="../../../Themes/Images/btn_dg_edit.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="入库" Visible="false">
                <ItemStyle HorizontalAlign="Center" Width="30px" />
                <ItemTemplate>
                    <asp:LinkButton ID="lbInCompany" runat="server" CommandName="incompany" CommandArgument='<%#Eval("UserId")%>'
                        EnableTheming="false">
                        <img alt="入库"  title="入库" onclick="if(!confirm('您确认要入库吗？')) return false;" src="../../../Themes/Images/btn_consign.gif"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="删除" Visible="false">
                <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDelete" runat="server" CommandArgument='<%#Eval("UserId") %>'
                        CommandName="deletedata" EnableTheming="false">
						 <img  alt=""  onclick="if(!confirm('您确认要删除吗？')) return false;" src="../../../Themes/Images/btn_dg_delete.gif"  />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="工号" DataField="LoginId" ItemStyle-Width="40px" SortExpression="LoginId" />
            <asp:BoundField HeaderText="姓名" DataField="UserName" ItemStyle-Width="50px" SortExpression="UserName" />
            <asp:BoundField HeaderText="性别" DataField="Sex" ItemStyle-Width="40px" SortExpression="Sex" />
            <asp:BoundField HeaderText="出生日期" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}"
                SortExpression="Birthday" />
            <asp:BoundField HeaderText="年龄" DataField="Age" SortExpression="Age" />
            <asp:BoundField HeaderText="部门" DataField="OrgUnitName" SortExpression="OrgUnitName" />
            <asp:BoundField HeaderText="职务" DataField="RANKNAME" ItemStyle-Width="100px" SortExpression="RANKNAME" />
            <asp:BoundField HeaderText="技术职称" DataField="SKILLTITLE" SortExpression="SKILLTITLE" />
            <asp:BoundField HeaderText="党派名称" DataField="PoliticalLandscape" ItemStyle-Width="60px"
                SortExpression="PoliticalLandscape" />
            <asp:BoundField HeaderText="文化程度" DataField="Education" SortExpression="Education" />
            <asp:BoundField HeaderText="退出时间" DataField="CHANGEDATE" DataFormatString="{0:yyyy-MM-dd}"
                Visible="false" SortExpression="CHANGEDATE" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        //全选设置
        function AllChecked(obj) {
            $("input[id*=Sel]").each(function () {
                $(this)[0].checked = obj.checked;
            });
        }

        //人员基本信息明细页面
        function PersonnelItem(actionType, bizId) {
            var stringFeatures = "dialogHeight:900px; dialogWidth: 1000px;resizable: Yes; scroll:auto; status: no;";
            var IsInCompany = '<%=IsInCompany %>';
            var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelInfoEditorNew.aspx?&actionType=" + actionType;
            if (actionType == "1" || actionType == "3") {
                url += "&bizId=" + bizId;
            }

            url += "&IsInCompany=" + IsInCompany;
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }

        //退出明细页面
        function NewOutItem(acType, bizId) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkRetireEditor.aspx?&showOther=0&actionType=" + acType + "&retireTypeId=";
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkRetireEditor.aspx?&showOther=0&actionType=" + acType + "&bizId=" + bizId + "&retireTypeId=";
            }
            var ret = window.showModalDialog(url, null, stringFeatures)

            if (acType == "1") {
                return false;
            }

            if (ret == null) {
                return false;
            }
            return true;
        }

        //人事异动
        function WorkStaffChange(acType, bizId) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/UserChange/WorkStaffChangeEditor_New.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/UserChange/WorkStaffChangeEditor_New.aspx?&actionType=" + acType + "&bizId=" + bizId;
            }
            var ret = window.showModalDialog(url, null, stringFeatures)
            if (acType == "1") {
                return false;
            }

            if (ret == null) {
                return false;
            }
            return true;
        }


        function setQueryWidth() {
            return 550;
        }

        function setQueryHeight() {
            return 250;
        }
    </script>
</asp:Content>
