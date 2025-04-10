<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMeetMinutesCirculateDetail.ascx.cs" Inherits="Zhongsoft.Portal.KMS.UI.Controls.UCMeetMinutesCirculateDetail" %>
<table class="tz-table">
    <tr>
        <td style="text-align: center; font-size: medium">会议决议事项</td>
    </tr>
    <tr id="trSure" runat="server">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkFillNum()" />
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
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="议题决议" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="46%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtIssueResolution" Field="IssueResolution" runat="server" Text='<%#Eval("IssueResolution") %>' activestatus="(23.发起传阅)" MaxLength="500" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" />
                            <!--办理状态-->
                            <input type="hidden" runat="server" id="hiHandleStatus" field="HandleStatus" value='<%#Eval("HandleStatus") %>' />
                             <input type="hidden" runat="server" id="hiSort" field="Sort" value='<%#Eval("Sort") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="主办部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="14%">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtHostDept" SelectPageMode="Dialog" activestatus="(23.发起传阅)"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" Field="HostDept" PageHeight="650px"
                                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" Value='<%#Eval("HostDept") %>'
                                IsMutiple="false" ResultForControls="{'hiHostDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiHostDeptId" field="HostDeptId" value='<%#Eval("HostDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="配合部门" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="25%">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtFitDept" SelectPageMode="Dialog" activestatus="(23.发起传阅)"  title='<%#Eval("FitDept") %>'
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" Field="FitDept" PageHeight="650px"
                                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" Value='<%#Eval("FitDept") %>'
                                IsMutiple="true" ResultForControls="{'hiFitDeptId':'id'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiFitDeptId" field="FitDeptId" value='<%#Eval("FitDeptId") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="办理完成时间<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="8%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="txtCompleteDate" Field="CompleteDate" ActiveStatus="(23.发起传阅)"  CssClass="kpms-textbox-date"  EnableTheming="false"  runat="server" req="1" Text='<%#Eval("CompleteDate") == DBNull.Value ? "" : Convert.ToDateTime(Eval("CompleteDate").ToString()).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除"   HeaderStyle-Width="5%"></zhongsoft:LightButtonField>
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
    function checkFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }

    //判断是否必填
    function checkMeetDetail() {
        var num = $("#<%=gvDetail.ClientID %> tr").length - 2;
        if ($("#<%=hdnIsReq.ClientID %>").val() == "1") {
            if (num == 0) {
                alert("会议决议事项必填");
                return false;
            }
        }
        return true;
    }

</script>
