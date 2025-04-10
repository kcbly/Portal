<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ColumnSetEditor.aspx.cs" Inherits="Zhongsoft.Portal.PWS.BGM.List.ColumnSetEditor" %>

<%@ Register Src="~/Sys/FileDocument/PWSUpLoadFile.ascx" TagName="UpLoadFile" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">上级栏目名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbParentColumnName" ReadOnly="true" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">栏目名称<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbColumnName" runat="server" MaxText="64" TableName="PWS_ColumnSet" Field="ColumnName" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">栏目类别<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlColumnClass" runat="server" TableName="PWS_ColumnSet" Field="ColumnClass" ActiveStatus="(23.*)" req="1"></zhongsoft:LightDropDownList>
                <input type="hidden" id="hiColumnType" runat="server" tablename="PWS_ColumnSet" field="ColumnType" />
            </td>
            <td class="td-l">栏目位置</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlColumnPosition" runat="server" TableName="PWS_ColumnSet" Field="ColumnPosition" ActiveStatus="(23.*)"></zhongsoft:LightDropDownList>
            </td>
        </tr>
         <tr>
            <td class="td-l">访问地址</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbVisitAddress" runat="server" MaxText="200" TableName="PWS_ColumnSet" Field="VisitAddress" ActiveStatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">所属部门</td>
            <td class="td-r" colspan="3">
                <div style="width: 40%">
                    <zhongsoft:LightObjectSelector runat="server" ID="tbBelongDeptName" IsMutiple="false"
                        SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                        DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiBelongDeptId':'id'}"
                        PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" tablename="PWS_ColumnSet" field="BelongDeptName"></zhongsoft:LightObjectSelector>
                    <input type="hidden" runat="server" id="hiBelongDeptId" tablename="PWS_ColumnSet" field="BelongDeptId" />
                </div>
            </td>
            <td class="td-l" style="display: none">访问权限<span class="req-star">*</span></td>
            <td class="td-r" style="display: none">
                <asp:RadioButtonList ID="rbVisitAccess" req="1" runat="server" RepeatDirection="Horizontal" TableName="PWS_ColumnSet" Field="VisitAccess" ActiveStatus="(23.*)"></asp:RadioButtonList>
            </td>
        </tr>       
        <tr>
            <td class="td-l">封面图片</td>
            <td class="td-m" colspan="3">
                <span displaystatus="(2.*)" runat="server" class="req-star">先保存数据，再上传封面图片！</span><br />
                <asp:LinkButton ID="btnuploadImg" runat="server" DisplayStatus="(3.*)" EnableTheming="false"
                    CssClass="kpms-btn"><img src="../../../Themes/Images/btn_upload.gif" alt="上传封面图片" /><span>上传封面图片</span></asp:LinkButton>
                <span style="color: red; margin-left: 20px" runat="server" displaystatus="(3.*)">请上传'.gif', '.png', '.jpeg', '.jpg', '.bmp'格式的图片！</span>
            </td>
        </tr>
        <tr displaystatus="(13.*)" runat="server">
            <td colspan="4" class="td-r">
                <uc3:UpLoadFile ID="uploadImg" runat="server" RepeatColumns="3" ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr>
            <td class="td-l">图标</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbIcon" EnableTheming="false" runat="server" TableName="PWS_ColumnSet" Field="Icon" ActiveStatus="(23.*)" CssClass="kpms-textbox" Style="width: 100px" />
            </td>
            <td class="td-l">排序</td>
            <td class="td-r">
                <zhongsoft:LightTextBox CssClass="kpms-textbox-money" ID="tbSort" runat="server" EnableTheming="false" TableName="PWS_ColumnSet" Field="Sort" ActiveStatus="(23.*)" DataType="PositiveInteger" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否信息宣传审批
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="tbIsShowMessagePublicity" field="IsShowMessagePublicity" tablename="PWS_ColumnSet" activestatus="(23.*)" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" field="Flag" tablename="PWS_ColumnSet" activestatus="(23.*)" RepeatDirection="Horizontal" req="1">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiColumnID" runat="server" tablename="PWS_ColumnSet" field="ColumnID" />
    <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="PWS_ColumnSet" />
    <asp:Button ID="btnReset" runat="server" Visible="false" OnClick="btnReset_Click" />
    <script type="text/javascript">
        //上传封面图片
        function uploadFile(fileType) {
            var uploadType = "Pws";
            var url = buildQueryUrl("<%=WebAppPath %>/sys/filedocument/fileuploader.aspx", { fileSourceId: "<%= this.BusinessObjectId %>", fileSourceFlag: uploadType, fileType: fileType, uploadType: fileType, multiselect: false });
            showDivDialog(encodeURI(url), null, 500, 400, callback);
            return false;
        }
        //编辑资产弹出层callback方法
        function callback() {
             <%=Page.ClientScript.GetPostBackEventReference(this.btnReset,"") %>;
        }
    </script>
</asp:Content>
