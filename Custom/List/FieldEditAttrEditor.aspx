<%@ Page Title="编辑属性配置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="FieldEditAttrEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.FieldEditAttrEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        控件类型
                    </td>
                    <td class="td-m">
                        <asp:DropDownList runat="server" ID="ddlCtrlType">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trReq" style="display: none">
                    <td class="td-l">
                        是否必填项
                    </td>
                    <td class="td-m">
                        <asp:CheckBox runat="server" ID="cbReq" Text="是" />
                    </td>
                </tr>
                <tr id="trField" style="display: none">
                    <td class="td-l">
                        保存字段
                    </td>
                    <td class="td-m">
                        <asp:DropDownList runat="server" ID="ddlSaveField">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trDataType" style="display: none">
                    <td class="td-l">
                        数据类型
                    </td>
                    <td class="td-m">
                        <input type="text" runat="server" readonly="readonly" id="tbDataType" class="kpms-textbox" />
                    </td>
                </tr>
                <tr id="trLength" style="display: none">
                    <td class="td-l">
                        最大长度
                    </td>
                    <td class="td-m">
                        <zhongsoft:LightTextBox runat="server" ID="tbMaxLength" DataType="Integer"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr id="trRegex" style="display: none">
                    <td class="td-l">
                        匹配规则
                    </td>
                    <td class="td-m">
                        <asp:DropDownList runat="server" ID="ddlRegexType">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="trParam" style="display: none">
                    <td class="td-l">
                        绑定参数
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiFieldParam" />
                                    <zhongsoft:XHtmlInputText type="text" ID="txtFieldParam" runat="server" readonly="readonly"
                                        style="width: 100%" class="kpms-textbox">
                                    </zhongsoft:XHtmlInputText>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnFieldParam" OnClientClick="return setFieldParam();"
                                        OnClick="btnFieldParam_Click" Style="height: 18px; width: 20px; padding: 0px"
                                        CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="trDefault" style="display: none">
                    <td class="td-l">
                        默认值
                    </td>
                    <td class="td-r">
                        <asp:TextBox runat="server" ID="tbDefaultValue"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" runat="server" id="hiExpJson" />
            <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if (window.dialogArguments != undefined) {
                    $("#<%=hiExpJson.ClientID %>").val(window.dialogArguments);
                     <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
            }
        })

        function initCustomerPlugin() {
            setDisplay();
              $("#<%=this.tbDefaultValue.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',xformdefault'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbDefaultValue.ClientID %>").attr("value", ui.item.value);
                    }
                }
            });
        }
        $("#<%=ddlCtrlType.ClientID %>").live("change", function () { setDisplay(); })
 
        function setDisplay() {
           var type= $("#<%=ddlCtrlType.ClientID %>").val();
           clearAttr();
           if(type!=""){
              $("#trField").show();
              $("#trDataType").show();
              $("#trDefault").show();
             
              $("#<%=ddlSaveField.ClientID %>").attr("req","1");
             if(type=="Label"){
               $("#trLength").hide();
               $("#trRegex").hide();
               $("#trParam").hide();
               $("#trReq").hide();
             }
             else if(type=="TextBox"){
                $("#trLength").show();
                $("#trRegex").show();
                $("#trParam").hide();
                $("#<%=tbMaxLength.ClientID %>").attr("req","1");
                 $("#trReq").show();
              }
              else if(type=="TextDate"){
               $("#trLength").hide();
               $("#trRegex").hide();
               $("#trParam").hide();
                $("#trReq").show();
              
              }
              else if(type=="DropDownList"){
               $("#trLength").hide();
               $("#trRegex").hide();
               $("#trParam").show();
                $("#trReq").show();
               $("#<%=txtFieldParam.ClientID %>").attr("req","1");     
              }
           }
           else{
              $("#trDataType").hide();
              $("#trField").hide();
              $("#trReq").hide();
              $("#trLength").hide();
              $("#trRegex").hide();
              $("#trParam").hide();
           }
        }

        function clearAttr() {
            $("#<%=ddlSaveField.ClientID %>").removeAttr("req");
            $("#<%=tbMaxLength.ClientID %>").removeAttr("req");
            $("#<%=txtFieldParam.ClientID %>").removeAttr("req");       
        }

        function saveData() {
            return checkReqField();
        }


        function closeExpWindow() {
            window.returnValue = $("#<%=hiExpJson.ClientID %>").val();
            window.close();
        }

        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }

        function setFieldParam() {
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", null);
            var re = showModal(encodeURI(url), $("#<%=hiFieldParam.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiFieldParam.ClientID%>").val(re);
                return true;
            }
            return false;
        }

        

        $("#<%=ddlSaveField.ClientID %>").live("change", function () {
          var type= $("#<%=ddlCtrlType.ClientID %>").val();
        
                if ($(this).val() == "")
                { $("#<%=tbDataType.ClientID %>").val("") }
                else {
                    $.post("FieldEditAttrEditor.aspx",
                    { asyfunc: "GetDataType", tablecode: "<%=TableCode %>", fieldcode: $(this).val() },
                    function (res) {
                        $("#<%=tbDataType.ClientID %>").val(res);
                     }
                );
               
            }
        })
    
    </script>
</asp:Content>
