<%@ Page Language="C#" AutoEventWireup="true" Title="技术职称" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SkillLevelEditorBatch.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.SkillLevelEditorBatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" activestatus="(2.*)"
                    DoCancel="true" OnClick="btnChooseUser_Click" ResultAttr="name"  ShowJsonRowColName="true" SelectPageMode="Dialog"
                    EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode" ResultForControls="{'txtDept':'OrgUnitName','hiPersonnelInfoID':'id','txtPersonnelCode':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPersonnelInfoID" />
            </td>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly" class="kpms-textbox" req="1" activestatus="(2.N)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">部门名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtDept" runat="server" readonly="readonly" class="kpms-textbox"
                    activestatus="(2.N)" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center" colspan="4">技术职称
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:LinkButton runat="server" ID="btnAdd" class="kpms-btn" OnClick="btnAdd_Click"
                    OnClientClick="return OpenItem('','2')" displaystatus="(23.*)">
                     <span>新增技术职称</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvSkill" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" DataKeyNames="SKILLLEVELID"
                    OnRowCommand="gvSkill_RowCommand" BindGridViewMethod="BindGridView">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="排序码" DataField="Code"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="工种" DataField="SKILLTITLE"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="技能等级" DataField="SKILLLEVEL"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="取得时间" DataField="DESERVEDATE" DataFormatString="{0:yyyy-MM-dd}"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="证书名称" DataField="CertificateName"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="证书号" DataField="CertificateNo"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="鉴定机构" DataField="IdentifyOrg" ShowToolTip="true"></zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="特殊工种标识" DataField="IsSpecialMarkText"></zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="ViewData" EditIdField="SKILLLEVELID" EditPageUrl="~/EHR/List/OrgUsers/SkillLevelEditor.aspx"
                            EditPageHeight="600px" EditPageWidth="800px">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            CausesValidation="false" CommandName="EditData" EditIdField="SKILLLEVELID" EditPageUrl="~/EHR/List/OrgUsers/SkillLevelEditor.aspx"
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
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditor.aspx?&actionType=" + actType + "&pid=" + personId;
            }
            else {
                url = "<%=WebAppPath %>" + "/EHR/List/OrgUsers/SkillLevelEditor.aspx?&actionType=" + actType + "&bizId=" + id + "&pid=" + personId;
            }
            if (window.showModalDialog(url, null, stringFeatures) != null) {
                return true;
            }

            return false;
        } 
    </script>
</asp:Content>
