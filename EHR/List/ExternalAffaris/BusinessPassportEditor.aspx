<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="BusinessPassportEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.BusinessPassportEditor" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="<%= Request.ApplicationPath %>/EHR/UI/Script/EHRGeneralScript.js"></script>
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table class="tz-table">
        <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional">
            <ContentTemplate>
                <tr>
                    <td class="td-l">
                        人员类型<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3">
                        <asp:RadioButtonList ID="rblUserType" runat="server" RepeatColumns="2" activestatus="(23.*)"
                            req="1" RepeatDirection="Horizontal" Field="USERTYPE" Tablename="EHR_BUSINESSPASSPORT">
                            <asp:ListItem Value="我院">我院</asp:ListItem>
                            <asp:ListItem Value="非我院">非我院</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        姓名<span class="req-star">*</span>
                    </td>
                    <td style="white-space: nowrap; text-align: left;">
                        <table>
                            <tr>
                                <td>
                                    <zhongsoft:LightTextBox ID="tUserName" activestatus="(23.*)" runat="server" Field="USERNAME"
                                        tablename="EHR_BUSINESSPASSPORT" Width="100%"></zhongsoft:LightTextBox>
                                </td>
                                <td>
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" activestatus="(23.*)"
                                        Width="60px" DoCancel="true" ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true"
                                        ShowAttrs="name,UserCode" OnlyShowButton="true" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tUserName':'UserName','hiSex':'Sex','ddlNation':'NATION','tbIdCard':'IDENTITYCARDNO','tbBirthDay':'BIRTHDAY','tbHomeTown':'HOMETOWN','hiDeptId':'DEPTID','tbDeptName':'DEPTNAME','hiSubDeptId':'SUBDEPTID','tbSubDeptName':'SUBDEPTNAME','tbPosition':'RANKNAME','tbTechnicalPost':'SKILLTITLE'}"
                                        PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="lbtnChooseUser_Click" />
                                    <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_BUSINESSPASSPORT" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="td-l">
                        工号
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" class="kpms-textbox" readonly="readonly"
                            field="USERCODE" tablename="EHR_BUSINESSPASSPORT" activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        性别<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="rbtnSex" runat="server" readonly="readonly" Activestatus="(23.*)"
                            RepeatDirection="Horizontal" field="SEX" tablename="EHR_BUSINESSPASSPORT" onclick="addSex();">
                        </asp:RadioButtonList>
                        <input type="hidden" id="hiSex" runat="server" field="SEX" tablename="EHR_BUSINESSPASSPORT" />
                    </td>
                    <td class="td-l">
                        民族<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList ID="ddlNation" readonly="readonly" runat="server" req="1"
                            field="NATION" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)" Enabled="false">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        身份证号<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText ID="tbIdCard" runat="server" readonly="readonly" req="1"
                            class="kpms-textbox" field="IDCARD" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        出生日期<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbBirthDay" runat="server" readonly="readonly" req="1"
                            class="kpms-textbox-date" field="BIRTHDAY" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        出生地<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbHomeTown" runat="server" readonly="readonly" req="1"
                            class="kpms-textbox" field="HOMETOWN" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        部门
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" readonly="readonly" req="1"
                            class="kpms-textbox" field="DEPTNAME" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                        <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_BUSINESSPASSPORT" />
                    </td>
                    <td class="td-l">
                        科室
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbSubDeptName" runat="server" readonly="readonly" req="1"
                            class="kpms-textbox" field="SUBDEPTNAME" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                        <input type="hidden" id="hiSubDeptId" runat="server" field="SUBDEPTID" tablename="EHR_BUSINESSPASSPORT" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        职务
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbPosition" runat="server" class="kpms-textbox" field="POSITION"
                            tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">
                        职称
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="tbTechnicalPost" runat="server" class="kpms-textbox"
                            field="TECHNICALPOST" tablename="EHR_BUSINESSPASSPORT" Activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        备注
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                            EnableTheming="false" maxtext="1024" Tablename="EHR_BUSINESSPASSPORT" field="REMARK"
                            ActiveStatus="(23.*)">
                        </zhongsoft:LightTextBox>
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
            <ContentTemplate>
                <tr>
                    <td align="right" colspan="4" runat="server" id="td1">
                        <asp:LinkButton runat="server" ID="btnSure" OnClick="btnAddExpenses_Click" EnableTheming="false"
                            displaystatus="(23.*)" CssClass="subtoolbarlink" OnClientClick="return addList();"
                            activestatus="(23.*)"><span>添加</span></asp:LinkButton>
                        <zhongsoft:LightTextBox runat="server" ID="tbRowNum" Width="30px" Style="text-align: right"
                            regex="\d{1,3}" errmsg="请输入正确的行号！" Text="2" activestatus="(23.*)" displaystatus="(23.*)">
                        </zhongsoft:LightTextBox>行
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; font-weight: bold; height: 30px; line-height: 30px;
                        background: #B3D3FD; border: 2px #6F9DD1 solid">
                        护照信息列表
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="kpms-longtable">
                            <zhongsoft:LightPowerGridView ID="gvPassport" runat="server" UseDefaultDataSource="true"
                                AutoGenerateColumns="false" OnRowCommand="gvPassport_RowCommand" AllowPaging="true"
                                PageSize="10" DataKeyNames="PASSPORTINFOID" ShowExport="true" OnRowDataBound="gvPassport_RowDataBound"
                                BindGridViewMethod="BindPassportGrid">
                                <Columns>
                                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px">
                                    </zhongsoft:LightCheckField>
                                    <zhongsoft:LightTemplateField HeaderText="持何种护照<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:LightDropDownList ID="ddlPassportType" runat="server" req="1" activestatus="(23.*)">
                                            </zhongsoft:LightDropDownList>
                                            <input type="hidden" id="hiPassportType" value='<%#Eval("PASSPORTTYPE") %>' runat="server" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="护照号码<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox ID="tbPassportNumber" runat="server" CssClass="kpms-textbox"
                                                req="1" EnableTheming="false" activestatus="(23.*)" Text='<%#Eval("PASSPORTNUMBER")%>'></zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="护照有效开始日期<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtPassportStartDate" runat="server" class="kpms-textbox-comparedate"
                                                compare="2" req="1" readonly="readonly" value='<%#Eval("PASSPORTSTARTDATE")%>'
                                                activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="护照有效截止日期<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtPassportEndDate" runat="server" class="kpms-textbox-comparedate"
                                                compare="2" req="1" readonly="readonly" value='<%#Eval("PASSPORTENDDATE")%>'
                                                activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="是否借出">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblIsLoan" runat="server" activestatus="(23.*)" RepeatDirection="Horizontal"
                                                Width="80px">
                                            </asp:RadioButtonList>
                                            <input type="hidden" id="hiIsLoan" runat="server" value='<%#Eval("ISLOAN") %>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="借出日期">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtLoanDate" runat="server" class="kpms-textbox-date"
                                                readonly="readonly" value='<%#Eval("LOANDATE")%>' activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="是否到期">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblIsOverDued" runat="server" Enabled="false" RepeatDirection="Horizontal"
                                                Width="80px">
                                            </asp:RadioButtonList>
                                            <input type="hidden" runat="server" id="hiIsOverDued" value='<%#Eval("ISOVERDUED")%>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                                        ItemStyle-HorizontalAlign="Center" DeleteText="您确定删除该记录吗？">
                                    </zhongsoft:LightButtonField>
                                    <%--<zhongsoft:LightTemplateField HeaderText="删除">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("PASSPORTINFOID") %>'>
                                                <img id="btnDelete" alt="删除" title="删除" style="cursor:hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
                                                    src="../../../Themes/Images/btn_dg_delete.gif" border="0" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>--%>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
        <tr>
            <td>
                <br />
            </td>
        </tr>
        <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
            <ContentTemplate>
                <tr>
                    <td colspan="4" align="right" runat="server" id="td2">
                        <asp:LinkButton runat="server" ID="btnSureTwo" Text="添加" OnClick="btnAddTwoExpenses_Click"
                            activestatus="(23.*)" displaystatus="(23.*)" EnableTheming="false" CssClass="subtoolbarlink"
                            OnClientClick="return addList();"><span>添加</span></asp:LinkButton>
                        <%-- <zhongsoft:LightTextBox runat="server" ID="tbRowNumTwo" Width="30px" Style="text-align: right"
                            regex="\d{1,3}" errmsg="请输入正确的行号！">
                        </zhongsoft:LightTextBox>行--%>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center; font-weight: bold; height: 30px; line-height: 30px;
                        background: #B3D3FD; border: 2px #6F9DD1 solid">
                        出境证明信息列表
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div class="kpms-longtable">
                            <zhongsoft:LightPowerGridView ID="gvExit" runat="server" UseDefaultDataSource="true"
                                AutoGenerateColumns="false" OnRowCommand="gvExit_RowCommand" AllowPaging="true"
                                PageSize="10" DataKeyNames="EXITPROVEINFOID" ShowExport="true" OnRowDataBound="gvExit_RowDataBound"
                                BindGridViewMethod="BindExitGrid">
                                <Columns>
                                    <zhongsoft:LightTemplateField HeaderText="护照号码">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox ID="tbPassportNumber" runat="server" CssClass="kpms-textbox"
                                                Enabled="false" EnableTheming="false" activestatus="(23.*)" Text='<%#Eval("PASSPORTNUMBER")%>'></zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="出访国家<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox ID="tbVisitNation" runat="server" CssClass="kpms-textbox"
                                                req="1" EnableTheming="false" activestatus="(23.*)" Text='<%#Eval("VISITNATION")%>'></zhongsoft:LightTextBox>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="有效开始日期<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" class="kpms-textbox-comparedate"
                                                compare="1" req="1" readonly="readonly" value='<%#Eval("STARTDATE")%>' activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="有效截止日期<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" class="kpms-textbox-comparedate"
                                                compare="1" req="1" readonly="readonly" value='<%#Eval("ENDDATE")%>' activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="分类<span class='req-star'>*</span>">
                                        <ItemTemplate>
                                            <zhongsoft:LightDropDownList ID="ddlKind" runat="server" req="1" activestatus="(23.*)">
                                                <asp:ListItem>请选择</asp:ListItem>
                                                <asp:ListItem Value="一次有效">一次有效</asp:ListItem>
                                                <asp:ListItem Value="多次有效">多次有效</asp:ListItem>
                                            </zhongsoft:LightDropDownList>
                                            <input type="hidden" id="hiKind" value='<%#Eval("KIND") %>' runat="server" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="是否借出">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblIsLoan" runat="server" activestatus="(23.*)" RepeatDirection="Horizontal"
                                                Width="80px">
                                            </asp:RadioButtonList>
                                            <input type="hidden" id="hiIsLoan" runat="server" value='<%#Eval("ISLOAN") %>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="借出日期">
                                        <ItemTemplate>
                                            <zhongsoft:XHtmlInputText ID="txtLoanDate" runat="server" class="kpms-textbox-date"
                                                readonly="readonly" value='<%#Eval("LOANDATE")%>' activestatus="(23.*)">
                                            </zhongsoft:XHtmlInputText>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="是否到期">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rblIsOverDued" runat="server" Enabled="false" RepeatDirection="Horizontal"
                                                Width="80px">
                                            </asp:RadioButtonList>
                                            <input type="hidden" runat="server" id="hiIsOverDued" value='<%#Eval("ISOVERDUED")%>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                                        ItemStyle-HorizontalAlign="Center" DeleteText="您确定删除该记录吗？">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </div>
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
    </table>
    <input type="hidden" id="hiBusinessPassportId" runat="server" field="BUSINESSPASSPORTID"
        tablename="EHR_BUSINESSPASSPORT" />
    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function addList() {
            if ("<%=ActionType%>" == "Create") {
                window.alert('请先保存后再添加列表！');
                return false;
            }
        }

        $('#<%=rblUserType.ClientID %>').change(function () {
            var type = $("#<%=rblUserType.ClientID %> input:checked").val();
            SetInOut(type);
        })

        //        $("#aUserName").keyup(function () {
        //            $("#<%=tbUserName.ClientID %>").next().next().val($("#aUserName").val());
        //        });

        $(document).ready(
        function () {
            var type = $("#<%=rblUserType.ClientID %> input:checked").val();
            SetInOut(type);
        })

        function SetInOut(type) {
            if (type == "我院") {

                // $("#aUserName").hide();
                //$("#<%=tUserName.ClientID %>").hide();
                $("#<%=tbUserName.ClientID %>").show();
                $("#<%=tbUserName.ClientID %>_btn").show();
                // $("#aUserName").prev().show();

                //$("#<%=tUserName.ClientID %>").removeAttr("req", "1");
                $("#<%=hiUserId.ClientID %>").attr("req", "1");
                $("#<%=tUserName.ClientID %>").attr("disabled", "disabled");
                $("#<%=tbDeptName.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbDeptName.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=tbSubDeptName.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbSubDeptName.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=tbPosition.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbPosition.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=rbtnSex.ClientID %>  input").attr("disabled", "disabled");

                $("#<%=tbTechnicalPost.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbTechnicalPost.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=ddlNation.ClientID %>").attr("readonly", "readonly");
                $("#<%=ddlNation.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=tbBirthDay.ClientID %>").attr("class", "kpms-textbox");
                $("#<%=tbBirthDay.ClientID %>").removeAttr("onclick");

                $("#<%=tbHomeTown.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbHomeTown.ClientID %>").css("background-color", "#ddffdd");

                $("#<%=tbIdCard.ClientID %>").attr("readonly", "readonly");
                $("#<%=tbIdCard.ClientID %>").css("background-color", "#ddffdd");
            }

            else if (type == "非我院") {
                $("#<%=hiUserId.ClientID %>").val("");
                $("#<%=tbUserCode.ClientID %>").val("");

                $("#<%=hiDeptId.ClientID %>").val("");
                $("#<%=hiSubDeptId.ClientID %>").val("");

                $("#<%=tbUserName.ClientID %>").hide();
                $("#<%=tbUserName.ClientID %>_btn").hide();
                $("#<%=tbUserName.ClientID %>").removeAttr("req");
                // $("#aUserName").show();
                //$("#<%=tUserName.ClientID %>").show();
                $("#<%=tUserName.ClientID %>").css("background-color", "#ffffbb");
                $("#<%=hiUserId.ClientID %>").removeAttr("req");
                // $("#aUserName").attr("req", "1");
                $("#<%=tUserName.ClientID %>").attr("req", "1");
                $("#<%=tUserName.ClientID %>").removeAttr("disabled");
                // $("#aUserName").val($("#<%=tbUserName.ClientID %>").next().next().val());
                // $("#aUserName").prev().hide();

                $("#<%=tbIdCard.ClientID %>").removeAttr("readonly");
                $("#<%=tbIdCard.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=rbtnSex.ClientID %>  input").removeAttr("disabled");

                $("#<%=tbDeptName.ClientID %>").removeAttr("readonly");
                $("#<%=tbDeptName.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=tbSubDeptName.ClientID %>").removeAttr("readonly");
                $("#<%=tbSubDeptName.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=tbPosition.ClientID %>").removeAttr("readonly");
                $("#<%=tbPosition.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=tbTechnicalPost.ClientID %>").removeAttr("readonly");
                $("#<%=tbTechnicalPost.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=ddlNation.ClientID %>").removeAttr("readonly");
                $("#<%=ddlNation.ClientID %>").css("background-color", "#ffffbb");

                $("#<%=tbBirthDay.ClientID %>").attr("class", "kpms-textbox-date");
                $("#<%=tbBirthDay.ClientID %>").attr("onclick", "WdatePicker({dateFmt:'yyyy-MM-dd'})");

                $("#<%=tbHomeTown.ClientID %>").removeAttr("readonly");
                $("#<%=tbHomeTown.ClientID %>").css("background-color", "#ffffbb");
            }
        }

        function addSex() {
            $("#<%=hiSex.ClientID %>").val($("#<%=rbtnSex.ClientID %> :checked").val());
        }
    </script>
</asp:Content>
