<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="FileInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.FileInfoEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table class="tz-table">
        <tr>
            <td class="kpms-fim-l">
                员工号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="员工号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    转入日期<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <input type="text" readonly="readonly" runat="server" id="tbInTime" class="kpms-textbox-date"
                        status="0" req="1" field="InTime" tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="转入日期" />
                </td>
                <td class="td-l">
                    档案来处<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbFromPlace" field="FromPlace" tablename="EHR_FileInfoTemp"
                        status="0" req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="档案来处"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    转出日期
                </td>
                <td class="td-r">
                    <input type="text" readonly="readonly" runat="server" id="tbOutTime" class="kpms-textbox-date"
                        status="0" field="OutTime" tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="转出日期" />
                </td>
                <td class="td-l">
                    档案去处
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbToPlace" field="ToPlace" tablename="EHR_FileInfoTemp"
                        status="0" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="档案去处"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    档案类别
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbFileType" field="FileType" tablename="EHR_FileInfoTemp"
                        status="0" MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="档案类别"></asp:TextBox>
                </td>
                <td class="td-l">
                    变动原因<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbChangeReason" field="ChangeReason" tablename="EHR_FileInfoTemp"
                        status="0" req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="变动原因"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    管理单位<span class="kpms-star">*</span>
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbManageUnit" field="ManageUnit" tablename="EHR_FileInfoTemp"
                        status="0" req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="管理单位"></asp:TextBox>
                </td>
                <td class="td-l">
                    说明
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbExplain" field="Explain" tablename="EHR_FileInfoTemp"
                        status="0" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="说明"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    档案位置
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbFileLocation" field="FileLocation" tablename="EHR_FileInfoTemp"
                        status="0" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="档案位置"></asp:TextBox>
                </td>
                <td class="td-l">
                    条形码
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbBarCode" field="BarCode" tablename="EHR_FileInfoTemp"
                        status="0" MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        fieldname="条形码"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    备注
                </td>
                <td class="td-m" colspan="3">
                    <asp:TextBox ID="tbRemark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        fieldname="备注" status="0" EnableTheming="false" maxtext="512" tablename="EHR_FileInfoTemp"
                        field="Remark" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiFileInfoID" field="FileInfoID" tablename="EHR_FileInfoTemp"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiFileInfoTempID" field="FileInfoTempID"
        activestatus="(23.申请人填写信息)(23.申请人修改信息)" tablename="EHR_FileInfoTemp" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_FileInfoTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiFileName" value="档案信息" />
    <input type="hidden" runat="server" id="hiFileUrl" value="/Portal/EHR/Form/FileInfoEditor.aspx" />
    <input type="hidden" runat="server" id="hiFileFCode" value="InTime" />
    <input type="hidden" runat="server" id="hiFileFName" value="转入日期" />
    <input type="hidden" runat="server" id="hiFileTCode" value="EHR_FileInfoTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="FileInfoTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="FileInfoID" />

    <script>

        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function KPMSCheckSubmit() {
            var start = document.getElementById("<%=tbInTime.ClientID %>").value;
            var end = document.getElementById("<%=tbOutTime.ClientID %>").value;
            if (start != "" && end != "") {
                if (Date.parse(start.replace('-', '/')) >= Date.parse(end.replace('-', '/'))) {
                    alert("转入日期应早于转出日期！");
                    return false;
                }
            }
            return true;
        }
    </script>

    <script type="text/javascript">
        $(function()
        {
            SetBackGround();
        });
    </script>

</asp:Content>
