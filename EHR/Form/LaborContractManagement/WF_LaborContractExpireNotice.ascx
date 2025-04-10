<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_LaborContractExpireNotice.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.LaborContractManagement.WF_LaborContractExpireNotice" %>
<table class="tz-table" width="100%">
    <tr>
    <td class="td-l">
            工号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtUserCode" readonly="readonly" class="kpms-textbox"
                field="FILLUSERCODE" tablename="EHR_LABORCONTRACTEXPIRENT" activestatus="(23.填写合同到期签订情况并通知各部门)(23.修改合同到期签订情况)" />
        </td>
        <td class="td-l">
            填表人
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText type="text" ID="txtFillUserName" runat="server" readonly="readonly"
                class="kpms-textbox" field="FILLUSERNAME" tablename="EHR_LABORCONTRACTEXPIRENT"
                activestatus="(23.填写合同到期签订情况并通知各部门)(23.修改合同到期签订情况)" />
            <input type="hidden" id="hiFillUserId" runat="server" field="FILLUSERID" tablename="EHR_LABORCONTRACTEXPIRENT" />
        </td>
        <td class="td-l">
            填表日期<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText type="text" ID="txtFillDate" runat="server" class="kpms-textbox-date"
                readonly="readonly" field="FILLDATE" tablename="EHR_LABORCONTRACTEXPIRENT" activestatus="(23.填写合同到期签订情况并通知各部门)(23.修改合同到期签订情况)"
                req="1" />
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m" colspan="4" height="25" style="font-weight: bold; text-align: center">
            到期劳动合同列表
        </td>
    </tr>
    <tr>
        <td colspan="6" align="right">
            <asp:Button ID="btnExpireContract" runat="server" Text="添加到期劳动合同" displayStatus="(23.填写合同到期签订情况并通知各部门)(23.修改合同到期签订情况)"
                OnClick="btnExpireContract_Click" OnClientClick="return chooseExpireContract();" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="True" PermissionStatus="true"
                ShowHeaderWhenEmpty="true" displayStatus="(123.*)" RowStyle-Wrap="false" AllowPaging="True"
                PageSize="1000" AutoGenerateColumns="False" DataKeyNames="LABORCONTRACTEXPIRENTDTID"
                HideFieldOnExport="序号,编辑,删除"  OnRowDataBound="gvList_RowDataBound"
                OnRowCommand="gvList_RowCommand"  ShowExport="True"
                BindGridViewMethod="BindGridData" ShowPageSizeChange="False" OnExport="gvList_Export">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="30px"
                        ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1  %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="部门" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="170px">
                        <ItemTemplate>
                            <%#Eval("DEPTNAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="工号" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="60px">
                        <ItemTemplate>
                            <%#Eval("USERCODE")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="姓名" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%#Eval("USERNAME")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="合同到期日" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%# Eval("ENDDATE") == DBNull.Value ? "" : string.IsNullOrEmpty(Eval("ENDDATE").ToString()) ? "" : DateTime.Parse(Eval("ENDDATE").ToString()).ToString("yyyy-MM-dd")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="合同归属单位" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <%#Eval("CONTRACTBELONGTO")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="建议签订年限<span class='req-star'>*</span>" ItemStyle-VerticalAlign="Middle"
                        ItemStyle-Width="120px">
                        <ItemTemplate>
                            <asp:TextBox ID="tbSuggestYears" runat="server" class="kpms-textbox" regex="(^[1-9]\d{0,1}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" Text=' <%#Eval("SUGGESTYEARS")%>' activestatus="(23.填写合同到期签订情况并通知各部门)(23.部门确认)"
                                 req="1"  MaxLength="64"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="部门及个人意见" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="120px">
                        <ItemTemplate>
                            <asp:TextBox ID="tbDeptAndUserIdea" runat="server" CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("DEPTANDUSERIDEA")%>' activestatus="(23.部门确认)"
                                Maxtext="512" TextMode="MultiLine"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分管院长意见" ItemStyle-Width="200px">
                        <ItemTemplate>
                             <asp:TextBox ID="tbLEADERIDEA" runat="server" CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("LEADERIDEA") %>' activestatus="(23.分管院领导审核)"
                                Maxtext="512" TextMode="MultiLine"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteData" CommandArgument='<%# Container.DataItemIndex %>' EnableTheming="false" BorderStyle="None">
                               <img id="btnDelete" alt="删除" title="删除" style="CURSOR: hand" onclick='if(!confirm("您确定要删除吗？")) return false;'
							src="../../Themes/Images/btn_dg_delete.gif" border="0">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiLaborContractExpireNtId" runat="server" field="LABORCONTRACTEXPIRENTID"
    tablename="EHR_LABORCONTRACTEXPIRENT" />
<input type="hidden" runat="server" id="hiExpireContract" />
<input type="hidden" runat="server" id="hiisEditing" />
<script type="text/javascript">
    var currentAct = '<%=CurrentActivityName %>';
    function InitCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    function chooseExpireContract() {
        var param = new InputParamObject("m");
        getDivLaborContract("<%=hiExpireContract.ClientID%>", param, null,afterSelTraceCallBack);
        return false;
    }

    function afterSelTraceCallBack(re) {
        if (re != null)
             <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnExpireContract, "")%>;
        else 
            return false;
    }

    $(function () {
        $("#<%=gvList.ClientID%> > caption").css("font-size", "15px");
        $("#<%=gvList.ClientID%> > caption").css("padding-bottom", "10");
    });


    function checkForm() {
        var isEditing = $('#<%=hiisEditing.ClientID %>').val();

        if (isEditing == "1") {
            alert("请先“保存”或“取消”编辑！");
            return false;
        }

        if ($sendBtnId == "btnSend" && (currentAct == "填写合同到期签订情况并通知各部门" || currentAct == "修改合同到期签订情况")) {
            var grid = $("#<%=gvList.ClientID %>")[0];
            if (grid.rows.length < 2) {
                alert("请添加到期劳动合同！");
                return false;
            }
//            var table = $("#<%=gvList.ClientID %>");
//            var $trs = table.children("tbody").children("tr");
//            for (var i = 0; i < $trs.length; i++) {
//                if (($("td:eq(6)", $trs[i]).text().trim() == "")) {
//                    alert("请填写  " + $("td:eq(3)", $trs[i]).html().trim() + "  建议签订年限");
//                    return false;
//                }
//            }
        }

        if ($sendBtnId == "btnSend" && (currentAct == "部门确认" || currentAct == "分管院领导审核")) {
            var table = $("#<%=gvList.ClientID %>");
            var $trs = table.children("tbody").children("tr");
            for (var i = 0; i < $trs.length; i++) {
                if (($("td:eq(6)", $trs[i]).html().trim() == "")) {
                    alert("请填写  " + $("td:eq(3)", $trs[i]).html().trim() + "  建议签订年限");
                    return false;
                }
            }
        }
        return true;
    }

</script>
