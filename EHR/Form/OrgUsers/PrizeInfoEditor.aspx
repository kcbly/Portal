<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PrizeInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.OrgUsers.PrizeInfoEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserCode" tablename="EHR_PrizeInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="工号" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" readonly="readonly"
                    class="kpms-textbox" field="UserName" tablename="EHR_PrizeInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbOrgUnitName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_PrizeInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    获奖名称<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbPrizeName" field="PrizeName" tablename="EHR_PrizeInfoTemp"
                        fieldname="获奖名称" status="0" req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    获奖级别<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbPrizeLevel" field="PrizeLevel"
                        tablename="EHR_PrizeInfoTemp" req="1" fieldname="获奖级别" status="0" activestatus="(23.申请人填写信息)(23.申请人修改信息)">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    获奖类别<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbPrizeType" field="PrizeType" tablename="EHR_PrizeInfoTemp"
                        req="1" fieldname="获奖类别" status="0" activestatus="(23.申请人填写信息)(23.申请人修改信息)">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    获奖日期<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="tbPRIZEDATE" class="kpms-textbox-date"
                        fieldname="获奖日期" status="0" req="1" field="PRIZEDATE" tablename="EHR_PrizeInfoTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    获奖项目名称
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbProjectName" field="ProjectName" tablename="EHR_PrizeInfoTemp"
                        fieldname="获奖项目名称" status="0" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    获奖项目编号
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" field="ProjectCode" tablename="EHR_PrizeInfoTemp"
                        fieldname="获奖项目编号" status="0" MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    担任角色
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbROLENAME" field="ROLENAME" tablename="EHR_PrizeInfoTemp"
                        fieldname="担任角色" status="0" MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    授奖单位
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbAWARDCORP" field="AWARDCORP" tablename="EHR_PrizeInfoTemp"
                        fieldname="授奖单位" status="0" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    备注
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        fieldname="备注" status="0" EnableTheming="false" maxtext="512" tablename="EHR_PrizeInfoTemp"
                        field="Memo" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    批准文件
                </td>
                <td class="td-m" colspan="3">
                    <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                        class="req-star">请先保存再上传批准文件</span>
                    <asp:ImageButton ID="ibtnAttach" ImageUrl="~/Themes/Images/btn_dg_upfile.gif" runat="server"
                        Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click" ToolTip="上传附件"
                        CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.*)" />
                    <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" ShowDelete="true"
                        ShowDeleteBySelf="true" />
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_PrizeInfoTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPrizeInfoID" field="PrizeInfoID" tablename="EHR_PrizeInfoTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPrizeInfoTempID" field="PrizeInfoTempID"
        tablename="EHR_PrizeInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiUSERINFOPASSID" field="USERINFOPASSID"
        tablename="EHR_PrizeInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiPrizeName" value="获奖信息" />
    <input type="hidden" runat="server" id="hiPrizeUrl" value="/EHR/Form/OrgUsers/PrizeInfoEditor.aspx" />
    <input type="hidden" runat="server" id="hiPrizeFCode" value="PrizeName" />
    <input type="hidden" runat="server" id="hiPrizeFName" value="获奖名称" />
    <input type="hidden" runat="server" id="hiTableCode" value="EHR_PrizeInfoTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="PrizeInfoTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="PrizeInfoID" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "OrgUsers";
            var buildSelf = "False";

            var url = "<%=WebAppPath %>/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
    <script type="text/javascript">
        $(function () {
            SetBackGround();
        });
    </script>
</asp:Content>
