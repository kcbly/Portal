<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainProjectSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainProjectSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                培训项目名称
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Width="350px">
                </zhongsoft:LightTextBox>
                承办人
                <zhongsoft:LightTextBox ID="tbUnderTaker" runat="server" Width="50px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td>
                培训方式
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainWay">
                </zhongsoft:LightDropDownList>
                培训类别
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainClass">
                </zhongsoft:LightDropDownList>
                培训类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType">
                </zhongsoft:LightDropDownList>
                培训形式
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="10" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowCommand="gvList_RowCommand" ShowJsonRowColName="true" OnJsonClick="addObject"
        JsonClickMode="onclick" BindJsonClick="true">
        <Columns>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTCODE" HeaderText="培训项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGTYPE" HeaderText="培训类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGFORM" HeaderText="培训形式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGLEVEL" HeaderText="培训级别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINSTDATE" HeaderText="参加培训开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINENDDATE" HeaderText="参加培训结束日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
