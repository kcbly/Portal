<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="多媒体授权管理" CodeBehind="MultimediaAuthorizeList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.MultimediaAuthorizeList" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="toolBar">
    <table>
        <tr>
            <td>
                工号/姓名/简拼
                <asp:TextBox ID="tbUser" runat="server" Width="70px"></asp:TextBox>
                文件类型
                <asp:DropDownList ID="ddlFileType" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="listGrid">
    <zhongsoft:LightPowerGridView ID="gvMultimedia" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" AllowPaging="true" AllowSorting="true" ShowExport="true"
        BindGridViewMethod="BindGrid" DataKeyNames="UserId,MultimediaID" OnRowCommand="gvMultimedia_RowCommand"
        OnRowDataBound="gvMultimedia_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="UserCode" HeaderText="工号" SortExpression="UserCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" SortExpression="UserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门" SortExpression="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SubDeptName" HeaderText="科室" SortExpression="SubDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileType" HeaderText="文件类型" SortExpression="FileType">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="文件名称" HeaderStyle-Width="35%">
                <ItemTemplate>
                    <uc1:AttachmentView ID="AttachmentView1" FileSourceID='<%#Eval("MultimediaID") %>'
                        runat="server" ShowDelete="false" RepeatColumns="1" />
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="授权" CommandName="DeleteAudit" ImageUrl="../../../Themes/Images/btn_examine.gif"
                DeleteText="确定授权给{0}下载权限吗？" DeleteTipField="UserName">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="回收" CommandName="DeleteBack" ImageUrl="../../../Themes/Images/btn_chexiao.gif"
                DeleteText="确定回收{0}的下载授权吗？" DeleteTipField="UserName">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiRZDeptCode" runat="server" value="01017032" />
</asp:Content>
