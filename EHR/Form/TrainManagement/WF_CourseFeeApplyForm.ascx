<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_CourseFeeApplyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.TrainManagement.WF_CourseFeeApplyForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            培训项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTrainProjectName" runat="server" field="TRAINPROJECTNAME"
                req="1" Width="99%" tablename="EHR_COURSEFEEAPPLYFORM" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)"
                 />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训内容<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectContent" runat="server" CssClass="kpms-textarea" EnableTheming="false" field="PROJECTCONTENT"
                  TextMode="MultiLine" maxtext="512"  Width="99%"
                 tablename="EHR_COURSEFEEAPPLYFORM" req="1" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
      
    </tr>
    <tr>
        <td class="td-l">
            培训讲师<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:LightTextBox ID="tdTutor" runat="server" field="TUTOR" tablename="EHR_COURSEFEEAPPLYFORM"
                req="1" Width="99%"  activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
    
   
        <td class="td-l">
            培训对象<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:LightTextBox ID="tbTraningObject" runat="server" field="TRAININGOBJECT" Width="99%"
                 tablename="EHR_COURSEFEEAPPLYFORM" req="1" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
        
        
    </tr>
    <tr>
        <td class="td-l">
            组织部门<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="2">
        <%--应该用下来列表?--%>
            <zhongsoft:LightTextBox runat="server" ID="tbMainDepartment" readOnly="true" field="MAINDEPARTMENT" req="1" Width="99%"
                tablename="EHR_COURSEFEEAPPLYFORM" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
            <input type="hidden" id="hiDeptId" runat="server" field="DEPTID" tablename="EHR_COURSEFEEAPPLYFORM" />
            <input type="hidden" id="hiDeptCode" runat="server" field="DEPTCODE" tablename="EHR_COURSEFEEAPPLYFORM" />
        </td>
  
       
        <td class="td-l" >
            协办部门
        </td>
        <td class="td-r" colspan="2">
            <zhongsoft:LightTextBox ID="tdDepartment" runat="server"  field="DEPARTMENT"  Width="99%"
                tablename="EHR_COURSEFEEAPPLYFORM" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            培训起始时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="2">
            <zhongsoft:XHtmlInputText ID="txtStartDate" runat="server" readonly="readonly" field="STARTDATE"
                class="kpms-textbox-date" tablename="EHR_COURSEFEEAPPLYFORM" req="1" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
        <td class="td-l">
            培训结束时间<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText ID="txtEndDate" runat="server" readonly="readonly" field="ENDDATE"  
                class="kpms-textbox-date" tablename="EHR_COURSEFEEAPPLYFORM" req="1"  activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
    </tr>
    <tr>
    <td class="td-l">
            参加人数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tdNumber" runat="server"  field="NUMBER"
                tablename="EHR_COURSEFEEAPPLYFORM" req="1" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
        <td class="td-l">
            培训学时<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tHours" runat="server"  field="HOURS"
                tablename="EHR_COURSEFEEAPPLYFORM" req="1" activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
        <td class="td-l">
            培训费<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbTutorFee" runat="server" field="TUTORFEE" req="1"
                tablename="EHR_COURSEFEEAPPLYFORM"  activestatus="(23.填写授课费申请表)(23.修改授课费申请表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbNotes" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="512" field="NOTES" tablename="EHR_COURSEFEEAPPLYFORM"
                Width="99%"  activestatus="(23.填写授课费申请表)(23.修改授课费申请表)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiCourseFeeApplyFormId" field="COURSEFEEAPPLYFORMID"
    tablename="EHR_COURSEFEEAPPLYFORM" />
