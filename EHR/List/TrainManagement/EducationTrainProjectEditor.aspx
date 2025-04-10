<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EducationTrainProjectEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.EducationTrainProjectEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs" style="min-height: 500px">
        <ul>
            <li><a href='#BasicInfo' id='aBasicInfo'>基本信息</a></li>
            <li><a href='#TrainPersonnel' id='aTrainPersonnel'>培训人员</a></li>
        </ul>
        <div id="BasicInfo">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="tz-table" style="white-space: nowrap">
                        <tr>
                            <td class="td-l">
                                培训项目编号
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainProjectCode" CssClass="kpms-textbox"
                                    Width="99%" MaxLength="32" field="TRAINPROJECTCODE" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)" ReadOnly="true">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训项目名称<span class="req-star">*</span>
                            </td>
                            <td class="td-r" colspan="3">
                                <zhongsoft:LightObjectSelector runat="server" ID="selTrainProject" activestatus="(23.*)"
                                    DoCancel="false" ResultAttr="name" EnableTheming="false" field="TRAINPROJECTNAME"
                                    ShowSelectBtn="true" SelectPageMode="Dialog" Writeable="false" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    ShowJsonRowColName="true" ShowAttrs="YEARINSTTRAINPLANENTITYID,TRAINPROJECTNAME"
                                    PageUrl="~/EHR/List/TrainManagement/YearTrainPlanSelector.aspx" PageHeight="500PX"
                                    PageWidth="800px" ResultForControls="{'txtPlanStDate':'PLANSTDATE','txtPlanEndDate':'PLANENDDATE','ddlTrainType':'TRAININGTYPE','hiUnderTakerName':'UNDERTAKERNAME',
                                    'hiUnderTakerCode':'UNDERTAKERCODE','hiUnderTakerId':'UNDERTAKERID','hiUnderDeptName':'UNDERDEPTNAME','hiUnderDeptCode':'UNDERDEPTCODE',
                                    'tbTrainClassHour':'TRAININGCLASSHOUR', 'ddlUnderDept':'UNDERDEPTID', 'tbNumberOfTrain':'NUMBEROFTRAINING', 'ddlTrainForm':'TRAININGFORM',
                                    'ddlTrainWay':'TRAININGWAY','ddlTrainClass':'TRAININGCLASS','tbPeriod':'PERIOD','tbResult':'ASSESSMENT','hiYear':'YEAR','ddlTrainLevel':'TRAININGLEVEL','tbTrainContent':'TRAINCONTENT',
                                    'hiYearInsttrainPlanEntityId':'id'}" OnClick="btnSelector_Click"></zhongsoft:LightObjectSelector>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                计划类型<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPlanType" req="1" activestatus="(23.*)"
                                    field="Type" tablename="EHR_EDUCATIONTRAINPROJECT" AutoPostBack="true" OnSelectedIndexChanged="ddlPlanType_SelectedIndexChanged1">
                                    <asp:ListItem Text="计划内" Selected="True">计划内</asp:ListItem>
                                    <asp:ListItem Text="计划外">计划外</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                申请人
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightObjectSelector runat="server" ID="selUnderTaker" activestatus="(23.*)"
                                    field="UNDERTAKERNAME" tablename="EHR_EDUCATIONTRAINPROJECT" DoCancel="true"
                                    SelectPageMode="Dialog" ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true"
                                    ShowAttrs="name,UserCode" Width="60px" ResultForControls="{'hiUnderTakerId':'id','hiUnderTakerCode':'UserCode','hiUnderTakerName':'name'}"
                                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" OnClick="btnUnderTakerSelector_Click">
                                </zhongsoft:LightObjectSelector>
                                <input type="hidden" id="hiUnderTakerId" runat="server" field="UNDERTAKERID" tablename="EHR_EDUCATIONTRAINPROJECT" />
                                <input type="hidden" id="hiUnderTakerCode" runat="server" field="UNDERTAKERCODE"
                                    tablename="EHR_EDUCATIONTRAINPROJECT" />
                                <input type="hidden" id="hiUnderTakerName" runat="server" field="UNDERTAKERNAME"
                                    tablename="EHR_EDUCATIONTRAINPROJECT" />
                            </td>
                            <td class="td-l">
                                计划申请部门
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" activestatus="(23.*)"
                                    field="UNDERDEPTID" tablename="EHR_EDUCATIONTRAINPROJECT" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlUnderDeptIndexChange">
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" id="hiUnderDeptCode" runat="server" field="UNDERDEPTCODE" tablename="EHR_EDUCATIONTRAINPROJECT" />
                                <input type="hidden" id="hiUnderDeptName" runat="server" field="UNDERDEPTNAME" tablename="EHR_EDUCATIONTRAINPROJECT" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                培训级别
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainLevel" activestatus="(23.*)"
                                    field="TRAININGLEVEL" tablename="EHR_EDUCATIONTRAINPROJECT">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                培训单位
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainCompany" CssClass="kpms-textbox"
                                    Width="99%" MaxLength="64" field="TRAINCOMPANY" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训地点
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainPlace" CssClass="kpms-textbox"
                                    Width="99%" MaxLength="64" field="TRAINPLACE" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                培训内容
                            </td>
                            <td class="td-m" colspan="5">
                                <zhongsoft:LightTextBox ID="tbTrainContent" runat="server" CssClass="kpms-textarea"
                                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINCONTENT"
                                    tablename="EHR_EDUCATIONTRAINPROJECT" Width="99%" activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                学时<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainClassHour" CssClass="kpms-textbox"
                                    req="1" Width="80px" regex="^(([1-9]\d{0,2})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训课时(整数或小数)"
                                    field="TRAININGCLASSHOUR" tablename="EHR_EDUCATIONTRAINPROJECT" activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训人数
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbNumberOfTrain" CssClass="kpms-textbox"
                                    errmsg="请输入正确的培训人数(1-4位整数)" regex="^\d{1,4}$" field="NUMBEROFTRAINING" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训类别
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlTrainClass" activestatus="(23.*)"
                                    field="TRAININGCLASS" tablename="EHR_EDUCATIONTRAINPROJECT">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                参加培训起止日期<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtTrainStDate" runat="server" readonly="readonly"
                                    field="TRAINSTDATE" class="kpms-textbox-comparedate" compare="1" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)" req="1" />
                                至
                                <zhongsoft:XHtmlInputText ID="txtTrainEndDate" runat="server" readonly="readonly"
                                    field="TRAINENDDATE" class="kpms-textbox-comparedate" compare="1" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)" req="1" />
                            </td>
                            <td class="td-l">
                                计划培训起止日期
                            </td>
                            <td class="td-r" colspan="3">
                                <zhongsoft:XHtmlInputText ID="txtPlanStDate" runat="server" readonly="readonly" field="PLANSTDATE"
                                    class="kpms-textbox-comparedate" compare="2" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)" />
                                至
                                <zhongsoft:XHtmlInputText ID="txtPlanEndDate" runat="server" readonly="readonly"
                                    field="PLANENDDATE" class="kpms-textbox-comparedate" compare="2" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                培训讲师
                            </td>
                            <td class="td-r" colspan="5">
                                <zhongsoft:LightObjectSelector runat="server" ID="selInstructors" field="INSTRUCTORNAMES"
                                    SelectPageMode="Dialog" tablename="EHR_EDUCATIONTRAINPROJECT" activestatus="(23.*)"
                                    DoCancel="true" IsMutiple="true" ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true"
                                    ResultForControls="{'hiInstructorIds':'id'}" PageUrl="~/EHR/List/TrainManagement/TrainInstructorSelector.aspx"
                                    Width="99%" PageWidth="600px" PageHeight="600px"></zhongsoft:LightObjectSelector>
                                <input type="hidden" id="hiInstructorIds" runat="server" field="INSTRUCTORIDS" tablename="EHR_EDUCATIONTRAINPROJECT" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                考核方式及结果
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbResult" CssClass="kpms-textbox" Width="99%"
                                    MaxLength="128" field="TESTTYPERESULT" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训机构<span class="req-star">*</span>
                            </td>
                            <td class="td-r" colspan="3">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainInstiType" CssClass="kpms-textbox"
                                    req="1" Width="98%" MaxLength="64" field="TRAININSTITYPE" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                培训期数
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbPeriod" CssClass="kpms-textbox" regex="^\d{1,3}$"
                                    errmsg="请输入正确期数(1-3位整数)" field="PERIOD" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                培训人员类型
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlTraineeType" activestatus="(23.*)"
                                    field="TRAINEETYPE" tablename="EHR_EDUCATIONTRAINPROJECT">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                培训费(元)<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbTrainCost" CssClass="kpms-textbox-money"
                                    req="1" Width="80px" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的培训费(整数或小数)"
                                    field="TRAINCOST" tablename="EHR_EDUCATIONTRAINPROJECT" activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                有无结业证书
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList runat="server" ID="rblHaveCertOfComp" field="HAVECERTOFCOMP"
                                    tablename="EHR_EDUCATIONTRAINPROJECT" RepeatDirection="Horizontal" activestatus="(23.*)">
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                是否交流
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList runat="server" ID="rblIsCommunicate" field="ISCOMMUNICATE" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    RepeatDirection="Horizontal" activestatus="(23.*)">
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                是否需内部宣贯
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList runat="server" ID="rblIspublicizing" field="ISPUBLICIZING" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    RepeatDirection="Horizontal" activestatus="(23.*)">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                培训结果和效果登记
                            </td>
                            <td class="td-m" colspan="5">
                                <zhongsoft:LightTextBox ID="LightTextBox1" runat="server" CssClass="kpms-textarea"
                                    EnableTheming="false" TextMode="MultiLine" maxtext="512" field="TRAINRESULTANDEFFECTIVE"
                                    tablename="EHR_EDUCATIONTRAINPROJECT" Width="99%" activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                备注
                            </td>
                            <td class="td-m" colspan="5">
                                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_EDUCATIONTRAINPROJECT"
                                    Width="99%" activestatus="(23.*)">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <input type="hidden" runat="server" id="hiJoinTrainee" />
        <input type="hidden" runat="server" id="hiYear" field="YEAR" tablename="EHR_EDUCATIONTRAINPROJECT" />
        <input type="hidden" runat="server" id="hiEducationTrainProjectId" field="EDUCATIONTRAINPROJECTID"
            tablename="EHR_EDUCATIONTRAINPROJECT" />
        <input type="hidden" runat="server" id="hiYearInsttrainPlanEntityId" field="YEARINSTTRAINPLANENTITYID"
            tablename="EHR_EDUCATIONTRAINPROJECT" />
        <div id="TrainPersonnel" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="right">
                                <asp:Button ID="btnTrainPersonnel" runat="server" Text="添加培训人员" displayStatus="(3.*)"
                                    OnClick="btnTrainPersonnel_Click" OnClientClick="return chooseTrainPersonnel();" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True"
                                    ShowHeaderWhenEmpty="true" displayStatus="(13.*)" AllowPaging="True" AutoGenerateColumns="False"
                                    DataKeyNames="JOINTRAINEEID,USERID,DEPTID" HideFieldOnExport="序号,编辑,发起培训反馈,删除"
                                    OnRowCommand="gvList_RowCommand" ShowExport="True" BindGridViewMethod="BindGridData"
                                    ShowEmptyDataHeader="true" ShowPageSizeChange="False">
                                    <Columns>
                                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                            HeaderStyle-Width="3%">
                                            <ItemTemplate>
                                                <%#((GridViewRow)Container).DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightBoundField DataField="USERCODE" HeaderText="工号">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="USERNAME" HeaderText="姓名">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="SEX" HeaderText="性别">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="DEPTNAME" HeaderText="培训时所在部门">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="DUTY" HeaderText="培训时职务">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="EDUCATION" HeaderText="培训时学历">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="TRAININGCLASSHOUR" HeaderText="培训课时">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="CERTIFICATENO" HeaderText="证书编号">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="SCORE" HeaderText="成绩">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="COST" HeaderText="个人费用(元)">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightBoundField DataField="TRAINING" HeaderText="培训情况">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false"
                                            EditIdField="JOINTRAINEEID" EditPageWidth="850px" EditPageHeight="300px" ImageUrl="../../../Themes/Images/btn_dg_edit.gif"
                                            ItemStyle-Width="3%" EditPageUrl="../../../EHR/List/TrainManagement/TrainPersonnelEditor.aspx">
                                        </zhongsoft:LightButtonField>
                                        <zhongsoft:LightButtonField HeaderText="发起培训反馈" CommandName="TrainFeedBack" ImageUrl="../../../Themes/Images/btn_submit.gif"
                                            DeleteText="确定给{0}发起培训反馈吗？" DeleteTipField="USERNAMENAME" Visible="false">
                                        </zhongsoft:LightButtonField>
                                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                                            ImageUrl="../../../Themes/Images/btn_delete.gif" DeleteText="您确定删除该培训人员吗？">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            // Tabs
            $('#templateTabs').tabs();
        });

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function checkPlanDate() {
            var startdate = $("#<%=txtPlanStDate.ClientID %>").val();
            var enddate = $("#<%=txtPlanEndDate.ClientID %>").val();
            if (Date.parse(startdate.replace('-', '/')) >= Date.parse(enddate.replace('-', '/'))) {
                alert("计划开始日期应早于计划结束日期！");
                return false;
            }
            else
                return true;
        }
        function editAsset(detailID) {
            var actionType = 3;
            var url = buildQueryUrl("EHR/List/TrainManagement/TrainPersonnelEditor.aspx", { "actionType": actionType, "bizId": detailID, "IsStock": 'true' });
            showDivDialog(url, null, 850, 550, resetAssetInfo);
            return false;
        }
         function resetAssetInfo() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnTrainPersonnel,"") %>
        }

        function checkForm() {
            if (checkPlanDate())
                return true;
            else
                return false;
        }

        function chooseTrainPersonnel() {
            var param = new InputParamObject("m");
            var re = getDivUsersNew("<%=hiJoinTrainee.ClientID%>", param, null,addTrainPersonel);
            return false;
        }
        function addTrainPersonel() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnTrainPersonnel,"")%>;
    }
    </script>
</asp:Content>
