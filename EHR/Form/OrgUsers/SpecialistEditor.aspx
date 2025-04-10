<%@ Page Language="C#" AutoEventWireup="true" Title="专家人才" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="SpecialistEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.SpecialistEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table width="100%">
        <tr>
            <td class="kpms-fim-l">
                院号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="院号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="所属部门" style="width: 34%" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="kpms-fim-l">
                    专家称号名称<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSpecialistName" field="SpecialistName" tablename="EHR_SpecialistTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="专家称号名称" req="1"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    专家人才类型
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSpecialistType" field="SpecialistType" tablename="EHR_SpecialistTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="专家人才类型"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    专家称号批准日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointStartTime" class="kpms-textbox-date"
                        field="AppointStartTime" tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="专家称号批准日期" req="1" />
                </td>
                <td class="kpms-fim-l">
                    专家称号终止日期
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointEndTime" class="kpms-textbox-date"
                        field="AppointEndTime" tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="专家称号终止日期" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    获得方式
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbGetPath" field="GetPath" tablename="EHR_SpecialistTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="获得方式"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    专业领域
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbSpecialistArea" field="SpecialistArea" tablename="EHR_SpecialistTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="专业领域"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    批准单位
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbApprovalUnit" field="ApprovalUnit" tablename="EHR_SpecialistTemp"
                        class="kpms-textbox" MaxLength="128" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="批准单位"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    备注
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" Maxtext="256" tablename="EHR_SpecialistTemp" field="Remark"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="备注"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiSpecialistID" field="SpecialistID" tablename="EHR_SpecialistTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiSpecialistTempID" field="SpecialistTempID"
        tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_SpecialistTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiDegreeName" value="专家人才" />
    <input type="hidden" runat="server" id="hiDegreeUrl" value="/Portal/EHR/Form/SpecialistEditor.aspx" />
    <input type="hidden" runat="server" id="hiDegreeFCode" value="SpecialistName" />
    <input type="hidden" runat="server" id="hiDegreeFName" value="专家称号名称" />
    <input type="hidden" runat="server" id="hiDegreeTCode" value="EHR_SpecialistTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="SpecialistTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="SpecialistID" />

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
                    alert("专家称号批准日期应早于专家称号终止日期！");
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
