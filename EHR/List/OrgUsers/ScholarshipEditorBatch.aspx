<%@ Page Language="C#" AutoEventWireup="true" Title="学术团体" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ScholarshipEditorBatch.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.ScholarshipEditorBatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
               <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName"  
                    activestatus="(2.*)" DoCancel="true" Width="100px" req="1" OnClick="btnChooseUser_Click"
                    ResultAttr="name" EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'txtDept':'OrgUnitName','hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode'}" 
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPersonnelInfoID" />
            </td>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly"
                    class="kpms-textbox" style="width: 100px" req="1" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(23.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center" colspan="4">
                学术团体
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
                    OnClientClick="return OpenItem('','2')" displaystatus="(23.*)">
                     <span>新增学术团体信息</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvScholarship" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="ScholarshipID"
                    OnRowCommand="gvScholarship_RowCommand" OnRowDataBound="gvScholarship_RowDataBound" BindGridViewMethod="BindGridView">
                    <Columns>
                        <asp:BoundField HeaderText="社团名称" DataField="ScholarshipName"></asp:BoundField>
                        <asp:BoundField HeaderText="主管单位名称" DataField="ManageCorp"></asp:BoundField>
                        <asp:BoundField HeaderText="职务" DataField="RANK"></asp:BoundField>
                        <asp:BoundField HeaderText="参加日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="最新学术团体" DataField="IsNew2"></asp:BoundField>
                        <asp:BoundField HeaderText="退出日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}">
                        </asp:BoundField>
                        <asp:BoundField HeaderText="备注" DataField="Memo"></asp:BoundField>
                        <asp:TemplateField HeaderText="查看" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false">
                        <img alt="查看" id="Img1"  onclick='return OpenItem("<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>","1");'
                            border="0" src="../../../Themes/Images/btn_dg_view.gif" style="cursor: hand" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return OpenItem("<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>","3");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ScholarshipID") %>' EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('您确认删除吗？')" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserXml" EnableTheming="false"/>

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function OpenItem(id, actType) {
            var personId = $("#<%=hiPersonnelInfoID.ClientID %>").val();
            if (personId == "") {
                alert("请选择人员");
                return false;
            }
            var stringFeatures = "dialogHeight:550px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";

            if (actType == "2") {
                url ="<%=WebAppPath %>"+ "/EHR/List/OrgUsers/ScholarshipEditor.aspx?&actionType=" + actType + "&pid=" + personId;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/ScholarshipEditor.aspx?&actionType=" + actType + "&bizId=" + id + "&pid=" + personId;
            }
            if (window.showModalDialog(url, null, stringFeatures) != null) {
                return true;
            }

            return false;
        }

       
    </script>

</asp:Content>
