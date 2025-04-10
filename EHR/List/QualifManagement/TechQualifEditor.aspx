<%@ Page Title="专业技术资格录入" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TechQualifEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.TechQualifEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" activestatus="(2.*)"
                    DoCancel="true" Width="100px" req="1" OnClick="btnChooseUser_Click" ResultAttr="name"
                    EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode" ShowJsonRowColName="true" SelectPageMode="Dialog"
                    ResultForControls="{'txtDept':'OrgUnitName','hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPersonnelInfoID" />
            </td>
            <td class="td-l">登录号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly"
                    class="kpms-textbox" style="width: 100px" req="1" activestatus="(2.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.*)" style="width: 34%" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center; font-weight: bold" colspan="4">专业技术资格列表
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
                    OnClientClick="return OpenItem('','2')" displaystatus="(23.*)">
                     <%--  <img alt ="" src="../../../Themes/Images/btn_add.gif" />--%>
                    <span>新增专业技术资格</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvTech" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" AllowPaging="true" PageSize="12" DataKeyNames="TECHQUALIFID"
                    OnRowCommand="gvTech_RowCommand" BindGridViewMethod="BindTechGrid">
                    <Columns>
                        <asp:BoundField DataField="TECHQUALIFNAME" HeaderText="专业技术资格名称" />
                        <asp:BoundField DataField="TECHQUALIFSERIES" HeaderText="专业技术资格系列" />
                        <asp:BoundField DataField="TECHQUALIFLEVEL" HeaderText="专业技术资格等级" />
                        <asp:BoundField DataField="QUALIFICATIONCODE" HeaderText="专业技术资格证书编号" />
                        <asp:BoundField DataField="QUALIFYINGTIME" HeaderText="取得资格日期" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="ISHIGHESTT" HeaderText="最高等级标识" HtmlEncode="false" />          
                        <asp:BoundField DataField="APPROVALUNIT" HeaderText="审批单位" />
                        <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="ViewData" EditIdField="TECHQUALIFID" EditPageUrl="~/EHR/List/QualifManagement/TechQualifSubEditor.aspx"
                            EditPageHeight="600px" EditPageWidth="800px">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="EditData" EditIdField="TECHQUALIFID" EditPageUrl="~/EHR/List/QualifManagement/TechQualifSubEditor.aspx"
                            EditPageHeight="600px" EditPageWidth="800px">
                        </zhongsoft:LightButtonField> 
                        <asp:TemplateField HeaderText="删除">
                            <ItemStyle HorizontalAlign="Center" Width="15px"></ItemStyle>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false" CommandArgument='<%#Eval("TECHQUALIFID") %>'>
                                   <img onclick="if(!confirm('确认要删除吗？')) return false;" src="../../../Themes/Images/btn_dg_delete.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserXml" />
    <script type="text/javascript">

         function initCustomerPlugin() {
            $("#ctl00_divToolBtn").hide();
        }
        function OpenItem(id, actType) {
            var personId = $("#<%=hiPersonnelInfoID.ClientID %>").val();
            if (personId == "") {
                alert("请选择人员");
                return false;
            }
            var stringFeatures = "dialogHeight:550px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";

            if (actType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/TechQualifSubEditor.aspx?&actionType=" + actType + "&pid=" + personId;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/QualifManagement/TechQualifSubEditor.aspx?&actionType=" + actType + "&bizId=" + id + "&pid=" + personId;
            }
            if (window.showModalDialog(url, null, stringFeatures) != null) {
                return true;
            }

            return false;
        }
    </script>
</asp:Content>
