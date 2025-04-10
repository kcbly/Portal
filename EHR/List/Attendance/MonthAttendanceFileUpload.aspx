<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthAttendanceFileUpload.aspx.cs" Title="上传考勤数据"
     MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EHR.List.Attendance.MonthAttendanceFileUpload" %>
   
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
   
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="btnImport" runat="server" OnClick="btnImport_Click"  >
        <span>导入Excel</span>
            </asp:LinkButton> 
             <asp:FileUpload ID="fupAllowance" runat="server" /> 
</asp:Content>
