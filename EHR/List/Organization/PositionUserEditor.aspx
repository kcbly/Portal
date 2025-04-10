<%@ Page Title="上岗人员" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="PositionUserEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.Organization.PositionUserEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                员工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="USERID"
                    tablename="EHR_PositionUser" />
                <input type="text" runat="server" id="txtPersonnelCode" field="UserCode" tablename="EHR_PositionUser"
                    class="kpms-textbox" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="text" runat="server" id="txtPersonnelName" field="UserName" tablename="EHR_PositionUser"
                    class="kpms-textbox" activestatus="(23.*)" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所在部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiDeptID" field="OrgUnitID" tablename="EHR_PositionUser" />
                <input type="text" runat="server" id="txtDeptName" field="OrgUnitName" tablename="EHR_PositionUser"
                    class="kpms-textbox" activestatus="(23.*)" readonly="readonly" />
            </td>
            <td class="td-l">
                所属职务
            </td>
            <td class="td-r">
                <asp:TextBox runat="server" ID="tbPosition" field="OrgUnitName" tablename="EHR_PositionUser"
                  MaxLength="20"  class="kpms-textbox" activestatus="(23.*)"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                上任日期
            </td>
            <td class="td-r">
                <input type="text" readonly="readonly" runat="server" id="txtAppointedTime" class="kpms-textbox-comparedate"
                    field="AppointDate" tablename="EHR_PositionUser" activestatus="(23.*)" compare="1" />
            </td>
            <td class="td-l">
                卸任日期
            </td>
            <td class="td-r">
                <input type="text" readonly="readonly" runat="server" id="txtOutgoingTime" class="kpms-textbox-comparedate"
                    field="LEAVEDATE" tablename="EHR_PositionUser" activestatus="(23.*)" compare="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                在岗状态
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlPositionState" field="PositionState" tablename="EHR_PositionUser"
                    activestatus="(23.*)">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPositionUserID" field="PositionUserID"
        tablename="EHR_PositionUser" />
</asp:Content>
