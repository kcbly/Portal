<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TrainFeedBack.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_TrainFeedBack" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="4" style="text-align: left; font-size: medium; line-height: 1.5;">
            感谢您参加此次培训！根据院教育培训管理程序，及时有效地了解您在此次课程中的收获，以及对课程内容、讲师的专业水平的评价，请协助我们完成以下评估。谢谢！
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训项目
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTrainProjectName" runat="server" ReadOnly="true" field="TRAINPROJECTNAME"
                Width="400px" tablename="EHR_TRAINFEEDBACKFORM" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
            <input type="hidden" id="hiTrainProjectId" runat="server" field="EDUCATIONTRAINPROJECTID"
                tablename="EHR_TRAINFEEDBACKFORM" />
        </td>
        <td class="td-l">
            培训老师
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbInstructor" runat="server" ReadOnly="true" field="INSTRUCTORNAMES"
                Width="200px" tablename="EHR_TRAINFEEDBACKFORM" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            部门
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDept" runat="server" ReadOnly="true" field="DEPTNAME"
                Width="120px" tablename="EHR_TRAINFEEDBACKFORM" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
        </td>
        <td class="td-l">
            培训日期
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtTrainStDate" runat="server" ReadOnly="true" EnableTheming="false"
                field="TRAINSTDATE" class="kpms-textbox" tablename="EHR_TRAINFEEDBACKFORM" Width="80px"
                req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
            至
            <zhongsoft:LightTextBox ID="txtTrainEndDate" runat="server" ReadOnly="true" EnableTheming="false"
                field="TRAINENDDATE" class="kpms-textbox" tablename="EHR_TRAINFEEDBACKFORM" Width="80px"
                req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserCode" runat="server" ReadOnly="true" field="USERCODE"
                Width="100px" tablename="EHR_TRAINFEEDBACKFORM" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
        </td>
        <td class="td-l">
            学员姓名
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUserName" runat="server" ReadOnly="true" field="USERNAME"
                Width="100px" tablename="EHR_TRAINFEEDBACKFORM" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" />
            <input type="hidden" id="hiUserId" runat="server" field="USERID" tablename="EHR_TRAINFEEDBACKFORM" />
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            一、此次培训班的总体评价
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbOverallEvaluation" field="OVERALLEVALUATION"
                tablename="EHR_TRAINFEEDBACKFORM" RepeatDirection="Horizontal" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            二、对培训班安排的评价
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            这正是我工作需要了解的内容和信息
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbEvaluation1" field="EVALUATION1" tablename="EHR_TRAINFEEDBACKFORM"
                RepeatDirection="Horizontal" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            学习到了新知识、新技巧，拓展了视野
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbEvaluation2" field="EVALUATION2" tablename="EHR_TRAINFEEDBACKFORM"
                RepeatDirection="Horizontal" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训内容的针对性和实用性
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbEvaluation3" field="EVALUATION3" tablename="EHR_TRAINFEEDBACKFORM"
                RepeatDirection="Horizontal" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训管理工作的条理性和规范性
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbEvaluation4" field="EVALUATION4" tablename="EHR_TRAINFEEDBACKFORM"
                RepeatDirection="Horizontal" req="1" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td>
            <br />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td>
            三、对授课讲师的评价 ( 5=非常好，4=好，3=较好，2=一般，1=差 )
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="EVALUATIONTOTEACHERID"
                AutoGenerateColumns="False" BindGridViewMethod="BindInstructorData" UseDefaultDataSource="true"
                OnRowDataBound="gvList_RowDataBound"  PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightBoundField HeaderText="评估讲师" DataField="INSTRUCTORNAME">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="授课思路">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rb1" RepeatDirection="Horizontal" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
                                <asp:ListItem Value="5">5分</asp:ListItem>
                                <asp:ListItem Value="4">4分</asp:ListItem>
                                <asp:ListItem Value="3">3分</asp:ListItem>
                                <asp:ListItem Value="2">2分</asp:ListItem>
                                <asp:ListItem Value="1">1分</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="语言表达能力">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rb2" RepeatDirection="Horizontal" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
                                <asp:ListItem Value="5">5分</asp:ListItem>
                                <asp:ListItem Value="4">4分</asp:ListItem>
                                <asp:ListItem Value="3">3分</asp:ListItem>
                                <asp:ListItem Value="2">2分</asp:ListItem>
                                <asp:ListItem Value="1">1分</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="现场控制能力">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rb3" RepeatDirection="Horizontal" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
                                <asp:ListItem Value="5">5分</asp:ListItem>
                                <asp:ListItem Value="4">4分</asp:ListItem>
                                <asp:ListItem Value="3">3分</asp:ListItem>
                                <asp:ListItem Value="2">2分</asp:ListItem>
                                <asp:ListItem Value="1">1分</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="解答学员的要求和问题">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rb4" RepeatDirection="Horizontal" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
                                <asp:ListItem Value="5">5分</asp:ListItem>
                                <asp:ListItem Value="4">4分</asp:ListItem>
                                <asp:ListItem Value="3">3分</asp:ListItem>
                                <asp:ListItem Value="2">2分</asp:ListItem>
                                <asp:ListItem Value="1">1分</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="授课态度">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rb5" RepeatDirection="Horizontal" activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)">
                                <asp:ListItem Value="5">5分</asp:ListItem>
                                <asp:ListItem Value="4">4分</asp:ListItem>
                                <asp:ListItem Value="3">3分</asp:ListItem>
                                <asp:ListItem Value="2">2分</asp:ListItem>
                                <asp:ListItem Value="1">1分</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            我在本次培训最大的收获<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbHarvest" runat="server" CssClass="kpms-textarea" req="1"
                EnableTheming="false" TextMode="MultiLine" maxtext="512" field="HARVEST" tablename="EHR_TRAINFEEDBACKFORM"
                activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            课程需加强的地方
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbEnhance" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="ENHANCE" tablename="EHR_TRAINFEEDBACKFORM"
                activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" style="line-height: 1.5">
            建议或还需要什么培训
        </td>
        <td class="td-m">
            <zhongsoft:LightTextBox ID="tbSuggest" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="SUGGEST" tablename="EHR_TRAINFEEDBACKFORM"
                activestatus="(23.填写员工培训反馈表)(23.修改员工培训反馈表)" Width="99%">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            上传培训证书
        </td>
        <td class="td-r">
            <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                class="req-star">请先保存再上传证书</span>
            <asp:LinkButton runat="server" ID="btnAttach" OnClientClick="uploadFile1()" OnClick="lbtnAttach_Click"
                displayStatus="(3.填写员工培训反馈表)(23.修改员工培训反馈表)" activestatus="(3.填写员工培训反馈表)(23.修改员工培训反馈表)"><span>上传证书</span></asp:LinkButton>
            <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" displayStatus="(3.填写员工培训反馈表)(23.修改员工培训反馈表)" activestatus="(3.填写员工培训反馈表)(23.修改员工培训反馈表)"
                ShowDelete="true" ShowDeleteBySelf="true" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiTrainFeedBackFormId" field="TRAINFEEDBACKFORMID"
    tablename="EHR_TRAINFEEDBACKFORM" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    //上传证书
    function uploadFile1() {
        var fileSrcId = "<%=BusinessObjectId %>";
        showUploadForm(fileSrcId, "WF_TRAINFEEDBACK");
        return true;
    }
</script>
