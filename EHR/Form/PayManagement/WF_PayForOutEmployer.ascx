<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PayForOutEmployer.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.PayManagement.WF_PayForOutEmployer" %>
<%@ Register src="../../UI/Controls/AttachmentBatchDown.ascx" tagname="AttachmentBatchDown" tagprefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" CssClass="kpms-textbox" Field="TITLE"
                Tablename="EHR_PAYFOROUTEMPLOYER" Activestatus="(23.通知各部门提供考勤考核工资)" EnableTheming="false"
                MaxLength="128" req="1">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            拟稿人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCreateMenName" readonly="readonly"
                class="kpms-textbox" field="CREATEMANNAME" tablename="EHR_PAYFOROUTEMPLOYER"
                activestatus="(23.通知各部门提供考勤考核工资)" />
            <input type="hidden" id="hiCreateManID" runat="server" field="CREATEMANID" tablename="EHR_PAYFOROUTEMPLOYER" />
            <input type="hidden" id="hiCreateManCode" runat="server" field="CREATEMANCODE" tablename="EHR_PAYFOROUTEMPLOYER" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbCreateManPhone" runat="server" CssClass="kpms-textbox"
                Field="CREATEMANPHONE" Tablename="EHR_PAYFOROUTEMPLOYER" Activestatus="(23.通知各部门提供考勤考核工资)"
                MaxLength="11">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            拟稿部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCreateDeptName" readonly="readonly"
                class="kpms-textbox" field="CREATEDEPTNAME" tablename="EHR_PAYFOROUTEMPLOYER"
                activestatus="(23.通知各部门提供考勤考核工资)" />
            <input type="hidden" id="hiCreateDeptID" runat="server" field="CREATEDEPTID" tablename="EHR_PAYFOROUTEMPLOYER" />
            <input type="hidden" id="hiCreateDeptCode" runat="server" field="CREATEDEPTCODE"
                tablename="EHR_PAYFOROUTEMPLOYER" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            拟稿日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateDocDate" runat="server" class="kpms-textbox-comparedate"
                field="CREATEDOCDATE" tablename="EHR_PAYFOROUTEMPLOYER" readonly="readonly" req="1"
                activestatus="(23.通知各部门提供考勤考核工资)" compare="1" />
        </td>
        <td class="td-l">
            需办结时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" class="kpms-textbox-comparedate"
                field="FINISHDATE" tablename="EHR_PAYFOROUTEMPLOYER" readonly="readonly" req="1"
                activestatus="(23.通知各部门提供考勤考核工资)" compare="1" />
        </td>
        <td class="td-l">
            缓急程度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlImpLevel" runat="server" field="PriorityLevel" tablename="EHR_PAYFOROUTEMPLOYER">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" activestatus="(23.通知各部门提供考勤考核工资)"
                maxtext="1024" CssClass="kpms-textarea" EnableTheming="false" field="MEMO" tablename="EHR_PAYFOROUTEMPLOYER" />
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="6" style="text-align: center !important;">
            考核工资统计表
        </td>
    </tr>
    <tr id="Tr1" runat="server">
        <td class="td-r" colspan="6" style="text-align: right !important;">
            <asp:LinkButton ID="lbkUpLoadFile" runat="server" DisplayStatus="(3.提供考勤考核工资)(3.审核)"
                Activestatus="(3.提供考勤考核工资)(3.审核)" OnClientClick="return upLoadFile(1)" OnClick="lbkUpLoadFile_Click"
                EnableTheming="false">上传附件</asp:LinkButton>
            <uc1:AttachmentBatchDown ID="AttachmentBatchDown" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center">
            <zhongsoft:LightPowerGridView ID="gvListFile" runat="server" ShowFooter="false" AllowPaging="false"
                AutoGenerateColumns="false" UseDefaultDataSource="true" OnRowCommand="gvListFile_RowCommand"
                BindGridViewMethod="UserControl.BindFile" DataKeyNames="FileId,FilePath">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DisplayIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="上传人员" DataField="CreateUserName" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DEPTNAME" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="文件名称" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                target="_blank" title="<%# Eval("FileName") %>" style="text-decoration: underline;
                                color: Blue">
                                <%# Eval("FileName").ToString().Length > 40 ? Eval("FileName").ToString().Substring(0,40) : Eval("FileName").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                OnClientClick='return confirm("确定要删除吗？");'>
                                <img alt="删除" title="删除" src="../../Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-r" colspan="6" style="text-align: center !important; display: none">
            薪酬发放\费用明细表
        </td>
    </tr>
    <tr id="Tr2" runat="server" displaystatus="(3.汇总核算制作薪酬发放表)(3.制作费用明细表)(3.审核)" style="display: none">
        <td class="td-r" colspan="6" style="text-align: right !important;">
            <asp:LinkButton ID="lkbPayListUp" runat="server" DisplayStatus="(3.汇总核算制作薪酬发放表)(3.制作费用明细表)(3.审核)"
                Activestatus="(3.汇总核算制作薪酬发放表)(3.制作费用明细表)(3.审核)" EnableTheming="false" OnClientClick="return upLoadFile(2)"
                OnClick="lkbPayListUp_Click">上传附件</asp:LinkButton>
        </td>
    </tr>
    <tr style="display: none">
        <td colspan="6" align="center">
            <zhongsoft:LightPowerGridView ID="gvPayList" runat="server" ShowFooter="false" AllowPaging="false"
                AutoGenerateColumns="false" UseDefaultDataSource="true" OnRowCommand="gvPayList_RowCommand"
                BindGridViewMethod="UserControl.BindPayList" DataKeyNames="FileId,FilePath">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DisplayIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightBoundField HeaderText="上传人员" DataField="CreateUserName" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField HeaderText="部门名称" DataField="DEPTNAME" ItemStyle-Width="100px">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="文件名称" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                target="_blank" title="<%# Eval("FileName") %>" style="text-decoration: underline;
                                color: Blue">
                                <%# Eval("FileName").ToString().Length > 25 ? Eval("FileName").ToString().Substring(0,25) : Eval("FileName").ToString()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="80px"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                                OnClientClick='return confirm("确定要删除吗？");'>
                                <img alt="删除" title="删除" src="../../Themes/Images/btn_dg_delete.gif" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPAYFOROUTEMPLOYERID" runat="server" field="PAYFOROUTEMPLOYERID"
    tablename="EHR_PAYFOROUTEMPLOYER" />
