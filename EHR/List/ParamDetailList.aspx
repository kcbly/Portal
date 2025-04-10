<%@ Page Language="C#" Title="人力资源-基础信息设置" AutoEventWireup="true" CodeBehind="ParamDetailList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ParamDetailList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>参数明细台账</title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%">
            <tr>
                <td width="20%" valign="top" style="border: 1px #6699FF solid;">
                    <asp:TreeView ID="treeParam" runat="server" OnSelectedNodeChanged="treeParam_SelectedNodeChanged"   Height="100%" Width="100%" ShowLines="True">
                        <SelectedNodeStyle BackColor="#F7F7F7" />
                    </asp:TreeView>
                </td>
                <td valign="top">
                    <table width="100%" runat="server" id="param" visible="true">
                        <tr>
                            <td class="tz-toolbar">参数名
                              <asp:TextBox ID="tbParamName" runat="server" Width="140px" CssClass="kpms-textboxsearch" MaxLength="20"></asp:TextBox>
                                <asp:LinkButton runat="server" class="kpms-btn" ID="btnSearch" OnClick="btnSearch_Click">
                                    <img   src="../../Themes/Images/btn_search.gif"/><span>查找</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" class="kpms-btn" ID="btnReset" OnClick="btnReset_Click">
                                     <img src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="btnNew" class="kpms-btn"   OnClientClick="return AddItem()">
                                     <img  src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" sDataKeyNames="ParamNameID" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand">
                                    <Columns> 
                                        <zhongsoft:LightBoundField HeaderText="参数名" DataField="ParamName" HeaderStyle-Width="30%"></zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField HeaderText="说明" DataField="Remark"></zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField HeaderText="排序" DataField="Sort" HeaderStyle-Width="7%"></zhongsoft:LightBoundField>
                                        <zhongsoft:LightTemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                      <img alt="编辑" id="Img1"  onclick='return EditItem("<%#DataBinder.Eval(Container.DataItem,"ParamNameID") %>");'  border="0" src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightTemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamNameID") %>'  EnableTheming="false">
                                                        <img alt="删除" id="Img2" onclick="return confirm('确定删除？');"  border="0" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand"  />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>   
                    <table width="100%" runat="server" id="detail" visible="false">
                    <tr>
                        <td class="tz-toolbar">
                            参数明细名/值
                            <asp:TextBox ID="tbParamDetail" runat="server" Width="140px" CssClass="kpms-textboxsearch"  MaxLength="20"></asp:TextBox>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnDetailSearch" OnClick="btnDetailSearch_Click">
                                 <img   src="../../Themes/Images/btn_search.gif"/><span>查找</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" class="kpms-btn" ID="btnDetailReset" OnClick="btnDetailReset_Click">
                                 <img " src="../../Themes/Images/btn_empty.gif"/><span>重置</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="btnDetailNew" class="kpms-btn"   OnClientClick="return AddDetailItem()">
                                <img  src="../../Themes/Images/btn_new.gif"/><span>新建</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView ID="gvDetailList" runat="server" AutoGenerateColumns="false"  UseDefaultDataSource="true" AllowPaging="true" PageSize="15" DataKeyNames="ParamDetailID"  OnRowCommand="gvDetailList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightBoundField HeaderText="参数明细名" DataField="ParamDetailName"></zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="参数明细值" DataField="ParamDetailValue"></zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField HeaderText="排序" DataField="Sort"></zhongsoft:LightBoundField>
                                    <zhongsoft:LightTemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                                                <img alt="编辑" id="Img1"  onclick='return EditDetailItem("<%#DataBinder.Eval(Container.DataItem,"ParamDetailID") %>");'  src="../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamDetailID") %>'    EnableTheming="false">
                                                <img alt="删除" id="Img2"  border="0" onclick="return confirm('确定删除？');" src="../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
        </table>
        <asp:Button ID="btnRefresh" runat="server"  OnClick="btnRefresh_Click" Visible="false" /> 
        <asp:Button ID="btnRefreshDetail" runat="server"  OnClick="btnRefreshDetail_Click" Visible="false" /> 
        <script type="text/javascript">
            function EditItem(bizId) {
                var url = buildBizUrl(3, bizId, "EHR/List/ParamNameEditor.aspx", null);
                showDivDialog(url, null, 600, 400, callBack);
                return false;
            }
            function AddItem() {
                var url = buildBizUrl(2, null, "EHR/List/ParamNameEditor.aspx", null);
                showDivDialog(url, null, 600, 400, callBack);
                return false;
            }
            function callBack() {
                <%=Page.ClientScript.GetPostBackEventReference(this.btnRefresh,"") %>;
            }
            function EditDetailItem(bizId) {
                var url = buildBizUrl(3, bizId, "EHR/List/ParamDetailEditor.aspx", null);
                showDivDialog(url, null, 600, 400, callDetailBack);
                return false; 
            }
            function AddDetailItem() {
                var paramnameID = "<%=ParamNameID %>";
                if (paramnameID == "") {
                    alert("请选中一个参数再添加参数明细");
                    return false;
                }
                var url = buildBizUrl(2, null, "EHR/List/ParamDetailEditor.aspx",{paramnameID:paramnameID});
                showDivDialog(url, null, 600, 400, callDetailBack);
                return false; 
            }
            function callDetailBack() {
                <%=Page.ClientScript.GetPostBackEventReference(this.btnRefreshDetail,"") %>;
            }
        </script>
    </form>
</body>
</html>
