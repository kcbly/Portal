<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
CodeBehind="TechQualifAppointment.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.TechQualifAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="white-space:nowrap">
        <tr>
            <td class="td-l">
                聘任日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
               <zhongsoft:XHtmlInputText runat="server" ID="txtAppointStartTime" class="kpms-textbox-comparedate" req="1"
                    field="APPOINTDATE" tablename="EHR_TECHQUALIFAPPOINTMENT" activestatus="(23.*)" readonly="readonly"
                    compare="1" />
            </td>
            <td class="td-l">
                聘任文号<span class="req-star">*</span>
            </td>
            <td class="td-r">
              <zhongsoft:LightTextBox ID="tbAPPOINTDOC" runat="server" req="1"
                    class="kpms-textbox" field="APPOINTDOC" tablename="EHR_TECHQUALIFAPPOINTMENT" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                聘任续聘日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAppointEndTime" class="kpms-textbox-comparedate" req="1"
                    field="LEAVEDATE" tablename="EHR_TECHQUALIFAPPOINTMENT" activestatus="(23.*)" readonly="readonly"
                    compare="1" />
            </td>
            <td class="td-l" style="white-space:nowrap">
                解聘文号
            </td>
            <td class="td-r">
                  <zhongsoft:LightTextBox ID="tbLEAVEDOC" runat="server"
                    class="kpms-textbox" field="LEAVEDOC" tablename="EHR_TECHQUALIFAPPOINTMENT" activestatus="(23.*)" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiTECHQUALIFAPPOINTMENTID" field="TECHQUALIFAPPOINTMENTID" tablename="EHR_TECHQUALIFAPPOINTMENT" />
     <input type="hidden" runat="server" id="hiTECHQUALIFID" field="TECHQUALIFID" tablename="EHR_TECHQUALIFAPPOINTMENT" />
</asp:Content>
