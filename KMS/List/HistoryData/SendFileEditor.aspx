<%@ Page Title="历史收文查看页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="SendFileEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.HistoryData.SendFileEditor" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
 <table class="tz-table" style="border-bottom-width: 0px!important">
    <tr>
        <td class="td-l">文件标题<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbFileTitle" activestatus="(23.拟稿)"
                Field="FileTitle" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                req="1" Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发文类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="txtFileCategoryText" activestatus="(23.拟稿)"
                Field="FileCategoryText" MaxLength="32" Width="100px" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox"
                EnableTheming="false" />     
        </td> 
        <td class="td-l" title="">密&nbsp;&nbsp;&nbsp;&nbsp;级
        </td>
        <td class="td-r">
             <zhongsoft:LightTextBox runat="server" ID="txtSecurityLevelName" activestatus="(23.拟稿)"
                Field="SecurityLevelName" MaxLength="32" Width="100px" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox"
                EnableTheming="false" />   
        </td>
          <td class="td-l" title="">   </td>
        <td class="td-r">   </td>
    </tr>
    <tr> 
        <td class="td-l">文&nbsp;&nbsp;&nbsp;&nbsp;号
        </td>
        <td class="td-r">
           
            <zhongsoft:LightTextBox runat="server" ID="txtFileCode" ActiveStatus="(23.套红、盖章)"
                Field="FileCode" MaxLength="200" tablename="KMS_KOA_SendFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" /> 
        </td>
        <td class="td-l">紧急程度
        </td>
        <td class="td-r">
             <zhongsoft:LightTextBox runat="server" ID="txtPriorityLevelName" activestatus="(23.拟稿)"
                Field="PriorityLevelName" MaxLength="32" Width="100px" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox"
                EnableTheming="false" /> 
        </td>
          <td class="td-l" title="">   </td>
        <td class="td-r">   </td>
    </tr> 
    <tr>
        <td class="td-l">主&nbsp;&nbsp;&nbsp;&nbsp;送<span class="req-star">*</span>
        </td>
        <td class="td-r">  
            <zhongsoft:LightTextBox runat="server" ID="txtMainSendDeptName" ActiveStatus="(23.拟稿)" req="1"
                Field="MainSendDeptName" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>

        <td class="td-l">抄&nbsp;&nbsp;&nbsp;&nbsp;送
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCopySendDeptName" activestatus="(23.拟稿)"
                Field="CopySendDeptName" MaxLength="128" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
        <td class="td-l">保密期限
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbKeepYears" activestatus="(23.拟稿)"
                Field="KeepYears" MaxLength="32" Width="100px" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox"
                EnableTheming="false" />
        </td>


    </tr>
    <tr>

        <td class="td-l">备&nbsp;&nbsp;&nbsp;&nbsp;注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" activestatus="(23.拟稿)"
                Field="Memo" MaxLength="500" tablename="KMS_KOA_SendFileForm"
                TextMode="MultiLine" Rows="1" CssClass="kpms-textarea memo-title" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">拟稿人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" TableName="KMS_KOA_SendFileForm"
                Field="CreateUserName" activestatus="(23.拟稿)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiCreateUserId" tablename="KMS_KOA_SendFileForm"
                field="CreateUserId" />
        </td>
        <td class="td-l">拟稿部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtHostDeptName" runat="server" TableName="KMS_KOA_SendFileForm"
                Field="HostDeptName" activestatus="(23.拟稿)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiHostDeptId" tablename="KMS_KOA_SendFileForm"
                field="HostDeptId" />
        </td>

        <td class="td-l">拟稿时间
        </td>
        <td class="td-r">
                 <zhongsoft:XHtmlInputText type="text" runat="server" ID="tbCreateDate" tablename="KMS_KOA_ReceiveFileForm" req="1"
                readonly="readonly" class="kpms-textbox-date" field="CreateDate" activestatus="(23.拟稿)">
            </zhongsoft:XHtmlInputText> 
    </tr>

    <tr>
        <td class="td-l">发文正文
        </td>  
        <td class="td-m" colspan="5">
 

             <uc3:UpLoadFile ID="uploadFileView" runat="server" ShowDelete="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发文附件
        </td>

        <td class="td-m" colspan="5"> 
            <uc3:UpLoadFile ID="uploadFile" runat="server" ShowDelete="false" />
        </td>
    </tr> 
    <tr>
        <tr>
            <td class="td-l">主题词
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="txtThemeWord" activestatus="(23.拟稿)"
                    Field="ThemeWord" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                    TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
            </td>
        </tr> 
    </tr>
</table>

<input type="hidden" id="hiFileEntityID" runat="server" field="SendFileFormId" tablename="KMS_KOA_SendFileForm" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
       
            var showtxt=$('.kpms-tablebordernone').find('a') ; 
            for (var i = 0, j = showtxt.length; i < j; i++) {
                var isXiaZai = showtxt[i].innerText;
                if ($.trim(isXiaZai) == "下载") {
                   showtxt[i].innerText="";
                }
            }
        }

    </script>
</asp:Content>

