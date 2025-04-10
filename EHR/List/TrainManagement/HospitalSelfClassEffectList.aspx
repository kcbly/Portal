<%@ Page Title="院内自办班教培效果反馈台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="HospitalSelfClassEffectList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.HospitalSelfClassEffectList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">参训人</span><span>
        <zhongsoft:LightTextBox ID="tbJoinUserName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训名称</span><span>
        <zhongsoft:LightTextBox ID="tbTrainName" runat="server" CssClass="kpms-search" EnableTheming="false" Width="120px"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtBeginDate" class="kpms-textbox-comparedate"
            compare="1" readonly="readonly">
        </zhongsoft:XHtmlInputText>
        至
         <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
             compare="1" readonly="readonly">
         </zhongsoft:XHtmlInputText>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="HospitalSelfClassEffectFormID" ShowExport="true" BindGridViewMethod="BindData"
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="自办班编号" DataField="Code" SortExpression="Code">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参训人" DataField="JoinUserName" SortExpression="JoinUserName">
            </zhongsoft:LightBoundField>
            <asp:TemplateField HeaderText="培训名称" ItemStyle-HorizontalAlign="left" SortExpression="TrainName">
                <ItemTemplate>
                    <a onclick="return ViewItem('<%#Eval("FId")%>','<%#Eval("PId")%>');" style="color: Blue;">
                        <%#Eval("TrainName")%>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightBoundField HeaderText="培训日期（起）" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="StartDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（止）" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="EndDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训反馈" DataField="Effect" ShowToolTip="true" SortExpression="Effect">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true" SortExpression="Memo">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">      
        function ViewItem(FId, PId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + FId + "&prcInstId=" + PId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
