<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SingleEncouragement.ascx.cs"
    Inherits="Zhongsoft.Portal.EHR.Form.PayManagement.WF_SingleEncouragement" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTitle" runat="server" CssClass="kpms-textbox" Field="TITLE"
                Tablename="EHR_SINGLEENCOURAGEMENT" Activestatus="(23.申请单项奖)(3.修改单项奖)" EnableTheming="false"
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
                class="kpms-textbox" field="CREATEMANNAME" tablename="EHR_SINGLEENCOURAGEMENT"
                activestatus="(23.申请单项奖)(3.修改单项奖)" />
            <input type="hidden" id="hiCreateManID" runat="server" field="CREATEMANID" tablename="EHR_SINGLEENCOURAGEMENT" />
            <input type="hidden" id="hiCreateManCode" runat="server" field="CREATEMANCODE" tablename="EHR_SINGLEENCOURAGEMENT" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbCreateManPhone" runat="server" CssClass="kpms-textbox"
                Field="CREATEMANPHONE" Tablename="EHR_SINGLEENCOURAGEMENT" Activestatus="(23.申请单项奖)(3.修改单项奖)"
                MaxLength="11">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            拟稿部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCreateDeptName" readonly="readonly"
                class="kpms-textbox" field="CREATEDEPTNAME" tablename="EHR_SINGLEENCOURAGEMENT"
                activestatus="(23.申请单项奖)(3.修改单项奖)" />
            <input type="hidden" id="hiCreateDeptID" runat="server" field="CREATEDEPTID" tablename="EHR_SINGLEENCOURAGEMENT" />
            <input type="hidden" id="hiCreateDeptCode" runat="server" field="CREATEDEPTCODE"
                tablename="EHR_SINGLEENCOURAGEMENT" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            拟稿日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCreateDocDate" runat="server" class="kpms-textbox-comparedate"
                field="CREATEDOCDATE" tablename="EHR_SINGLEENCOURAGEMENT" readonly="readonly"
                req="1" activestatus="(23.申请单项奖)(3.修改单项奖)" compare="1" />
        </td>
        <td class="td-l">
            需办结时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFinishDate" runat="server" class="kpms-textbox-comparedate"
                field="FINISHDATE" tablename="EHR_SINGLEENCOURAGEMENT" readonly="readonly" req="1"
                activestatus="(23.申请单项奖)(3.修改单项奖)" compare="1" />
        </td>
        <td class="td-l">
            缓急程度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlImpLevel" runat="server" field="PriorityLevel" tablename="EHR_SINGLEENCOURAGEMENT">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            说明
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" activestatus="(23.申请单项奖)(3.修改单项奖)"
                maxtext="1024" CssClass="kpms-textarea" EnableTheming="false" field="MEMO" tablename="EHR_SINGLEENCOURAGEMENT" />
        </td>
    </tr>
    <tr>
        <td class="td-r" colspan="6" style="text-align: center !important;">
            单项奖统计表
        </td>
    </tr>
    <tr id="Tr1" runat="server" displaystatus="(3.申请单项奖)(3.修改单项奖)(3.部门负责人审核)">
        <td class="td-r" colspan="6" style="text-align: right !important;">
            <asp:LinkButton ID="lbkUpLoadFile" runat="server" DisplayStatus="(3.申请单项奖)(3.修改单项奖)(3.部门负责人审核)"
                Activestatus="(3.申请单项奖)(3.修改单项奖)(3.部门负责人审核)" OnClientClick="return upLoadFile(1)"
                OnClick="lbkUpLoadFile_Click" EnableTheming="false">上传附件</asp:LinkButton>
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
        <td class="td-r" colspan="6" style="text-align: center !important;">
            单项奖发放表
        </td>
    </tr>
    <tr id="Tr2" runat="server" displaystatus="(3.薪酬管理岗审核发放表)" style="display: none">
        <td class="td-r" colspan="6" style="text-align: right !important;">
            <asp:LinkButton ID="lkbPayListUp" runat="server" DisplayStatus="(3.薪酬管理岗审核发放表)" Activestatus="(3.薪酬管理岗审核发放表)"
                EnableTheming="false" OnClientClick="return upLoadFile(2)" OnClick="lkbPayListUp_Click">上传附件</asp:LinkButton>
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
<input type="hidden" id="hiSINGLEENCOURAGEMENTID" runat="server" field="SINGLEENCOURAGEMENTID"
    tablename="EHR_SINGLEENCOURAGEMENT" />
<input type="hidden" id="hiTJFILESORCEID" runat="server" field="TJFILESORCEID" tablename="EHR_SINGLEENCOURAGEMENT" />
<input type="hidden" id="hiFFFILESORCEID" runat="server" field="FFFILESORCEID" tablename="EHR_SINGLEENCOURAGEMENT" />
<input type="hidden" id="hiKq" runat="server" value="考勤管理员" />
<input type="hidden" id="hiDeptMag" runat="server" value="部门负责人" />
<input type="hidden" id="hiYgc" runat="server" value="院高层" />
<input type="hidden" id="hiEHRDeptID" runat="server" value="FE9B0814-8BBD-4630-AF85-0E8E118B5147" />
<input type="hidden" id="hiEHRPayMag" runat="server" value="薪酬福利管理岗" />
<input type="hidden" id="hiCWBID" runat="server" value="59C68AF8-02A1-4FE9-A74D-6B9AB2655A16" />
<input type="hidden" id="hiXchs" runat="server" value="薪酬核算岗" />
<script type="text/javascript">
    //上传文件type:1为加班费统计表上传；2为加班费用发放表上传
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
            if ($actName == "申请单项奖" || $actName == "修改单项奖") {
                if ($('#<%=gvListFile.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
                    window.alert('请上传单项奖统计表！');
                    return false;
                }
            }
            //            else if ($actName == "薪酬管理岗审核发放表") {
            //                if ($('#<%=gvPayList.ClientID %>')[0].rows[1].cells[0].innerText == "没有要查找的数据") {
            //                    window.alert('请上传单项奖发放表！');
            //                    return false;
            //                }
            //            }
        }

        return true;
    }
</script>
