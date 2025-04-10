<%@ Page Language="C#" AutoEventWireup="true" Title="技能等级" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SkillLevelEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.SkillLevelEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table width="100%">
        <tr>
            <td class="kpms-fim-l">
                院号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="院号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="所属部门" style="width: 34%" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="kpms-fim-l">
                    技能鉴定工种<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbQualificationName" field="QualificationName" tablename="EHR_SkillLevelTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="技能鉴定工种" req="1"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    资格等级
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbQualificationLevel" field="QualificationLevel"
                        tablename="EHR_SkillLevelTemp" MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="资格等级"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    证书编号<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbQualificationNo" field="QualificationNo" tablename="EHR_SkillLevelTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="证书编号" req="1"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    资格获得日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbGetDate" class="kpms-textbox-date"
                        field="GetDate" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="资格获得日期" req="1" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    聘任日期
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointStartTime" class="kpms-textbox-date"
                        field="AppointStartTime" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="聘任日期" />
                </td>
                <td class="kpms-fim-l">
                    解聘日期
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointEndTime" class="kpms-textbox-date"
                        field="AppointEndTime" tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="解聘日期" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    批准单位
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbApprovalUnit" field="ApprovalUnit" tablename="EHR_SkillLevelTemp"
                        class="kpms-textbox" MaxLength="128" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="批准单位"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    是否最高技能等级
                </td>
                <td class="kpms-fim-r">
                    <asp:CheckBox runat="server" ID="tbIsHighest" Text="是" field="IsHighest" tablename="EHR_SkillLevelTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="是否最高技能等级" />
                </td>
                <td class="kpms-fim-l">
                    是否现技能等级
                </td>
                <td class="kpms-fim-r">
                    <asp:CheckBox runat="server" ID="tbIsNow" Text="是" field="IsNow" tablename="EHR_SkillLevelTemp"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="是否现技能等级" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    备注
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" Maxtext="256" tablename="EHR_SkillLevelTemp" field="Remark"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="备注"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiSkillLevelID" field="SkillLevelID" tablename="EHR_SkillLevelTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiSkillLevelTempID" field="SkillLevelTempID"
        tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_SkillLevelTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiDegreeName" value="技能等级" />
    <input type="hidden" runat="server" id="hiDegreeUrl" value="/Portal/EHR/Form/SkillLevelEditor.aspx" />
    <input type="hidden" runat="server" id="hiDegreeFCode" value="QualificationName" />
    <input type="hidden" runat="server" id="hiDegreeFName" value="技能鉴定工种" />
    <input type="hidden" runat="server" id="hiDegreeTCode" value="EHR_SkillLevelTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="SkillLevelTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="SkillLevelID" />

    <script>

        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        function KPMSCheckSubmit() {
            var start = document.getElementById("<%=tbAppointStartTime.ClientID %>").value;
            var end = document.getElementById("<%=tbAppointEndTime.ClientID %>").value;
            if (start != "" && end != "") {
                if (Date.parse(start.replace('-', '/')) >= Date.parse(end.replace('-', '/'))) {
                    alert("聘任日期应早于解聘日期！");
                    return false;
                }
            }
            return true;
        }

    </script>

    <script type="text/javascript">
        $(function() {
            SetBackGround();
        });
    </script>

</asp:Content>