<input type="hidden" id="hiTJFILESORCEID" runat="server" field="TJFILESORCEID" tablename="EHR_PAYFOROUTEMPLOYER" />
<input type="hidden" id="hiFFFILESORCEID" runat="server" field="FFFILESORCEID" tablename="EHR_PAYFOROUTEMPLOYER" />
<input type="hidden" id="hiKq" runat="server" value="考勤管理员" />
<input type="hidden" id="hiDeptMag" runat="server" value="部门负责人" />
<input type="hidden" id="hiEHRDeptID" runat="server" value="FE9B0814-8BBD-4630-AF85-0E8E118B5147" />
<input type="hidden" id="hiEHRPayMag" runat="server" value="薪酬福利管理岗" />
<input type="hidden" id="hiCWBID" runat="server" value="59C68AF8-02A1-4FE9-A74D-6B9AB2655A16" />
<input type="hidden" id="hiXchs" runat="server" value="薪酬核算岗" />
<script type="text/javascript">
    //上传文件type:1为费用统计表上传；2为费用发放表上传
    function upLoadFile(type) {
        var tjfileSourceId = $("#<%=hiTJFILESORCEID.ClientID %>").val();
        var fffileSourceId = $("#<%=hiFFFILESORCEID.ClientID %>").val();
        if (type == 1) {
            showUploadFormNoSameName(tjfileSourceId, "Module");
        }
        if (type == 2) {
            showUploadFormNoSameName(fffileSourceId, "Module");
        }
        return true;
    }
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "提供考勤考核工资") {
                if ($('#<%=gvListFile.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    window.alert('请上传考勤考核工资统计表！');
                    return false;
                }
            }
            //            else if ($actName == "汇总核算制作薪酬发放表" || $actName == "制作费用明细表") {
            //                if ($('#<%=gvPayList.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
            //                    window.alert('请上传考勤考核工资发放表！');
            //                    return false;
            //                }
            //            }
        }

        return true;
    }
</script>
