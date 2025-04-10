<%@ Page Title="历史收文查看页" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="ReceiveFileEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.HistoryData.ReceiveFileEditor" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
  <table class="tz-table">
    <tr>
        <td class="td-l ">收文日期 <span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtReceiveFileDate" tablename="KMS_KOA_ReceiveFileForm"
                readonly="readonly" class="kpms-textbox-date" field="ReceiveFileDate" req="1"
             activestatus="(23.收文拟办)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">所属年份<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFileYear" field="PostFileYear" tablename="KMS_KOA_ReceiveFileForm" regex="^[0-9]*[1-9][0-9]*$" errmsg="请输入正整数"
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)"
                req="1" Style="width: 100px"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">密&nbsp;&nbsp;级
        </td>
        <td class="td-r">
               <zhongsoft:LightTextBox runat="server" ID="txtSecurityLevelName" field="SecurityLevelName" tablename="KMS_KOA_ReceiveFileForm"  
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)"
                req="1" Style="width: 100px"></zhongsoft:LightTextBox>
           
        </td>
    </tr>
    <tr>
        <td class="td-l">收文类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
              <zhongsoft:LightTextBox runat="server" ID="txtFileStyleText" field="FileStyleText" tablename="KMS_KOA_ReceiveFileForm"  
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)"
                req="1" Style="width: 100px"></zhongsoft:LightTextBox>
          
        </td>
        <td class="td-l">收文编号<span class="req-star">*</span>
        </td>
        <td class="td-r">

            <zhongsoft:XHtmlInputText ID="tbSerialCode" TableName="KMS_KOA_ReceiveFileForm" Field="SerialCode" runat="server" ActiveStatus="(23.收文拟办)" class="kpms-textbox"  />
            <input type="hidden" runat="server" id="hiFileYearAndPostFileFlow" field="FileYearAndPostFileFlow"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
        <td class="td-l">紧急程度
        </td>
        <td class="td-r">
              <zhongsoft:LightTextBox runat="server" ID="txtPriorityLevelName" field="PriorityLevelName" tablename="KMS_KOA_ReceiveFileForm"  
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)"
                req="1" Style="width: 100px"></zhongsoft:LightTextBox> 
        </td>
    </tr>
    <tr>
        <td class="td-l ">文件标题<span class="req-star">*</span>
        </td>
        <td class="td-m " colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbFileTitle" field="FileTitle" tablename="KMS_KOA_ReceiveFileForm"
                CssClass="kpms-textbox" EnableTheming="false" MaxLength="512" req="1"
                 activestatus="(23.收文拟办)"></zhongsoft:LightTextBox>
        </td>

    </tr>
    <tr>
        <td class="td-l">发文单位<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="ltbFileDeptName" ActiveStatus="(23.收文拟办)" req="1"
                Field="FileDeptName" MaxLength="512" tablename="KMS_KOA_ReceiveFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">原文字号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFileCode" field="FileCode" tablename="KMS_KOA_ReceiveFileForm"
                EnableTheming="false" Width="180px" req="1"
                MaxLength="32" activestatus="(23.收文拟办)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">份数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtCopies" field="Copies" tablename="KMS_KOA_ReceiveFileForm"
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)" regex="^[1-9]\d*$" errmsg="请输入正整数"
                Style="width: 90px"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l ">发文日期 <span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtFileDate" tablename="KMS_KOA_ReceiveFileForm" req="1"
                readonly="readonly" class="kpms-textbox-date" field="FileDate" activestatus="(23.收文拟办)">
            </zhongsoft:XHtmlInputText>
        </td>

    </tr>
    <tr>
        <td class="td-l ">备&nbsp;&nbsp;注
        </td>
        <td class="td-m " colspan="5">
            <zhongsoft:LightTextBox runat="server" TextMode="MultiLine" EnableTheming="false"
                Rows="1" CssClass="kpms-textarea memo-title" ID="tbMemo" field="Memo" tablename="KMS_KOA_ReceiveFileForm"
                activestatus="(23.收文拟办)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">收文正文
        </td>
        <td class="td-m" colspan="5"> 
            <asp:LinkButton runat="server" ID="LinkViewText" OnClientClick="return openTextBody('text','view')"
                key="ViewText" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="查看正文"  width="20px"  height="20px"/><span>查看正文</span></asp:LinkButton> 
              <uc3:UpLoadFile ID="uploadFileView" runat="server" ShowDelete="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">收文附件
        </td>

        <td class="td-m" colspan="5"> 
            <uc3:UpLoadFile ID="uploadFile" runat="server" ShowDelete="false" />
        </td>
    </tr>
</table>
     
<input type="hidden" id="hiReceiveFileID" runat="server" field="ReceiveFileFormID" tablename="KMS_KOA_ReceiveFileForm" />
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

