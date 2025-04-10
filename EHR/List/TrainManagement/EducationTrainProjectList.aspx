<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EducationTrainProjectList.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.EducationTrainProjectList"
    MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">

                <span class="filter-block"><span class="filter-block-lb">培训项目名称</span><span>
                <zhongsoft:LightTextBox ID="tbProjectName" CssClass="kpms-textboxsearch" runat="server" Width="100px" EnableTheming="false">
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
               <%-- 培训类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainType">
                </zhongsoft:LightDropDownList>
                培训形式
                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainForm">
                </zhongsoft:LightDropDownList>--%>

                <span class="filter-block"><span class="filter-block-lb">参加培训日期</span><span>
                <asp:CheckBox ID="cbDate" runat="server" Text="" />
                <zhongsoft:XHtmlInputText ID="txtPlanStDate" runat="server" readonly="readonly" class="kpms-textbox-comparedate"
                    compare="1" />
                至
                <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" /></span></span> 
                <span class="filter-block"><span class="filter-block-lb">申请人</span><span>
                <zhongsoft:LightTextBox ID="tbUnderTaker" CssClass="kpms-textboxsearch" runat="server" Width="50px" EnableTheming="false">
                </zhongsoft:LightTextBox></span></span> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="15" ID="gvList" UseDefaultDataSource="true"
        runat="server" ShowExport="true" HideFieldOnExport="全选,序号,发起培训反馈,培训单位,培训地点,培训人员类型,培训机构,培训费(元),备注"
        DataKeyNames="EDUCATIONTRAINPROJECTID,YEAR,INSTRUCTORIDS"  OnExport="gvList_Export"
        BindGridViewMethod="BindDataGrid" AllowFrozing="true" FrozenColNum="4" FrozenHeight="450px" OnRowCommand="gvList_RowCommand" RowStyle-Wrap="false">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="3%">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightBoundField DataField="TRAINPROJECTCODE" HeaderText="培训项目编号">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAINPROJECTNAME" HeaderText="培训项目名称">
            </zhongsoft:LightBoundField>
           <%-- <zhongsoft:LightBoundField DataField="TRAININGTYPE" HeaderText="培训类型">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="TRAININGLEVEL" HeaderText="培训级别">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="TRAININGWAY" HeaderText="培训方式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGFORM" HeaderText="培训形式">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAININGCLASS" HeaderText="培训类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINCOMPANY" HeaderText="培训单位">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="TRAINCONTENT" HeaderText="培训内容" MaxLength="10">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="NUMBEROFTRAINING" HeaderText="培训人数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINPLACE" HeaderText="培训地点" MaxLength="10">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="INSTRUCTORNAMES" HeaderText="培训讲师">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="TRAINDAYS" HeaderText="培训天数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="PERIOD" HeaderText="培训期数" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAINEETYPE" HeaderText="培训人员类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UNDERDEPTNAME" HeaderText="计划申请部门">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="UNDERTAKERNAME" HeaderText="责任人">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAINSTDATE" HeaderText="参加培训开始日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAINENDDATE" HeaderText="参加培训结束日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAININGCLASSHOUR" HeaderText="培训课时" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名"  Visible="false">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="TESTTYPERESULT" HeaderText="考试方式及结果" MaxLength="10">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="ISCOMMUNICATE" HeaderText="是否交流">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAININSTITYPE" HeaderText="培训机构">
            </zhongsoft:LightBoundField>
       <%--     <zhongsoft:LightBoundField DataField="ISSUINGAGENCY" HeaderText="发证机构" MaxLength="10">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="TRAINCOST" HeaderText="培训费(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
           <%-- <zhongsoft:LightBoundField DataField="MATERIALCOST" HeaderText="资料费(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ACCOMMODATION" HeaderText="食宿费(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TRAFFICEXPENSE" HeaderText="交通费(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SERVICECHARGE" HeaderText="劳务费(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="OTHERCOST" HeaderText="其他费用(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>--%>
         <%--   <zhongsoft:LightBoundField DataField="SUMACTCOST" HeaderText="费用合计(元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="MEMO" HeaderText="备注" MaxLength="10">
            </zhongsoft:LightBoundField>
            <%-- <zhongsoft:LightButtonField HeaderText="发起培训反馈" CommandName="TrainFeedBack" ImageUrl="../../../Themes/Images/flow_e.gif"
             DeleteText="确定给项目{0}发起培训反馈吗？" DeleteTipField="TRAINPROJECTNAME">
                                        </zhongsoft:LightButtonField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
