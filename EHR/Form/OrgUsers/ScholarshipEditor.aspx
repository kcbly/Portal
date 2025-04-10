<%@ Page Language="C#" AutoEventWireup="true" Title="学术团体" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ScholarshipEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.ScholarshipEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table width="100%">
        <tr>
            <td class="kpms-fim-l">
                院号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="院号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="所属部门" style="width: 34%" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="kpms-fim-l">
                    社团名称<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbScholarshipName" field="ScholarshipName" tablename="EHR_ScholarshipTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="社团名称" req="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    主管单位名称
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbManageUnit" field="ManageUnit" tablename="EHR_ScholarshipTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="主管单位名称"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    职务<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPosition" field="Position" tablename="EHR_ScholarshipTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="职务" req="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    参加日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointStartTime" class="kpms-textbox-date"
                        field="AppointStartTime" tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="参加日期" req="1" />
                </td>
                <td class="kpms-fim-l">
                    退出日期
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointEndTime" class="kpms-textbox-date"
                        field="AppointEndTime" tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="退出日期" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    备注
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        EnableTheming="false" Maxtext="256" tablename="EHR_ScholarshipTemp" field="Remark"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="备注"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiScholarshipID" field="ScholarshipID" tablename="EHR_ScholarshipTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiScholarshipTemp" field="ScholarshipTempID"
        tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_ScholarshipTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiDegreeName" value="学术团体" />
    <input type="hidden" runat="server" id="hiDegreeUrl" value="/Portal/EHR/Form/ScholarshipEditor.aspx" />
    <input type="hidden" runat="server" id="hiDegreeFCode" value="ScholarshipName" />
    <input type="hidden" runat="server" id="hiDegreeFName" value="社团名称" />
    <input type="hidden" runat="server" id="hiDegreeTCode" value="EHR_ScholarshipTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="ScholarshipTemp" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="ScholarshipID" />

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
                    alert("参加日期应早于退出日期！");
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
