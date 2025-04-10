<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YearTrainPlanSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.YearTrainPlanSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
                <span class="filter-block"><span class="filter-block-lb">年度</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" Width="65px" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
                <span class="filter-block"><span class="filter-block-lb">承办部门</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
                <span class="filter-block"><span class="filter-block-lb">承办人</span><span>
                <zhongsoft:LightTextBox ID="tbUnderTaker" runat="server" Width="50px" EnableTheming="false">
                </zhongsoft:LightTextBox></span></span> 
                <span class="filter-block"><span class="filter-block-lb">类型</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlType" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 

                <span class="filter-block"><span class="filter-block-lb">培训项目名称</span><span>
                <zhongsoft:LightTextBox ID="tbProjectName" Width="100px" runat="server">
                </zhongsoft:LightTextBox></span></span> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
        AllowPaging="true" PageSize="10" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid" OnRowCommand="gvList_RowCommand"
        ShowJsonRowColName="true" OnJsonClick="addObject" JsonClickMode="onclick" BindJsonClick="true">
        <Columns>
           <zhongsoft:LightBoundField DataField="YEARINSTTRAINPLANENTITYID" HeaderText="id" Visible="false">
            </zhongsoft:LightBoundField>
             <zhongsoft:LightBoundField DataField="YEAR" HeaderText="年度" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目名称" ItemStyle-Width="20%">
            </zhongsoft:LightBoundField>
            
                        <zhongsoft:LightBoundField DataField="UNDERDEPTNAME" HeaderText="承办部门" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>

            <zhongsoft:LightBoundField DataField="PLANSTDATE" HeaderText="计划开始时间" ItemStyle-Width="10%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PLANENDDATE" HeaderText="计划结束时间" ItemStyle-Width="10%"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CATEGORY" HeaderText="培训分类" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGLEVEL" HeaderText="培训级别" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TYPE" HeaderText="计划类型" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERTAKERNAME" HeaderText="承办人" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="COSTESTIMATING" HeaderText="费用估算(元)" ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="NUMBEROFTRAINING" HeaderText="培训人数" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGCLASSHOUR" HeaderText="培训课时" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
