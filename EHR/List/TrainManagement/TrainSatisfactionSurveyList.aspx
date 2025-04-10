<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainSatisfactionSurveyList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainSatisfactionSurveyList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table style="text-align: left">
        <tr>
            <td>
                年度
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
                </zhongsoft:LightDropDownList>
                培训项目编号/名称
                <zhongsoft:LightTextBox ID="tbTrainProject" runat="server" Width="250px">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ShowPageSizeChange="true"
        ID="gvList" UseDefaultDataSource="true" runat="server" ShowExport="true" HideFieldOnExport="查看"
        DataKeyNames="EDUCATIONTRAINPROJECTID" BindGridViewMethod="BindDataGrid" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTCODE" HeaderText="培训项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目名称" MaxLength="10">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINSTDATE" HeaderText="参加培训开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINENDDATE" HeaderText="参加培训结束日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGFORM" HeaderText="培训形式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGTYPE" HeaderText="培训类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINCONTENT" HeaderText="培训内容">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NUMBEROFTRAINING" HeaderText="参加培训人数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NUMBEROFSENDING" HeaderText="发起满意度调查份数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NUMBEROFTAKINGBACK" HeaderText="已收回调查表份数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                EditIdField="EDUCATIONTRAINPROJECTID" EditPageWidth="900px" EditPageHeight="600px"
                ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TrainSatisfactionSurveyDetail.aspx">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
