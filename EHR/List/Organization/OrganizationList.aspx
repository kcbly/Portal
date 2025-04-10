<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.OrganizationList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门台账</title>
    <base target="_self" />
    <link href="../../../Themes/Styles/objfilter.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="../../../UI/Script/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../../../UI/Script/groupgrid.js"></script>
</head>
<body onkeydown="search();">
    <form id="form1" runat="server">
        <table class="tz-table">
            <tr>
                <td class="tz-toolbar">
                    <table width="100%">
                        <tr>
                            <td>
                                <span class="filter-block"><span class="filter-block-lb">部门编号/名称</span><span>
                                    <asp:TextBox ID="tbOrganization" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
                                        MaxLength="64" Width="120px"></asp:TextBox></span></span> <span class="filter-block"><span class="filter-block-lb">部门分类</span><span>
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlMark" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                            </zhongsoft:LightDropDownList>
                                        </span></span><span class="filter-block"><span class="filter-block-lb">部门等级</span><span>
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlOrganizationLevel" class="kpms-ddlsearch" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true"
                                                EnableTheming="false" Width="100px">
                                            </zhongsoft:LightDropDownList>
                                        </span></span><span class="filter-block"><span class="filter-block-lb">显示类型</span><span>
                                            <zhongsoft:LightDropDownList ID="ddlFlag" runat="server" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="" Text="全部"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="现有部门" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="已撤销部门"></asp:ListItem>
                                            </zhongsoft:LightDropDownList>
                                        </span></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="clear: both">
                                    <div style="float: left">
                                        <asp:LinkButton runat="server" ID="btnNew" class="searchbtn" OnClick="btnNew_Click"
                                            OnClientClick="return AddItem('')">
                                     <img alt ="" src="../../../Themes/Images/btn_add.gif" />
                                <span>新建</span></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="LinkButton2" class="searchbtn" OnClick="btnNew_Click"
                                            OnClientClick="return MegerItem()">
                                     <img alt ="" src="../../../Themes/Images/btn_editor.gif" />
                                <span>合并</span></asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="LinkButton3" class="searchbtn" OnClick="btnNew_Click"
                                            OnClientClick="return SplitItem()">
                                     <img alt ="" src="../../../Themes/Images/btn_editor.gif" />
                                <span>分离</span></asp:LinkButton>                                     
                                    </div>
                                    <div style="float: right;">
                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                                <span>查找</span></asp:LinkButton>
                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                <span>重置</span></asp:LinkButton>
                                    </div>
                                </div>

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                        AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" PageSize="10"
                        ShowExport="true" DataKeyNames="OrgUnitId" HideFieldOnExport="编辑,撤销" OnRowCommand="gvList_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="序号">
                                <ItemStyle Width="4%" HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <%# (((GridViewRow)Container).DataItemIndex + 1) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <zhongsoft:LightBoundField HeaderText="部门编号" DataField="OrgUnitCode" SortExpression="OrgUnitCode">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightTemplateField HeaderText="部门名称" SortExpression="OrgUnitName">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnView" runat="server" EnableTheming="false">
                            <a  alt="部门名称" title="部门名称"  style="cursor:hand; color:blue;"
                                onclick="return DeptView('<%#Eval("OrgUnitId") %>')">
                            <%#Eval("OrgUnitName") %>
                            </a>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField HeaderText="部门分类" DataField="OrgType1" SortExpression="OrgType1">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="部门等级" DataField="OrgUnitLevel1" SortExpression="OrgUnitLevel1">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="上级部门" DataField="ParentName" SortExpression="ParentName">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="成立日期" DataField="SETUPDATE" DataFormatString="{0:yyyy-MM-dd}"
                                SortExpression="SETUPDATE">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="撤销日期" DataField="UNDODATE" DataFormatString="{0:yyyy-MM-dd}"
                                SortExpression="UNDODATE">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"  AccessLevel="3" 
                                DataParamFields="OrgUnitId" EditItemClick="AddItem">
                            </zhongsoft:LightButtonField>
                            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="撤销" CausesValidation="false"
                                DeleteText="您确定撤销该部门吗？">
                            </zhongsoft:LightButtonField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
        <script type="text/javascript">
            //新建、编辑
            function AddItem(OrgUnitId) {
                var json = { actionType: 3, bizId: OrgUnitId };
                if (OrgUnitId == "" || OrgUnitId == undefined)
                {
                    json = { actionType: 2};
                } 
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/OrganizationEditor.aspx", json);
                showDivDialog(encodeURI(url), null, 700, 550, callBack);
                return false;
            }
            //并转
            function MegerItem() { 
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/OrganizationMergerEditor.aspx", { actionType: 2});
                showDivDialog(encodeURI(url), null, 700, 550, callBack);
                return false;
            }
            //分离
            function SplitItem() {
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/OrganizationSplitEditor.aspx", { actionType: 3});
                showDivDialog(encodeURI(url), null, 900, 550, callBack);
                return false;
            }

            function AddItem(OrgUnitId) {
                var json = { actionType: 3, bizId: OrgUnitId };
                if (OrgUnitId == "" || OrgUnitId == undefined) {
                    json = { actionType: 2 };
                }
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/OrganizationEditor.aspx", json);
                  showDivDialog(encodeURI(url), null, 700, 450, callBack);
                  return false;
              }
            function callBack() {
                <%=Page.GetPostBackEventReference(this.btnSearch,"") %>;
            }
            //点击部门名称查看岗位/人员信息
            function DeptView(OrgUnitId) {
                var json = { actionType: 1, bizId: OrgUnitId };
                var url = buildQueryUrl("<%=WebAppPath %>/EHR/List/Organization/OrgPositionAndPerson.aspx", json);
                showDivDialog(encodeURI(url), null, 1000, 680, callBack);
                return false;
            }

        </script>
    </form>
</body>
</html>
