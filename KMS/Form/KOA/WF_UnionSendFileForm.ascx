<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_UnionSendFileForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.KOA.WF_UnionSendFileForm" %>
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %> 

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table width="100%" style="border: 0px" class="tz-table">
    <tr>
        <td colspan="6" align="center" style="border-left: 0px; border-right: 0px; border-top: 0px; height: 20px;">
            <div style="width: 100%;">
                <asp:Label ID="lbTitle" runat="server" Text="发文稿纸" ForeColor="Red" Font-Size="29px"
                    Font-Bold="true"></asp:Label>
            </div>
        </td>
    </tr>
</table>
<table class="tz-table" style="border-bottom-width: 0px!important">
    <tr style="display: none;">
        <td class="td-l" style="width: 15%;"></td>
        <td class="td-r" style="width: 18%;"></td>
        <td class="td-l" style="width: 15%;"></td>
        <td class="td-r" style="width: 18%;"></td>
        <td class="td-l" style="width: 15%;"></td>
        <td class="td-r" style="width: 19%;"></td>
    </tr>
    <tr>
        <td class="td-l">文件标题<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbFileTitle" activestatus="(23.填写申请)(23.修改申请)"
                Field="FileTitle" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                req="1" Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发文类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlFileCategory" runat="server" activestatus="(23.填写申请)(23.修改申请)"
                field="FileCategory" tablename="KMS_KOA_SendFileForm" req="1" />
            <zhongsoft:XHtmlInputText type="text" ID="txtOldCode" runat="server" readonly="readonly"
                class="kpms-textbox" style="width: 300px" Visible="false" />
            <input type="hidden" runat="server" id="hiFileCategoryText" field="FileCategoryText"
                tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l">公文类型
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlFileType" runat="server" activestatus="(23.填写申请)(23.修改申请)"
                field="FileType" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiFileTypeText" field="FileTypeText"
                tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l" title="">密&nbsp;&nbsp;&nbsp;&nbsp;级
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSecurityLevel" runat="server" activestatus="(23.填写申请)(23.修改申请)"
                field="SecurityLevel" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiSecurityLevelName" field="SecurityLevelName"
                tablename="KMS_KOA_SendFileForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发文类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlFileClass" runat="server" activestatus="(23.填写申请)(23.修改申请)" req="1"
                field="FileClass" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiFileClassText" field="FileClassText" tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l">是否需要文号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsNeedFileCode" runat="server" RepeatDirection="Horizontal" req="1" TableName="KMS_KOA_SendFileForm" Field="IsNeedFileCode" onclick="return IsNeedFileCode();"
                Activestatus="(23.套红、盖章)" />
            <input type="hidden" runat="server" id="hiIsNeedFileCodeText" field="IsNeedFileCodeText" tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l">文&nbsp;&nbsp;&nbsp;&nbsp;号
        </td>
        <td class="td-r">
            <%--            <asp:Label ID="lblCSX" runat="server" Text="陕电设"></asp:Label>
            <zhongsoft:LightDropDownList ID="ddlPostFileCode" runat="server" activestatus="(23.套红、盖章)"
                Width="60px" field="PostFileCode" tablename="KMS_KOA_SendFileForm" req="1" reqmsg="请选择文件字号"
                AutoPostBack="True" OnSelectedIndexChanged="ddlPostFileCode_SelectedIndexChanged" />
            〔
            <zhongsoft:XHtmlInputText type="text" activestatus="(23.套红、盖章)" class="kpms-textbox"
                style="width: 40px" ID="textFileYear" runat="server" readonly="readonly" field="PostFileYear"
                filldoc="lbFileYear" tablename="KMS_KOA_SendFileForm" />
            〕
            <asp:Label ID="lblHYJY" runat="server" Text="第" Visible="false"></asp:Label>
            <input type="hidden" runat="server" id="hiFileCode" field="FileCode" tablename="KMS_KOA_SendFileForm" />
            <zhongsoft:XHtmlInputText type="text" ID="textPostFileFlow" field="PostFileFlow"
                tablename="KMS_KOA_SendFileForm" activestatus="(23.套红、盖章)" style="width: 30px; text-align: right;"
                ErrMsg="请填写正整数" Regex="^[0-9]{1,}$" title="流水号" class="kpms-textbox"
                runat="server" filldoc="lbFileCode" /> <asp:Label ID="lblCodeH" runat="server" Text="号"></asp:Label> <asp:Label ID="lblCdoeQ" runat="server" Text="期"  Visible="false"></asp:Label>
             <asp:Button ID="btnCode" runat="server" Text="生成文号" OnClick="Button1_Click" activestatus="(23.套红、盖章)"
                displaystatus="(23.套红、盖章)" />--%>

            <zhongsoft:LightTextBox runat="server" ID="txtFileCode" ActiveStatus="(23.套红、盖章)"
                Field="FileCode" MaxLength="200" tablename="KMS_KOA_SendFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
            <input type="hidden" runat="server" id="hiFileYear" field="PostFileYear"
                tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiPostFileFlow" field="PostFileFlow"
                tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiFileYearAndFlow" field="FileYearAndFlow"
                tablename="KMS_KOA_SendFileForm" />
             <input type="hidden" runat="server" id="hiFileCode"  />
        </td>
    </tr>
    <tr>
        <td class="td-l">紧急程度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPriorityLevel" runat="server" activestatus="(23.填写申请)(23.修改申请)"
                field="PriorityLevel" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiPriorityLevelName" field="PriorityLevelName"
                tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l" id="target">红头类型
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlRedHeadType" runat="server" activestatus="(23.套红、盖章)"
                field="RedHeadType" tablename="KMS_KOA_SendFileForm" Width="230px" OnSelectedIndexChanged="ddlRedHeadType_SelectedIndexChanged" AutoPostBack="true" />
            <input type="hidden" runat="server" id="hiRedHeadTypeText" field="RedHeadTypeText"
                tablename="KMS_KOA_SendFileForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">主&nbsp;&nbsp;&nbsp;&nbsp;送<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%-- <zhongsoft:LightObjectSelector runat="server" ID="ltbMainSendDeptName" field="MainSendDeptName"
                tablename="KMS_KOA_SendFileForm" activestatus="(23.拟稿)"
                SourceMode="SelectorPage" SelectPageMode="Dialog" ShowJsonRowColName="true" EnableTheming="false"
                Writeable="true" ShowAttrs="name" Height="20" IsMutiple="false"
                PageUrl="~/KMS/Obsolete/KOAMainSendSelector.aspx" PageHeight="700" PageWidth="550" FilterFunction="filterFuc();"
                ResultAttr="name" req="1" reqmsg="请填写主送"></zhongsoft:LightObjectSelector>--%>
            <zhongsoft:LightTextBox runat="server" ID="txtMainSendDeptName" ActiveStatus="(23.填写申请)(23.修改申请)" req="1"
                Field="MainSendDeptName" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>

        <td class="td-l">抄&nbsp;&nbsp;&nbsp;&nbsp;送
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCopySendDeptName" activestatus="(23.填写申请)(23.修改申请)"
                Field="CopySendDeptName" MaxLength="128" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
        <td class="td-l">保密期限
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbKeepYears" activestatus="(23.填写申请)(23.修改申请)"
                Field="KeepYears" MaxLength="32" Width="100px" tablename="KMS_KOA_SendFileForm" CssClass="kpms-textbox"
                EnableTheming="false" />
        </td>


    </tr>
    <tr>
        <td class="td-l">发送范围</td>
        <td class="td-r" colspan="5">
            <asp:CheckBoxList runat="server" ID="cblSendScope" RepeatDirection="Horizontal" activestatus="(23.套红、盖章)">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hdnSendScopeText" field="SendScopeText" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hdnSendScope" field="SendScope" tablename="KMS_KOA_SendFileForm" />

        </td>
    </tr>
    <tr>

        <td class="td-l">备&nbsp;&nbsp;&nbsp;&nbsp;注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" activestatus="(23.填写申请)(23.修改申请)"
                Field="Memo" MaxLength="500" tablename="KMS_KOA_SendFileForm"
                TextMode="MultiLine" Rows="1" CssClass="kpms-textarea memo-title" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">拟稿人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" TableName="KMS_KOA_SendFileForm"
                Field="CreateUserName" activestatus="(23.填写申请)(23.修改申请)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiCreateUserId" tablename="KMS_KOA_SendFileForm"
                field="CreateUserId" />
        </td>
        <td class="td-l">拟稿部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtHostDeptName" runat="server" TableName="KMS_KOA_SendFileForm"
                Field="HostDeptName" activestatus="(23.填写申请)(23.修改申请)" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiHostDeptId" tablename="KMS_KOA_SendFileForm"
                field="HostDeptId" />
        </td>

        <td class="td-l">拟稿时间
        </td>
        <td class="td-r">
            <input id="tbCreateDate" runat="server" type="text" req="1" class="kpms-textbox-date"
                tablename="KMS_KOA_SendFileForm" field="CreateDate" readonly="readonly" activestatus="(23.填写申请)(23.修改申请)" /></td>
    </tr>

    <tr>
        <td class="td-l">发文正文
        </td>

        <td class="td-m" colspan="3">
            <zhongsoft:LightFileUploader runat="server" ID="LinkAddText" EnableTheming="false" key="AddText" Multiselect="false" BeforeUpload="beforeUploadText" Visible="false" OnClick="LinkAddText_Click">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_addtext.png" title="上载正文" id="imgAddText" width="20px"  height="20px"/><span>上传正文</span>
            </zhongsoft:LightFileUploader>
            <asp:LinkButton runat="server" ID="LinkSignText" OnClientClick="openDocBody('text','sign')" key="SignText" EnableTheming="false" Visible="false" OnClick="LinkSignText_Click"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_sign.png" title="盖章" width="20px"  height="20px"/><span>编辑盖章</span>
            </asp:LinkButton>
            <%--针对正文进行套打--%>
            <asp:LinkButton runat="server" ID="LinkClearPrintText" OnClientClick="openDocBody('text','edit')" key="ClearPrintText" EnableTheming="false" Visible="false" OnClick="LinkClearPrintText_Click"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="编辑正文" width="20px"  height="20px"/><span>编辑正文</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="LinkEditRedHead" OnClientClick="return editRedhead('editredhead')" key="RedHead" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_redhead.png" title="套红" width="20px"  height="20px"/><span>编辑套红正文</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="LinkRedHead" OnClientClick="return beforeRedhead()" key="RedHead" EnableTheming="false" Visible="false" OnClick="LinkRedHead_Click"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_redhead.png" title="套红" width="20px"  height="20px"/><span>套红</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="LinkViewText" OnClientClick="openDocBody('text','view')" key="ViewText" EnableTheming="false" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="查看正文"  width="20px"  height="20px"/><span>查看正文</span>
            </asp:LinkButton>
            <br />
            <span style="float: left; margin-right: 10px;" runat="server" id="THZWTitle" visible="false">套红正文:</span>
            <uc3:UpLoadFile ID="uploadFileView2" runat="server" ShowDelete="false" style="float: right" Visible="false" />
            <span style="float: left; margin-right: 10px;" runat="server" id="THYWTitle" visible="false">正文原文:</span>
            <uc3:UpLoadFile ID="uploadFileView" runat="server" ShowDelete="false" style="float: right" />
            <div runat="server" displaystatus="(23.套红、盖章)" style="color: red; margin-top: 5px;">注：如经过了排版环节，请点击预览PDF按钮生成PDF文件</div>
        </td>

        <td class="td-m" colspan="2">
            <asp:LinkButton runat="server" ID="LinkViewPDF" EnableTheming="false" OnClick="LinkViewPDF_Click" Visible="false"> 
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_viewtext.png" title="预览PDF"  width="20px"  height="20px"/><span>预览PDF</span>
            </asp:LinkButton>

            <uc3:UpLoadFile ID="uploadFilePDF" runat="server" ShowDelete="true" />
        </td>
    </tr>
    <tr>
        <td class="td-l">发文附件
        </td>

        <td class="td-m" colspan="5">
            <asp:LinkButton runat="server" ID="lbtnUploadNew" EnableTheming="False"
                OnClientClick="return uploadFilefj('KOAFORM','fwfj');" OnClick="lbtnUpload_Click"
                activestatus="(23.填写申请)(23.修改申请)(23.套红、盖章)(23.排版)" DisplayStatus="(23.填写申请)(23.修改申请)(23.套红、盖章)(23.排版)">
                                <img src="../../Themes/Images/btn_upload.gif">
                                <span>上传附件</span>
            </asp:LinkButton>
            <uc3:UpLoadFile ID="uploadFile" runat="server" ShowDelete="true" />
        </td>
    </tr>
    <tr runat="server" visible="false">
        <td class="td-l">是否发布到门户<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%--   <zhongsoft:LightDropDownList ID="ddlIsPublishWeb" runat="server" activestatus="(23.套红、盖章)" AutoPostBack="true" OnSelectedIndexChanged="ddlIsPublishWeb_SelectedIndexChanged" Width="80px"
                field="IsPublishWeb" tablename="KMS_KOA_SendFileForm" />--%>
            <asp:RadioButtonList ID="rblIsPublishWeb" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                tablename="KMS_KOA_SendFileForm" field="IsPublishWeb" activestatus="(23.填写申请)(23.修改申请)(23.套红、盖章)">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiIsPublishWebText" field="IsPublishWebText"
                tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l">内网发布栏目</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlColumn" Width="50%" runat="server"
                tablename="KMS_KOA_SendFileForm" field="ColumnID" ActiveStatus="(23.套红、盖章)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hdnColumnName" field="ColumnName"
                tablename="KMS_KOA_SendFileForm" />
        </td>
    </tr>
    <tr runat="server" visible="false">

        <td class="td-l">主题词
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtThemeWord" activestatus="(23.填写申请)(23.修改申请)"
                Field="ThemeWord" MaxLength="512" tablename="KMS_KOA_SendFileForm"
                TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>

        <%--  <td class="td-l">能否网上发布<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlIsPublishWeb" runat="server" activestatus="(23.拟稿)" req="1"
                field="IsPublishWeb" tablename="KMS_KOA_SendFileForm" />
            <input type="hidden" runat="server" id="hiIsPublishWebText" field="IsPublishWebText"
                tablename="KMS_KOA_SendFileForm" />
        </td>
        <td class="td-l"><span class="isPublish"> 发布通知公告</span>
        </td>
        <td class="td-r">
           <span class="isPublish"> <asp:RadioButtonList ID="rbtIsPublishNotice" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                tablename="KMS_KOA_SendFileForm" field="IsSendAlert" activestatus="(23.拟稿)">
            </asp:RadioButtonList>
               </span>
        </td>
        <td class="td-l"><span class="isPublish"> 发布规章制度</span> 
        </td>
        <td class="td-r" colspan="3">
             <span class="isPublish">
            <asp:RadioButtonList ID="rbtIsPublishRules" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                tablename="KMS_KOA_SendFileForm" field="IsZDWJ" activestatus="(23.拟稿)">
            </asp:RadioButtonList>
            </span>
        </td>--%>
    </tr>
