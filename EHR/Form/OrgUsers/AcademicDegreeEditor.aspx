<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="AcademicDegreeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.OrgUsers.AcademicDegreeEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserCode" tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="工号" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbUserName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserName" tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbOrgUnitName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    文化程度<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbEducation" field="Education" tablename="EHR_AcademicDegreeTemp"
                        req="1" activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="文化程度" status="0">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    学位
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbAcademicDegree" field="AcademicDegree"
                        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="学位"
                        status="0">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    主专业
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbMAJORSPECIALTY" field="MAJORSPECIALTY"
                        tablename="EHR_AcademicDegreeTemp" MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="主专业" status="0"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    辅专业
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbMINORSPECIALTY" field="MINORSPECIALTY"
                        tablename="EHR_AcademicDegreeTemp" MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="辅专业" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    毕业学校<span class="req-star">*</span>
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbGraduateSchool" field="GraduateSchool"
                        tablename="EHR_AcademicDegreeTemp" req="1" MaxLength="128" class="kpms-textbox"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="毕业学校" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    学制<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbSchoolingLength" field="SchoolingLength"
                        tablename="EHR_AcademicDegreeTemp" req="1" MaxLength="2" class="kpms-textbox-money"
                        EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)" regex="^\d+$" errmsg="请输入最多两位正整数"
                        fieldname="学制" status="0"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    学历性质
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="tbEducationType" runat="server" field="EducationType"
                        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="学历性质"
                        status="0">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    入学日期
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="tbENROLLMENTDATE"
                        class="kpms-textbox-comparedate" status="0" field="ENROLLMENTDATE" tablename="EHR_AcademicDegreeTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="入学日期" compare="1" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    毕业日期
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="tbGRADUATEDATE"
                        class="kpms-textbox-comparedate" status="0" field="GRADUATEDATE" tablename="EHR_AcademicDegreeTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="毕业日期" compare="1" />
                </td>
                <td class="td-l">
                    最高文化程度标识
                </td>
                <td class="td-r">
                    <asp:CheckBox runat="server" ID="tbIsHighest" Text="是" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" />
                    <input type="hidden" id="hiIsHighest" runat="server" field="IsHighest" tablename="EHR_AcademicDegreeTemp"
                        fieldname="最高文化程度标识" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    留学标识
                </td>
                <td class="td-r">
                    <asp:CheckBox runat="server" ID="tbIsAbroad" Text="是" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" />
                    <input type="hidden" id="hiIsAbroad" runat="server" field="IsAbroad" tablename="EHR_AcademicDegreeTemp"
                        fieldname="留学标识" />
                </td>
                <td class="td-l">
                    留学国别或行政区
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="tbAbroadCountry" runat="server" field="AbroadCountry"
                        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="留学国别或行政区"
                        status="0">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    回国时间
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" ID="tbBACKDATE" class="kpms-textbox-date"
                        status="0" field="BACKDATE" tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="回国时间" />
                </td>
                <td class="td-l">
                    公费标识
                </td>
                <td class="td-r">
                    <asp:CheckBox runat="server" ID="tbIsPublicExpense" Text="是" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" />
                    <input type="hidden" id="hiIsPublicExpense" runat="server" field="IsPublicExpense"
                        tablename="EHR_AcademicDegreeTemp" fieldname="公费标识" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    备注
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="EHR_AcademicDegreeTemp"
                        status="0" Maxtext="256" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        TextMode="MultiLine" fieldname="备注"></zhongsoft:LightTextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId" tablename="EHR_AcademicDegreeTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiAcademicDegreeID" field="AcademicDegreeID"
        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiAcademicDegreeTempID" field="AcademicDegreeTempID"
        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiUSERINFOPASSID" field="USERINFOPASSID"
        tablename="EHR_AcademicDegreeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiDegreeName" value="学历学位" />
    <input type="hidden" runat="server" id="hiDegreeUrl" value="/EHR/Form/OrgUsers/AcademicDegreeEditor.aspx" />
    <input type="hidden" runat="server" id="hiDegreeFCode" value="Education" />
    <input type="hidden" runat="server" id="hiDegreeFName" value="文化程度" />
    <input type="hidden" runat="server" id="hiDegreeTCode" value="EHR_AcademicDegreeTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="AcademicDegreeTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="AcademicDegreeID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        
    </script>
    <script type="text/javascript">
        $(function () {
            SetBackGround();
        });
    </script>
</asp:Content>
