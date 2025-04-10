<%@ Page Title="新闻信息录入" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="NewsMessageEditor.aspx.cs" Inherits="Zhongsoft.Portal.PWS.BGM.List.NewsMessageEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.PWS" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<%@ Register Src="~/Sys/FileDocument/PWSUpLoadFile.ascx" TagName="UpLoadFile" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <span onclick="lookItem()" runat="server" id="spanLook"><a title="预览" class="subtoolbarlink" id="btnLook">
        <span>
            <img width='16' height='16' id='imgLook' alt="预览" src="<%=WebAppPath %>/Themes/Images/btn_chakan.gif" />预览</span></a></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">标题<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbTitle" runat="server" MaxText="128" TableName="PWS_NewsMessage" Field="Title" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">所属栏目<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbColumnName" runat="server" readonly="readonly" style="width: 80%" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiColumnID" runat="server" tablename="PWS_NewsMessage" field="ColumnID" />
            </td>
            <td class="td-l">发布日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-wholedate" ID="txtSendDate" runat="server" readonly="readonly" TableName="PWS_NewsMessage" Field="SendDate" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr id="baseInfo" runat="server">
            <td class="td-l">作者<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbAuthor" runat="server" TableName="PWS_NewsMessage" Field="Author" ActiveStatus="(23.*)" style="width: 90px" req="1" />
            </td>
            <td class="td-l">责任编辑</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbEditor" runat="server" TableName="PWS_NewsMessage" Field="Editor" ActiveStatus="(23.*)" style="width: 90px" />
            </td>
        </tr>
        <tr id="baseInfo1" runat="server">
            <td class="td-l">来源</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbNewsFrom" runat="server" MaxText="32" TableName="PWS_NewsMessage" Field="NewsFrom" ActiveStatus="(23.*)" Style="width: 200px" />
            </td>
        </tr>
        <tr id="trLink" runat="server">
            <td class="td-l">链接地址</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbLinkAddress" EnableTheming="false" runat="server" TableName="PWS_NewsMessage"
                    Field="LinkAddress" ActiveStatus="(23.*)" CssClass="kpms-textbox" />
            </td>
            <td class="td-l">排序</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbSort" runat="server" TableName="PWS_NewsMessage" Field="Sort"
                    ActiveStatus="(23.*)" style="width: 120px; text-align: right" />
            </td>
        </tr>
        <tr style="display:none" class="trRotation">
            <td class="td-l">是否轮播正文图片</td>
            <td class="td-r" colspan="5">
                <asp:RadioButtonList ID="rbIsRotation" runat="server" RepeatDirection="Horizontal"
                    TableName="PWS_NewsMessage" Field="Rotation" ActiveStatus="(23.*)">
                </asp:RadioButtonList></td>
        </tr>
       <tr style="display:none" class="trImage">
            <td class="td-l">是否显示封面图片<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <span style="float: left">
                    <asp:RadioButtonList ID="rbIsImage" runat="server" RepeatDirection="Horizontal" TableName="PWS_NewsMessage" Field="IsImage" ActiveStatus="(23.*)"></asp:RadioButtonList>
                </span><span style="float: left; margin-left: 30px; margin-top: 3px" class="tdImg">
                    <asp:LinkButton ID="btnuploadImg" runat="server" DisplayStatus="(23.*)" EnableTheming="false"
                        CssClass="kpms-btn"><img src="../../../Themes/Images/btn_upload.gif" alt="上传封面图片" /><span>上传封面图片</span></asp:LinkButton><span style="color: red; margin-left: 20px" runat="server" displaystatus="(3.*)">请上传'.gif', '.png', '.jpeg', '.jpg', '.bmp'格式的图片！</span></span>
            </td>
        </tr>
        <tr style="display:none" class="trImage">
            <td colspan="4" class="td-r">
                <uc3:UpLoadFile ID="uploadImg" runat="server" RepeatColumns="3" ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr class="trVideo" style="display:none" >
            <td class="td-l">是否显示视频<span class="req-star">*</span></td>
            <td class="td-r" colspan="3"><span style="float: left">
                <asp:RadioButtonList ID="rbIsVideo" runat="server" RepeatDirection="Horizontal" TableName="PWS_NewsMessage" Field="IsVideo" ActiveStatus="(23.*)"></asp:RadioButtonList>
            </span><span style="float: left; margin-left: 30px; margin-top: 3px" class="tdVideo">
                <asp:LinkButton ID="btnloadVideo" runat="server" DisplayStatus="(23.*)" EnableTheming="false"
                    CssClass="kpms-btn"><img src="../../../Themes/Images/btn_upload.gif"  alt="上传视频" /><span>上传视频</span></asp:LinkButton><span style="color: red; margin-left: 20px" runat="server" displaystatus="(3.*)">请上传'.mp4', '.swf', '.webm', '.ogg'格式的视频！</span></span>            </td>
        </tr>
        <tr class="trVideo" style="display:none">
            <td colspan="4" class="td-r">
                <uc3:UpLoadFile ID="uploadVideo" runat="server" RepeatColumns="3" ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
        <tr id="trContent" runat="server">
            <td class="td-l">内容</td>
            <td class="td-r" colspan="3">
                <input type="hidden" id="hiContents" runat="server" tablename="PWS_NewsMessage" field="Contents" />
                <script id="container" name="content" type="text/plain" style="width: 100%; height: 500px;">
                </script>
                <!-- 配置文件 -->
                <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.config.js"></script>
                <!-- 编辑器源码文件 -->
                <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.all.min.js"></script>
                <!-- 实例化编辑器 -->
                <script type="text/javascript">
                    var ue = UE.getEditor('container', {
                        toolbars: [[
                            'source', //源代码
                            'redo', //重做
                            'undo', //撤销
                            'bold', //加粗
                            'indent', //首行缩进
                            'snapscreen', //截图
                            'italic', //斜体
                            'underline', //下划线
                            'strikethrough', //删除线
                            'subscript', //下标
                            'fontborder', //字符边框
                            'superscript', //上标
                            'formatmatch', //格式刷                            
                            'blockquote', //引用
                            'pasteplain', //纯文本粘贴模式
                            'selectall', //全选
                            'print', //打印
                            'preview', //预览
                            'horizontal', //分隔线
                            'removeformat', //清除格式
                            'time', //时间
                            'date', //日期
                            'unlink', //取消链接
                             'anchor', //锚点
                            'insertrow', //前插入行
                            'insertcol', //前插入列
                            'mergeright', //右合并单元格
                            'mergedown', //下合并单元格
                            'deleterow', //删除行
                            'deletecol', //删除列
                            'splittorows', //拆分成行
                            'splittocols', //拆分成列
                            'splittocells', //完全拆分单元格
                            'deletecaption', //删除表格标题
                            'inserttitle', //插入标题
                            'mergecells', //合并多个单元格
                            'deletetable', //删除表格
                            'cleardoc', //清空文档
                            'insertparagraphbeforetable', //"表格前插入行"
                            'insertcode', //代码语言
                            'fontfamily', //字体
                            'fontsize', //字号
                            'paragraph', //段落格式
                            'simpleupload', //单图上传
                            'insertimage', //多图上传
                            'edittable', //表格属性
                            'edittd', //单元格属性
                            'link', //超链接
                            'emotion', //表情
                            'spechars', //特殊字符
                            'searchreplace', //查询替换
                            'map', //Baidu地图
                            'gmap', //Google地图
                            'insertvideo', //视频
                            'help', //帮助
                            'justifyleft', //居左对齐
                            'justifyright', //居右对齐
                            'justifycenter', //居中对齐
                            'justifyjustify', //两端对齐
                            'forecolor', //字体颜色
                            'backcolor', //背景色
                            'insertorderedlist', //有序列表
                            'insertunorderedlist', //无序列表
                            'fullscreen', //全屏
                            'directionalityltr', //从左向右输入
                            'directionalityrtl', //从右向左输入
                            'rowspacingtop', //段前距
                            'rowspacingbottom', //段后距
                            'pagebreak', //分页
                            'insertframe', //插入Iframe
                            'imagenone', //默认
                            'imageleft', //左浮动
                            'imageright', //右浮动
                            'attachment', //附件
                            'imagecenter', //居中
                            'wordimage', //图片转存
                            'lineheight', //行间距
                            'edittip ', //编辑提示
                            'customstyle', //自定义标题
                            'autotypeset', //自动排版
                            'webapp', //百度应用
                            'touppercase', //字母大写
                            'tolowercase', //字母小写
                            'background', //背景
                            'template', //模板
                            'scrawl', //涂鸦
                            'music', //音乐
                            'inserttable', //插入表格
                            'drafts', // 从草稿箱加载
                            'charts', // 图表
                        ]],
                        autoHeightEnabled: false,
                        autoFloatEnabled: true,
                        serverUrl: "<%=WebAppPath %>/UEditorSrv/controller.ashx?id=<%=BusinessObjectId %>"
                    });

                    //对编辑器的操作最好在编辑器ready之后再做
                    ue.ready(function () {
                        //设置编辑器的内容
                        var content = $('#<%=hiContents.ClientID %>').val();
                        ue.setContent(content);
                        //只读设置
                        if ($bizCtx.action == 1) {
                            ue.setDisabled();
                        }
                    });
                </script>
            </td>
        </tr>
        <tr runat="server" displaystatus="(13.*)" id="trUpload">
            <td class="td-l">附件</td>
            <td class="td-r" colspan="3">
                <asp:LinkButton runat="server" ID="btnloadAttach" displaystatus="(3.*)" EnableTheming="False">
                <img src="../../../Themes/Images/btn_upload.gif" alt="上传附件" />
                <span>上传附件</span>
                </asp:LinkButton></td>
        </tr>
        <tr runat="server" displaystatus="(13.*)" id="trAttach">
            <td class="td-m" colspan="4">
                <uc1:AttachmentView ID="uploadAttach" runat="server" RepeatColumns="3" ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiNewsMessageID" runat="server" tablename="PWS_NewsMessage" field="NewsMessageID" />
    <%-- 新闻状态：--%>
    <input type="hidden" id="hiNewsState" runat="server" tablename="PWS_NewsMessage" field="NewsState" value="0" />
    <asp:Button ID="btnReset" runat="server" Visible="false" OnClick="btnReset_Click" />
    <input type="hidden" id="hiFlag" runat="server" tablename="PWS_NewsMessage" field="Flag" value="1" />
    <%--统计文本字数--%>
    <input type="hidden" id="hiTextCnt" runat="server" tablename="PWS_NewsMessage" field="TextCnt" />
    <input type="hidden" id="hiColumnClass" runat="server" />
    <script type="text/javascript">  
        function initCustomerPlugin() { 
            hideTdImg();
            hideTdVideo();
            if ($("#<%=hiColumnClass.ClientID%>").val() == "<%=ColumnClass.图片文字.GetHashCode()%>") {
                $(".trRotation").show();
            } else if ($("#<%=hiColumnClass.ClientID%>").val() == "<%=ColumnClass.图片.GetHashCode()%>"
                || $("#<%=hiColumnClass.ClientID%>").val() == "<%=ColumnClass.专题专栏.GetHashCode()%>"
                || $("#<%=hiColumnClass.ClientID%>").val() == "<%=ColumnClass.视频.GetHashCode()%>") {
                $(".trImage").show();
            } 
        }
        $("#<%=rbIsImage.ClientID%>").change(function () {
            hideTdImg();
        });
        function lookItem() {
            var url = "<%=WebAppPath %>/PWS/FGM/Detail.aspx?ColumnId=<%=ColumnId%>&NewsMessageID=<%= this.BusinessObjectId %>";
            window.open(encodeURI(url));
        }
        //上传图片、视频
        function uploadFile(fileType) {
            var uploadType = "Pws";
            var url = buildQueryUrl("<%=WebAppPath %>/sys/filedocument/fileuploader.aspx", { fileSourceId: "<%= this.BusinessObjectId %>", fileSourceFlag: uploadType, fileType: fileType, uploadType: fileType, multiselect: false });
            showDivDialog(encodeURI(url), null, 500, 400, callback);
            return false;
        }
        //上传附件
        function uploadFiles(fileType) {
            var fileSrcId ="<%= this.BusinessObjectId %>";
            showUploadFormAndType(fileSrcId, "Pws", fileType, callback);
            return false;
        }
        //编辑资产弹出层callback方法
        function callback() {
             <%=Page.ClientScript.GetPostBackEventReference(this.btnReset,"") %>;
        }
        $("#<%=rbIsImage.ClientID%>").change(function () {
            hideTdImg();
        });
        function hideTdImg() {
            rbIsImage = $("#<%=rbIsImage.ClientID%> :checked").val();
            if (rbIsImage == "1") {
                $(".tdImg").show(); 

            } else {
                $(".tdImg").hide(); 
            }
        }
        $("#<%=rbIsVideo.ClientID%>").change(function () {
            hideTdVideo();
        });
        function hideTdVideo() {
            rbIsVideo = $("#<%=rbIsVideo.ClientID%> :checked").val();
            if (rbIsVideo == "1") {
                $(".tdVideo").show(); 
            } else {
                $(".tdVideo").hide(); 
            }
        }
        function checkForm() {
            var html = ue.getContent();
            $('#<%=hiContents.ClientID %>').val(html);
            //统计文本字数
            var textCnt = ue.getContentLength(true);
            $('#<%=hiTextCnt.ClientID %>').val(textCnt);
            return true;
        }      
    </script>
</asp:Content>
