<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProjectExperienceEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.OrgUsers.ProjectExperienceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../../UI/Script/EHRGeneralScript.js"></script>

    <table class="tz-table">
        <tr>
            <td class="kpms-fim-l">
                工号<span class="req-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <zhongsoft:XHtmlInputText id="tbUserCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserCode" tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="工号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <zhongsoft:XHtmlInputText id="tbUserName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="UserName" tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="req-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <zhongsoft:XHtmlInputText id="tbOrgUnitName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrgUnitName" tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="td-l">
                    项目名称<span class="req-star">*</span>
                </td>
                <td class="td-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbProjectName" field="ProjectName" tablename="EHR_PROEXPERIENCETEMP"
                        fieldname="项目名称" status="0" req="1" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    项目编号
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbProjectCode" field="ProjectCode" tablename="EHR_PROEXPERIENCETEMP"
                        fieldname="项目编号" status="0" MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></asp:TextBox>
                </td>
                <td class="td-l">
                    担任角色
                </td>
                <td class="td-r">
                    <asp:TextBox runat="server" ID="tbRoleName" field="RoleName" tablename="EHR_PROEXPERIENCETEMP"
                        fieldname="担任角色" status="0" MaxLength="32" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    上任日期<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <input type="text" readonly="readonly" runat="server" id="tbAppointDate" class="kpms-textbox-comparedate" compare="1"
                        fieldname="上任日期" status="0" req="1" field="AppointDate" tablename="EHR_PROEXPERIENCETEMP"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                </td>
                <td class="td-l">
                    卸任日期<span class="req-star">*</span>
                </td>
                <td class="td-r">
                    <input type="text" readonly="readonly" runat="server" id="tbLEAVEDATE" class="kpms-textbox-comparedate" compare="1"
                        fieldname="卸任日期" status="0" req="1" field="LEAVEDATE" tablename="EHR_PROEXPERIENCETEMP"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
                </td>
            </tr>
            <tr>
                <td class="td-l">
                    主要任务及工作内容
                </td>
                <td class="td-m" colspan="3">
                    <asp:TextBox ID="tbWorkContent" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                        fieldname="主业任务及工作内容" status="0" EnableTheming="false" maxtext="512" tablename="EHR_PROEXPERIENCETEMP"
                        field="WorkContent" activestatus="(23.申请人填写信息)(23.申请人修改信息)"></asp:TextBox>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiUserId" field="UserId"
        tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPROEXPERIENCEID" field="PROEXPERIENCEID"
        tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiPROEXPERIENCETEMPID" field="PROEXPERIENCETEMPID"
        tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <input type="hidden" runat="server" id="hiUSERINFOPASSID" field="USERINFOPASSID"
        tablename="EHR_PROEXPERIENCETEMP" activestatus="(23.申请人填写信息)(23.申请人修改信息)" />
    <%--地址/主要字段名/表名--%>
    <input type="hidden" runat="server" id="hiProjectName" value="项目履历" />
    <input type="hidden" runat="server" id="hiProjectUrl" value="/EHR/Form/OrgUsers/ProjectExperienceEditor.aspx" />
    <input type="hidden" runat="server" id="hiProjectFCode" value="ProjectName" />
    <input type="hidden" runat="server" id="hiProjectFName" value="项目名称" />
    <input type="hidden" runat="server" id="hiTableCode" value="EHR_PROEXPERIENCETEMP" />
    <input type="hidden" runat="server" id="hiKeyName" value="PROEXPERIENCETEMPID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="PROEXPERIENCEID" />

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>

    <script type="text/javascript">
        $(function()
        {
            SetBackGround();
        });
    </script>

</asp:Content>
