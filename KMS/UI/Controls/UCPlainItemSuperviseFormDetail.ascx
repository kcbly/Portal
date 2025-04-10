<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCPlainItemSuperviseFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCPlainItemSuperviseFormDetail" %>
<table class="tz-table" runat="server">
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
                            <input type="hidden" runat="server" id="hiOperationStatus" field="OperationStatus" tablename="KMS_Meet_PlainItemSuperviseFormDetail" value='<%#Eval("OperationStatus") %>' />
                            <input type="hidden" runat="server" id="hiSort" field="Sort" tablename="KMS_Meet_PlainItemSuperviseFormDetail" value='<%#Eval("Sort") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="反馈日期" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="xmlFeedbackDate" runat="server" ReadOnly="true" class="kpms-textbox-date" req="1"
                                Field="FeedbackDate" value='<%#Eval("FeedbackDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("FeedbackDate").ToString()).ToString("yyyy-MM-dd") %>' activestatus="(23.部门办理)(23.安排办理)(23.继续办理)(23.进度反馈)" />

                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="进度说明<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtProgress" Field="Progress" runat="server" Text='<%#Eval("Progress") %>' activestatus="(23.部门办理)(23.安排办理)(23.继续办理)(23.进度反馈)" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" req="1" />

                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="提交进度" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Editdata" EnableTheming="false" CommandArgument='<%#Eval("DetailId")+","+ Container.DataItemIndex%>' activestatus="(23.部门办理)(23.进度反馈)">
                                						<img id="imgEdit" title="提交进度" style="CURSOR: hand"
							 src="<%=WebAppPath%>/Themes/Images/btn_submit.gif" border="0">
                            </asp:LinkButton>
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

    function checkForm() {

        //判断最新反馈日期是否大于之前提交过的日期
        var objList = $("#<%=gvDetail.ClientID %> tbody tr")
        //已提交的反馈时间
        var y_datearr = [];
        //未提交的反馈时间
        var n_datearr = [];
        //没有填写的进度说明计数
        var n_progresscount = 0;
        //存在添加的新的进度反馈时间小于已提交的最新的反馈时间计数
        var count = 0;
        if (objList.length > 0) {

            for (var i = 0; i < objList.length; i++) {
                if ($(objList[i]).children().children().children().prevObject[0].value == "已提交") {
                    y_datearr.push(new Date($(objList[i]).children().children().children().prevObject[2].value.replace(/-/g, "/")))
                }
                if ($(objList[i]).children().children().children().prevObject[0].value == "未提交") {
                    n_datearr.push(new Date($(objList[i]).children().children().children().prevObject[2].value.replace(/-/g, "/")))
                }
                if ($(objList[i]).children().children().children().prevObject[3].value == "" || $(objList[i]).children().children().children().prevObject[3].value == null) {

                    n_progresscount++;
                }

            }
            var maxDate = new Date(Math.max.apply(null, y_datearr));
            if (n_datearr.length > 0) {
                for (var i = 0; i < n_datearr.length; i++) {

                    if (new Date(n_datearr[i]) <= maxDate) {
                        count++;
                    }
                }
            }
            if (count > 0) {
                alert("最新反馈日期必须大于之前提交过的日期！")
                return false;
            }
            else {
                if (n_progresscount > 0) {
                    alert("请填写进度说明！")
                    return false;

                }
                else {
                    if ($actName == "部门办理" || $actName == "安排办理" || $actName == "继续办理" || $actName == "进度反馈") {

                        if (n_datearr.length > 0) {

                            alert("请确认进度说明，并提交。")
                        }
                    }
                    return true;
                }

            }

        }

        return true;

    }

</script>
