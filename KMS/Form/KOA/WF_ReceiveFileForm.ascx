<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReceiveFileForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.KOA.WF_ReceiveFileForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table width="100%" style="border: 0px">
    <tr>
        <td colspan="6" align="center" style="border-left: 0px; border-right: 0px; border-top: 0px; height: 10px;">
            <div style="width: 100%;">
                <asp:Label ID="lbTitle" runat="server" Text="处理签" ForeColor="Red" Font-Size="29px"
                    Font-Bold="true"></asp:Label>

            </div>
        </td>
    </tr>
</table>
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
            <zhongsoft:LightDropDownList runat="server" ID="ddlSecurityLevel" field="SecurityLevel"
                tablename="KMS_KOA_ReceiveFileForm" activestatus="(23.收文拟办)" Width="100px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSecurityLevelName" field="SecurityLevelName"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">收文类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlFileStyle" runat="server" activestatus="(23.收文拟办)" AutoPostBack="true"
                Width="100px" field="FileStyle" tablename="KMS_KOA_ReceiveFileForm" req="1" OnSelectedIndexChanged="ddlFileStyle_SelectedIndexChanged" />
            <input type="hidden" runat="server" id="hiFileStyleText" field="FileStyleText"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
        <td class="td-l">收文编号<span class="req-star">*</span>
        </td>
        <td class="td-r">

            <zhongsoft:XHtmlInputText ID="tbSerialCode" TableName="KMS_KOA_ReceiveFileForm" Field="SerialCode" runat="server" ActiveStatus="(23.收文拟办)" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiFileYearAndPostFileFlow" field="FileYearAndPostFileFlow"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
        <td class="td-l">紧急程度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPriorityLevel" field="PriorityLevel"
                tablename="KMS_KOA_ReceiveFileForm" activestatus="(23.收文拟办)" Width="100px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiPriorityLevelName" field="PriorityLevelName"
                tablename="KMS_KOA_ReceiveFileForm" />
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
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="ltbFileDeptName" ActiveStatus="(23.收文拟办)" req="1"
                Field="FileDeptName" MaxLength="512" tablename="KMS_KOA_ReceiveFileForm"
                Rows="1" CssClass="kpms-textbox" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">原文字号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFileCode" field="FileCode" tablename="KMS_KOA_ReceiveFileForm"
                EnableTheming="false" Width="180px"
                MaxLength="32" activestatus="(23.收文拟办)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">份数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="txtCopies" field="Copies" tablename="KMS_KOA_ReceiveFileForm" MaxLength="3"
                CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.收文拟办)" regex="^[1-9]\d*$" errmsg="请输入正整数"
                Style="width: 90px"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l ">形成日期 <span class="req-star">*</span>
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
        <td class="td-l">收文正文<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightFileUploader runat="server" ID="LinkAddText" EnableTheming="false" OnClick="LinkAddText_Click"
                key="AddText" Multiselect="false" BeforeUpload="beforeUploadText" Visible="false">
                <img src="../../Themes/custom/Images/btn/toolbar_pic/btn_f_addtext.png" title="上载正文" id="imgAddText" width="20px"  height="20px"/><span>上载正文</span></zhongsoft:LightFileUploader>
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
            <asp:LinkButton runat="server" ID="lbtnUploadNew" EnableTheming="False" OnClientClick="return uploadFile1('KOAFORM','swfj');" OnClick="lbtnUpload_Click"
                activestatus="(23.收文拟办)" DisplayStatus="(23.收文拟办)">
                                <img src="../../Themes/Images/btn_upload.gif">
                                <span>上传附件</span>
            </asp:LinkButton>
            <uc3:UpLoadFile ID="uploadFile" runat="server" ShowDelete="true" />
        </td>
    </tr>
    <%--<tr>
        <td class="td-l">是否发布到门户<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsPublishWeb" runat="server" RepeatDirection="Horizontal" needcontrol="true"
                tablename="KMS_KOA_ReceiveFileForm" field="IsPublishWeb" activestatus="(23.收文拟办)" req="1">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiIsPublishWebText" field="IsPublishWebText"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
        <td class="td-l" id="targetnew">内网发布栏目</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlColumn" Width="50%" runat="server"
                tablename="KMS_KOA_ReceiveFileForm" field="ColumnID" ActiveStatus="(23.收文拟办)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hdnColumnName" field="ColumnName"
                tablename="KMS_KOA_ReceiveFileForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">拟办意见<span class="req-star" id="target">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="txtProposedOpinion" ActiveStatus="(23.收文拟办)(23.审核)"
                Field="ProposedOpinion" MaxLength="512" tablename="KMS_KOA_ReceiveFileForm"
                TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
    <tr>
        <td class="td-l">传阅人</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="txtPassManUser" SelectPageMode="Dialog" activestatus="(23.文书处理)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" field="PassManUser" tablename="KMS_KOA_ReceiveFileForm"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                IsMutiple="true" ResultForControls="{'hiPassManUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiPassManUserId" field="PassManUserId" tablename="KMS_KOA_ReceiveFileForm" />
        </td>
    </tr>--%>
