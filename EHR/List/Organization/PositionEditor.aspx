<%@ Page Title="岗位信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PositionEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.PositionEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li><a href='#baseInfo' id='abaseInfo' onclick="return ReBack();">基本信息</a></li>
            <li><a href='#userInfo' id='auserInfo'>岗位人员</a></li>
        </ul>
        <div id="baseInfo">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td class="td-l">岗位编号<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbPositionCode" CssClass="kpms-textbox"
                                    MaxLength="20" req="1" field="PositionCode" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">岗位名称<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbPositionName" CssClass="kpms-textbox"
                                    MaxLength="64" req="1" field="PositionName" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">岗位职级
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList ID="ddlPostLevel" runat="server" field="POSITIONLEVEL" tablename="EHR_Position"
                                    activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">岗位层级
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList ID="ddlPostHierarchy" runat="server" field="POSITIONHIERARCHY" tablename="EHR_Position"
                                    activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">直接上级
                            </td>
                            <td class="td-m">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtParentName" readonly="readonly" class="kpms-textbox"
                                    style="width: 150px" activestatus="(23.*)" />
                                <asp:ImageButton runat="server" ID="ibtnChooseParentPosition" ImageUrl="../../../Themes/Images/btn_select.gif"
                                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseParentPosition();" CausesValidation="False"
                                    DisplayStatus="(23.*)" />
                            </td>
                            <td class="td-l">直接下级
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSubordinate" readonly="readonly"
                                    class="kpms-textbox" style="width: 150px" activestatus="(23.*)" />
                                <asp:ImageButton runat="server" ID="btnSubordinate" ImageUrl="../../../Themes/Images/btn_select.gif"
                                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseSubordinatePosition();"
                                    CausesValidation="False" DisplayStatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">所属职务
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbSubordinatePost" CssClass="kpms-textbox"
                                    MaxLength="32" field="BELONGRANK" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">岗位分类<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionClassify" field="PositionClassify"
                                    tablename="EHR_Position" activestatus="(23.*)" req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">岗位定编人数
                            </td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:LightTextBox ID="tbPersonsNum" runat="server" CssClass="kpms-textbox-money"
                                    EnableTheming="false" field="PersonsNum" tablename="EHR_Position" activestatus="(23.*)"
                                    regex="^\d+$" errmsg="请填写非负整数" MaxLength="5"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">岗位缺编人数
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="tbLessNum" runat="server" class="kpms-textbox-money"
                                    field="LessNum" tablename="EHR_Position" activestatus="(23.*)" Regex="^\d+" ErrMsg="请填写非负整数"
                                    MaxLength="5" readonly="readonly">
                                </zhongsoft:XHtmlInputText>
                            </td>
                            <td class="td-l">岗位超编人数
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="tbOutterNum" runat="server" class="kpms-textbox-money"
                                    field="OutterNum" tablename="EHR_Position" activestatus="(23.*)" Regex="^\d+"
                                    ErrMsg="请填写非负整数" MaxLength="5" readonly="readonly">
                                </zhongsoft:XHtmlInputText>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">成立日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtSetUpTime" class="kpms-textbox-date"
                                    style="width: 80px" field="SETUPDATE" tablename="EHR_Position" activestatus="(23.*)"
                                    readonly="readonly" />
                            </td>
                            <td class="td-l">撤销日期
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtUndoTime" class="kpms-textbox" style="width: 80px"
                                    field="UNDODATE" tablename="EHR_Position" activestatus="(23.N)" readonly="readonly" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">备注
                            </td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" EnableTheming="false"
                                    runat="server" TextMode="MultiLine" maxtext="512" tablename="EHR_Position" field="MEM0"
                                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">岗位类型<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:XHtmlInputText runat="server" ID="txtRoleName" readonly="readonly" class="kpms-textbox-short"
                                    req="1"   activestatus="(23.*)" />
                                <asp:ImageButton runat="server" ID="ibtnChoosePositionRole" ImageUrl="../../../Themes/Images/btn_select.gif"
                                    ToolTip="选择" TabIndex="1" OnClientClick="return ChoosePositionRole();" CausesValidation="False"
                                    ActiveStatus="(23.*)" DisplayStatus="(23.*)" />
                            </td>
                            <td class="td-l">岗位角色
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionRole" field="PositionRole"
                                    tablename="EHR_Position" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr displaystatus="(3.*)" runat="server">
                            <td class="td-m" colspan="4">
                                <zhongsoft:LightFileUploader ID="ibtnAttach" runat="server" OnClick="ibtnAttach_Click"
                                    DisplayStatus="(3.*)">
                                <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                                <span>上传岗位工作标准</span>
                                </zhongsoft:LightFileUploader>
                            </td>
                        </tr>
                        <tr displaystatus="(13.*)" runat="server">
                            <td class="td-m" colspan="6">
                                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                                    ShowDeleteBySelf="true" />
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="btnBack" runat="server" OnClick="btnBack_Click" Visible="false"></asp:LinkButton>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="userInfo">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td>
                                <span id="Span1" runat="server" displaystatus="(2.*)" class="req-star">请先保存再添加上岗人员</span>
                                <div style="line-height: 30px">
                                    <asp:LinkButton runat="server" ID="btnaddPositionUser" class="kpms-btn" OnClick="btnaddPositionUser_Click"
                                        OnClientClick="return ChoosePositionUser()" displaystatus="(3.*)" EnableTheming="false">
                                     <img src="../../../Themes/Images/btn_add.gif" />
                                     <span>添加岗位人员</span>
                                    </asp:LinkButton>
                                </div>

                            </td>
                        </tr>
                        <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                            UseDefaultDataSource="true" AllowPaging="true" DataKeyNames="PositionUserID,USERID"
                            OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                            <Columns>
                                <asp:BoundField HeaderText="工号" DataField="UserCode"></asp:BoundField>
                                <asp:BoundField HeaderText="姓名" DataField="UserName"></asp:BoundField>
                                <asp:BoundField HeaderText="部门" DataField="OrgUnitName"></asp:BoundField>
                                <%--<asp:BoundField HeaderText="所属职务" DataField="Position"></asp:BoundField>--%>
                                <asp:BoundField HeaderText="在岗状态" DataField="PositionState"></asp:BoundField>
                                <asp:BoundField HeaderText="上任日期" DataField="APPOINTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                <asp:BoundField HeaderText="卸任日期" DataField="LEAVEDATE" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-HorizontalAlign="Center"></asp:BoundField>
                                <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="资格" CausesValidation="false"
                                    ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px" EditIdField="UserID"
                                    EditPageWidth="900px" EditPageHeight="600px" EditPageUrl="~/EHR/List/QualifManagement/AllQualifList.aspx">
                                </zhongsoft:LightButtonField>
                                <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" EnableTheming="false">
                        <img alt="编辑" id="Img1"  onclick='return EditItem("<%#Eval("PositionUserID") %>");'
                            border="0" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="删除" HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
                        <img alt="删除" id="Img2"  border="0" src="../../../Themes/Images/btn_dg_delete.gif" style="cursor: hand" onclick="return confirm('确认删除？')" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <input type="hidden" runat="server" id="hiRoleXML" />
    <input type="hidden" runat="server" id="hiRoleId" field="RoleId" tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="EHR_Position" />
    <input type="hidden" id="hiSubordinate" runat="server" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EHR_Position"
        value="1" />
    <input type="hidden" id="hiUserNum" runat="server" field="UserNum" tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiPositionUserXml" />
    <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
        tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiPositionID" field="PositionID" tablename="EHR_Position" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            $('#templateTabs').tabs();
            checkRegex();
            checkMaxLength();
            CalculateUser();
        }

        $('#<%=tbPersonsNum.ClientID %>').live('change', function () {
            CalculateUser();
        })
        $('#<%=hiUserNum.ClientID %>').live('change', function () {
            CalculateUser();
        })

        function CalculateUser() {
            var $PersonsNum = $('#<%=tbPersonsNum.ClientID %>');
            var $LessNum = $('#<%=tbLessNum.ClientID %>');
            var $OutterNum = $('#<%=tbOutterNum.ClientID %>');
            var $UserNum = $('#<%=hiUserNum.ClientID %>');
            var num = ConvertToNum($PersonsNum.val()) - ConvertToNum($UserNum.val());
            if (num > 0) {
                $LessNum.val(num);
                $OutterNum.val("");
            }
            else if (num < 0) {
                $OutterNum.val(-num);
                $LessNum.val("");
            }
            else {
                $OutterNum.val("");
                $LessNum.val("");
            }
        }

        function ConvertToNum(num) {
            if (num == "" || num == null) {
                return parseInt("0");
            }
            else {
                return parseInt(num);
            }
        }

        function ReBack() {
             <%=Page.ClientScript.GetPostBackEventReference(this.btnBack,"") %>;
        }

        //选择直接上级
        function ChooseParentPosition() {
            var currentID = $("#<%=hiPositionID.ClientID %>").val();
            var param = new InputParamObject("s");
            var filter = "{CurrentPositionID:'" + currentID + "'}";
            var re = getPosition("", param, filter);
            if (re != null) {
                $("#<%=hiParentID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtParentName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
        //选择直接下级
        function ChooseSubordinatePosition() {
            var currentID = $("#<%=hiPositionID.ClientID %>").val();
            var param = new InputParamObject("m");
            var filter = "{CurrentPositionID:'" + currentID + "'}";
            var re = getPosition("<%=hiSubordinate.ClientID %>", param, filter);
            if (re != null) {
                var strParam = '';
                var nodes = re.selectNodes('root/o');
                for (var i = 0; i < nodes.length; i++) {
                    strParam += nodes[i].getAttribute('name') + ';';
                }
                $("#<%=txtSubordinate.ClientID %>").val(strParam);
            }
            return false;
        }
        //选择流程角色
        function ChoosePositionRole() {
            var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
            var param = new InputParamObject("s");
            var re = getRoles("<%=hiRoleXML.ClientID %>", param, "|" + orgId);
            if (re != null) {
                $("#<%=hiRoleId.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtRoleName.ClientID %>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
        //选择岗位人员
        function ChoosePositionUser() {
            var param = new InputParamObject("m");
            var deptID = $('#<%=hiOrganizationID.ClientID %>').val();
            var json = { OrganizationID: deptID };
            var re = getUsers("<%=hiPositionUserXml.ClientID %>", param, json);
            if (re != null) {
                if (re.buildAttrJson("o", "name") != "") {
                    return true;
                }
            }
            return false;
        }



        function EditItem(bizId) {
            var stringFeatures = "dialogHeight:400px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:auto; status: no;";
            var url = "<%=WebAppPath %>" + "/EHR/List/Organization/PositionUserEditor.aspx?&actionType=3&bizId=" + bizId;
            if (window.showModalDialog(url, null, stringFeatures) == undefined) {
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
