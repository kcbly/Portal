<%@ Page Language="C#" AutoEventWireup="true" Title="离退休明细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WorkRetireEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.OrgUsers.WorkRetireEditor" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="information">
        <ul>
            <li><a href="#userInformation">基本信息</a></li>
            <li><a id="aroleInformation" href="#roleInformation">其他信息</a></li>
        </ul>
        <div id="userInformation">
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        姓名<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID"
                            tablename="EHR_RETIREDUSER" />
                        <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelName" readonly="readonly"
                            class="kpms-textbox" style="width: 100px" req="1" field="PersonName" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                        <asp:LinkButton runat="server" ID="lbtnChooseUser" OnClientClick="return ChooseUser()"
                            OnClick="lbtnChooseUser_Click" DisplayStatus="(2.*)" CausesValidation="false">
                                <img alt="选择" src="../../Themes/Images/btn_select.gif" style="cursor:hand; border:0" />
                        </asp:LinkButton>
                    </td>
                    <td class="td-l">
                        工号<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtPersonnelCode" readonly="readonly"
                            class="kpms-textbox" style="width: 100px" req="1" field="PersonCode" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        性别
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtSex" readonly="readonly" class="kpms-textbox"
                            style="width: 100px" field="Sex" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        民族
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtNation" readonly="readonly" class="kpms-textbox"
                            style="width: 100px" field="Nation" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        <span tih="tih">离退</span>时所在部门
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtOrganizationName" readonly="readonly"
                            class="kpms-textbox" style="width: 200px" field="OrganizationName" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                         <input type="hidden" runat="server" id="hiOrgUnitId" readonly="readonly" field="OrgUnitId"
                            tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiRetiredDeptID" readonly="readonly" field="RetiredDeptID"
                            tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiRetiredDeptName" readonly="readonly" field="RetiredDeptName"
                            tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        职称
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtJobCall" readonly="readonly" class="kpms-textbox"
                            style="width: 150px" field="Title" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        <span tih="tih">离退</span>时职务
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbPost" field="Position" tablename="EHR_RETIREDUSER"
                            class="kpms-textbox-long" activestatus="(N.*)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">
                        身份证号
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtIdentityCardNO" field="IdentityCardNO"
                            tablename="EHR_RETIREDUSER" readonly="readonly" class="kpms-textbox" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        学历
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtCulturalLevel" readonly="readonly"
                            class="kpms-textbox" style="width: 150px" field="CulturalLevel" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        个人身份
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtPersonalIdentity" readonly="readonly"
                            class="kpms-textbox" style="width: 150px" field="PersonalIdentity" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        工作日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtWorkingTime" readonly="readonly"
                            class="kpms-textbox-date" style="width: 100px" field="WorkingTime" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        联系方式
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtFamilyPhone" class="kpms-textbox"
                            style="width: 100px" field="FamilyPhone" tablename="EHR_RETIREDUSER" activestatus="(23.*)"
                            maxlength="64" />
                    </td>
                    <td class="td-l">
                        出生年月
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtBirthday" readonly="readonly" class="kpms-textbox"
                            style="width: 100px" field="Birthday" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                    <td class="td-l">
                        入党日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtPartyTime" readonly="readonly" class="kpms-textbox-date"
                            style="width: 100px" field="PartyTime" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        籍贯
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbNativePlace" field="NativePlace" tablename="EHR_RETIREDUSER"
                            class="kpms-textbox-long" activestatus="(N.*)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        出生地
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbBirthdayAdd" field="BirthdayAdd" tablename="EHR_RETIREDUSER"
                            class="kpms-textbox-long" activestatus="(N.*)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        住址
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbFamilyAddress" field="FamilyAddress"
                            tablename="EHR_RETIREDUSER" class="kpms-textbox-long" activestatus="(23.*)"
                            MaxLength="128"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        <span tih="tih">离退</span>类别<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlRetiredType" field="RetiredType"
                            tablename="EHR_RETIREDUSER" activestatus="(23.*)" req="1">
                        </zhongsoft:LightDropDownList>
                    </td>
                    <td class="td-l">
                        <span tih="tih">离退</span>日期
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtRetiredTime" readonly="readonly" field="RETIREDDATE"
                            class="kpms-textbox-date" style="width: 100px" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                </tr>
                <tr id="trroleInformation">
                    <td class="td-l">
                        身故标识
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList ID="radDeathState" runat="server" activestatus="(23.*)" field="ISDEAD"
                            tablename="EHR_RETIREDUSER" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">已身故</asp:ListItem>
                            <asp:ListItem Value="0">未身故</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="td-l">
                        身故日期
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtDeathTime" readonly="readonly" class="kpms-textbox-date" field="DEADDATE"
                            style="width: 100px" tablename="EHR_RETIREDUSER" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr style="display: none">
                    <td class="td-l">
                        <span tih="tih">离退</span>原因
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox runat="server" ID="tbRetiredReason" field="RetiredReason"
                            tablename="EHR_RETIREDUSER" maxtext="512" class="kpms-textarea" activestatus="(23.*)"
                            TextMode="MultiLine" EnableTheming="false"></zhongsoft:LightTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="roleInformation">
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        离退休后享受级别
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbEnjoyLevel" field="ENJOYLEVEL" tablename="EHR_RETIREDUSER"
                            MaxLength="64" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">
                        养老金（元）
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbPension" field="Pension" tablename="EHR_RETIREDUSER"
                            MaxLength="15" CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.*)"
                            regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数,最多12位整数2位小数"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        离退休费(元)
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbRetiredFee" field="RetiredFee" tablename="EHR_RETIREDUSER"
                            MaxLength="15" CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.*)"
                            regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数,最多12位整数2位小数"></zhongsoft:LightTextBox>
                    </td>
                    <td class="td-l">
                        离退休费支付单位
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbPayUnit" tablename="EHR_RETIREDUSER" field="PAYCORP"
                            MaxLength="128" class="kpms-textbox-long" activestatus="(23.*)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        离退休管理单位
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbManageUnit" tablename="EHR_RETIREDUSER" field="MANAGECORP"
                            MaxLength="128" class="kpms-textbox-long" activestatus="(23.*)"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        参加各项活动
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbActivity" field="Activity" tablename="EHR_RETIREDUSER"
                            maxtext="512" class="kpms-textarea" activestatus="(23.*)" TextMode="MultiLine"
                            EnableTheming="false"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        返聘情况
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbBridgeState" tablename="EHR_RETIREDUSER" field="REEMPLOYEDSTATE"
                            Maxtext="128" class="kpms-textarea" activestatus="(23.*)" TextMode="MultiLine"
                            EnableTheming="false"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        是否异地安置
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsDifPlace" field="IsDifPlace" activestatus="(23.*)"
                            tablename="EHR_RETIREDUSER" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="td-l">
                        异地接收安置日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveTime" readonly="readonly" field="RECEIEVEDATE"
                            class="kpms-textbox-date" style="width: 100px" tablename="EHR_RETIREDUSER"
                            activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        异地安置情况
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:LightTextBox runat="server" ID="tbDifPlaceState" field="DifPlaceState"
                            tablename="EHR_RETIREDUSER" maxtext="512" class="kpms-textarea" activestatus="(23.*)"
                            TextMode="MultiLine" EnableTheming="false"></zhongsoft:LightTextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <input runat="server" type="hidden" id="hiRetiredPersonnelID" field="RETIREDUSERID"
        tablename="EHR_RETIREDUSER" />
    <%--<input type="hidden" id="hiOrgContractState" runat="server" field="OrgContractState"
        tablename="EHR_RETIREDUSER" />--%>

    <script type="text/javascript">
        $(function() {
            $('#information').tabs();
        });   
    </script>

    <input type="hidden" runat="server" id="hiUserXml" />

    <script type="text/javascript">

        var showOtherInfo = '<%=ShowOtherInfo %>';
        var sourcePage = '<%=SourcePage %>';
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            ShowOtherInfo();
        }

        function ChooseUser() {
            var param = new InputParamObject("s");
            var filter = "";
            var re = getPersonnel("<%=hiUserXml.ClientID %>", param, filter);

            if (re != null) {
                $("#<%=hiPersonnelInfoID.ClientID %>").val(re.buildAttrJson("o", "id"));
                $("#<%=txtPersonnelName.ClientID %>").val(re.buildAttrJson("o", "name"));
                $("#<%=txtPersonnelCode.ClientID %>").val(re.buildAttrJson("o", "att2"));
                $("#<%=hiRetiredDeptID.ClientID %>").val(re.buildAttrJson("o", "att3"));
                $("#<%=txtOrganizationName.ClientID %>").val(re.buildAttrJson("o", "att4"));
                $("#<%=txtIdentityCardNO.ClientID %>").val(re.buildAttrJson("o", "att11"));
                return true;
            }
            return false;
        }
        //Add by huah 2012-11-19 由人员退出进入不显示“其它信息”页签，显示“退出”
        function ShowOtherInfo() {
            if (showOtherInfo == "0") {
                $("[id*=roleInformation]").hide();
                $("[tih=tih]").each(function() {
                    newtitle = $(this).text().replace("离退", "退出");
                    $(this).text(newtitle)
                })
            }
        }
        //由离退休人员生日提醒进入时只有地址、联系方式、死亡时间和死亡状态可编辑 Add by huah 2013-01-09 
        function InitDisabled() {
            if (sourcePage == "retireBirthdayAlter") {
                $('input[type=text],select,textarea').attr("disabled", "disabled").css("background-color", "#ffffff");
                $('#<%=rblIsDifPlace.ClientID %>').attr("disabled", "disabled");
                $('#<%=txtFamilyPhone.ClientID %>').removeAttr("disabled").css("background-color", "#ffffbb");
                $('#<%=tbFamilyAddress.ClientID %>').removeAttr("disabled").css("background-color", "#ffffbb");
                $('#<%=txtDeathTime.ClientID %>').removeAttr("disabled").css("background-color", "#ddffdd");
            }
        }

    </script>

</asp:Content>
