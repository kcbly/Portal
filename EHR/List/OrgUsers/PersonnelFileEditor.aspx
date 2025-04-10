<%@ Page Title="人事档案编辑" Language="C#" AutoEventWireup="true" CodeBehind="PersonnelFileEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.PersonnelFileEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%--<zhongsoft:LightObjectSelector runat="server" ID="tbUserCode" Field="UserCode" tablename="EHR_UB_PersonnelFile"
                    Activestatus="(23.*)" DoCancel="true" req="1" ResultAttr="UserCode" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserName':'name'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" />--%>
                <input type="hidden" id="hiUserId" runat="server" field="UserID" tablename="EHR_UB_PersonnelFile" />
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" readonly="readonly" req="1"
                    class="kpms-textbox" field="UserCode" tablename="EHR_UB_PersonnelFile" activestatus="(23.*)" />
            </td>
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
<%--                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="UserName" Tablename="EHR_UB_PersonnelFile" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>--%>
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','txtDept':'OrgUnitName'}" EnableTheming="false"
                    Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" field="UserName" tablename="EHR_UB_PersonnelFile" />
            </td>
        </tr>
        <tr>
            <td class="td-l">档案编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFileCode" runat="server" Field="FileCode" req="1" MaxLength="32" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">人事档案类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlFileType" req="1" Field="FileType" Tablename="EHR_UB_PersonnelFile" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">地点<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPlace" runat="server" Field="Place" MaxLength="512" req="1" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">档案管理单位<span class="req-star">*</span>

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbManagementUnit" runat="server" Field="ManagementUnit" MaxLength="512" req="1" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">正本卷数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbOriginalNumber" runat="server" DataType="Integer" Field="OriginalNumber" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)" MaxLength="5">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">副本卷数

            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCopyNumber" runat="server" DataType="Integer" Field="CopyNumber" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)" MaxLength="5">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">档案条形码号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBarNumber" runat="server" Field="BarNumber" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)" MaxLength="64">
                </zhongsoft:LightTextBox>
            </td>
             <td class="td-l">档案变动原因
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbChangeReason" runat="server" Field="ChangeReason" Tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)" MaxLength="512">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="Memo" tablename="EHR_UB_PersonnelFile" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelFileID" tablename="EHR_UB_PersonnelFile" field="PersonnelFileID" />

    <script type="text/javascript">
        function initCustomerPlugin() {

        }
        
    </script>
</asp:Content>