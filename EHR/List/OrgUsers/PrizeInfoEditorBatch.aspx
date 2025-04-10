<%@ Page Language="C#" AutoEventWireup="true" Title="获奖信息" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="PrizeInfoEditorBatch.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PrizeInfoEditorBatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" activestatus="(2.*)"
                    DoCancel="true" Width="100px" req="1" OnClick="btnChooseUser_Click" ResultAttr="name"
                    EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode" ResultForControls="{'txtDept':'OrgUnitName','hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode'}"
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
                获奖信息
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
                    OnClientClick="return openItem('','2')" displaystatus="(23.*)">
                     <span>新增获奖信息</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvPrizeInfo" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="PRIZEINFOID"
                    OnRowCommand="gvPrizeInfo_RowCommand" BindGridViewMethod="BindGridView">
                    <Columns>
                        <asp:BoundField HeaderText="获奖名称" DataField="PrizeName"></asp:BoundField>
                        <asp:BoundField HeaderText="获奖项目名称" DataField="ProjectName"></asp:BoundField>
                        <asp:BoundField HeaderText="担任角色" DataField="ROLENAME"></asp:BoundField>
                        <asp:BoundField HeaderText="获奖级别" DataField="PrizeLevel"></asp:BoundField>
                        <asp:BoundField HeaderText="授奖单位" DataField="AWARDCORP"></asp:BoundField>
                        <asp:BoundField HeaderText="获奖日期" DataField="PRIZEDATE" DataFormatString="{0:yyyy-MM-dd}">
                        </asp:BoundField>
                        <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="ViewData" EditIdField="PRIZEINFOID" EditPageUrl="~/EHR/List/OrgUsers/PrizeInfoEditor.aspx"
                            EditPageHeight="600px" EditPageWidth="800px">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="EditData" EditIdField="PRIZEINFOID" EditPageUrl="~/EHR/List/OrgUsers/PrizeInfoEditor.aspx"
                            EditPageHeight="600px" EditPageWidth="800px">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="删除" ItemStyle-HorizontalAlign="Center" CausesValidation="false"
                            CommandName="DeleteData" DeleteText="确认删除？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUserXml" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function openItem(id, actType) {
            var personId = $("#<%=hiPersonnelInfoID.ClientID %>").val();
            if (personId == "") {
                alert("请选择人员");
                return false;
            }
            var stringFeatures = "dialogHeight:550px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "";

            if (actType == "2") {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + actType + "&pid=" + personId;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/PrizeInfoEditor.aspx?&actionType=" + actType + "&bizId=" + id + "&pid=" + personId;
            }
            if (window.showModalDialog(url, null, stringFeatures) != null) {
                return true;
            }

            return false;
        }

       
    </script>
</asp:Content>
