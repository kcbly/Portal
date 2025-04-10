<%@ Page Language="C#" AutoEventWireup="true" Title="离退休台账" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WorkRetireList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.WorkRetireList" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="toolBar">
                     <span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
                    <asp:TextBox ID="tbPersonnel" runat="server" Width="120px" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span></span>
                     <span class="filter-block"><span class="filter-block-lb">职务</span><span>
                    <asp:TextBox ID="tbPost" runat="server" Width="120px" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox></span></span>
                     <span class="filter-block"><span class="filter-block-lb">性别</span><span>
                    <asp:DropDownList runat="server" ID="ddlSex" Width="60px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList></span></span>
<%--
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                                 <span content="searchResult">查找</span></asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                 <span>重置</span></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click"
                        OnClientClick="return NewItem('','2')" Visible="false">
                                <span>新建</span></asp:LinkButton>--%>
                     <span class="filter-block"><span class="filter-block-lb">离退类别</span><span>
                    <asp:DropDownList ID="ddlRetiredType" runat="server" Width="120px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList></span></span>
                     <span class="filter-block"><span class="filter-block-lb">离退日期</span><span>
                    <asp:CheckBox ID="cbDate" runat="server" Text="" />
                    <input type="text" compare='1' id="tbStartDate" runat="server" class="kpms-textbox-comparedate"
                        readonly="readonly" />
                    至
                    <input type="text" compare='1' id="tbEndDate" runat="server" class="kpms-textbox-comparedate"
                        readonly="readonly" /></span></span>
                         <span class="filter-block"><span class="filter-block-lb">是否身故</span><span>
                    <asp:DropDownList ID="ddlIsDeath" runat="server" Width="90px" CssClass="kpms-ddlsearch" EnableTheming="False" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="">全部</asp:ListItem>
                        <asp:ListItem Value="True">已身故</asp:ListItem>
                        <asp:ListItem Value="False">未身故</asp:ListItem>
                    </asp:DropDownList></span></span>
                     <span class="filter-block"><span class="filter-block-lb">身故日期</span><span>
                    <asp:CheckBox ID="cbDeathTime" runat="server" />
                    <input type="text" compare='2' id="txtDStartDate" runat="server" class="kpms-textbox-comparedate"
                        readonly="readonly" />
                    至
                    <input type="text" compare='2' id="txtDEndDate" runat="server" class="kpms-textbox-comparedate"
                        readonly="readonly" /></span></span>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="listGrid">
                 
    <zhongsoft:FlexGridView ID="gvList" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false"
        AllowPaging="true" OnChangeSize="changeSize" OnDragCol="dragCol" OnDragTo="dragColTo"
        DragToId="group-filter" OnPageSizeChanged="gvList_PageSizeChanged" ShowPageSizeChange="true"
        DataKeyNames="RETIREDUSERID,UserId" OnRowCommand="gvList_RowCommand" ShowExport="true"
        AllowSorting="true" ShowGroup="true" BindGridViewMethod="BindDataGrid">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="工号" DataField="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="民族" DataField="Nation">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="离（退）时所在部门" DataField="RETIREDDEPTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="离（退）时职务" DataField="RETIREDRANKNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="技术职称" DataField="RETIREDSKILLTITLE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="离（退）类别" DataField="RETIREDTYPE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="离（退）日期" DataField="RETIREDDATE" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="学历" DataField="RETIREDEDUCATION">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="个人身份" DataField="RETIREDUSERIDENTITY">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作日期" DataField="WorkDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="入党日期" DataField="PartyDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="联系方式" DataField="MobilePhone">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生年月" DataField="Birthday" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="籍贯" DataField="HOMETOWN">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="出生地" DataField="BIRTHPLACE">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="住址" DataField="FamilyAddress">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                EditIdField="RETIREDUSERID" EditPageWidth="950px" EditPageHeight="600px" EditPageUrl="~/EHR/List/OrgUsers/WorkRetireEditor.aspx">
            </zhongsoft:LightButtonField>
                                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                            EditIdField="RETIREDUSERID" EditPageWidth="950px" EditPageHeight="600px"
                            EditPageUrl="~/EHR/List/OrgUsers/WorkRetireEditor.aspx">
                        </zhongsoft:LightButtonField>
      <%--      <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                Visible="false">
            </zhongsoft:LightButtonField>--%>
        </Columns>
    </zhongsoft:FlexGridView>
    <script type="text/javascript">

        //打开明细页面
        function NewItem(bizId, acType) {
            var stringFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";
            if (acType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkRetireEditor.aspx?&actionType=" + acType;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/WorkRetireEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
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
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
