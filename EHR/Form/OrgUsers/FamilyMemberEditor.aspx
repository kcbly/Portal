<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FamilyMemberEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.FamilyMemberEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table class="tz-table">
        <tr>
            <td class="td-l">
                工号<span class="kpms-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="工号" />
            </td>
            <td class="td-l">
                姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    成员姓名<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbFamilyMemberName" field="FamilyMemberName" tablename="EHR_FamilyMemberTemp"
                        req="1" MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="姓名" status="0"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    与本人关系<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="tbRelationship" runat="server" field="Relationship" tablename="EHR_FamilyMemberTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" req="1" fieldname="与本人关系" status="0">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    性别<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <asp:RadioButtonList runat="server" ID="tbSex" field="Sex" tablename="EHR_FamilyMemberTemp"
                        req="1" activestatus="(23.申请人填写信息)(23.申请人修改信息)" RepeatDirection="Horizontal"
                        fieldname="性别" status="0">
                        <asp:ListItem Value="男">男</asp:ListItem>
                        <asp:ListItem Value="女">女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="td-l">
                    出生日期
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText readonly="readonly" runat="server" id="tbBirthday" class="kpms-textbox-date"
                        status="0" field="Birthday" tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="出生日期" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    民族
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbNation" field="Nation" tablename="EHR_FamilyMemberTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="民族" status="0">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    籍贯
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbNativePlace" field="NativePlace" tablename="EHR_FamilyMemberTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="籍贯" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    文化程度
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbCulturalLevel" field="CulturalLevel" tablename="EHR_FamilyMemberTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="文化程度" status="0">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    国籍
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbNationality" field="Nationality" tablename="EHR_FamilyMemberTemp"
                        MaxLength="50" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="国籍" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    政治面貌
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList runat="server" ID="tbPoliticalAffiliation" field="PoliticalAffiliation"
                        tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="政治面貌"
                        status="0">
                    </zhongsoft:LightDropDownList>
                </td>
                <td class="td-l">
                    工作单位
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbWorkUnit" field="WorkUnit" tablename="EHR_FamilyMemberTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="工作单位" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    职务
                </td>
                <td class="td-r">
                    <zhongsoft:LightTextBox runat="server" ID="tbPosition" field="Position" tablename="EHR_FamilyMemberTemp"
                        MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="职务" status="0"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">
                    人员状态
                </td>
                <td class="td-r">
                    <zhongsoft:LightDropDownList ID="tbState" runat="server" field="State" tablename="EHR_FamilyMemberTemp"
                        fieldname="人员状态" status="0" activestatus="(23.申请人填写信息)(23.申请人修改信息)">
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    联系电话
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ID="tbTelPhone" field="TelPhone" tablename="EHR_FamilyMemberTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.*)" regex="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)"
                        errmsg="请输入正确联系电话" fieldname="联系电话" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    备注
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" maxtext="512" tablename="EHR_FamilyMemberTemp" field="Remark"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" fieldname="备注" status="0"></zhongsoft:LightTextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiFamilyMemberID" field="FamilyMemberID"
        tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiFamilyMemberTempID" field="FamilyMemberTempID"
        tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_FamilyMemberTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiFamilyName" value="家庭成员" />
    <input type="hidden" runat="server" id="hiFamilyUrl" value="/Portal/EHR/Form/FamilyMemberEditor.aspx" />
    <input type="hidden" runat="server" id="hiFamilyFCode" value="FamilyMemberName" />
    <input type="hidden" runat="server" id="hiFamilyFName" value="姓名" />
    <input type="hidden" runat="server" id="hiFaminlyTCode" value="EHR_FamilyMemberTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="FamilyMemberTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="FamilyMemberID" />

    <script type="text/javascript">

        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    
    </script>

    <script type="text/javascript">
        $(function() {
            SetBackGround();
        });
    </script>

</asp:Content>
