<%@ Page Language="C#" Title="公文模板编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="OfficialTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.KOA.OfficialTemplateEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">红头类型<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlRedHeadType" TableName="KMS_KOA_OfficialTemplate" Field="RedHeadType" ActiveStatus="(23.*)" req="1" runat="server" Width="180px" />
                <input type="hidden" runat="server" id="hiRedHeadTypeText" field="RedHeadTypeText" tablename="KMS_KOA_OfficialTemplate" />

            </td>
            <td class="td-l">模板名称<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtTemplateName" runat="server" class="kpms-textbox" readonly="readonly"
                    TableName="KMS_KOA_OfficialTemplate" Field="TemplateName" ActiveStatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">上传模版<span class="req-star">*</span></td>
            <td class="td-r" colspan="2">
                <asp:FileUpload runat="server" ID="fupFile" displaystatus="(23.*)" Width="180px" />
            </td>
            <td class="td-r">
                <a id="aFile" runat="server" visible="false" target="_blank" href="">下载</a>
                <input type="hidden" runat="server" id="hiTemplatePath" field="TemplatePath" tablename="KMS_KOA_OfficialTemplate" />
            </td>

        </tr>
        <tr>
            <td class="td-l" colspan="6">
                <p style="color: red">选择文件后必须点击保存文件才能保存到服务器中!</p>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_KOA_OfficialTemplate" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_KOA_OfficialTemplate" field="OfficialTemplateId" />
    <script type="text/javascript">
        function checkForm() {
            return checkDoc();
        }
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        var filetype = ["doc", "dot"];
        $('#<%=fupFile.ClientID %>').on("change", function () {
            var filePath = $(this).val();
            var arr = filePath.split('.');
            var fileName = (arr[arr.length - 1]).toLowerCase();

            if ($.inArray(fileName, filetype) < 0) {
                alert("文件格式错误，请上传doc、dot文件格式！");
                $(this).after($(this).clone().val(""));
                $(this).remove();
                return false;
            }
            return true;
        });

        function checkDoc() {
            var filePath = $('#<%=fupFile.ClientID %>').val();
            if (filePath != "") {
                var arr = filePath.split('.');
                var fileName = (arr[arr.length - 1]).toLowerCase();
                if ($.inArray(fileName, filetype) < 0) {
                    alert("文件格式错误，请上传doc、docx 文件格式！");
                    $(this).after($(this).clone().val(""));
                    $(this).remove();
                    return false;
                }
            }
            return true;
        }

    </script>
</asp:Content>
