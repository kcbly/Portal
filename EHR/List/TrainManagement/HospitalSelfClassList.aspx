<%@ Page Title="院内自办班申请台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="HospitalSelfClassList.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.HospitalSelfClassList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">申请部门</span><span>
        <zhongsoft:LightTextBox ID="tbChargeDeptName" runat="server"  CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">培训班名称</span><span>
        <zhongsoft:LightTextBox ID="tbTrainName" runat="server"  CssClass="kpms-search" EnableTheming="false"></zhongsoft:LightTextBox></span></span>
    <span class="filter-block"><span class="filter-block-lb">计划办班日期</span><span>
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
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" AllowPaging="true" DataKeyNames="HospitalSelfClassFormID"
        ShowExport="true" BindGridViewMethod="BindData" ShowFooter="true" OnRowDataBound="gvList_RowDataBound"
        AllowSorting="true" UseDefaultDataSource="true" HideFieldOnExport="查看">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="5%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="Code">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="办班部室" DataField="ChargeDeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训班名称" DataField="ClassName">
            </zhongsoft:LightBoundField>            
            <zhongsoft:LightBoundField HeaderText="预计参训人数" DataField="JoinPeopleNum1" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（起）" DataField="StartDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训日期（止）" DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="培训费合计（元）" DataField="TrainTotalCost1" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField> 
            <zhongsoft:LightBoundField HeaderText="培训内容" DataField="TrainContent" ShowToolTip="true">
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
        <FooterStyle ForeColor="Red" Font-Bold="true" HorizontalAlign="Right" />
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
