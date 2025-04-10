<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SeparationProcedures.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.UserChange.WF_SeparationProcedures" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            姓名
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPersonnelName" field="USERNAME"
                tablename="EHR_USERTRANSFERTRACE" activestatus="(23.办理离职手续)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" Width="100px" ResultAttr="name" EnableTheming="false"
                Writeable="true" ShowAttrs="name,UserCode" ResultForControls="{'hiSeparationUserID':'id','txtPersonnelCode':'UserCode','hiOrganizationID':'OrgUnitId','hiDEPTCODE':'OrgUnitCode','txtOrganizationName':'OrgUnitName','txtPosition':'RANKNAME','txtMobilePhone':'MobilePhone'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiSeparationUserID" field="USERID" tablename="EHR_SEPARATIONPROCEDURE" />
        </td>
        <td class="td-l">
            工号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPersonnelCode" runat="server" class="kpms-textbox"
                readonly="readonly" field="USERCODE" tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)"
                style="width: 100px" />
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <input type="hidden" id="hiOrganizationID" runat="server" field="DEPTID" tablename="EHR_SEPARATIONPROCEDURE" />
            <input type="hidden" id="hiDEPTCODE" runat="server" field="DEPTCODE" tablename="EHR_SEPARATIONPROCEDURE" />
            <zhongsoft:XHtmlInputText runat="server" ID="txtOrganizationName" readonly="readonly"
                class="kpms-textbox" field="DEPTNAME" tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            职务
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPosition" runat="server" class="kpms-textbox" readonly="readonly"
                field="RANKNAME" tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="txtMobilePhone" runat="server" field="MOBILEPHONE" tablename="EHR_SEPARATIONPROCEDURE"
                MaxLength="64" activestatus="(23.办理离职手续)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            填写日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="txtSeparationDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="FILLDATE" tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            离职原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightDropDownList ID="ddlChangeReason" runat="server" field="ChangeReason"
                tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)" req="1">
            </zhongsoft:LightDropDownList>
            <zhongsoft:LightTextBox ID="tbSeparationReason" runat="server" CssClass="kpms-textarea"
                EnableTheming="false" TextMode="MultiLine" maxtext="128" field="CHANGEEXPLAIN"
                tablename="EHR_SEPARATIONPROCEDURE" activestatus="(23.办理离职手续)" Width="70%" req="1"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_SEPARATIONPROCEDURE"
                activestatus="(23.办理离职手续)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="6" style="font-weight: bold">
            办理部门移交情况表
        </td>
    </tr>
    <tr runat="server" displaystatus="(3.办理离职手续)">
        <td colspan="6" align="right">
            <asp:Button ID="btnDept" runat="server" Text="添加办理部门" OnClick="btnDept_Click" OnClientClick="return ChooseDept();" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvListSign" runat="server" AutoGenerateColumns="false"
                UseDefaultDataSource="true" AllowPaging="true" PageSize="20" DataKeyNames="SEPARATIONSIGNID"
                OnRowCommand="gvListSign_RowCommand" OnRowDataBound="gvListSign_RowDataBound"
                ShowExport="true" OnExport="gvListSign_Export" OnRowEditing="gvListSign_RowEditing"
                OnRowCancelingEdit="gvListSign_RowCancelingEdit" OnRowUpdating="gvListSign_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%#Container.DataItemIndex+1%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="办理部门" ItemStyle-Wrap="false" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <%#Eval("ORGUNITNAME")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%#Eval("ORGUNITNAME")%>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="移交情况">
                        <ItemTemplate>
                            <%#Eval("MEMO")%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                                Text='<%#Eval("MEMO") %>' Maxtext="128" TextMode="MultiLine"></zhongsoft:LightTextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="编辑" UpdateText="保存" EditText="编辑" CancelText="取消" ShowEditButton="true"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px" />
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDel" runat="server" Text="删除" CommandName="DeleteData" CommandArgument='<%#Eval("SEPARATIONSIGNID") %>'
                                OnClientClick="return confirm('您确定要删除吗？');" EnableTheming="false">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            批准文件
        </td>
        <td class="td-m" colspan="5">
            <asp:LinkButton runat="server" ID="lbtnUpByFile" OnClientClick="ShowUpload();" OnClick="lbtnUpByFile_Click"
                DisplayStatus="(3.办理)" EnableTheming="false">
                    <img alt="点此上传文件" id="imgUpByFile" src="../../../../Themes/Images/btn/upload.gif" 
                    style="cursor:hand; border:0;" />
                    <span>文件</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr style="display: none">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FileId" AutoGenerateColumns="False"
                AllowPaging="True" PageSize="10" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="文件名" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <a href="../../../sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("fileId") %>"
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
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="color: Red">说明：<br />
                1、凡本院职工在离开本院时，须先持本清单按规定至有关部门办理交接手续。<br />
                2、各部门领导须认真查明该同志是否有未交待清楚事宜后再签字。<br />
                3、当事人办完手续，应将此单交人力资源部。</span>
        </td>
    </tr>
</table>
<input type="hidden" id="hiSeparationProceduresID" runat="server" field="SEPARATIONPROCEDUREID"
    tablename="EHR_SEPARATIONPROCEDURE" />
<input type="hidden" id="hiRZ" runat="server" value="01017032" />
<input type="hidden" id="hisignUnits" runat="server" value="'所在部门','人力资源部','财务部','信息中心','工会','物业中心','院长工作部'" />
<input type="hidden" id="hisignUnitsCode" runat="server" value="'','01017032','01017033','01017018','01017043','01017052','01017031'" />
<input type="hidden" id="hiUnits" runat="server" />
<input type="hidden" runat="server" id="hiisEditing" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //选择办理部门
    function ChooseDept() {
        var param = new InputParamObject("m");
        var filter = "{OrganizationLevel:'2'}";
        var re = getOrgsNew('<%=hiUnits.ClientID %>', param, filter);
        if (re != null) {
            return true;
        }
        return false;
    }

    function checkForm() {
        var isEditing = $('#<%=hiisEditing.ClientID %>').val();

        if (isEditing == "1") {
            alert("请先“保存”或“取消”编辑！");
            return false;
        }
        return true;
    }

    //上传附件
    function ShowUpload() {
        var fileSrcId = document.getElementById('<%=hiSeparationProceduresID.ClientID %>').value;

        var fileSrcFlag = "UserChange";
        var buildSelf = "False";

        var url = "<%=WebAppPath %>/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
        var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
        window.showModalDialog(url, null, stringFeatures);
        return true;
    }

    function beforePrint() {
        url = "<%=WebAppPath %>/EHR/List/UserChange/SeparationProceduresPrinter.aspx?ProcessInstanceId=" + "<%=ProcessInstanceId %>&bizId=<%=BusinessObjectId %>";
        window.open(url, '_blank');
        return false;
    }
</script>
