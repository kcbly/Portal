<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_MessagePublicityApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.KMS.Form.Other.WF_MessagePublicityApplyForm" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table" style="width: 100%">
     <tr>
                <td></td>
                <td></td>
                <td class="td-l">单据号<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbNumbers" field="Numbers" CssClass="kpms-textbox-short" Width="100"
                        EnableTheming="false" tablename="KMS_Other_MessagePublicityApplyForm" activestatus="(23.填写申请)"
                        runat="server" ReadOnly="true">
                    </zhongsoft:LightTextBox>
                </td>
            </tr>
    <tr>
        <td class="td-l">主题<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="ltbTheme" TableName="KMS_Other_MessagePublicityApplyForm" Field="Theme" ActiveStatus="(23.填写申请)" req="1" runat="server" MaxLength="100" />
        </td>
    </tr>
    <tr>
        <td class="td-l">信息去向</td>
        <td class="td-m" colspan="3">
            <asp:CheckBoxList ID="cblMessageFlow" runat="server" ActiveStatus="(3.宣传中心审批)" req="1" RepeatDirection="Horizontal" RepeatColumns="10">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiMessageFlow" field="MessageFlow" tablename="KMS_Other_MessagePublicityApplyForm" />
            <input type="hidden" runat="server" id="hiMessageFlowText" field="MessageFlowText" tablename="KMS_Other_MessagePublicityApplyForm" />
        </td>
    </tr>
    <tr class="trColumnText" style="display: none;">
        <td class="td-l">门户栏目</td>
        <td class="td-m" colspan="3">
            <asp:CheckBoxList ID="cblColumnId" runat="server" ActiveStatus="(3.宣传中心审批)" RepeatDirection="Horizontal" RepeatColumns="10">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiColumnId" field="ColumnId" tablename="KMS_Other_MessagePublicityApplyForm" />
            <input type="hidden" runat="server" id="hiColumnText" field="ColumnText" tablename="KMS_Other_MessagePublicityApplyForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">申请部门<span class="req-star">*</span></td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtDeptName" field="ApplyDeptName" PageHeight="650px"
                SelectPageMode="Dialog" TableName="KMS_Other_MessagePublicityApplyForm" activestatus="(23.填写申请)" ShowAttrs="name"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                IsMutiple="false" ResultForControls="{'hiDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiDeptId" field="ApplyDeptId" tablename="KMS_Other_GeneralApplyForm" />
        </td>
        <td class="td-l">申请日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="xmlApplyDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1"
                field="ApplyDate" TableName="KMS_Other_MessagePublicityApplyForm" activestatus="(23.填写申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">内容<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <input type="hidden" runat="server" id="hiSave" />
            <input type="hidden" id="hiContents" runat="server" tablename="KMS_Other_MessagePublicityApplyForm" field="Content" />
            <script id="container" name="content" type="text/plain" style="width: 100%; height: 500px;">
            </script>
            <!-- 配置文件 -->
            <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.config.js"></script>
            <!-- 编辑器源码文件 -->
            <script type="text/javascript" src="<%=WebAppPath %>/UEditor/ueditor.all.min.js"></script>
            <!-- 实例化编辑器 -->
            <script type="text/javascript"> 
                var $ue = UE.getEditor('container', {
                    toolbars: [
                        ['fullscreen', 'source', '|', 'undo', 'redo', '|',
                            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc'],
                        ['rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                            'directionalityltr', 'directionalityrtl', 'indent', '|',
                            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|'],
                        ['link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                            'simpleupload', 'insertimage', 'emotion',
                            , 'map', 'gmap', 'pagebreak', 'template', 'background', '|',
                            'horizontal', 'date', 'time', 'spechars', 'snapscreen'],
                        ['inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                            'print', 'preview', 'searchreplace', 'help', 'drafts'
                        ]
                    ],
                    zIndex: 199,     //编辑器层级的基数,默认是900
                    autoHeightEnabled: false,
                    autoFloatEnabled: true,
                    serverUrl: "<%= WebAppPath %>/UEditorSrv/controller.ashx?id=<%=BusinessObjectId %>"
                });

            </script>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Other_MessagePublicityApplyForm" Field="Remark" ActiveStatus="(23.填写申请)"
                runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiKeyId" runat="server" field="MessagePublicityId" tablename="KMS_Other_MessagePublicityApplyForm" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        //catch(){}中方法是用于，保存数据后页面刷新重新加载UEditor的，
        //不刷新页面UEditor不会重新加载的，因为FormDetail中的UpatePanel
        try {
            //对编辑器的操作最好在编辑器ready之后再做
            $ue.ready(function () {
                //设置编辑器的内容
                var content = $('#<%=hiContents.ClientID %>').val();
                $ue.setContent(content);
            });
        } catch (e) {
            var isSave = $('#<%=hiSave.ClientID%>').val();
            if (isSave != '1') { //除了发送状态都需要刷新页面，发送状态下的取消需要单独写js
                window.location = window.location;
            }
        }
        //FormDetail中点取消后刷新页面，重新加载UEditor的
        $('#btnCancel').on('click', function () {
            window.location = window.location;
        });
        messageClick();
    }
    function checkForm() {
        if (!checkReqField()) {
            return false;
        }
        else {
            if ("<%=CurrentActivityId%>" === "act_45717")//宣传中心审批
            {
                var mftxt = ""; var txt = "";
                $('#<%=cblMessageFlow.ClientID %>').find("input[type='checkbox']:checked").each(function () {
                    mfText = this.nextSibling.innerText;
                    mftxt += mfText;
                });
                if (mftxt == "") {
                    alert("请勾选信息去向！");
                    return false;
                }
                else {
                    if (mftxt.match("内网")) {
                        $('#<%=cblColumnId.ClientID %>').find("input[type='checkbox']:checked").each(function () {
                            sText = this.nextSibling.innerText;
                            txt += sText;
                        });
                        if (txt == "") {
                            alert("请勾选门户栏目！");
                            return false;
                        }
                    }
                }
            }

            $('#<%=hiSave.ClientID%>').val('');
            if ($formAction == 0 || $formAction == 1) {
                //标记发送、回退，除发送、回退状态下其他都需自动刷新
                $('#<%=hiSave.ClientID%>').val('1');

            }
            var html = $ue.getContent();
            $('#<%=hiContents.ClientID %>').val(html);

            return true;
        }
    }

    function messageClick() {
        var mftxt = "";
        $('#<%=cblMessageFlow.ClientID %>').find("input[type='checkbox']:checked").each(function () {
            mftxt += this.nextSibling.innerText;
        });
        if (mftxt.match("内网")) {
            $(".trColumnText").show();
            $("#<%=cblColumnId.ClientID%>").attr("req", "1");
        }
        else {
            $(".trColumnText").hide();
            $("#<%=cblColumnId.ClientID%>").removeAttr("req");
        }
    }
<%--    function sendForm() {
        if ("<%=CurrentActivityId%>" === "act_45717")//宣传中心审批
        {
            var mftxt = ""; var txt = "";
            $('#<%=cblMessageFlow.ClientID %>').find("input[type='checkbox']:checked").each(function () {
                mfText = this.nextSibling.innerText;
                mftxt += mfText;
            });
            if (mftxt == "") {
                alert("请勾选信息去向！");
                return false;
            }
            else {
                if (mftxt.match("内网")) {
                    $('#<%=cblColumnId.ClientID %>').find("input[type='checkbox']:checked").each(function () {
                        sText = this.nextSibling.innerText;
                        txt += sText;
                    });
                    if (txt == "") {
                        alert("请勾选门户栏目！");
                        return false;
                    }
                }
            }
        }
    }--%>
</script>
