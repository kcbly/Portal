<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="岗位合并" CodeBehind="PositionMergerEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.PositionMergerEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="BusinessObjectHolder">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                合并岗位<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbMerger" runat="server" readonly="readonly" class="kpms-textbox-short" activestatus="(23.*)" req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiMerger" runat="server" />
                <asp:ImageButton runat="server" ID="btnMerger" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseMergerPosition();" CausesValidation="False"
                    DisplayStatus="(2.*)" OnClick="btnMerger_Click" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合并后岗位编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                    tablename="EHR_Position" />
                <input type="hidden" runat="server" id="hiPositionID" field="PositionID" tablename="EHR_Position" />
                <zhongsoft:LightTextBox runat="server" ID="tbPositionCode" CssClass="kpms-textbox"
                    MaxLength="20" req="1" field="PositionCode" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合并后岗位名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPositionName" CssClass="kpms-textbox"
                    MaxLength="64" req="1" field="PositionName" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                岗位类型<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiRoleXML" />
                <input type="hidden" runat="server" id="hiRoleId" field="RoleId" tablename="EHR_Position" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtRoleName" readonly="readonly" class="kpms-textbox-short"
                    req="1" field="RoleName" tablename="EHR_Position" activestatus="(23.*)" />
                <asp:ImageButton runat="server" ID="ibtnChoosePositionRole" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChoosePositionRole();" CausesValidation="False"
                    ActiveStatus="(2.*)" DisplayStatus="(2.*)" />
            </td>
            <td class="td-l">
                岗位职级
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlPostLevel" runat="server" field="POSITIONLEVEL" tablename="EHR_Position"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                直接上级
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="EHR_Position" />
                <zhongsoft:XHtmlInputText runat="server" ID="txtParentName" readonly="readonly" class="kpms-textbox"
                    style="width: 150px" activestatus="(23.*)" />
                <asp:ImageButton runat="server" ID="ibtnChooseParentPosition" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseParentPosition();" CausesValidation="False"
                    DisplayStatus="(23.*)" />
            </td>
            <td class="td-l">
                直接下级
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSubordinate" readonly="readonly"
                    class="kpms-textbox" style="width: 150px" activestatus="(23.*)" />
                <input type="hidden" id="hiSubordinate" runat="server" />
                <asp:ImageButton runat="server" ID="btnSubordinate" ImageUrl="~/Themes/Images/btn_select.gif"
                    ToolTip="选择" TabIndex="1" OnClientClick="return ChooseSubordinatePosition();"
                    CausesValidation="False" DisplayStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属职务
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSubordinatePost" CssClass="kpms-textbox"
                    MaxLength="32" field="BELONGRANK" tablename="EHR_Position" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                岗位分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionClassify" field="PositionClassify"
                    tablename="EHR_Position" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                岗位角色
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPositionRole" field="PositionRole"
                    tablename="EHR_Position" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                岗位定编人数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPersonsNum" runat="server" CssClass="kpms-textbox-money"
                    EnableTheming="false" field="PersonsNum" tablename="EHR_Position" activestatus="(23.*)"
                    regex="^\d+$" errmsg="请填写非负整数" MaxLength="5"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                岗位缺编人数
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbLessNum" runat="server" class="kpms-textbox-money"
                    field="LessNum" tablename="EHR_Position" activestatus="(23.*)" Regex="^\d+" ErrMsg="请填写非负整数"
                    MaxLength="5" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                岗位超编人数
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbOutterNum" runat="server" class="kpms-textbox-money"
                    field="OutterNum" tablename="EHR_Position" activestatus="(23.*)" Regex="^\d+"
                    ErrMsg="请填写非负整数" MaxLength="5" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成立日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSetUpTime" class="kpms-textbox-date"
                    style="width: 80px" field="SETUPDATE" tablename="EHR_Position" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
            <td class="td-l">
                撤销日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUndoTime" class="kpms-textbox" style="width: 80px"
                    field="UNDODATE" tablename="EHR_Position" activestatus="(23.N)" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" EnableTheming="false"
                    runat="server" TextMode="MultiLine" maxtext="512" tablename="EHR_Position" field="MEM0"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr  DisplayStatus="(3.*)" runat="server">
            <td class="td-m" colspan="4">
                <asp:LinkButton ID="ibtnAttach" runat="server" CssClass="kpms-btn" EnableTheming="false"
                    OnClientClick="UpLoadFile()" OnClick="ibtnAttach_Click" >
                                <img src="../../../Themes/Images/btn_dg_upfile.gif" />
                                <span>上传岗位工作标准</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr  DisplayStatus="(13.*)" runat="server">
            <td class="td-m" colspan="4">
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                    ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EHR_Position" />
    <input type="hidden" runat="server" id="hiUserNum" field="UserNum" tablename="EHR_Position"/>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            CalculateUser();
        }

        $('#<%=tbPersonsNum.ClientID %>').live('change', function () {
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

        function ChooseMergerPosition() {
            var param = new InputParamObject("m");
            var re = getPosition("<%=hiMerger.ClientID %>", param, null);
            if (re != null) {
                return true;
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

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "Module";
            var buildSelf = "False";

            var url = "<%=WebAppPath %>" +"/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
