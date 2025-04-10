<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCByAirApplyFormDetail.ascx.cs" Inherits="Zhongsoft.Portal.FM.UI.Controls.UCByAirApplyFormDetail" %>

<table class="tz-table" style="width: 100%">
    <tr>
        <td colspan="4" style="text-align: center; font-size: medium; padding: 10px 0px;">超标申请明细<span class="req-star" runat="server" displaystatus="(2.*)">（请先保存，再添加超标申请明细）</span></td>
    </tr>
    <tr runat="server" displaystatus="(3.填写申请)">
        <td style="text-align: right">新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="30px" regex="^\d+$"
            Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2" Text="1"></zhongsoft:LightTextBox>行	
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click" Text="确定" OnClientClick="return checkIsTrue()" />
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                DataKeyNames="DetailId" PowerPageCount="0" PowerPageIndex="0" PermissionStatus="true" EmptyDataText="没有超标申请明细"
                RecordsCount="0" UseDefaultDataSource="true" ShowFooter="true" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出差人<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightObjectSelector runat="server" ID="ltbUserName" SelectPageMode="Dialog" activestatus="(23.填写申请)" PageHeight="650px"
                                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" Field="UserName" Value='<%#Eval("UserName") %>'
                                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" req="1"
                                    IsMutiple="false" ResultForControls="{'hiUserId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                                <input type="hidden" runat="server" id="hiUserId" field="UserId" value='<%#Eval("UserId") %>' />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出发地<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="ltbStartAddr" req="1" ActiveStatus="(23.填写申请)" Field="StartAddr"
                                    Text='<%#Eval("StartAddr") %>' MaxLength="150" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="目的地<span class='req-star'>*</span>" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="tlbGetToAddr" req="1" ActiveStatus="(23.填写申请)" Field="GetToAddr"
                                    Text='<%#Eval("GetToAddr") %>' MaxLength="150"/>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出差日期<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" ID="ltbByAirDate" runat="server" req="1" field="ByAirDate" activestatus="(23.填写申请)" Text='<%#Eval("ByAirDate","{0:yyyy-MM-dd}") %>'
                                    CssClass="kpms-textbox-date" EnableTheming="false" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出行方式<span class='req-star'>*</span>" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightDropDownList ID="ddlTravelMode" runat="server" CssClass="kpms-ddlsearch" req="1" ActiveStatus="(23.填写申请)" field="TravelMode" EnableTheming="false" />
                                <input type="hidden" runat="server" id="hiTravelModeText" field="TravelModeText" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="是否往返<span class='req-star'>*</span>" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <span>
                                <asp:RadioButtonList ID="rblIsBack" runat="server" RepeatDirection="Horizontal" req="1" Field="IsBack"
                                    Activestatus="(23.填写申请)" />
                                <input type="hidden" runat="server" id="hiIsBackText" field="IsBackText" value='<%#Eval("IsBackText") %>' />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="预估费用（元）<span class='req-star'>*</span>" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox type="text" runat="server" ID="ltbAirCost" req="1" CssClass="kpms-textbox-money"  regex="(^[1-9]\d{0,11}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="请输入正数、两位小数"  ActiveStatus="(23.填写申请)"
                                    Field="AirCost" Text='<%#Eval("AirCost") %>' MaxLength="18" />
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="备注" ItemStyle-Width="300px">
                        <ItemTemplate>
                            <span>
                                <zhongsoft:LightTextBox ID="ltbApplyReason" CssClass="kpms-textarea" runat="server" TextMode="MultiLine" EnableTheming="false" maxtext="500" Text='<%#Eval("Remark") %>'
                                    Field="Remark" ActiveStatus="(23.填写申请)" MaxLength="500"></zhongsoft:LightTextBox>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightButtonField HeaderText="删除" Visible="false" CommandName="DeleteData" ItemStyle-Width="60px">
                    </zhongsoft:LightButtonField>
                </Columns>
                <PagerStyle HorizontalAlign="Right"></PagerStyle>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();

    }
    //点击确定时，验证是否输入数字
    function checkIsTrue() {

        var showNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (showNum == "") {
            alert("请输入显示的行数");
            return false;
        }
        return true;
    }
</script>
