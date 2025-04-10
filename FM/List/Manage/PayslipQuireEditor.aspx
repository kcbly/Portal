<%@ Page Title="工资条详情"  Language="C#"  MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="PayslipQuireEditor.aspx.cs" Inherits="Zhongsoft.Portal.FM.List.Manage.PayslipQuireDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
     <style type="text/css">
         .td-r{
             width:30%;
         }
     </style>
        <asp:Literal runat="server" ID="ltSignInfo"></asp:Literal>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="FM_Manage_Payslip" field="PayslipId" />
    <script type="text/javascript">
       
    </script>
</asp:Content>
