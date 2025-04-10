<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TranPlanExcuteStatisticList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TranPlanExcuteStatisticList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">

                <span class="filter-block"><span class="filter-block-lb">年度</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlYear" Width="65px" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
                <span class="filter-block"><span class="filter-block-lb">计划申请部门</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
               <span class="filter-block"><span class="filter-block-lb"> 申请人</span><span>
                <zhongsoft:LightTextBox ID="tbUnderTaker" CssClass="kpms-textboxsearch" runat="server" Width="70px" EnableTheming="false">
                </zhongsoft:LightTextBox></span></span> 

                <span class="filter-block"><span class="filter-block-lb">培训项目名称</span><span>
                <zhongsoft:LightTextBox ID="tbProjectName" CssClass="kpms-textboxsearch" runat="server" Width="175px" EnableTheming="false">
                </zhongsoft:LightTextBox></span></span> 

                <%-- 培训方式
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainWay">
                </zhongsoft:LightDropDownList>--%>
                <span class="filter-block"><span class="filter-block-lb">培训类别</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainClass" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
                <span class="filter-block"><span class="filter-block-lb">培训级别</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainLevel" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 

                <span class="filter-block"><span class="filter-block-lb">计划类型</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlType" EnableTheming="false">
                </zhongsoft:LightDropDownList></span></span> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg" style="display:none">
        <asp:LinkButton ID="lbtnBatchBack" runat="server" OnClick="btnBatchExamine_Click"
            OnClientClick="return hasChecked();" Visible="false">
        <span>批量审核</span>
        </asp:LinkButton>
        <asp:LinkButton ID="lbtnBatchExamine" runat="server" OnClick="btnBatchBack_Click"
            OnClientClick="return hasChecked();" Visible="false">
        <span>批量回退</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="10" ShowPageSizeChange="true"
        ID="gvList" UseDefaultDataSource="true" runat="server" ShowExport="true" HideFieldOnExport="全选,编辑,提交审核,审核通过,回退"
        DataKeyNames="YEARINSTTRAINPLANENTITYID" BindGridViewMethod="BindDataGrid"
        AllowFrozing="true" FrozenColNum="6" FrozenHeight="420px" OnRowCommand="gvList_RowCommand"
        OnRowDataBound="gvList_RowDataBound" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="3%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="UNDERDEPTNAME" HeaderText="计划申请部门" ItemStyle-Width="5%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目名称" MaxLength="15">
            </zhongsoft:LightBoundField>
        <%--    <zhongsoft:LightBoundField DataField="PLANSTDATE" HeaderText="计划开始时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PLANENDDATE" HeaderText="计划结束时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>--%>
            <asp:BoundField HeaderText="期数" DataField="PERIOD" />
            <asp:BoundField HeaderText="课时" DataField="TRAININGCLASSHOUR" />
            <asp:BoundField HeaderText="人数" DataField="NUMBEROFTRAINING" />
            <%-- <zhongsoft:LightBoundField DataField="TRAININGWAY" HeaderText="培训方式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGFORM" HeaderText="培训形式">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="SOURCEOFTEACHERS" HeaderText="师资来源" MaxLength="15">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="COURSEWARESOURCE" HeaderText="网络或视听培训的课件来源"
                ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAININGLEVEL" HeaderText="培训级别" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGCLASS" HeaderText="培训类别" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINOBJECT" HeaderText="培训对象" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINCONTENT" HeaderText="培训内容" MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERTAKERNAME" HeaderText="申请人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ASSESSMENT" HeaderText="考核方式" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="COSTESTIMATING" HeaderText="费用估算(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightBoundField DataField="ISKEYPROJECT" HeaderText="是否重点项目">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MEETINGRESULT" HeaderText="上会结果">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TYPE" HeaderText="类型">
            </zhongsoft:LightBoundField>
          <%--  <zhongsoft:LightBoundField DataField="MARK" HeaderText="标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ADJUSTCONTENT" HeaderText="调整内容" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ADJUSTREASON" HeaderText="调整理由" MaxLength="15">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="ACTSTDATE" HeaderText="实际开始时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ACTENDDATE" HeaderText="实际结束时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ACTJOINNUMS" HeaderText="实际参培人数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ACTTRAINHOURS" HeaderText="实际培训课时" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ISSUBMIT" HeaderText="是否提交" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ISEXCUTE" HeaderText="是否执行">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false" Visible ="false"
                EditIdField="YEARINSTTRAINPLANENTITYID" EditPageWidth="900px" EditPageHeight="550px"
                ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TranPlanExcuteStatisticEditor.aspx">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="提交审核" CommandName="SubmitExamine" ImageUrl="../../../Themes/Images/btn_submit.gif" Visible ="false"
                DeleteText="确定提交审核{0}吗？" DeleteTipField="TRAINPROJECTNAME">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="审核通过" CommandName="ExaminePass" ImageUrl="../../../Themes/Images/btn_examine.gif"
                DeleteText="确定审核通过{0}吗？" DeleteTipField="TRAINPROJECTNAME" Visible="false">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="回退" CommandName="ExamineBack" ImageUrl="../../../Themes/Images/btn_chexiao.gif"
                DeleteText="确定回退{0}吗？" DeleteTipField="TRAINPROJECTNAME" Visible="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Label runat="server" Text="" ID="lbTranPlanExcute"></asp:Label>
    <asp:Label runat="server" Text="" ID="lbTJ"></asp:Label>
    <input type="hidden" runat="server" id="hiCount" />
    <input type="hidden" runat="server" id="hiCountOfExcuted" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function hasChecked() {
            var array = buildGirdRowIds($gridCheckedClientID);
            if (array.length == 0) {
                alert("请先进行培训计划的选择，再进行批量操作");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
