<%@ Page Language="C#" AutoEventWireup="true" Title="职务变动" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="PositionChangeEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.Form.PositionChangeEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <script type="text/javascript" src="../UI/Script/EHRGeneralScript.js"></script>

    <table class="tz-table">
        <tr>
            <td class="kpms-fim-l">
                员工号<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelCode" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelCode" tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="员工号" />
            </td>
            <td class="kpms-fim-l">
                姓名
            </td>
            <td class="kpms-fim-r">
                <input type="text" id="tbPersonnelName" runat="server" readonly="readonly" class="kpms-textbox"
                    field="PersonnelName" tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    status="0" fieldname="姓名" />
            </td>
        </tr>
        <tr>
            <td class="kpms-fim-l">
                所属部门<span class="kpms-star">*</span>
            </td>
            <td class="kpms-fim-m" colspan="3">
                <input type="text" id="tbDept" runat="server" readonly="readonly" class="kpms-textbox"
                    field="OrganizationName" tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                    style="width: 34%" status="0" fieldname="所属部门" />
            </td>
        </tr>
        <asp:Panel runat="server" ID="pnlData">
            <tr>
                <td class="kpms-fim-l">
                    单位全名称
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbUnitName" field="UnitName" tablename="EHR_PositionChangeTemp"
                        MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="单位全名称"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    单位名称
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbSimpleUnitName" field="SimpleUnitName" tablename="EHR_PositionChangeTemp"
                        MaxLength="64" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="单位名称"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    担任职务时部门<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <input type="text" id="tbThenDeptName" runat="server" readonly="readonly" class="kpms-textbox"
                        field="ThenDeptName" tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="担任职务时部门" req="1"/>
                    <input type="hidden" runat="server" id="hiThenDeptID" field="ThenDeptID" tablename="EHR_PositionChangeTemp" />
                    <asp:ImageButton runat="server" ID="ibtnChooseDept" ImageUrl="~/Themes/Images/btn_select.gif"
                        ToolTip="选择" TabIndex="1" OnClientClick="return ChooseDept();" CausesValidation="False"
                        ActiveStatus="(23.申请人填写信息)(23.申请人修改信息)" DisplayStatus="(23.申请人填写信息)(23.申请人修改信息)" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    职务名称<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPositionName" field="PositionName" tablename="EHR_PositionChangeTemp"
                        MaxLength="20" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        req="1" status="0" fieldname="职务名称"></asp:TextBox>
                </td>
                <td class="kpms-fim-l">
                    职务级别<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPositionLevel" field="PositionLevel" tablename="EHR_PositionChangeTemp"
                        MaxLength="2" CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        regex="^\d+$" errmsg="请输入最多两位整数" req="1" status="0" fieldname="职务级别"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    任职日期<span class="kpms-star">*</span>
                </td>
                <td class="kpms-fim-r">
                    <input type="text" readonly="readonly" runat="server" id="tbStartDate" class="kpms-textbox-date"
                        req="1" field="StartDate" tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="任职日期" />
                </td>
                <td class="kpms-fim-l">
                    职务配置方式
                </td>
                <td class="kpms-fim-r">
                    <asp:TextBox runat="server" ID="tbPositionConfigureType" field="PositionConfigureType"
                        tablename="EHR_PositionChangeTemp" MaxLength="128" class="kpms-textbox" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="职务配置方式"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    变动原因
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbChangeReason" field="ChangeReason" tablename="EHR_PositionChangeTemp"
                        Maxtext="256" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="变动原因"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    批准单位
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbApproveUnit" field="ApproveUnit" tablename="EHR_PositionChangeTemp"
                        MaxLength="128" activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="批准单位"></asp:TextBox>
                </td>
            </tr>
            <tr>
                
                <td class="kpms-fim-l">
                    是否现行政、党派职务
                </td>
                <td class="kpms-fim-r">
                    <asp:CheckBox runat="server" ID="tbIsNowPosition" Text="是" field="IsNowPosition"
                        tablename="EHR_PositionChangeTemp" activestatus="(23.申请人填写信息)(23.申请人修改信息)"
                        status="0" fieldname="是否现行政、党派职务" />
                </td>
            </tr>
            <tr>
                <td class="kpms-fim-l">
                    备注
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <asp:TextBox runat="server" ID="tbRemark" field="Remark" tablename="EHR_PositionChangeTemp"
                        Maxtext="512" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                        activestatus="(23.申请人填写信息)(23.申请人修改信息)" status="0" fieldname="备注"></asp:TextBox>
                </td>
            </tr>
            <tr style="display: none">
                <td class="kpms-fim-l">
                    批准文件
                </td>
                <td class="kpms-fim-m" colspan="3">
                    <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                        class="kpms-star">请先保存在上传批准文件</span>
                    <asp:ImageButton ID="ibtnAttach" ImageUrl="../../Themes/Images/btn_dg_upfile.gif"
                        runat="server" Style="cursor: hand; height: 16px;" OnClick="ibtnAttach_Click"
                        ToolTip="上传附件" CausesValidation="false" OnClientClick="UpLoadFile()" DisplayStatus="(3.申请人填写信息)(3.申请人修改信息)" />
                    <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="1" />
                </td>
            </tr>
        </asp:Panel>
    </table>
    <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PersonnelInfoID"
        tablename="EHR_PositionChangeTemp" />
    <input type="hidden" runat="server" id="hiPositionChangeID" field="PositionChangeID"
        tablename="EHR_PositionChangeTemp" />
    <input type="hidden" runat="server" id="hiPositionChangeTempID" field="PositionChangeTempID"
        tablename="EHR_PositionChangeTemp" />
    <input type="hidden" runat="server" id="hiPersonelInfoPassMainID" field="PersonelInfoPassMainID"
        tablename="EHR_PositionChangeTemp" />
    <!--地址/主要字段名/表名-->
    <input type="hidden" runat="server" id="hiPositionName" value="职务变动" />
    <input type="hidden" runat="server" id="hiPositionUrl" value="/Portal/EHR/Form/PositionChangeEditor.aspx" />
    <input type="hidden" runat="server" id="hiPositionFCode" value="PositionName" />
    <input type="hidden" runat="server" id="hiPositionFName" value="职务名称" />
    <input type="hidden" runat="server" id="hiPositionTCode" value="EHR_PositionChangeTemp" />
    <input type="hidden" runat="server" id="hiKeyName" value="PositionChangeTempID" />
    <input type="hidden" runat="server" id="hiOriKeyName" value="PositionChangeID" />

    <script type="text/javascript">
        $(function() {
            SetBackGround();
        });
    </script>

    <script type="text/javascript">
        function InitCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        var webappicationpath = "<%=WebApplicationPath%>";
        function UpLoadFile() {
            var fileSrcId = "<%=BusinessObjectId%>";
            var fileSrcFlag = "Module";
            var buildSelf = "False";

            var url = webappicationpath + "/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
        function ChooseDept() {
            var param = new InputParamObject("s");

            //Modified by wanglj 20130423 将getEHROrg改为getOrgs
            var re = getOrgs("", param, "");
            if (re != null) {
                $("#<%=hiThenDeptID.ClientID%>").val(re.buildAttrJson("o", "id"));
                $("#<%=tbThenDeptName.ClientID%>").val(re.buildAttrJson("o", "name"));
            }
            return false;
        }
    </script>

</asp:Content>
