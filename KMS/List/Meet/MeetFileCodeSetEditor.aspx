<%@ Page Language="C#" Title="会议纪要文件号维护编辑页" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="MeetFileCodeSetEditor.aspx.cs" Inherits="Zhongsoft.Portal.KMS.List.Meet.MeetFileCodeSetEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr>
            <td class="td-l">会议类型<span class="req-star">*</span></td>
            <td class="td-r">
                 <zhongsoft:LightDropDownList ID="ddlMeetingType" TableName="KMS_Meet_MeetFileCodeSet" Field="MeetingType" ActiveStatus="(23.*)" AutoPostBack="true"    req="1" runat="server" Width="128px">               
                 </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiMeetingTypeText" field="MeetingTypeText" tablename="KMS_Meet_MeetFileCodeSet" /> 

            </td> 
        </tr>
          <tr>
            <td class="td-l">编号前缀<span class="req-star">*</span></td>
            <td class="td-r" >
                   <zhongsoft:LightTextBox ID="txtCodePrefix" TableName="KMS_Meet_MeetFileCodeSet" Field="CodePrefix" ActiveStatus="(23.*)"  runat="server"  req="1" Width="180px" />
                   <asp:Label ID="lbSendText"  runat="server"></asp:Label>
                 <span class="req-star">编号格式例如：水电党纪要+年份+第XX期,文本框中输入编号前缀："水电党纪要"</span>
                </td> 
        </tr> 
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r"  colspan="3">
                <zhongsoft:LightTextBox ID="txtRemark" TableName="KMS_Meet_MeetFileCodeSet" Field="Remark" ActiveStatus="(23.*)"
                    runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" /></td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiKeyId" name="hiKeyId" tablename="KMS_Meet_MeetFileCodeSet" field="MeetFileCodeSetId" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

    </script>
</asp:Content>

