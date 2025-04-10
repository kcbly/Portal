<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCResolutionSuperviseFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCResolutionSuperviseFormDetail" %>

<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">进度反馈</td>
    </tr>
    <tr id="trSure" runat="server" displaystatus="(23.部门办理)(23.安排办理)(23.继续办理)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" displaystatus="(23.部门办理)(23.安排办理)(23.继续办理)" />
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView ID="gvDetail" runat="server" UseDefaultDataSource="true" AutoGenerateColumns="false" AllowPaging="false" AllowSorting="true" BindGridViewMethod="BindData" ShowExport="true" ShowPageSizeChange="true" DataKeyNames="DetailId" PageSize="15" OnRowCommand="gvDetail_RowCommand" OnRowDataBound="gvDetail_RowDataBound" HideFieldOnExport="删除" PermissionStatus="true">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                             <!--操作状态-->
                            <input type="hidden" runat="server" id="hiOperationStatus" field="OperationStatus" tablename="KMS_Meet_ResolutionSuperviseFormDetail" value='<%#Eval("OperationStatus") %>' />
                            <input type="hidden" runat="server" id="hiSort" field="Sort" tablename="KMS_Meet_ResolutionSuperviseFormDetail" value='<%#Eval("Sort") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="反馈日期" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="xmlFeedbackDate" runat="server" ReadOnly="true" class="kpms-textbox-date"
                                Field="FeedbackDate" value='<%#Eval("FeedbackDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("FeedbackDate").ToString()).ToString("yyyy-MM-dd") %>' activestatus="(23.部门办理)(23.安排办理)(23.进度反馈)(23.继续办理)" />

                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="进度说明<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtProgress" Field="Progress" runat="server" Text='<%#Eval("Progress") %>' activestatus="(23.部门办理)(23.安排办理)(23.进度反馈)(23.继续办理)" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" />

                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="提交进度" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Editdata" EnableTheming="false" CommandArgument='<%#Eval("DetailId")+","+ Container.DataItemIndex%>' activestatus="(23.部门办理)(23.进度反馈)"> <img id="imgEdit" title="提交进度" style="CURSOR: hand"  src="<%=WebAppPath %>/Themes/Images/btn_submit.gif"  border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>

                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" HeaderStyle-Width="10%"></zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hideptname" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }
    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
    
</script>
