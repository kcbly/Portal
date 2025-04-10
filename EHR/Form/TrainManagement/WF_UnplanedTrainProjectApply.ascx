<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_UnplanedTrainProjectApply.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_UnplanedTrainProjectApply" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            年度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlYear" req="1" activestatus="(2.申报计划外培训)(2.修改计划外培训)"
                field="YEAR" tablename="EHR_YEARINSTTRAINPLANFORM">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDeptName" runat="server" ReadOnly="true" field="FILLDEPTNAME"
                Width="120px" tablename="EHR_YEARINSTTRAINPLANFORM" req="1" activestatus="(23.申报计划外培训)(23.修改计划外培训)" />
            <input type="hidden" id="hiDeptId" runat="server" field="FILLDEPTID" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="FILLDEPTCODE" tablename="EHR_YEARINSTTRAINPLANFORM" />
        </td>
        <td class="td-l">
            填表人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="FILLUSERNAME"
                Width="100px" tablename="EHR_YEARINSTTRAINPLANFORM" req="1" activestatus="(23.申报计划外培训)(23.修改计划外培训)" />
            <input type="hidden" id="hiUserId" runat="server" field="FILLUSERID" tablename="EHR_YEARINSTTRAINPLANFORM" />
            <input type="hidden" id="hiUserCode" runat="server" field="FILLUSERCODE" tablename="EHR_YEARINSTTRAINPLANFORM" />
        </td>
        <td class="td-l">
            填表日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFillDate" runat="server" readonly="readonly" field="FILLDATE"
                class="kpms-textbox-date" tablename="EHR_YEARINSTTRAINPLANFORM" req="1" activestatus="(23.申报计划外培训)(23.修改计划外培训)" />
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td colspan="8" align="right">
            <asp:Button ID="btnAddTrainReq" runat="server" Text="添加计划外培训" displayStatus="(3.申报计划外培训)(3.修改计划外培训)"
                OnClick="btnAddTrainReq_Click" OnClientClick="return editor('','2');" />
        </td>
    </tr>
    <tr>
        <td colspan="8">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True"
                AllowSorting="true" ShowHeaderWhenEmpty="true" displayStatus="(13.*)" HeaderStyle-Wrap="true"
                AllowPaging="True" PageSize="10" Caption="计划外培训" AutoGenerateColumns="False"
                DataKeyNames="YEARINSTTRAINPLANDTID" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControls.BindDataGrid"
                OnRowDataBound="gvList_RowDataBound" ShowPageSizeChange="False">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="3%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="承办部门" DataField="UNDERDEPTNAME" ItemStyle-Width="12%" />
                    <asp:TemplateField HeaderText="培训项目名称" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbProjectName" runat="server" Text='<%#Eval("TRAINPROJECTNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="计划开始时间" DataField="PLANSTDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="5%" />
                    <asp:BoundField HeaderText="计划结束时间" DataField="PLANENDDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Width="5%" />
                    <%--  <asp:BoundField HeaderText="培训方式" DataField="TRAININGWAY" ItemStyle-Width="9%" />
                    <asp:BoundField HeaderText="培训形式" DataField="TRAININGFORM" ItemStyle-Width="4%" />--%>
                    <asp:BoundField HeaderText="培训级别" DataField="TRAININGLEVEL" ItemStyle-Width="9%" />
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
                    <asp:TemplateField HeaderText="培训对象" ItemStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbTrainObject" runat="server" Text='<%#Eval("TRAINOBJECT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="责任人" DataField="UNDERTAKERNAME" ItemStyle-Width="8%" />
                    <%--<asp:TemplateField HeaderText="考核方式" ItemStyle-Width="8%">
                        <ItemTemplate>
                            <asp:Label ID="lbAssessment" runat="server" Text='<%#Eval("ASSESSMENT") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:BoundField HeaderText="费用估算（元）" DataField="COSTESTIMATING" ItemStyle-Width="3%"
                        ItemStyle-HorizontalAlign="Right" />
                    <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                        EditIdField="YEARINSTTRAINPLANDTID" EditPageWidth="900px" EditPageHeight="440px"
                        ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/UnplanedTrainProjectApplyEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                        EditIdField="YEARINSTTRAINPLANDTID" EditPageWidth="900px" EditPageHeight="440px"
                        Visible="false" ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/UnplanedTrainProjectApplyEditor.aspx">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        Visible="false" ItemStyle-Width="3%" DeleteText="您确定删除该记录吗？">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiType" field="TYPE" tablename="EHR_YEARINSTTRAINPLANFORM"
    value="计划外" />
<input type="hidden" runat="server" id="hiUnplanedTrainProjectApplyFormId" field="YEARINSTTRAINPLANFORMID"
    tablename="EHR_YEARINSTTRAINPLANFORM" />
<!--人资部部门Code-->
<input type="hidden" runat="server" id="hiRZDeptCode" value="01017032" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //打开编辑页面
    function editor(bizId, acType) {
        var year = $("#<%=ddlYear.ClientID%>").val();
        var formId = "<%=BusinessObjectId %>";
        var stringFeatures = "dialogHeight:440px; dialogWidth: 900px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:auto; status: no;";
        var url = "";
        if (acType == "2") {
            url = "<%=WebAppPath%>/EHR/List/TrainManagement/UnplanedTrainProjectApplyEditor.aspx?&actionType=" + acType + "&year=" + year + "&formId=" + formId;
        }
        else {
            url = "<%=WebAppPath%>/EHR/List/TrainManagement/UnplanedTrainProjectApplyEditor.aspx?&actionType=" + acType + "&bizId=" + bizId;
        }
        if (window.showModalDialog(url, null, stringFeatures) == undefined) {
            return false;
        }
        return true;
    }

    $(function () {
        $("#<%=gvList.ClientID%> > caption").css("font-size", "15px");
        $("#<%=gvList.ClientID%> > caption").css("margin-bottom", "10");
    });

    function checkForm() {
        if ($sendBtnId == "btnSend" && ($actName == "申报计划外培训" || $actName == "修改计划外培训")) {
            var grid = $("#<%=gvList.ClientID %>")[0];
            if (grid.rows.length < 3) {
                alert("请添加计划外培训！");
                $("#<%=btnAddTrainReq.ClientID%>").focus();
                return false;
            }
        }
        return true;
    }


</script>
