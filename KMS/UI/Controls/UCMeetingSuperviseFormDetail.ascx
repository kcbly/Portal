<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMeetingSuperviseFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCMeetingSuperviseFormDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">决议事项</td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="BindData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="议题决议" ItemStyle-HorizontalAlign="Center"   HeaderStyle-Width="50%">
                        <ItemTemplate>
                           <zhongsoft:LightTextBox ID="tbIssueResolution" CssClass="kpms-textarea" TableName="KMS_Meet_MeetingSuperviseFormDetail" Field="IssueResolution"    runat="server" TextMode="MultiLine" Height="85"
                                            EnableTheming="false" Text='<%#Eval("IssueResolution") %>' ReadOnly="true" ToolTip='<%#Eval("IssueResolution") %>'>
                                        </zhongsoft:LightTextBox>  
                            <input type="hidden" runat="server" id="hiDetailId" Field="DetailId" tablename="KMS_Meet_MeetingSuperviseFormDetail" value='<%#Eval("DetailId") %>' /> 
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="主办部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="12%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtHostDeptName" TableName="KMS_Meet_MeetingSuperviseFormDetail" Field="HostDeptName" ActiveStatus="(23.发起人填写)" value='<%#Eval("HostDeptName") %>' class="kpms-textbox" runat="server" readonly="readonly" />
                            <input type="hidden" runat="server" id="hiHostDeptId" Field="HostDeptId" tablename="KMS_Meet_MeetingSuperviseFormDetail" value='<%#Eval("HostDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="配合部门" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbFitDeptName" CssClass="kpms-textarea" TableName="KMS_Meet_MeetingSuperviseFormDetail" Field="FitDeptName"    runat="server" TextMode="MultiLine" Height="35"
                                            EnableTheming="false" Text='<%#Eval("FitDeptName") %>' ReadOnly="true" ToolTip='<%#Eval("FitDeptName") %>'>
                                        </zhongsoft:LightTextBox>   
                            <input type="hidden" runat="server" id="hiFitDeptId" Field="FitDeptId" tablename="KMS_Meet_MeetingSuperviseFormDetail" value='<%#Eval("FitDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="要求最晚完成日期" ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtLatestCompleteDate" TableName="KMS_Meet_MeetingSuperviseFormDetail" Field="LatestCompleteDate" ActiveStatus="(23.发起人填写)" value='<%#Eval("LatestCompleteDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("LatestCompleteDate").ToString()).ToString("yyyy-MM-dd") %>' class="kpms-textbox" runat="server" readonly="readonly" />
                            <%-- <zhongsoft:LightTextBox ID="txtCompleteDate" Field="CompleteDate" ActiveStatus="(23.发起人填写)"  CssClass="kpms-textbox-date"  EnableTheming="false"  runat="server" Text='<%#Eval("CompleteDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("CompleteDate").ToString()).ToString("yyyy-MM-dd") %>' />--%>
                             <input type="hidden" runat="server" id="hiSort" Field="Sort" tablename="KMS_Meet_MeetingSuperviseFormDetail" value='<%#Eval("Sort") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hdnIsReq" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

</script>
