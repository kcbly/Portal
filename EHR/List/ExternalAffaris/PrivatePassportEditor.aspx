<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PrivatePassportEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.ExternalAffaris.PrivatePassportEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" Field="USERNAME" tablename="EHR_PRIVATEPASSPORT"
                    activestatus="(2.*)" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false"
                    ShowJsonRowColName="true" ShowAttrs="name,UserCode" ResultForControls="{'hiUserId':'id','tbUserCode':'UserCode','tbUserName':'UserName',
                      'hiDeptId':'DEPTID','tbDeptName':'DEPTNAME','hiSubDeptId':'OrgUnitId','tbSubDeptName':'OrgUnitName','tbSex':'Sex'
                      ,'tbNation':'NATION','tbIdCard':'IDENTITYCARDNO','tbBirthday':'BIRTHDAY','tbHomeTown':'HOMETOWN','tbPosition':'RANKNAME','tbTechnicalPost':'SKILLTITLE'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="lbtnChooseUser_Click" />
                <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_PRIVATEPASSPORT" />
                <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_PRIVATEPASSPORT" />
                <input type="hidden" id="hiSubDeptId" runat="server" field="SUBDEPTID" tablename="EHR_PRIVATEPASSPORT" />
            </td>
            <td class="td-l">
                工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="USERCODE" Tablename="EHR_PRIVATEPASSPORT" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSex" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="SEX" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                民族
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbNation" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="NATION" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                身份证号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbIdCard" runat="server" readonly="readonly" class="kpms-textbox"
                    Field="IDCARD" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                出生日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbBirthday" runat="server" class="kpms-textbox-date"
                    readonly="readonly" Field="BIRTHDAY" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                出生地
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbHomeTown" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="HOMETOWN" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbDeptName" runat="server" class="kpms-textbox" readonly="readonly"
                    Field="DEPTNAME" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbSubDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                    Field="SUBDEPTNAME" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                职务
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPosition" runat="server" readonly="readonly" class="kpms-textbox"
                    Field="POSITION" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                职称
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbTechnicalPost" runat="server" readonly="readonly"
                    class="kpms-textbox" Field="TECHNICALPOST" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                护照号码<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbPassportNumber" runat="server" req="1" CssClass="kpms-textbox"
                    Field="PASSPORTNUMBER" Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l" nowrap>
                护照有效开始日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPassportStartDate" runat="server" readonly="readonly"
                    req="1" class="kpms-textbox-comparedate" compare="1" Field="PASSPORTSTARTDATE"
                    Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l" nowrap>
                护照有效截止日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPassportEndDate" runat="server" readonly="readonly"
                    req="1" class="kpms-textbox-comparedate" compare="1" Field="PASSPORTENDDATE"
                    Tablename="EHR_PRIVATEPASSPORT" Activestatus="(23.*)" onblur="getTerm(0);">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否借出
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsLoan" runat="server" RepeatDirection="Horizontal" field="ISLOAN"
                    tablename="EHR_PRIVATEPASSPORT" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-m" colspan="2">
                <table>
                    <tr class="trloan">
                        <td class="td-l">
                            借出日期<span class="req-star">*</span>
                        </td>
                        <td class="td-m">
                            <zhongsoft:XHtmlInputText ID="tbLoanDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                                type="text" content="loan" conteneSpecial="check" Field="LOANDATE" Tablename="EHR_PRIVATEPASSPORT"
                                Activestatus="(23.*)">
                            </zhongsoft:XHtmlInputText>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否过期
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsDated" runat="server" RepeatDirection="Horizontal"
                    Enabled="false" EnableTheming="false">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="1024" Tablename="EHR_PRIVATEPASSPORT" field="MEMO"
                    ActiveStatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiPrivatePassportId" runat="server" field="PRIVATEPASSPORTID"
        tablename="EHR_PRIVATEPASSPORT" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();


            $('#<%=rblIsLoan.ClientID %>').live("change", function () {
                accessOfReDisply();

            });
            accessOfReDisply();

        }


        function getTerm(type) {
            if (type == 0) {
                var endDate = new Date();
                var start = $("#<%=tbPassportEndDate.ClientID %>").val();
                var startDate = new Date(Date.parse(start.replace(/-/g, "/")));
                var ratio = $("input[name='<%=rblIsDated.ClientID %>']");
                if (calculateTerm(startDate, endDate) > 6) {
                    $("input[name='<%=rblIsDated.ClientID %>']").val(["否"]);
                }
                else {
                    $("input[name='<%=rblIsDated.ClientID %>']").val(["是"]);
                }
            }
        }

        function calculateTerm(stDate, endDate) {
            if (stDate != "" && endDate != "") {
                var year = stDate.getYear() - endDate.getYear();
                var month = stDate.getMonth() - endDate.getMonth();
                if (year > 0) {
                    month = year * 12 + month;
                }
                else
                    month = month - 12;
                return month;
            }
            else return 7;
        }

        //控制是否显示借出日期
        function accessOfReDisply() {
            var isRight = $('#<%=rblIsLoan.ClientID%> :checked').val();
            if (isRight == "是") {
                $('.trloan').show();
                $('#<%=tbLoanDate.ClientID %>').attr('req', '1');
            }
            else {
                $('.trloan').hide();
                $('#<%=tbLoanDate.ClientID %>').removeAttr('req');
                $('#<%=tbLoanDate.ClientID %>').val("");
            }
        }
    </script>
</asp:Content>
