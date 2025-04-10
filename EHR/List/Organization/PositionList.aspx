<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PositionList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.PositionList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <base target="_self" />
    <link href="../../../Themes/Styles/objfilter.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="../../../UI/Script/groupgrid.js"></script>
</head>
<body onkeydown="search();">
    <form id="form1" runat="server">
        <div style="min-width: 1100px; _width: 1100px;">
            <table width="100%">
                <tr>
                    <td width="20%" valign="top" style="border: 1px #6699FF solid;">
                        <asp:TreeView ID="tvOrganizationTree" runat="server" OnSelectedNodeChanged="tvOrganizationTree_SelectedNodeChanged"
                            Height="100%" Width="100%" ShowLines="True">
                            <SelectedNodeStyle BackColor="#F7F7F7" />
                        </asp:TreeView>
                    </td>
                    <td valign="top">
                        <table width="100%" class="tz-table">
                            <tr>
                                <td class="tz-toolbar">
                                    <table width="100%">
                                        <tr>
                                            <td>
                                                <span class="filter-block"><span class="filter-block-lb">岗位编号/名称</span><span>
                                                    <asp:TextBox ID="tbPosition" runat="server" MaxLength="20" CssClass="kpms-textboxsearch"
                                                        EnableTheming="false" Width="120px"></asp:TextBox></span></span><span class="filter-block"><span
                                                            class="filter-block-lb">所属职务</span><span>
                                                                <asp:TextBox ID="tbSubordinatePost" runat="server" CssClass="kpms-textboxsearch"
                                                                    EnableTheming="false" MaxLength="20" Width="120px"></asp:TextBox></span></span>
                                                <span class="filter-block"><span class="filter-block-lb">岗位分类</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlPositionClassify" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
                                                        EnableTheming="false" Width="120px">
                                                    </asp:DropDownList>
                                                </span></span><span class="filter-block"><span class="filter-block-lb">是否撤销</span><span>
                                                    <asp:DropDownList ID="ddlFlag" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="" Text="全部" Selected="True"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="未撤销"></asp:ListItem>
                                                        <asp:ListItem Value="0" Text="已撤销"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </span></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="clear: both">
                                                    <div style="float: left">
                                                        <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClientClick="return AddItem('')">  <img alt ="" src="../../../Themes/Images/btn_add.gif" />
                                                <span>新建</span></asp:LinkButton>
                                                        <asp:LinkButton runat="server" ID="btnMerger" class="searchbtn" OnClientClick="return MergerPosition()">  <img alt ="" src="../../../Themes/Images/btn_editor.gif" />
                                                <span>合并</span></asp:LinkButton>
                                                        <asp:LinkButton runat="server" ID="btnSplit" class="searchbtn" OnClientClick="return SplitPosition()">     <img alt ="" src="../../../Themes/Images/btn_editor.gif" />
                                                <span>分离</span></asp:LinkButton>
                                                    </div>
                                                    <div style="float: right">
                                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                                                <span content="searchResult">查找</span></asp:LinkButton>
                                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                                 <span>重置</span></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" PageSize="10"
                                ShowExport="true" DataKeyNames="POSITIONID" HideFieldOnExport="编辑,撤销" OnRowCommand="gvList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightBoundField HeaderText="岗位编号" DataField="PositionCode" SortExpression="PositionCode">
                                    </zhongsoft:LightBoundField>
                                    <asp:TemplateField HeaderText="岗位名称" ItemStyle-HorizontalAlign="left" SortExpression="PositionName"
                                        ItemStyle-Width="155px">
                                        <ItemTemplate>
                                            <a onclick="return ViewItem('<%#Eval("PositionID")%>');" style="color: Blue;">
                                                <%#Eval("PositionName")%>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <zhongsoft:LightBoundField HeaderText="岗位职级" DataField="POSITIONLEVEL" SortExpression="POSITIONLEVEL">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="所属职务" DataField="BELONGRANK" SortExpression="BELONGRANK">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="岗位分类" DataField="PositionClassify" SortExpression="PositionClassify">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="成立日期" DataField="SETUPDATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="SETUPDATE">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="撤销日期" DataField="UNDODATE" DataFormatString="{0:yyyy-MM-dd}" SortExpression="UNDODATE">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="岗位定编人数" DataField="PersonsNum" ItemStyle-HorizontalAlign="Right" SortExpression="PersonsNum">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="岗位缺编人数" DataField="LessNum" ItemStyle-HorizontalAlign="Right" SortExpression="LessNum">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="岗位超编人数" DataField="OutterNum" ItemStyle-HorizontalAlign="Right" SortExpression="OutterNum">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="AddItem" DataParamFields="PositionID">
                                    </zhongsoft:LightButtonField>
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="撤销" CausesValidation="false" DeleteText="确定要撤销该岗位吗？">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <script type="text/javascript">
            function AddItem(PositionID) {
                var orgID = "<%=orgID%>";
                if (orgID == "") {
                    alert("请先选择一个部门，再新增岗位");
                    return false;
                }
                var json = { actionType: 3, orgID: orgID, bizId: PositionID };
                if (PositionID == "" || PositionID == undefined) {
                    json = { actionType: 2, orgID: orgID };
                }
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/PositionEditor.aspx", json);
                showDivDialog(encodeURI(url), null, 700, 600, callBack);
                return false;
            }
            function ViewItem(PositionID) {
                var orgID = "<%=orgID%>";
                if (orgID == "") {
                    alert("请先选择一个部门，再新增岗位");
                    return false;
                }
                var json = { actionType: 1, orgID: orgID, bizId: PositionID };
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/PositionEditor.aspx", json);
            showDivDialog(encodeURI(url), null, 700, 550, null);
            return false;
            }
            function MergerPosition() {
                var orgID = "<%=orgID%>";
                if (orgID == "") {
                    alert("请先选择一个部门，再合并岗位岗位");
                    return false;
                }
                var json = { actionType: 2, orgID: orgID };
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/PositionMergerEditor.aspx", json);
            showDivDialog(encodeURI(url), null, 700, 550, callBack);
            return false;
            }
            function SplitPosition() {
                var orgID = "<%=orgID%>";
                if (orgID == "") {
                    alert("请先选择一个部门，再合并岗位岗位");
                    return false;
                }
                var json = { actionType: 3, orgID: orgID };
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/PositionSplitEditor.aspx", json);
            showDivDialog(encodeURI(url), null, 700, 550, callBack);
            return false;
            }
            function callBack() {
             <%=Page.GetPostBackEventReference(this.btnSearch,"") %>;
            }
        </script>
    </form>
</body>
</html>
