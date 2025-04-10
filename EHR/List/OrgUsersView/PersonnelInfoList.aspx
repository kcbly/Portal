<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelInfoList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsersView.PersonnelInfoList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <base target="_self" />
    <title>员工库</title>
    <link href="../../../Themes/Styles/objfilter.css" type="text/css" rel="Stylesheet" />
    <script type="text/javascript" src="../../../UI/Script/groupgrid.js"></script>
</head>
<body onkeydown="search();">
    <form id="form1" runat="server">
        <div style="min-width: 1100px; _width: 1100px;">
            <table width="100%">
                <tr>
                    <td width="20%" valign="top" style="border: 1px #6699FF solid;">
                        <asp:TreeView ID="tvOrganizationTree" runat="server" OnSelectedNodeChanged="tvOrganizationTree_SelectedNodeChanged" Height="100%" Width="100%" ShowLines="True">
                            <SelectedNodeStyle BackColor="#F7F7F7" />
                        </asp:TreeView>
                    </td>
                    <td valign="top">
                        <table width="100%" class="tz-table">
                            <tr>
                                <td class="tz-toolbar">
                                    <table width="100%">
                                        <tr>
                                           <%-- <td>
                                                <asp:LinkButton runat="server" class="searchbtn" ID="LinkButton1" Visible="false" OnClientClick="return UpdateInfo()">
                                                    <span>批量修改资质信息</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" class="searchbtn" ID="LinkButton2" OnClientClick="return AddItem()">
                                                     <span>新建员工</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                                                    flag="import" OnClientClick="return openDownLoad()">
                                                    <span>
                                                        <img id="Img9" runat="server" src="~/Themes/Images/desc.png" alt="下载模板" width="16" height="16" />下载模板</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                                                    flag="import" OnClientClick="return InExport()">
                                                    <span>
                                                        <img id="Img1" runat="server" src="~/Themes/Images/btn_add.gif" alt="从Excel导入" width="16" height="16" />从Excel导入</span>
                                                </asp:LinkButton>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="filter-block" style="z-index: 2; position: relative">
                                                    <zhongsoft:DropCheckBoxList runat="server" ID="dcbDept" TitleName="部门" SearchBtnId="btnOrg"
                                                        RepeatColumns="3" RepeatDirection="Horizontal" />
                                                    <asp:LinkButton runat="server" ID="btnOrg" Style="display: none" OnClick="btnOrg_Click"></asp:LinkButton>
                                                    <zhongsoft:DropCheckBoxList runat="server" ID="dcbOrg" TitleName="科室" RepeatColumns="2"
                                                        RepeatDirection="Horizontal" />
                                                </span><span class="filter-block"><span class="filter-block-lb">工号/姓名/简拼</span><span>
                                                    <asp:TextBox ID="tbPersonnel" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"
                                                        MaxLength="20" Width="120px"></asp:TextBox></span></span>
                                                <span class="filter-block"><span class="filter-block-lb">人员类别</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlCategories" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </span></span>
                                                <span class="filter-block"><span class="filter-block-lb">毕业院校</span><span><asp:TextBox
                                                    ID="txtGraduatedSchool" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false" Width="120px"
                                                    MaxLength="20"></asp:TextBox></span></span>
                                                <%--<span class="filter-block"><span class="filter-block-lb">专业</span><span><asp:TextBox ID="txtSpecialty" runat="server" CssClass="kpms-textboxsearch"
                                                        EnableTheming="false" MaxLength="20" Width="120px"></asp:TextBox></span></span>--%>
                                                <%--                                                <span class="filter-block"><span class="filter-block-lb">用工形式</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlEmploymentForm" class="kpms-ddlsearch" EnableTheming="false" Width="150px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </span></span>--%>
                                                <span class="filter-block"><span class="filter-block-lb">人员状态</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlState" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </span></span><span class="filter-block"><span class="filter-block-lb">将要退休人员</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlWillRetire" class="kpms-ddlsearch" EnableTheming="false" Width="100px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="">全部</asp:ListItem>
                                                        <asp:ListItem Value="1">1年内</asp:ListItem>
                                                        <asp:ListItem Value="2">2年内</asp:ListItem>
                                                        <asp:ListItem Value="3">3年内</asp:ListItem>
                                                        <asp:ListItem Value="4">4年内</asp:ListItem>
                                                        <asp:ListItem Value="5">5年内</asp:ListItem>
                                                        <asp:ListItem Value="6">6年内</asp:ListItem>
                                                        <asp:ListItem Value="7">7年内</asp:ListItem>
                                                        <asp:ListItem Value="8">8年内</asp:ListItem>
                                                        <asp:ListItem Value="9">9年内</asp:ListItem>
                                                        <asp:ListItem Value="10">10年内</asp:ListItem>
                                                    </asp:DropDownList>
                                                </span></span><%--<span class="filter-block"><span class="filter-block-lb">今年、往年退休人员</span><span>
                                                    <asp:DropDownList runat="server" ID="ddlRetireState" class="kpms-ddlsearch" EnableTheming="false" Width="120px" OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="">全部</asp:ListItem>
                                                        <asp:ListItem Value="当年退休人员">当年退休人员</asp:ListItem>
                                                        <asp:ListItem Value="往年该退休人员">往年该退休人员</asp:ListItem>
                                                    </asp:DropDownList>
                                                </span></span>--%>
                                                <span class="filter-block" style="display: none">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <span>
                                                                    <asp:LinkButton runat="server" ID="lbtnDown" OnClientClick="return DownLoadTemp();"><span>下载模板</span></asp:LinkButton></span>
                                                            </td>
                                                            <td>
                                                                <span class="filter-block-lb">
                                                                    <asp:FileUpload ID="fupContract" runat="server" />
                                                                </span>
                                                            </td>
                                                            <td>
                                                                <span>
                                                                    <asp:LinkButton runat="server" ID="btnImport" OnClick="btnImport_Click" OnClientClick="return CheckFile();"><span>导入</span></asp:LinkButton></span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="clear: both">
                                                    <div style="float: right">
                                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnSearch" OnClick="btnSearch_Click">
                                                            <span content="searchResult">查询</span>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                                                            <span>重置</span>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                                Width="100%" AllowPaging="true" ShowPageSizeChange="true" DataKeyNames="UserId"
                                OnExport="gvList_Export" OnRowCommand="gvList_RowCommand" ShowExport="true" AllowSorting="true"
                                BindGridViewMethod="BindDataGrid">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 <%--   <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" EditItemClick="EditItem" DataParamFields="UserId" ItemStyle-Width="30px" />
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false" ItemStyle-Width="30px" />--%>
                                    <zhongsoft:LightBoundField HeaderText="工号" DataField="LOGINID" SortExpression="LOGINID" ItemStyle-Width="100px" />
                                    <asp:TemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="left" SortExpression="UserName" ItemStyle-Width="80px" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <a onclick="return ViewCustomListLink('<%#Eval("UserId")%>');" style="color: Blue;">
                                                <%#Eval("UserName")%>
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <zhongsoft:LightBoundField HeaderText="部门" DataField="DEPTNAME" ItemStyle-Wrap="false" SortExpression="DEPTNAME" ItemStyle-Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="室组" DataField="SUBDEPTNAME" ItemStyle-Wrap="false" SortExpression="SUBDEPTNAME" ItemStyle-Width="100px" />
                                    <zhongsoft:LightBoundField HeaderText="性别" DataField="Sex" SortExpression="Sex" ItemStyle-Width="40px" />
                                    <zhongsoft:LightBoundField HeaderText="现任职务" DataField="RANKNAME" ItemStyle-Wrap="false" SortExpression="RANKNAME" ItemStyle-Width="150px" />
                                    <zhongsoft:LightBoundField HeaderText="职称" DataField="SKILLTITLE" ItemStyle-Wrap="false" SortExpression="SKILLTITLE" ItemStyle-Width="150px" />
                                    <zhongsoft:LightBoundField HeaderText="最高学历毕业学校" DataField="GraduateSchool" ItemStyle-Wrap="false" SortExpression="GraduateSchool" ItemStyle-Width="150px" />
                                    <%--<zhongsoft:LightBoundField HeaderText="最高学历专业" DataField="MAJORSPECIALTY" ItemStyle-Wrap="false" SortExpression="MAJORSPECIALTY" ItemStyle-Width="150px" />--%>
                                    <zhongsoft:LightBoundField HeaderText="最高学历学位" DataField="AcademicDegree" ItemStyle-Wrap="false" SortExpression="AcademicDegree" ItemStyle-Width="150px" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>

                        </table>
                    </td>
                </tr>
            </table>
            <input type="hidden" id="hiEditRole" runat="server" value="人事专责" />
            <input type="hidden" runat="server" id="hidFilePath" />
        </div>
        <script type="text/javascript">
            function openTables() {
                $("#divTables").dialog("open");
                $("#divTables").parent().appendTo("#<%=this.Page.Form.ClientID%>");
                return false;
            }

            function setQueryWidth() {
                return 600;
            }

            function setQueryHeight() {
                return 300;
            }

            //模板地址
            function DownLoadTemp() {
                var url = "/Portal/Sys/Download/人员信息导入模板.xls";
                window.location.href = url;
                return false;
            }

            //检查文件
            function CheckFile() {
                var fileAddress = $("#<%=fupContract.ClientID %>").val();
                $("#<%=hidFilePath.ClientID %>").val(fileAddress);
                if (fileAddress == "") {
                    alert("请选择模板文件！");
                    return false;
                } else if (fileAddress.indexOf('人员信息导入模板') == -1) {
                    alert("请选择正确的模板文件！");
                    return false;
                }
                $("#<%=fupContract.ClientID %>").val(fileAddress);
                return true;
            }
            function EditItem(bzid) {
                var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/C_PersonnelInfoEditor.aspx?&actionType=3&bizId=" + bzid;
                showDivDialog(url, "", 980, 650, callBack);
                return false;
                <%--var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelInfoHYEditor.aspx?&actionType=3&bizId=" + bzid;
                showDivDialog(url, "", 1280, 650, callBack);
                return false;--%>
            }
            function ViewItem(bzid) {
                var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PersonnelInfoHYEditor.aspx?&actionType=1&bizId=" + bzid;

                showDivDialog(url, "", 980, 650, null);
                return false;
            }
            function callBack() {
                <%=Page.GetPostBackEventReference(this.btnSearch,"") %>;
            }
            function AddItem() {
                var url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/C_PersonnelInfoEditor.aspx?&actionType=2"
                showDivDialog(url, "", 980, 650, callBack);
                return false;
            }
            function UpdateInfo() {
                var url = "<%=WebAppPath %>" + "/EPMS/List/OBS/BatchQualificOfUserEditor.aspx";
                showDivDialog(url, "", 980, 650, null);
                return false;
            }


            function InExport() {
                var url = buildQueryUrl("EHR/Import/PersonnelInfoImport.aspx", { AssetsType: 1 });
                showDivDialog(url, null, 460, 380, null);
                return false;
            }
            //下载
            function openDownLoad() {
                window.open("<%=WebAppPath %>/EHR/Templete/用户信息导入模板.xlsx");
            }

            //列表超链接查看普通编辑页js --带权限
            function ViewCustomListLink(id) {
                var keyUrl = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/C_PersonnelInfoEditor.aspx";
                //actionType=1时，说明是列表调用查看方法，根据用户权限重新赋值actionType 
                var actionType = 1;
                url = buildQueryUrl(keyUrl, { actionType: actionType, bizId: id });
                showDivDialog(encodeURI(url), null, 1150, 800, callBack);
                return false;
            }


          
        </script>
    </form>
</body>
</html>
