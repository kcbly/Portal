<%@ Page Language="C#" AutoEventWireup="true" Title="人员变动明细" MasterPageFile="~/UI/Master/ObjectEditorNew.Master"
    CodeBehind="WorkStaffChangeEditor_New.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserChange.WorkStaffChangeEditor_New" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                变动原因<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlChangeReason" field="ChangeReason"
                    tablename="EHR_USERCHANGE" activestatus="(2.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName"  field="UserName" tablename="EHR_USERCHANGE"
                    activestatus="(2.*)" DoCancel="true" Width="100px" req="1" OnClick="lbtnChooseUser_Click"
                    ResultAttr="name" EnableTheming="false" Writeable="true" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUserId':'id','txtUSERCODE':'UserCode','hiOGDEPTID':'OrgUnitId','txtOGDEPTNAME':'OrgUnitName','txtOGRANKNAME':'RANKNAME','txtOGSKILLTITLE':'SKILLTITLE'}" 
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserId" field="UserId"
                    tablename="EHR_USERCHANGE" />
            </td>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUSERCODE" readonly="readonly"
                    class="kpms-textbox" style="width: 100px" req="1" field="USERCODE" tablename="EHR_USERCHANGE"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                原部门
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtOGDEPTNAME" readonly="readonly"
                    class="kpms-textbox" field="OGDEPTNAME" tablename="EHR_USERCHANGE" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiOGDEPTID" readonly="readonly" field="OGDEPTID"
                    tablename="EHR_USERCHANGE" activestatus="(23.*)" />
                <asp:LinkButton runat="server" ID="lbtnChooseDeptS" OnClientClick="return ChooseDeptS()"
                    DisplayStatus="(23.N)" CausesValidation="false">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <td class="td-l">
                岗位名称
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPositionXml" readonly="readonly"
                    class="kpms-textbox" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiOGPositionXml" readonly="readonly" field="OGPOSITIONXML"
                    tablename="EHR_USERCHANGE" />
                <input type="hidden" runat="server" id="hiChangePositionXml" readonly="readonly"
                    field="CHANGEPOSITIONXML" tablename="EHR_USERCHANGE" />
                <asp:LinkButton runat="server" ID="lbtnChoosePost1" OnClientClick="return ChoosePostS()"
                    DisplayStatus="(23.N)" CausesValidation="false" OnClick="lbtnChoosePost1_Click">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                党政职务
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtOGRANKNAME" runat="server" class="kpms-textbox" readonly="readonly"
                    style="width: 100px" field="OGRANKNAME" tablename="EHR_USERCHANGE" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                技术职称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtOGSKILLTITLE" runat="server" class="kpms-textbox" readonly="readonly"
                    style="width: 100px" field="OGSKILLTITLE" tablename="EHR_USERCHANGE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                现部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCHANGEDEPTNAME" readonly="readonly"
                    class="kpms-textbox" field="CHANGEDEPTNAME" tablename="EHR_USERCHANGE" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiChangeDeptID" readonly="readonly" field="CHANGEDEPTID"
                    tablename="EHR_USERCHANGE" activestatus="(23.*)" />
                <asp:LinkButton runat="server" ID="lbtnChooseDept" OnClientClick="return ChooseDept()"
                    DisplayStatus="(23.*)" CausesValidation="false" EnableTheming="false">
                        <img alt="选择" src="../../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                </asp:LinkButton>
            </td>
            <td class="td-l">
                变动日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCHANGEDATE" class="kpms-textbox-date"
                    field="CHANGEDATE" tablename="EHR_USERCHANGE" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否生效
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="radISPASS" runat="server" field="ISPASS" tablename="EHR_USERCHANGE"
                    activestatus="(23.N)" req="1" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Text="已生效"></asp:ListItem>
                    <asp:ListItem Value="0" Text="未生效" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                制表日期
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtMAKEDATE" class="kpms-textbox-date"
                    field="MAKEDATE" tablename="EHR_USERCHANGE" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="MEMO" tablename="EHR_USERCHANGE"
                    maxtext="512" CssClass="kpms-textarea" activestatus="(23.*)" TextMode="MultiLine" 
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                批准文件
            </td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUpByFile" OnClientClick="ShowUpload('UserChange');"
                    OnClick="lbtnUpByFile_Click" DisplayStatus="(3.*)" EnableTheming="false">
                    <img alt="点此上传文件" id="imgUpByFile" src="../../../Themes/Images/btn_upload.gif" 
                    style="cursor:hand; border:0;" />
                    <span>文件</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FileId" AutoGenerateColumns="False"
                    AllowPaging="True" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="文件名" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <a href="/portal/sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("fileId") %>"
                                    target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline;
                                    color: #0033FF;">
                                    <%# Eval("FileName") %>
                                </a>
                                <input type="hidden" runat="server" id="hiCreatUserID" value='<%#Eval("CreateUserId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除">
                            <ItemStyle Width="40px" HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("FileId") %>'
                                    CommandName="del" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../../Themes/Images/btn_dg_delete.gif"  />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiUSERCHANGEID" field="USERCHANGEID"
        tablename="EHR_USERCHANGE" />
    <input type="hidden" runat="server" id="hiUserXml" />
    <input type="hidden" runat="server" id="hiDeptXml" />
    <input type="hidden" runat="server" id="hiPostXml" />
    <input type="hidden" runat="server" id="hiDeptSXml" />

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function ChooseDeptS() {
            var param = new InputParamObject("s");
            var userId = $("#<%=hiUserId.ClientID %>").val();
            var filter = "{UserId:'" + userId + "'}";
            var re = getOrgsNew("<%=hiDeptSXml.ClientID %>", param, filter);

            if (re != null) {
                $("#<%=hiOGDEPTID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtOGDEPTNAME.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }

        function ChooseDept() {
            var param = new InputParamObject("s");
            var re = getOrgsNew("<%=hiDeptXml.ClientID %>", param, null);

            if (re != null) {
                $("#<%=hiChangeDeptID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtCHANGEDEPTNAME.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }

        function ChoosePostS() {
            var param = new InputParamObject("m");
            var orgId = $("#<%=hiOGDEPTID.ClientID %>").val();
            var userId = $("#<%=hiUserId.ClientID %>").val();
            var filter = "{OrgId:'" + orgId + "',UserId:'" + userId + "'}";
            var re;
            var changeReason = $("#<%=ddlChangeReason.ClientID %> option:selected").text();
            if (changeReason == "返聘") {
                re = getPosition("<%=hiChangePositionXml.ClientID %>", param, filter);
            }
            else {
                re = getPosition("<%=hiOGPositionXml.ClientID %>", param, filter);
            }

            if (re != null) {
                return true;
            }
            return false;
        }

        //上传附件使用系统通用js方法showUploadForm
        function ShowUpload(type) {
            var fileSrcId = document.getElementById('<%=hiUSERCHANGEID.ClientID %>').value;
            showUploadForm(fileSrcId, type);
            return true;
        }
     
    </script>

</asp:Content>
