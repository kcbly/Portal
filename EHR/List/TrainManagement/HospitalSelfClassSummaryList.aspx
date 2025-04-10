<%@ Page Title="院内自办班总结台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="HospitalSelfClassSummaryList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.HospitalSelfClassSummaryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">参训人</span><span>
        <zhongsoft:LightTextBox ID="tbJoinUserName" runat="server"  CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训名称</span><span>
        <zhongsoft:LightTextBox ID="tbTrainName" runat="server"  CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>
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
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="HospitalSelfClassSummaryFormID"
        ShowExport="true" BindGridViewMethod="BindData" 
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="自办班编号" DataField="Code">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="参训人" DataField="JoinUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训名称" DataField="TrainName">
            </zhongsoft:LightBoundField>  
            <zhongsoft:LightBoundField HeaderText="培训日期（起）" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（止）" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField> 
            <zhongsoft:LightBoundField HeaderText="培训总结" DataField="Summary" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDetail" EnableTheming="false">
                        <img alt="" src="../../../Themes/Images/btn_dg_view.gif"onclick='return ViewItem("<%#Eval("FId") %>","<%#Eval("PId") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
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
