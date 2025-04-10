<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"  AutoEventWireup="true" CodeBehind="SpecialtyPositionEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.QualifManagement.SpecialtyPositionEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"  TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>           
            <td class="td-l">姓名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbPersonnelName" activestatus="(2.*)"
                    field="PERSONNELNAME" tablename="EHR_PRACTICEQUALIF" DoCancel="true" req="1" ResultAttr="name" EnableTheming="false" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiPersonnelInfoId':'id','tbPersonnelCode':'UserCode'
                    ,'tbPersonnelName':'UserName','hiDeptId':'DEPTID','tbDeptName':'DEPTNAME','hiSubDeptId':'OrgUnitId','tbSubDeptName':'OrgUnitName','tbSex':'Sex'
                    ,'tbIdentityCardNO':'IDENTITYCARDNO','tbAge':'Age','tbState':'STATE'}"  ShowJsonRowColName="true" SelectPageMode="Dialog" Writeable="true"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPersonnelInfoID" field="PERSONNELINFOID"
                    tablename="EHR_PRACTICEQUALIF" />
                <input type="hidden" id="hiDeptID" runat="server" field="DEPTID" tablename="EHR_PRACTICEQUALIF" />
                <input type="hidden" id="hiSubDeptID" runat="server" field="SUBDEPTID" tablename="EHR_PRACTICEQUALIF" />
            </td>
             <td class="td-l">工号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbPersonnelCode" readonly="readonly"
                    class="kpms-textbox" field="PERSONNELCODE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">资格证书名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlQuaflificationName" runat="server" field="QUAFLIFICATIONNAME"
                    req="1" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">资格证书级别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationLevel" field="QUAFLIFICATIONLEVEL"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
             <td class="td-l">资格证书专业
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQuaflificationProfession" field="QUAFLIFICATIONPROFESSION"
                    tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">资格证书编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbQuaflificationCode" field="QUAFLIFICATIONCODE"
                    tablename="EHR_PRACTICEQUALIF" MaxLength="32" class="kpms-textbox" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>           
        </tr>
        <tr>
            <td class="td-l">资格证书取得日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtQuaflificationGetDate" class="kpms-textbox-date"
                    field="QUAFLIFICATIONGETDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
             <td class="td-l">资格有效期至
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveEndTime" class="kpms-textbox-date"
                    field="EFFECTIVEENDTIME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
           
        </tr>
        <tr>
          <td class="td-l">距有效期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEffectiveMonth" class="kpms-textbox"
                    field="EFFECTIVEMONTH" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly"
                    style="width: 30px">
                </zhongsoft:XHtmlInputText>
                月
            </td>
             <td class="td-l">性别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSex" readonly="readonly" class="kpms-textbox"
                    style="width: 50px" field="SEX" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
          <tr>
            <td class="td-l">年龄
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbAge" readonly="readonly" class="kpms-textbox"
                    field="AGE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" style="width: 50px">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">人员状态
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbState" readonly="readonly" class="kpms-textbox"
                    field="STATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
         <tr>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbDeptName" readonly="readonly" class="kpms-textbox"
                    field="DEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
            <td class="td-l">科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbSubDeptName" readonly="readonly" class="kpms-textbox"
                    field="SUBDEPTNAME" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" />
            </td>
        </tr>
         <tr>           
            <td class="td-l">身份证号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbIdentityCardNO" field="IDENTITYCARDNO"
                    tablename="EHR_PRACTICEQUALIF" class="kpms-textbox" readonly="readonly" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
            </td>
             <td class="td-l" nowrap>月工资奖励开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtManthWardDate" class="kpms-textbox-date"
                    field="MANTHWARDDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)" readonly="readonly" />
            </td>
        </tr>
        <tr>        
            <td class="td-l" nowrap>月工资奖励金额（元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbManthWardMoney" field="MANTHWARDMONEY"
                    tablename="EHR_PRACTICEQUALIF" regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                    errmsg="请输入正数、两位小数" MaxLength="15" CssClass="kpms-textbox-money" EnableTheming="false"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td> 
            <td class="td-l">月工资奖励终止日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtManthWardEndDate" class="kpms-textbox-date"
                    field="MANTHWARDENDDATE" tablename="EHR_PRACTICEQUALIF" activestatus="(23.*)"
                    readonly="readonly" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>       
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbRecark" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="1024" tablename="EHR_PRACTICEQUALIF" field="RECARK"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">证书扫描件
            </td>
            <td class="td-r" colspan="3">
                <span id="span1" runat="server" displaystatus="(2.*)" style="cursor: hand; height: 16px;"
                    class="req-star">请先保存再上传文件</span>
                <asp:LinkButton runat="server" ID="btnAttach" OnClientClick="uploadFile()" OnClick="lbtnAttach_Click"
                    DisplayStatus="(3.*)"><span>上传文件</span></asp:LinkButton>
                <uc1:AttachmentView ID="AttachmentView1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                    ShowDelete="true" ShowDeleteBySelf="true" />
            </td>
        </tr>
    </table>
    <input id="hiPracticeQualifID" type="hidden" runat="server" field="PRACTICEQUALIFID"   tablename="EHR_PRACTICEQUALIF" />
    <input id="hiTypeFlag" type="hidden" runat="server" field="TYPEFLAG" tablename="EHR_PRACTICEQUALIF"  value="2" />
    <script type="text/javascript"> 
        $('#<%=txtEffectiveEndTime.ClientID %>').live('blur', function () {
            var aDate = new Date();
            var end = $('#<%=txtEffectiveEndTime.ClientID %>').val();
            if (end == "") {
                $('#<%=txtEffectiveMonth.ClientID %>').val('');
                return;
            }
            var endDate = new Date(end.replace(/-/g, "/"));
            var months = (endDate.getFullYear() - aDate.getFullYear()) * 12 + (endDate.getMonth() - aDate.getMonth());
            $('#<%=txtEffectiveMonth.ClientID %>').val(months);
        })

        //上传文件
        function uploadFile() {

            var fileSrcId = "<%=BusinessObjectId %>";
            showUploadForm(fileSrcId, "LaborContractEditor");
            return true;
        }
         //资格证书编号,供用户手工填写，查重
        $('#<%=tbQuaflificationCode.ClientID %>').live('blur', function () { 
            $.post("SpecialtyPositionEditor.aspx", { asyfunc: "CheckSaveData", code: $("#<%=tbQuaflificationCode.ClientID%>").val() }, 
                function (data) {
                    if (intParse(data)>0) {
                        alert("资格证书编号重复！");
                        return false;
                    } else {
                        return true;
                    }
             });
        }) 
    </script>
</asp:Content>
