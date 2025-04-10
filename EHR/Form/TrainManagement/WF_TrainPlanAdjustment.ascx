<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TrainPlanAdjustment.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_TrainPlanAdjustment" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(2.调整部门培训计划)(2.修改调整部门培训计划)"
                field="YEAR" tablename="EHR_TRAINPLANADJUSTFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="FILLDEPTNAME"
                Width="120px" tablename="EHR_TRAINPLANADJUSTFORM" req="1" activestatus="(23.调整部门培训计划)(23.修改调整部门培训计划)" />
            <input type="hidden" id="hiDeptId" runat="server" field="FILLDEPTID" tablename="EHR_TRAINPLANADJUSTFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="FILLDEPTCODE" tablename="EHR_TRAINPLANADJUSTFORM" />
        </td>
        <td class="td-l">
            填表人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="FILLUSERNAME"
                Width="100px" tablename="EHR_TRAINPLANADJUSTFORM" req="1" activestatus="(23.调整部门培训计划)(23.修改调整部门培训计划)" />
            <input type="hidden" id="hiUserId" runat="server" field="FILLUSERID" tablename="EHR_TRAINPLANADJUSTFORM" />
            <input type="hidden" id="hiUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_TRAINPLANADJUSTFORM" />
        </td>
        <td class="td-l">
            填表日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_TRAINPLANADJUSTFORM" req="1" activestatus="(23.调整部门培训计划)(23.修改调整部门培训计划)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="7">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_TRAINPLANADJUSTFORM"
                Width="99%" activestatus="(23.*)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="8">
            <div id="templateTabs" style="min-height: 300px">
                <ul>
                    <li><a href='#AdjustRecord' id='aAdjustRecord'>调整记录</a></li>
                    <li><a href='#CancelRecord' id='aCancelRecord'>取消记录</a></li>
                </ul>
                <div id="AdjustRecord">
                    <zhongsoft:LightPowerGridView ID="gvList1" runat="server" DataKeyNames="INSTTRAINPLANADJUSTDTID"
                        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" BindGridViewMethod="UserControls.BindAdjustRecordGrid"
                        ShowPageSizeChange="true" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                        RowStyle-Wrap="false" AllowFrozing="true" FrozenColNum="6">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="承办部门" DataField="UNDERDEPTNAME" />
                            <asp:TemplateField HeaderText="培训项目名称">
                                <ItemTemplate>
                                    <asp:Label ID="lbProjectName" runat="server" Text='<%#Eval("TRAINPROJECTNAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="期数" DataField="PERIOD" />
                            <asp:BoundField HeaderText="课时" DataField="TRAININGCLASSHOUR" />
                            <asp:BoundField HeaderText="人数" DataField="NUMBEROFTRAINING" />
                            <asp:BoundField HeaderText="计划开始时间" DataField="PLANSTDATE" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField HeaderText="计划结束时间" DataField="PLANENDDATE" DataFormatString="{0:yyyy-MM-dd}" />
                            <%-- <asp:BoundField HeaderText="培训方式" DataField="TRAININGWAY" ItemStyle-Width="9%" />
                            <asp:BoundField HeaderText="培训形式" DataField="TRAININGFORM" ItemStyle-Width="4%" />--%>
                            <asp:BoundField HeaderText="培训类别" DataField="TRAININGCLASS" />
                            <asp:BoundField HeaderText="培训级别" DataField="TRAININGLEVEL" />
                            <asp:TemplateField HeaderText="师资来源" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Label ID="lbSourceOfTeachers" runat="server" Text='<%#Eval("SOURCEOFTEACHERS") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="网络或视听培训的课件来源" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Label ID="lbCourseWareSource" runat="server" Text='<%#Eval("COURSEWARESOURCE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="培训对象">
                                <ItemTemplate>
                                    <asp:Label ID="lbTrainObject" runat="server" Text='<%#Eval("TRAINOBJECT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <zhongsoft:LightBoundField HeaderText="培训内容" DataField="TRAINCONTENT" MaxLength="10" />
                            <asp:BoundField HeaderText="责任人" DataField="UNDERTAKERNAME" />
                            <%-- <asp:TemplateField HeaderText="考核方式" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="lbAssessment" runat="server" Text='<%#Eval("ASSESSMENT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField HeaderText="费用估算（元）" DataField="COSTESTIMATING" ItemStyle-HorizontalAlign="Right" />
                            <%-- <asp:BoundField HeaderText="是否重点项目" DataField="ISKEYPROJECT" ItemStyle-Width="3%" />
                            <asp:BoundField HeaderText="上会结果" DataField="MEETINGRESULT" ItemStyle-Width="3%" />--%>
                            <zhongsoft:LightBoundField HeaderText="调整内容" DataField="ADJUSTCONTENT" MaxLength="10" />
                            <zhongsoft:LightBoundField HeaderText="调整理由" DataField="ADJUSTREASON" MaxLength="10" />
                            <%--<zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                EditIdField="INSTTRAINPLANADJUSTDTID" EditPageWidth="900px" EditPageHeight="450px"
                                ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TrainPlanAdjustmentEditor.aspx">
                            </zhongsoft:LightButtonField>--%>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
                <div id="CancelRecord" style="display: none">
                    <zhongsoft:LightPowerGridView ID="gvList2" runat="server" DataKeyNames="INSTTRAINPLANADJUSTDTID"
                        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" ShowPageSizeChange="false"
                        BindGridViewMethod="UserControls.BindCancelRecordGrid" UseDefaultDataSource="true"
                        OnRowDataBound="gvList_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="承办部门" DataField="UNDERDEPTNAME" />
                            <asp:TemplateField HeaderText="培训项目名称">
                                <ItemTemplate>
                                    <asp:Label ID="lbProjectName" runat="server" Text='<%#Eval("TRAINPROJECTNAME") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="期数" DataField="PERIOD" />
                            <asp:BoundField HeaderText="课时" DataField="TRAININGCLASSHOUR" />
                            <asp:BoundField HeaderText="人数" DataField="NUMBEROFTRAINING" />
                            <asp:BoundField HeaderText="计划开始时间" DataField="PLANSTDATE" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField HeaderText="计划结束时间" DataField="PLANENDDATE" DataFormatString="{0:yyyy-MM-dd}" />
                            <%-- <asp:BoundField HeaderText="培训方式" DataField="TRAININGWAY" ItemStyle-Width="9%" />
                            <asp:BoundField HeaderText="培训形式" DataField="TRAININGFORM" ItemStyle-Width="4%" />--%>
                            <asp:BoundField HeaderText="培训类别" DataField="TRAININGCLASS" />
                            <asp:BoundField HeaderText="培训级别" DataField="TRAININGLEVEL" />
                            <asp:TemplateField HeaderText="师资来源">
                                <ItemTemplate>
                                    <asp:Label ID="lbSourceOfTeachers" runat="server" Text='<%#Eval("SOURCEOFTEACHERS") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="网络或视听培训的课件来源" ItemStyle-Width="10%">
                                <ItemTemplate>
                                    <asp:Label ID="lbCourseWareSource" runat="server" Text='<%#Eval("COURSEWARESOURCE") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="培训对象">
                                <ItemTemplate>
                                    <asp:Label ID="lbTrainObject" runat="server" Text='<%#Eval("TRAINOBJECT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <zhongsoft:LightBoundField HeaderText="培训内容" DataField="TRAINCONTENT" MaxLength="10" />
                            <asp:BoundField HeaderText="责任人" DataField="UNDERTAKERNAME" />
                            <%-- <asp:TemplateField HeaderText="考核方式" ItemStyle-Width="8%">
                                <ItemTemplate>
                                    <asp:Label ID="lbAssessment" runat="server" Text='<%#Eval("ASSESSMENT") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField HeaderText="费用估算（元）" DataField="COSTESTIMATING" ItemStyle-Width="3%"
                                ItemStyle-HorizontalAlign="Right" />
                            <%-- <asp:BoundField HeaderText="是否重点项目" DataField="ISKEYPROJECT" ItemStyle-Width="3%" />
                            <asp:BoundField HeaderText="上会结果" DataField="MEETINGRESULT" ItemStyle-Width="3%" />--%>
                            <zhongsoft:LightBoundField HeaderText="调整内容" DataField="ADJUSTCONTENT" MaxLength="10" />
                            <zhongsoft:LightBoundField HeaderText="调整理由" DataField="ADJUSTREASON" MaxLength="10" />
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
            </div>
        </td>
    </tr>
    <%-- <tr>
        <td colspan="8" align="right">
            <asp:Button ID="btnAddTrainReq" runat="server" Text="添加年度院培训计划" displayStatus="(3.调整部门培训计划)(3.修改调整部门培训计划)"
                OnClick="btnAddTrainReq_Click" OnClientClick="return editor('','2');" />
        </td>
    </tr>--%>
