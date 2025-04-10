<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAttendanceCollectFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.EHR.UI.Controls.UCAttendanceCollectFormDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: right; font-size: medium">缺勤信息</td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" BindGridViewMethod="UserControl.BindDetailData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                            <input type="hidden" runat="server" id="hiDetailId" field="DetailId" value='<%#Eval("DetailId") %>' />
                            <input type="hidden" runat="server" id="hdnSourceId" field="SourceId" value='<%#Eval("SourceId") %>' />
                            <input type="hidden" runat="server" id="hdnUserId" field="UserId" value='<%#Eval("UserId") %>' />
                            <input type="hidden" runat="server" id="hdnUserName" field="UserName" value='<%#Eval("UserName") %>' />

                            <input type="hidden" runat="server" id="hdnLateCnt" field="LateCnt" value='<%#Eval("LateCnt") %>' />
                            <input type="hidden" runat="server" id="hdnEarlyCnt" field="EarlyCnt" value='<%#Eval("EarlyCnt") %>' />
                            <input type="hidden" runat="server" id="hdnAbsentCnt" field="AbsentCnt" value='<%#Eval("AbsentCnt") %>' />
                            <input type="hidden" runat="server" id="hdnLeaveCnt" field="LeaveCnt" value='<%#Eval("LeaveCnt") %>' />
                            <input type="hidden" runat="server" id="hdnSickLeaveCnt" field="SickLeaveCnt" value='<%#Eval("SickLeaveCnt") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="姓名" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate> 
                            <label><%#Eval("UserName") %></label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="迟到（次）" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <label><%#Eval("LateCnt") %></label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="早退（次）" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <label><%#Eval("EarlyCnt") %></label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="旷工（次）" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <label> <%#(Convert.ToDouble(Eval("AbsentCnt")))%></label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                       <zhongsoft:LightTemplateField HeaderText="事假（天）" ItemStyle-HorizontalAlign="Center">                        <ItemTemplate>                            <label> <%#(Convert.ToDouble(Eval("LeaveCnt").ToString()==""?0:Eval("LeaveCnt")))%></label>                        </ItemTemplate>                    </zhongsoft:LightTemplateField>                    <zhongsoft:LightTemplateField HeaderText="病假（天）" ItemStyle-HorizontalAlign="Center">                        <ItemTemplate>                            <label> <%#(Convert.ToDouble(Eval("SickLeaveCnt").ToString()==""?0:Eval("SickLeaveCnt")))%></label>                        </ItemTemplate>                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtRemark" Field="Remark" TextMode="MultiLine" runat="server" EnableTheming="false" title='<%#Eval("Remark") %>' Text='<%#Eval("Remark") %>' activestatus="(23.填写申请)(23.修改申请)" />
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
