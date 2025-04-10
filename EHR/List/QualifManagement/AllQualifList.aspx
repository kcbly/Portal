<%@ Page Title="个人资格信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="AllQualifList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.AllQualifList" %>
<%@ Register Src="~/EHR/UI/Controls/QualifInfoList.ascx" TagPrefix="uc1" TagName="QualifInfoList" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
       <uc1:QualifInfoList runat="server" id="QualifInfoList" />
</asp:Content> 