</table>

<input type="hidden" id="hiFileEntityID" runat="server" field="SendFileFormId" tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiSendFileId" runat="server" field="SendFileID" tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiSignDate" runat="server" field="SignDate" tablename="KMS_KOA_SendFileForm" />

<input type="hidden" id="hiRelateXml" runat="server" />
<input type="hidden" id="hiIsCreateNew" runat="server" field="IsCreateNew" value="1"
    tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiCreateDeptCode" runat="server" field="CreateDeptCode"
    tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiCreateDeptID" runat="server" field="CreateDeptID" tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiCreateDeptName" runat="server" field="CreateDeptName"
    tablename="KMS_KOA_SendFileForm" />
<%--<input type="hidden" id="hiFileDeptName" runat="server" field="FileDeptName" tablename="KMS_KOA_SendFileForm" />--%>
<input type="hidden" id="hiAppPath" runat="server" />
<input type="hidden" id="hiSignUserName" runat="server" field="SignUserName" tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiSignUserId" runat="server" field="SignUserId" tablename="KMS_KOA_SendFileForm" />
<input type="hidden" id="hiFlag" runat="server" field="Flag" tablename="KMS_KOA_SendFileForm" />
<script type="text/javascript">
    function initCustomerPlugin() {


        //if ($actName == "院领导签发") {
        //    //需要自动发送的步骤，调用以下方法即可
        //    setAutoSend();
        //}
        if ($actCurrId == "act_35446") {
            SetAttr2();
        }

        <%--$('#<%=ddlIsPublishWeb.ClientID %>').live('change', function () {
            accessOfSelectType();
        });
        accessOfSelectType();--%>
        //$("input[id$='lbsProjectMgrName']").parent("td").css("width", "86%");//按钮对齐


        if ($actCurrId == "act_35446") {
            $("#target").html("红头类型" + "<span class='req-star'>*</span >");
            $("#<%=ddlRedHeadType.ClientID%>").attr("req", 1);
        }
        else {
            $("#target").html("红头类型");
            $("#<%=ddlRedHeadType.ClientID%>").removeAttr("req");
        }
        var flag=$("#<%=hiFlag.ClientID %>").val();
      //流程结束后传阅接收的人不能下载,文书可显示下载按钮 
        if ("<%=ActionType %>" == "<%=AccessLevel.Read %>" && "<%=isDocument%>" != "文书"&&flag == "1") {
            var showtxt = $('.kpms-tablebordernone').find('a');
            for (var i = 0, j = showtxt.length; i < j; i++) {
                var isXiaZai = showtxt[i].innerText;
                if ($.trim(isXiaZai) == "下载") {
                    showtxt[i].innerText = "";
                }
            }
        }
          //流程结束后，页面显示中隐藏“正文原文：”字样
        if (flag == "1") {
            $("#<%=THZWTitle.ClientID %>").css("display","none");
            $("#<%=THYWTitle.ClientID %>").css("display","none");
        }
        
        IsNeedFileCode();
    }

    function checkForm() {

        if ($formAction == 0) {
            if ($actCurrId == "act_20784" || $actCurrId == "act_49467") {

                var security = $("#<%=ddlSecurityLevel.ClientID %>").val();
                var keepYears = $("#<%=tbKeepYears.ClientID %>").val();
                if (security == "") {
                    if (!window.confirm("您确定不需要选择密级吗？")) {
                        return false;
                    }
                }
                //如果选择了密级，提示必须保密期限
                if (security != "" && keepYears == "") {
                    if (!window.confirm("您选择了密级,没有填写保密期限，您确定要提交吗？")) {
                        return false;
                    }
                }
                //判断是否有正文
                var flag = CheckFile("CheckTextBody");
                if (!flag) {
                    window.alert("正文不存在,请上传正文");
                    return false;
                }


            }
        }
        return true;
    }
    //上传附件
    function uploadFilefj(flag, fileType) {
        var fileSrcId = $("#<%=hiSendFileId.ClientID%>").val();
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }
    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnUploadNew,"") %>
    }
    function beforeUploadText() { //上传前看下是否有正文，如果有则提示
        //判断是否有正文
        var flag = CheckFile("CheckTextBody");
        if (flag) {
            if (!window.confirm("正文已存在，是否重新上传？（执行此操作原正文将被清除）")) {
                return false;
            }
        }
        return true;
    }
    function beforeRedhead(type, action) {
        var val = $("#<%=hiRedHeadTypeText.ClientID %>").val();
        if (val == "" || val == null || val == undefined || val.length == 0) {
            alert("请先选择红头类型！");
            return false;
        }
        return window.confirm("您确定执行套红操作？");
    }
    var actionState = "";

    function editRedhead(action) {
        var flag = CheckFile("CheckRedHead");
        if (!flag) {
            alert("正文未套红，请先套红！");
            return false;
        }
        if ($actCurrId == "act_35446") {
            actionState = "4";
        }
        var url = buildQueryUrl("WebOffice/WebOfficeEdit.aspx", { action: action, type: "redhead", bizId: $bizCtx.bizId, actionstate: actionState });
        var re = window.open(url);

        return false;
    }

    //正文处理
    function openDocBody(type, action) {
        //判断是否有正文
        var flag = CheckFile("CheckTextBody");
        if (!flag) {
            alert("未上传正文！");
            return false;
        }
        actionState = "1";
        if ($actCurrId == "act_35446") {//套红盖章
            actionState = "4";
        }

        var url = buildQueryUrl("WebOffice/WebOfficeEdit.aspx", { action: action, type: type, bizId: $bizCtx.bizId, actionstate: actionState });
        var re = window.open(url);

        return false;
    }

    function CheckFile(methodName) {
        //判断是否有正文
        var flag = true;
        $.ajax({
            type: "POST",
            url: buildQueryUrl("WebOffice/Handler/WebOfficeHandler.ashx", null),
            data: { BizId: $bizCtx.bizId, method: methodName },
            async: false,
            success: function (result) {
                var result = JSON.parse(result);
                if (result.error == "-1") {
                    flag = false;
                }
            }
        });
        return flag;
    }



   <%-- //当前为不同类型时更改必填
    function accessOfSelectType() {

        var contractType = $("#<%=ddlIsPublishWeb.ClientID %> option:selected").text();
        var contractVale = $("#<%=ddlIsPublishWeb.ClientID %> option:selected").val();

        //不发，外网
        if (contractVale == "1") {
            $('.isPublish').hide();

        }
        else {
            $('.isPublish').show();

        }
    }--%>

    //是否项目用车"是" 时,项目名称必填
    $('#<%=rblIsPublishWeb.ClientID %>').live("change", function () {
        if ($actCurrId == "act_35446") {
            SetAttr2();
        }
    });

    function SetAttr2() {
        var value = $('#<%=rblIsPublishWeb.ClientID %>').find("input:checked").val();
        $("#<%=ddlColumn.ClientID%>").removeAttr("req");
        if (value == "1") {
            $("#<%=ddlColumn.ClientID%>").attr("req", "1");
        }
    }
    
    function IsNeedFileCode() {
        if ($actName == "套红、盖章") {
            var IsNeedFileCode = $("#<%=rblIsNeedFileCode.ClientID %> input[type=radio]:checked").val();
            if (IsNeedFileCode == "0") {
                $("#<%=txtFileCode.ClientID%>").attr("ReadOnly", "ReadOnly");
                $("#<%=txtFileCode.ClientID%>").removeAttr("req");
                $("#<%=txtFileCode.ClientID %>").css("background-color", "##eef8fc");
                $("#<%=txtFileCode.ClientID %>").val("");
            }
            else {
                $("#<%=txtFileCode.ClientID%>").removeAttr("ReadOnly");
                $("#<%=txtFileCode.ClientID%>").attr("req","1");
                $("#<%=txtFileCode.ClientID %>").css("background-color", "#ffffbb");
                if ($("#<%=txtFileCode.ClientID %>").val() == "") {

                    $("#<%=txtFileCode.ClientID %>").val($("#<%=hiFileCode.ClientID %>").val());
                }
            }
        }
    }
</script>