</table>
<div>
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td colspan="8">
                        <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True"
                            AllowSorting="true" ShowHeaderWhenEmpty="true" displayStatus="(13.*)" HeaderStyle-Wrap="true"
                            AllowPaging="True" PageSize="10" Caption="培训计划列表" AutoGenerateColumns="False"
                            DataKeyNames="YEARINSTTRAINPLANENTITYID" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControls.BindTrainPlanGrid"
                            OnRowDataBound="gvList_RowDataBound" ShowPageSizeChange="False" PermissionStatus="true"
                            RowStyle-Wrap="false">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="承办部门" DataField="UNDERDEPTNAME" />
                                <asp:TemplateField HeaderText="培训项目名称">
                                    <ItemTemplate>
                                        <asp:Label ID="lbProjectName" runat="server" Text='<%#Eval("TRAINPROJECTNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="期数" DataField="PERIOD" />
                                <asp:BoundField HeaderText="课时" DataField="TRAININGCLASSHOUR" />
                                <asp:BoundField HeaderText="人数" DataField="NUMBEROFTRAINING" />
                                <asp:BoundField HeaderText="计划开始时间" DataField="PLANSTDATE" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-Width="5%" />
                                <asp:BoundField HeaderText="计划结束时间" DataField="PLANENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-Width="5%" />
                                <%-- <asp:BoundField HeaderText="培训方式" DataField="TRAININGWAY" ItemStyle-Width="9%" />
                                <asp:BoundField HeaderText="培训形式" DataField="TRAININGFORM" ItemStyle-Width="4%" />--%>
                                <asp:BoundField HeaderText="培训类别" DataField="TRAININGCLASS" />
                                <asp:BoundField HeaderText="培训级别" DataField="TRAININGLEVEL" />
                                <asp:TemplateField HeaderText="师资来源">
                                    <ItemTemplate>
                                        <asp:Label ID="lbSourceOfTeachers" runat="server" Text='<%#Eval("SOURCEOFTEACHERS") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%-- <asp:TemplateField HeaderText="网络或视听培训的课件来源" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbCourseWareSource" runat="server" Text='<%#Eval("COURSEWARESOURCE") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="培训对象">
                                    <ItemTemplate>
                                        <asp:Label ID="lbTrainObject" runat="server" Text='<%#Eval("TRAINOBJECT") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--  <zhongsoft:LightBoundField HeaderText="培训内容" DataField="TRAINCONTENT" ItemStyle-Width="10%"
                                    MaxLength="10" />--%>
                                <asp:BoundField HeaderText="责任人" DataField="UNDERTAKERNAME" ItemStyle-Width="6%" />
                                <%--  <asp:TemplateField HeaderText="考核方式" ItemStyle-Width="8%">
                                    <ItemTemplate>
                                        <asp:Label ID="lbAssessment" runat="server" Text='<%#Eval("ASSESSMENT") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField HeaderText="费用估算（元）" DataField="COSTESTIMATING" ItemStyle-Width="3%"
                                    ItemStyle-HorizontalAlign="Right" />
                                <%-- <asp:BoundField HeaderText="是否重点项目" DataField="ISKEYPROJECT" ItemStyle-Width="3%" />
                                <asp:BoundField HeaderText="上会结果" DataField="MEETINGRESULT" ItemStyle-Width="3%" />--%>
                                <zhongsoft:LightBoundField HeaderText="调整内容" DataField="ADJUSTCONTENT" MaxLength="10" />
                                <zhongsoft:LightBoundField HeaderText="调整理由" DataField="ADJUSTREASON" MaxLength="5" />
                                <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                    EditIdField="YEARINSTTRAINPLANENTITYID" EditPageWidth="900px" EditPageHeight="450px"
                                    ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TrainPlanAdjustmentEditor.aspx">
                                </zhongsoft:LightButtonField>
                                <zhongsoft:LightButtonField CommandName="EditData" HeaderText="调整" CausesValidation="false"
                                    EditIdField="YEARINSTTRAINPLANENTITYID" EditPageWidth="900px" EditPageHeight="450px"
                                    Visible="false" ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TrainPlanAdjustmentEditor.aspx?adjustFormId">
                                </zhongsoft:LightButtonField>
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="取消" CausesValidation="false"
                                    Visible="false" ItemStyle-Width="3%" DeleteText="您确定取消该记录吗？">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<input type="hidden" runat="server" id="hiTrainPlanAdjustFormId" field="TRAINPLANADJUSTFORMID"
    tablename="EHR_TRAINPLANADJUSTFORM" />
<!--人资部部门Code-->
<input type="hidden" runat="server" id="hiRZDeptCode" value="01017032" />
<script type="text/javascript">
    $(document).ready(function () {
        // Tabs
        $('#templateTabs').tabs();
    });


    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }


    $(function () {
        $("#<%=gvList.ClientID%> > caption").css("font-size", "15px");
        $("#<%=gvList.ClientID%> > caption").css("margin-bottom", "10");
    });

</script>
