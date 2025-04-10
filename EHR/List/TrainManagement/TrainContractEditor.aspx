<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainContractEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EHR.List.TrainManagement.TrainContractEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                合同编号
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbContractCode" CssClass="kpms-textbox"
                    MaxLength="12" field="CONTRACTCODE" tablename="EHR_TRAINCONTRACTENTITY"
                    activestatus="(23.*)" ReadOnly="true">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbContractName" CssClass="kpms-textbox"
                    req="1" MaxLength="64" field="CONTRACTNAME" tablename="EHR_TRAINCONTRACTENTITY"
                    Width="250px" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合同金额(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContractAmount" CssClass="kpms-textbox-money"
                    Width="80px" req="1" regex="^(([1-9]\d{0,9})|0)(\.\d{1,2})?$" errmsg="请输入正确的合同金额(整数或小数)"
                    field="CONTRACTAMOUNT" tablename="EHR_TRAINCONTRACTENTITY" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                签订日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSignDate" runat="server" readonly="readonly" field="SIGNDATE"
                    class="kpms-textbox-date" tablename="EHR_TRAINCONTRACTENTITY" req="1" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                承办部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlUnderDept" req="1" activestatus="(23.*)"
                    field="UNDERDEPTID" tablename="EHR_TRAINCONTRACTENTITY" AutoPostBack="true" OnSelectedIndexChanged="ddlUnderDeptIndexChange">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiUnderDeptCode" runat="server" field="UNDERDEPTCODE" tablename="EHR_TRAINCONTRACTENTITY" />
                <input type="hidden" id="hiUnderDeptName" runat="server" field="UNDERDEPTNAME" tablename="EHR_TRAINCONTRACTENTITY" />
            </td>
            <td class="td-l">
                承办人<span class="req-star">*</span>
            </td>
            <td class="td-r" style="width: 80px">
                <zhongsoft:LightObjectSelector runat="server" ID="selUnderTaker" field="UNDERTAKERNAME"
                    tablename="EHR_TRAINCONTRACTENTITY" activestatus="(23.*)" DoCancel="true" req="1"
                    ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiUnderTakerId':'id','hiUnderTakerCode':'UserCode'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiUnderTakerId" runat="server" field="UNDERTAKERID" tablename="EHR_TRAINCONTRACTENTITY" />
                <input type="hidden" id="hiUnderTakerCode" runat="server" field="UNDERTAKERCODE"
                    tablename="EHR_TRAINCONTRACTENTITY" />
            </td>
        </tr>
        <tr>
            <td colspan="6" align="center" style="font-weight: bold; font-size: medium">
                培训项目信息列表
            </td>
        </tr>
        <tr>
            <td align="right" colspan="6">
                <span id="Span1" runat="server" displaystatus="(2.*)" style="color: Red">请新保存再选择培训项目</span>
                <asp:LinkButton runat="server" ID="btn_SelTrainProject" EnableTheming="false" CssClass="subtoolbarlink"
                    OnClick="btnSelTrainProject_Click" OnClientClick="return chooseTrainProject();"
                    activestatus="(3.*)" displaystatus="(3.*)">
                <span>选择培训项目</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    AllowPaging="true" BindGridViewMethod="BindDataGrid" UseDefaultDataSource="true"
                    ShowPageSizeChange="true" DataKeyNames="TRAINCONTRACTDETAILID" RowStyle-Wrap="false"
                    PermissionStatus="true" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="培训项目编号" DataField="TRAINPROJECTCODE">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="培训项目名称" DataField="TRAINPROJECTNAME">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="培训项目明细" CausesValidation="false"
                            EditIdField="EDUCATIONTRAINPROJECTID" EditPageWidth="950px" EditPageHeight="600px"
                            EditPageUrl="../TrainManagement/EducationTrainProjectEditor.aspx">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                            DeleteText="您确定从合同中去掉此培训项目吗？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="512" field="MEMO" tablename="EHR_TRAINCONTRACTENTITY"
                    Width="99%" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiTrainContractId" field="TRAINCONTRACTID"
        tablename="EHR_TRAINCONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiTrainProject" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function chooseTrainProject() {
            var param = new InputParamObject("m");
            var re = getTrainProject("<%=hiTrainProject.ClientID%>", param, "");
            if (re != null)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