</table>

<input type="hidden" runat="server" id="hiFileCode" field="PostFileCode" tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" runat="server" id="hiPostFileFlow" field="PostFileFlow" tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" id="hiReceiveFileID" runat="server" field="ReceiveFileFormID" tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" id="hiFileEntityID" runat="server" field="ReceiveFileFormID" tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" id="hiFileCategory" runat="server" />
<input type="hidden" id="hiBGSDeptId" value="6BF67AA0-5C2D-4B00-8CF5-A0A6266A7181"
    runat="server" /><%--办公室部门id--%>
<input type="hidden" id="hiCreateDeptID" runat="server" field="CreateDeptID" tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" id="hiCreateDeptName" runat="server" field="CreateDeptName"
    tablename="KMS_KOA_ReceiveFileForm" />
<input type="hidden" id="hiCreateUserName" runat="server" field="CreateUserName"
    tablename="KMS_KOA_ReceiveFileForm" />
<script type="text/javascript">
    function initCustomerPlugin() {

        //if ($actName == "院领导阅示" || $actName == "部门确认办理结果" || $actName == "收文拟办") {
        //    //需要自动发送的步骤，调用以下方法即可
        //    setAutoSend();
        //}
        //附件不能上传
        try {
            if (!($formCtx.actName == "收文拟办" || $formCtx.actName == "修改登记")) {
                formAttachReadOnly = 1;
            }
        }
        catch (e) { }

       <%-- if ($actName == "审核") {
            $("#target").show();
            $("#<%=txtProposedOpinion.ClientID%>").attr("req", "1");
        }
        else {
            $("#target").hide();
            $("#<%=txtProposedOpinion.ClientID%>").removeAttr("req");
        }--%>
        //SetAttrnew();
          //流程结束后传阅接收的人不能下载,文书可显示下载按钮 
        if ("<%=ActionType %>" == "<%=AccessLevel.Read %>" && "<%=isDocument%>" != "文书") {
            var showtxt = $('.kpms-tablebordernone').find('a');
            for (var i = 0, j = showtxt.length; i < j; i++) {
                var isXiaZai = showtxt[i].innerText;
                if ($.trim(isXiaZai) == "下载") {
                    showtxt[i].innerText = "";
                }
            }
        }

    }

    function checkForm() {
        if ($formAction == 0) {
            if ($formCtx.actName == "收文拟办") {

                //判断是否有正文
                var flag = CheckFile("CheckReceiveFileTextBody");
                if (!flag) {
                    window.alert("正文不存在,请上传正文");
                    return false;
                }

            }


        }

        return true;
    }

    //上传附件
    function uploadFile1(flag, fileType) {
        var fileSrcId = $("#<%=hiReceiveFileID.ClientID%>").val();
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }

    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.lbtnUploadNew,"") %>
    }
    function beforeUploadText() { //上传前看下是否有正文，如果有则提示
        //判断是否有正文
        var flag = CheckFile("CheckReceiveFileTextBody");
        if (flag) {
            if (!window.confirm("正文已存在，是否重新上传？（执行此操作原正文将被清除）")) {
                return false;
            }
        }
        return true;
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


   <%-- //是否发布到门户”字段选“是”时，“内网发布栏目”字段必填
    $("#<%=rblIsPublishWeb.ClientID%>").live("change", function () { SetAttrnew() });

    function SetAttrnew() {
        var value = $('#<%=rblIsPublishWeb.ClientID %>').find("input:checked").val();
        if (value == "1") {

            $("#<%=ddlColumn.ClientID%>").attr("req", "1");
            $("#targetnew").html("内网发布栏目" + "<span class='req-star'>*</span >");
        }
        else {
            $("#<%=hdnColumnName.ClientID%>").val("");
            $("#<%=ddlColumn.ClientID%>").removeAttr("req");
            $("#targetnew").html("内网发布栏目");
        }
    }--%>


</script>

